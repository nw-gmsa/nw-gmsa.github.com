Instance: EPIC-OBX-1
InstanceOf: Observation
Title: "EPIC-OBX-1 Example"
Description: "TODO"


* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230056
    * display = "What Type of Referral Do You Require?"
    * system = "https://mft.nhs.uk/Id/IGENE"

* encounter = Reference(EPIC-PV1)

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Jack DAWKINS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"

* valueString = "Test on Stored DNA"
