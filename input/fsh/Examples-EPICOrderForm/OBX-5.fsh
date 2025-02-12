Instance: EPIC-OBX-5
InstanceOf: Observation
Title: "EPIC-OBX-5 Example"
Description: "TODO"

* identifier[+].value = "5"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #77386006
    * display = "Pregnancy"
    * system = "http://snomed.info/sct"

* valueBoolean = false

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"


