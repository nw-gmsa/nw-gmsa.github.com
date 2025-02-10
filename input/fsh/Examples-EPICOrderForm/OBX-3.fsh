Instance: EPIC-OBX-3
InstanceOf: Observation
Title: "EPIC-OBX-3 Example"
Description: "TODO"

* identifier[+].value = "3"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230019
    * display = "High Infection Risk"
    * system = "https://mft.nhs.uk/Id/IGENE"

* valueString = "Np"

* encounter = Reference(EPIC-PV1)

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Jack DAWKINS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"


