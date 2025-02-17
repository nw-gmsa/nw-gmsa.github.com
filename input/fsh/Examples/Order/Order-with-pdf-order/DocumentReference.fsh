Instance: a293b4a6-e46b-4402-9b2b-d9517afc7137
InstanceOf: DocumentReference
Title: "Document Reference Laboratory Order"
Description: "TODO"

* identifier[+].value = "a293b4a6-e46b-4402-9b2b-d9517afc7137"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "R0A"

* status = #current

* date = "2025-01-29T10:37:26+00:00"

* type
  * coding[+]
    * code = #721965002
    * display = "Laboratory order"
    * system = $sct

// EPIC-PV1
* context.encounter[+].reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* context.sourcePatientInfo.identifier.type = $v2-0203#MR
* context.sourcePatientInfo.identifier.value = "633"
* context.sourcePatientInfo.identifier.assigner.identifier.system = $ods-code
* context.sourcePatientInfo.identifier.assigner.identifier.value = "R0A"

* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:0a898233-763c-405d-8172-8c4f07e6e636"

* author[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


