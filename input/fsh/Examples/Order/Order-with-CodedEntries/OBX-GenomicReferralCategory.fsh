Instance: OBX-GenomicReferralCategory
InstanceOf: Observation
Title: "Genomic Referral Category"
Description: "TODO"

* identifier[+].value = "1"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+] = $NOS#230056 "What Type of Referral Do You Require?"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* valueCodeableConcept = $sct#1186936003 "Storage of specimen (procedure)"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"


