#!/usr/bin/env bash
# Reproduces the validator runs in the "Worked example: Variant Observation"
# section of input/pagecontent/testing-resources.md, and prints each run's
# issues as a kramdown table ready to paste into the page.
#
# Usage:
#   validation/validate-variant-example.sh            # all runs
#   validation/validate-variant-example.sh 3          # just run 3
#   validation/validate-variant-example.sh 3 4        # runs 3 and 4
#
# Prerequisites:
#   - Java 17+
#   - A current build of this IG (./_build.sh build) so that output/package.tgz
#     contains the latest profiles. Rebuild after changing any .fsh file.
#
# Output: validation/out/runN-results.json (OperationOutcome) and
#         validation/out/runN.md (table), and the tables are also printed.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HERE="$ROOT/validation"
EX="$HERE/variant-worked-example"
OUT="$HERE/out"
JAR="$ROOT/input-cache/validator_cli.jar"
PACKAGE="$ROOT/output/package.tgz"

GR_IG="hl7.fhir.uv.genomics-reporting#3.0.0"
GR_PROFILE="http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant"
NW_PROFILE="https://fhir.nwgenomics.nhs.uk/StructureDefinition/Variant"

mkdir -p "$OUT"

if [[ ! -f "$JAR" ]]; then
  echo "Downloading validator_cli.jar to input-cache/ ..." >&2
  curl -fL -o "$JAR" https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar
fi

# run number -> resource file | IG | profile | terminology (notx / tx)
run_config() {
  case "$1" in
    1) echo "run1.json|$GR_IG|$GR_PROFILE|notx" ;;   # Stage 1, original resource
    2) echo "run2.json|$GR_IG|$GR_PROFILE|notx" ;;   # Stage 1, after adding GE category
    3) echo "run2.json|nw|$NW_PROFILE|notx" ;;       # Stage 2, same resource against NW profile
    4) echo "run4.json|nw|$NW_PROFILE|notx" ;;       # Stage 2, after changes after run 3
    5) echo "run5.json|nw|$NW_PROFILE|tx" ;;         # Stage 3, coded values, terminology server on
    6) echo "run6.json|nw|$NW_PROFILE|tx" ;;         # Stage 3, after LOINC method (changes after run 5)
    *) echo "Unknown run: $1 (expected 1-6)" >&2; exit 1 ;;
  esac
}

RUNS=("$@")
[[ ${#RUNS[@]} -eq 0 ]] && RUNS=(1 2 3 4 5 6)

for run in "${RUNS[@]}"; do
  IFS='|' read -r file ig profile tx <<< "$(run_config "$run")"

  if [[ "$ig" == "nw" ]]; then
    if [[ ! -f "$PACKAGE" ]]; then
      echo "Missing $PACKAGE - run ./_build.sh build first." >&2
      exit 1
    fi
    ig="$PACKAGE"
  fi

  args=(-jar "$JAR" "$EX/$file" -version 4.0.1 -ig "$ig" -profile "$profile" -output "$OUT/run$run-results.json")
  [[ "$tx" == "notx" ]] && args+=(-tx n/a)

  echo "=== Run $run: $file against $profile ($tx) ===" >&2
  # The validator exits non-zero when there are errors; that is expected here.
  java "${args[@]}" > "$OUT/run$run-console.log" 2>&1 || true

  if [[ ! -f "$OUT/run$run-results.json" ]]; then
    echo "Validator produced no results for run $run, see $OUT/run$run-console.log" >&2
    exit 1
  fi

  python3 "$HERE/outcome-to-markdown.py" "$OUT/run$run-results.json" | tee "$OUT/run$run.md"
  echo
done
