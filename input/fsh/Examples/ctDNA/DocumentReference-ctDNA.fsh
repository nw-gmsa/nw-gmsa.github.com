Instance: DocumentReference-ctDNA
InstanceOf: DocumentReference
Title: "Document Reference Laboratory Report ctDNA"
Description: "TODO"

* identifier[+].value = "94bf65ba-cd6c-4601-b339-6d547f424646"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "699X0"

* status = #current

* date = "2025-10-14T15:59:16+00:00"

* type
  * coding[+]
    * code = #1054161000000101
    * display = "Genetic report"
    * system = $sct

* context.period.start = "2025-10-14T15:59:16+00:00"
* context.period.end = "2025-10-14T15:59:16+00:00"

* custodian
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GMSA"

* context.related[ReportIdentifier].identifier.value = "T26-59XG"
* context.related[ReportIdentifier].identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
* context.related[ReportIdentifier].identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* context.related[ReportIdentifier].identifier.assigner.identifier.system = $ods-code
* context.related[ReportIdentifier].identifier.assigner.identifier.value = "699X0"
* context.related[ReportIdentifier].type = "DiagnosticReport"
* context.related[ReportIdentifier].reference = "urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3"

* context.related[OrderIdentifier].identifier.value = "T26-59XG"
* context.related[OrderIdentifier].identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
* context.related[OrderIdentifier].identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* context.related[OrderIdentifier].identifier.assigner.identifier.system = $ods-code
* context.related[OrderIdentifier].identifier.assigner.identifier.value = "699X0"
* context.related[OrderIdentifier].type = "ServiceRequest"
* context.related[OrderIdentifier].reference = "urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec"

* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f"


* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* context.event[+] = $test-directory#M4.14

* context.sourcePatientInfo.identifier.type = $v2-0203#MR
* context.sourcePatientInfo.identifier.value = "RXR3302855"
* context.sourcePatientInfo.identifier.assigner.identifier.system = $ods-code
* context.sourcePatientInfo.identifier.assigner.identifier.value = "RHQ"


