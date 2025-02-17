Instance: 94bf65ba-cd6c-4601-b339-6d547f424646
InstanceOf: DocumentReference
Title: "Document Reference Laboratory Report"
Description: "TODO"

* identifier[+].value = "94bf65ba-cd6c-4601-b339-6d547f424646"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "699X0"

* status = #current

* date = "2025-01-29T10:37:26+00:00"

* type
  * coding[+]
    * code = #1054161000000101
    * display = "Genetic report"
    * system = $sct

// EPIC PV1
* context.encounter[+].reference = "urn:uuid:fe5a1b08-84c9-46e6-8162-d2dcf3e67141"

* context.related[accessionNumber].identifier.value = "1001166717"
* context.related[accessionNumber].identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* context.related[accessionNumber].identifier.assigner.identifier.system = $ods-code
* context.related[accessionNumber].identifier.assigner.identifier.value = "699X0"

* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:0a898233-763c-405d-8172-8c4f07e6e636"

// * author[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* context.event[+] = $test-directory#R240.1

* context.sourcePatientInfo.identifier.type = $v2-0203#MR
* context.sourcePatientInfo.identifier.value = "633"
* context.sourcePatientInfo.identifier.assigner.identifier.system = $ods-code
* context.sourcePatientInfo.identifier.assigner.identifier.value = "R0A"


