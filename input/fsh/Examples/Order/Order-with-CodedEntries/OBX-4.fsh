Instance: EPIC-OBX-4
InstanceOf: Observation
Title: "EPIC-OBX-4 Example"
Description: "TODO"

* identifier[+].value = "7b7ec386-bbc6-47fb-a3ed-6a6ea6e4c5d3"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230016
    * display = "Test Type"
    * system = $MFTEPIC

* valueString = "Diagnostic Screen/Test"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


