Instance: EPIC-OBX-2
InstanceOf: Observation
Title: "EPIC-OBX-2 Example"
Description: "TODO"


* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #230048
    * display = "Please Select Clinical Indication(s)"
    * system = "https://mft.nhs.uk/Id/IGENE"

* valueString = "R240: Diagnostic testing for known mutation(s)~R242: Predictive testing for known familial mutation(s)"

* encounter = Reference(EPIC-PV1)

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Jack DAWKINS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"


