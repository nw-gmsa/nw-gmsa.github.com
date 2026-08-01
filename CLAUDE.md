# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

This repository builds a HL7 FHIR Implementation Guide for the NHS North West Genomic Medicine Service Alliance (NW-GMSA), published at https://nw-gmsa.github.io/en/. It profiles genomics laboratory reporting and ordering workflows based on IHE Laboratory Testing Workflow (LTW), building on `hl7.fhir.uv.genomics-reporting`, `hl7.fhir.eu.laboratory`, UK Core, SDC, and IHE BALP (see `dependencies:` in `sushi-config.yaml`).

- `id`: `fhir.nwgenomics.nhs.uk`, `canonical`: `https://fhir.nwgenomics.nhs.uk` (see `sushi-config.yaml`)
- FSH source is compiled by SUSHI; narrative and generated output are rendered by the HL7 FHIR IG Publisher.

## Build commands

Use `./_build.sh <option>` (macOS/Linux) or `_build.bat` (Windows). Run with no arguments for an interactive menu (5s timeout, defaults to a full build).

- `./_build.sh build` — full build: SUSHI compiles `input/fsh` → `fsh-generated/`, then the IG Publisher (`publisher.jar`, cached in `input-cache/`) renders the IG to `output/`.
- `./_build.sh nosushi` — rebuild without re-running SUSHI (faster when only editing `input/pagecontent`).
- `./_build.sh notx` — build without contacting the external terminology server (`tx.fhir.org`); used automatically when offline.
- `./_build.sh jekyll` — just the Jekyll step (`temp/pages` → `output`), skipping the publisher.
- `./_build.sh update` — download/update `publisher.jar` and the build scripts themselves.
- `./_build.sh clean` — remove generated `output/`, `template/`, `temp/` directories.

There is no separate lint/test suite; correctness is checked via the IG Publisher's own QA output (`qa.html`, console errors/warnings) after a build. Known-good warnings are suppressed in `input/ignoreWarnings.txt`.

## Architecture

**FSH source (`input/fsh/`)** — ~249 `.fsh` files organized by kind, compiled by SUSHI into `fsh-generated/resources/`:
- `Actors/`, `CapabilityStatement/`, `DataTypes/`, `Endpoint/`, `MessageDefinition/`, `Parameters/`, `Questionnaire/`, `SearchParameter/` — profile and infrastructure definitions.
- `Termininology/` (sic) — `CodeSystem/`, `ValueSet/`, `ConceptMap/`.
- `Examples/` — split by clinical scenario (`Order/`, `ADT/`, `ctDNA/`, `BCRABL/`, `Cystic Fibrosis/`, `Lynch Syndrome/`, `Report/`, `ExampleScenario/`, `Audit/`).
- Top-level `.fsh` files for core resource profiles (e.g. `DiagnosticReport.fsh`, `Observation.fsh`, `LaboratoryAnalyteResult.fsh`).

Resource examples/artifacts also come from `input/resources/` and `input/examples/` — all three are configured as `path-resource` locations in `sushi-config.yaml`.

**Narrative content (`input/pagecontent/`)** — one Markdown file per generated page, commonly `<ArtifactName>-intro.md` for the narrative shown above a profile's machine-generated definition tables. Conventions used throughout, worth checking when editing or reviewing these files:
- Diagrams are inline Mermaid (` ```mermaid ` fences). `click <id>` and `class <ids>` statements must only reference node ids actually declared in that diagram — an undefined id (leftover from copy-pasting another diagram) silently renders as a stray phantom node.
- Tables use kramdown syntax with an `{:.grid}` line immediately after; every row must have the same number of `|`-delimited columns as the header, and the IDE's "table is not correctly formatted" diagnostic generally means padding/column-width, not structure.
- Draft/incomplete sections are flagged with `<div class="alert alert-danger">...currently being elaborated...</div>`; profile/interaction cross-references use `<div class="alert alert-info">`.
- Headings should be unique within a page — kramdown auto-suffixes duplicate headings (`#process-flow`, `#process-flow-1`, ...) for anchors, which is fragile if anything reorders the page or other pages link to that anchor (e.g. `LTW.html#lab-1-process-flow` is referenced from `ILW.md`).
- Diagram sources (PlantUML) live in `input/images-source/`; rendered SVGs land in `temp/pages/_includes/` and are pulled into pagecontent via Jekyll `{%include foo.svg%}`.

**Generated / do-not-edit**: `output/`, `temp/`, `fsh-generated/`, and `template/` are all produced by the build — changes belong in `input/fsh` or `input/pagecontent` instead.

**`Design/`** holds architecture sketches (Mermaid/PlantUML) and draft `MessageDefinition` FSH not yet wired into the published IG — useful for context but not part of the build.

## Key config files

- `sushi-config.yaml` — IG metadata, dependencies, and IG Publisher `parameters`.
- `ig.ini` — points the IG Publisher at the SUSHI-generated `ImplementationGuide` resource and the HTML template (`fhir2.base.template`).
- `publication-request.json` — templated release-request stub (not yet filled in for an actual release).
