Instance: Composition-GenomicsReport-JackDawkins
InstanceOf: http://hl7.eu/fhir/laboratory/StructureDefinition/Composition-eu-lab
Title: "Composition - Genomics Report Jack Dawkins"
Description: "Composition - Genomics Report Jack Dawkins"
Usage: #example

* status = #final
* type = $sct#1054161000000101 "Genetic report"
//* meta.versionId = 3
* date = "2024-10-13T10:33:00+00:00"
* author.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* author.identifier.value = "R0A"
* author.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* title = "Composition Referral Letter Jack Dawkins"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.identifier.system = $nhs-number
* subject.identifier.value = "9912003888"
* subject.display = "Jack DAWKINS"

* section[+]
  * title = "Results"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>Genetics Report</li></ul></div>"
  * code = http://loinc.org#18776-5
  * entry[+].reference = "urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80"

Instance: FHIRDocumentGeneticReportBundle
InstanceOf: Bundle
Title:       "Bundle `Document` - Genetic Report"
Description:  "FHIR Document Genetic Report for Jack Dawkins"
Usage: #example
* insert DocumentBundle("1d7155e8-b5b8-4406-adda-01a474d5ff6c", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:30551ce1-5a28-4356-b684-1e639094ad4d", Composition-GenomicsReport-JackDawkins)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-JackDawkins-9912003888)
* insert EntryDocument("urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80", DiagnosticReportGenomicsReport)
