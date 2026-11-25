#!/usr/bin/env python3
"""Convert a FHIR Validator OperationOutcome (-output results.json) into the
kramdown issue table used on testing-resources.md.

Usage: outcome-to-markdown.py results.json

Issues are sorted error -> warning -> information (validator order kept within
each severity). Consecutive issues with the same severity and message whose
locations differ only by one index are collapsed, e.g.
`Observation.component[1] to [5]`.
"""
import json
import re
import sys

SEVERITY_ORDER = {"fatal": 0, "error": 1, "warning": 2, "information": 3}
INDEX = re.compile(r"\[(\d+)\]")


def location(issue):
    expr = issue.get("expression") or issue.get("location") or [""]
    return expr[0]


def message(issue):
    return (issue.get("details") or {}).get("text") or issue.get("diagnostics", "")


def collapse(rows):
    """rows: list of (severity, location, message). Merge runs of index-only differences."""
    out = []
    for sev, loc, msg in rows:
        if out:
            psev, ploc, pmsg, first, last = out[-1]
            if psev == sev and pmsg == msg and last is not None:
                m = list(INDEX.finditer(loc))
                pm = list(INDEX.finditer(ploc))
                if m and pm and len(m) == len(pm):
                    # same text apart from the last index, which increments by one
                    if (loc[: m[-1].start()] == ploc[: pm[-1].start()]
                            and loc[m[-1].end():] == ploc[pm[-1].end():]
                            and int(m[-1].group(1)) == last + 1):
                        out[-1] = (psev, ploc, pmsg, first, last + 1)
                        continue
        m = list(INDEX.finditer(loc))
        idx = int(m[-1].group(1)) if m else None
        out.append((sev, loc, msg, idx, idx))

    result = []
    for sev, loc, msg, first, last in out:
        if first is not None and last != first:
            m = list(INDEX.finditer(loc))[-1]
            loc = f"{loc[:m.end()]} to [{last}]{loc[m.end():]}"
        result.append((sev, loc, msg))
    return result


def main(path):
    outcome = json.load(open(path))
    issues = [i for i in outcome.get("issue", [])
              if message(i) != "All OK"]
    issues.sort(key=lambda i: SEVERITY_ORDER.get(i.get("severity"), 9))
    rows = collapse([(i.get("severity"), location(i), message(i)) for i in issues])

    print("| Severity | Location | Message |")
    print("|----------|----------|---------|")
    for sev, loc, msg in rows:
        msg = msg.replace("|", "\\|").replace("\n", " ")
        loc = f"`{loc}`" if loc else ""
        print(f"| {sev} | {loc} | {msg} |")
    print("{:.grid}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    main(sys.argv[1])
