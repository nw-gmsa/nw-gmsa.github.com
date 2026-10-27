Profile:        ObservationPanel
Parent:         Observation
Id:             Observation-Panel
Title:          "Observation Panel"
Description:    """
`Diagnostic` Reference - [HL7 Europe Laboratory Report - Observation Results: laboratory](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Observation-resultslab-eu-lab.html)
"""

// value[x] 0..0 zeroes the EU Lab type slices and leaves value[x] with no types, so prohibit a value with an invariant instead
* obeys nw-panel-1
* hasMember 1..* MS
* component 0..0


Invariant: nw-panel-1
Description: "A panel has no value of its own; results are carried in hasMember"
Expression: "value.empty()"
Severity: #error
