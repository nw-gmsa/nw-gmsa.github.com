// RuleSets for the result Observations and PDF documents carried with Laboratory Reports in the example scenarios

// Common header for a genomic result Observation (Variant, DiagnosticImplication) performed by a laboratory
RuleSet: GenomicResultObservation(id, date, performerOds, performerName)
* identifier[+].value = "{id}"
* status = #final
* effectiveDateTime = "{date}"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* performer[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "{performerOds}"
  * display = "{performerName}"

// The report as a PDF, in the Binary at binaryUrn
RuleSet: ReportPDF(binaryUrn, title, date)
* presentedForm[+]
  * contentType = #application/pdf
  * language = #en-GB
  * url = "{binaryUrn}"
  * title = "{title}"
  * creation = "{date}"

// DocumentReference for the report PDF: related to the DiagnosticReport by its Report Identifier and to the order by its
// Order Placer Number, as for IHE XDS referenceIdList. Identifier only (no reference), as the same DocumentReference is also
// carried in messages that do not include the DiagnosticReport, such as the T02 FHIR Message
RuleSet: ReportPDFDocumentReferenceByIdentifier(id, assigner, date, reportSystem, reportValue, placerSystem, placerValue, placerAssigner, binaryUrn, event)
* identifier[+].value = "{id}"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "{assigner}"
* status = #current
* date = "{date}"
* type = $sct#1054161000000101 "Genetic report"
* context.related[DiagnosticReport]
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "{reportSystem}"
  * identifier.value = "{reportValue}"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "{assigner}"
* context.related[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "{placerSystem}"
  * identifier.value = "{placerValue}"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "{placerAssigner}"
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "{binaryUrn}"
* context.event[+] = $test-directory#{event}

// MessageHeader for a T02 FHIR Message (Document and Document Notification): the report PDF as a DocumentReference and Binary
RuleSet: T02MessageHeader(date, senderOds, senderName, receiverOds, receiverName, endpoint, docUrn, binaryUrn)
* meta.lastUpdated = "{date}"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#T02
* sender.identifier.system = $ods-code
* sender.identifier.value = "{senderOds}"
* sender.display = "{senderName}"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "{receiverOds}"
* destination.receiver.display = "{receiverName}"
* destination.endpoint = "{endpoint}"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "{docUrn}"
  * type = #DocumentReference
* focus[+]
  * reference = "{binaryUrn}"
  * type = #Binary
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/original-document"
