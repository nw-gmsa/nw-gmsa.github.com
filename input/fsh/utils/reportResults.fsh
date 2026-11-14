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

// DocumentReference for the report PDF: related to the DiagnosticReport (by reference and Report Identifier)
// and the order (Order Placer Number), as for IHE XDS referenceIdList
RuleSet: ReportPDFDocumentReference(id, assigner, date, drUrn, reportSystem, reportValue, placerSystem, placerValue, placerAssigner, binaryUrn, event)
* identifier[+].value = "{id}"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "{assigner}"
* status = #current
* date = "{date}"
* type = $sct#1054161000000101 "Genetic report"
* context.related[DiagnosticReport]
  * reference = "{drUrn}"
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
