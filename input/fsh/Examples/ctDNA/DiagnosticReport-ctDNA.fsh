Instance: DiagnosticReport-ctDNA
InstanceOf: DiagnosticReport
Title: "Diagnostic Report ctDNA Example"
Description: "Diagnostic Report ctDNA Example"

* meta.versionId = "1.0"

* identifier[ReportIdentifier]
  * value = "T26-59XG"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"


* status = #final
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
  * display = "Jonathan Edgerley"

* result[+].reference = ""urn:uuid:f80f704c-b2b2-4912-ac6f-e62aaadd4ff0""

* presentedForm[+]
  * contentType = #application/pdf
  * language = #en-GB
  * url = "urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f"
  * size = 43272
  * title = "ctDNA Genomic Report for Theon Sheffield"
  * creation = "2023-11-24"
