Instance: OBX-OrderTrackingNumber
InstanceOf: Observation
Title: "Order Tracking Number (type=ST)"
Description: "DPD, Hermes, etc"

* identifier[+].value = "9a012a65-062e-4e0a-9fce-f0aa09a4783b"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+] = $loinc#97209-1 "Order Tracking Number"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* valueString = "UK3096580215"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"


