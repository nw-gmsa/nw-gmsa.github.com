Instance: Composition-GenomicsReport-LynchSyndrome
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report LynchSyndrome"
Description: "Composition - Genomics Report LynchSyndrome"
Usage: #example

* identifier
  * value = "98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
//* type = $sct#1054161000000101 "Genetic report"
* type.coding[+] = $GTD#R210.2
* type.coding[+] = $sct#1054161000000101 "Genetic report"
//* type.coding[+] = $sct#4241000179101 "Laboratory report"

//* meta.versionId = 3
* date = "2024-10-13T10:33:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "R0A"
* author.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* title = "Composition Genomics Report Lynch Syndrome"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"

* encounter.identifier
  * value = "66717"
  * system = "http://www.acme.org/encounter/identifiers/RBS"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBS"

* section[+]
  * title = "Findings"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>Genomics Findings</li></ul></div>"
  * code = $loinc#59776-5 "Findings"
  * entry[+].reference = "urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99"
  * entry[+].reference = "urn:uuid:4490c092-c78c-480a-8cb7-653b70113fd5"

* section[+]
  * title = "Implications"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>Genomics Implications</li></ul></div>"
  * code = $loinc#59768-2 "Procedure indications Imp"
  * entry[+].reference = "urn:uuid:6beb613f-d303-42af-b025-86e8e0872061"
  * entry[+].reference = "urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa"


Instance: FHIRDocumentGeneticReportBundle2
InstanceOf: BundleDocument
Title:       "Bundle `Document` - Genomics Report Inherited MMR deficiency (Lynch syndrome)"
Description:  "FHIR Document Genomics Report for Ned Liverpool"
Usage: #example
* insert DocumentBundle("e51f87e6-f43f-4c7a-b475-23b784e2b852", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:c55a7dc6-9b29-4cd6-ab8f-9aea594aabde", Composition-GenomicsReport-LynchSyndrome)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80", DiagnosticReportGenomicsReportLS)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:6beb613f-d303-42af-b025-86e8e0872061", 6beb613f-d303-42af-b025-86e8e0872061)
* insert EntryDocument("urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa", 0878c5de-c22f-4e31-841a-a82ad31c93aa)
* insert EntryDocument("urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99", 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99)
* insert EntryDocument("urn:uuid:4490c092-c78c-480a-8cb7-653b70113fd5", 4490c092-c78c-480a-8cb7-653b70113fd5)
