Instance: EPIC-OBX-9
InstanceOf: Observation
Title: "EPIC-OBX-9 Example"
Description: "TODO"

* identifier[+].value = "9"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230029
    * display = "Confirmation of Consent for Testing - MANDATORY Testing will not be performed without completed confirmation of consent"
    * system = "https://mft.nhs.uk/Id/IGENE"

* valueString = "Completed Electronically on HIVE"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"


