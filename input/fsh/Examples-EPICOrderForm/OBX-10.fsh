Instance: EPIC-OBX-10
InstanceOf: Observation
Title: "EPIC-OBX-10 Example"
Description: "TODO"

* identifier[+].value = "10"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230037
    * display = "Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing"
    * system = "https://mft.nhs.uk/Id/IGENE"

* valueString = "Acknowledged"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Jack DAWKINS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"


