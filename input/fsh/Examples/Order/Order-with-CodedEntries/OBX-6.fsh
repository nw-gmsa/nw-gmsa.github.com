Instance: EPIC-OBX-6
InstanceOf: Observation
Title: "EPIC-OBX-6 Example"
Description: "TODO"

* identifier[+].value = "66b690c6-eb2c-49bb-9546-97cff782d978"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #231284
    * display = "Please Select R240 Test(s):"
    * system = "https://mft.nhs.uk/Id/IGENE"

* valueString = "R240.1: Targeted variant testing"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


