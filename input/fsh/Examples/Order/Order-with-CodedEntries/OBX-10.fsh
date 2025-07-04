Instance: EPIC-OBX-10
InstanceOf: Observation
Title: "EPIC-OBX-10 Example"
Description: "TODO"

* identifier[+].value = "4b910bc3-68c6-4252-a218-076110f0d23d"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230037
    * display = "Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing"
    * system = $MFTEPIC

* valueString = "Acknowledged"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


