Instance: DiagnosticReport-ctDNA
InstanceOf: LaboratoryReport
Title: "Diagnostic Report ctDNA Example"
Description: "Diagnostic Report ctDNA Example"

* meta.versionId = "1.0"

* identifier[ReportIdentifier]
  * value = "T26-59XG"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* basedOn[OrderFillerNumber]
  * identifier.value = "T26-59XG"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
  * identifier.type = $v2-0203#FILL
  * type = "ServiceRequest"
  * reference = "urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec"

* status = #final
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ctDNA genomic report for Theon SHEFFIELD. M4.14 Non-Small Cell Lung Cancer, multi-target ctDNA panel. Outcome: TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION.</p></div>"
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code.coding[+] = $GTD#M4.14
//* code.coding[+] = $sct#4241000179101 "Laboratory report"
* code.coding[+] = $sct#1054161000000101 "Genetic report"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* effectiveDateTime = "2025-10-14T15:59:16+00:00"

* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GMSA"


* resultsInterpreter[author]
  * display = "FICTITIOUS, Morgan"

* result[+].reference = "urn:uuid:00c22e97-a226-4845-b17a-e24ec1f4f77a"

* conclusionCode[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicTestOutcomeCode#431 "TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION"

* presentedForm[+]
  * contentType = #application/pdf
  * language = #en-GB
  * url = "urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f"
  * title = "ctDNA Genomic Report for Theon Sheffield"
