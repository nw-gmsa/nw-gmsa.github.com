Instance: OBX-Consanguinity
InstanceOf: Observation
Title: "Consanguinity (type=CE)"
Description: "TODO. See also https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-sets/maternity-services-data-set/guidance/msds-consanguinity-data-quality-guidance"

* identifier[+].value = "af0eb9c5-f694-4d3e-9720-b49c1101c019"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+] = $sct#842009 "Consanguinity"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* valueCodeableConcept = $loinc#LA32-8 "No"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"


