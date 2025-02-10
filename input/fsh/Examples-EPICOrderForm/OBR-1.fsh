Instance: EPIC-OBR-1
InstanceOf: ObservationPanel
Title: "EPIC-OBR-1 Example"
Description: "TODO"


* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #GENEAP
    * display = "GENETICS TEST PERFORMABLE"
    * system = "https://mft.nhs.uk/Id/IGEAP"
  * text = "GENETICS TEST"

* encounter = Reference(EPIC-PV1)

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Jack DAWKINS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"

* hasMember[+] = Reference(EPIC-OBX-1)
* hasMember[+] = Reference(EPIC-OBX-2)
* hasMember[+] = Reference(EPIC-OBX-3)
