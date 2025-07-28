Instance: OBX-PregnancyExpectedDeliveryDate
InstanceOf: Observation
Title: "Pregnancy Expected Delivery Date (type=DT)"
Description: ""

* identifier[+].value = "57ea3361-7b8d-4415-ae21-5e10bfc30992"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+] = $sct#161714006 "Estimated date of delivery"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* valueDateTime = "2025-05-12T10:37:26+00:00"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"


