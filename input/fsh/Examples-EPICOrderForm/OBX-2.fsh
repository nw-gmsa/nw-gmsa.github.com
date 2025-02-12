Instance: EPIC-OBX-2
InstanceOf: Observation
Title: "EPIC-OBX-2 Example"
Description: "TODO"

* identifier[+].value = "2"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #363349007
    * display = "Malignant tumour of stomach"
    * system = "http://snomed.info/sct"


// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"


