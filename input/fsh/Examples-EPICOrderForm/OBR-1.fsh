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

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"


* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"

// EPIC-OBX-1
* hasMember[+].reference = "urn:uuid:f39cc804-5280-4807-91d4-075be16928e5"
// EPIC-OBX-2
* hasMember[+].reference = "urn:uuid:47f34393-cc83-428f-b8dd-54bcd372c847"
// EPIC-OBX-3
* hasMember[+].reference = "urn:uuid:edd4debe-dd82-445f-b3e5-e175760da105"

* hasMember[+].reference = "urn:uuid:edd4debe-dd82-445f-b3e5-e175760da105"
// EPIC-OBX-4

* hasMember[+].reference = "urn:uuid:390c7633-fd63-483c-8e32-e8858f232339"
// EPIC-OBX-5
* hasMember[+].reference = "urn:uuid:66b690c6-eb2c-49bb-9546-97cff782d978"
// EPIC-OBX-6
* hasMember[+].reference = "urn:uuid:f36a0ed4-e5c3-4ac8-846f-571b4a500e17"
// EPIC-OBX-7
* hasMember[+].reference = "urn:uuid:ddf248a2-6323-4b7a-b4a3-e968c36311b7"
// EPIC-OBX-8
* hasMember[+].reference = "urn:uuid:0d472ee5-8c21-467a-aafe-29c89a42ed4e"
//  EPIC-OBX-9
* hasMember[+].reference = "urn:uuid:4b910bc3-68c6-4252-a218-076110f0d23d"
//  EPIC-OBX-10
* hasMember[+].reference = "urn:uuid:3a3ba1ed-831d-4f82-b487-e40860a2befd"
// EPIC-OBX-11
* hasMember[+].reference = "urn:uuid:298e99de-fd29-4802-bcf2-78f901b33a6e"
//  EPIC-OBX-12
