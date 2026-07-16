Instance: Composition-GenomicsReport-ctDNA
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report ctDNA"
Description: "Composition - Genomics Report ctDNA"
Usage: #example

* identifier
  * value = "T26-59XG"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
//* type = $sct#1054161000000101 "Genetic report"
* type.coding[+] = $GTD#M4.14
* type.coding[+] = $sct#1054161000000101 "Genetic report"
//* type.coding[+] = $sct#4241000179101 "Laboratory report"

//* meta.versionId = 3
* date = "2025-10-14T15:59:16+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "North West Genomics"

* title = "Composition Genomics Report ctDNA"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

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


Instance: FHIRDocumentGeneticReportBundle-ctDNA
InstanceOf: BundleDocument
Title:       "Bundle `Document` - Genomics Report ctDNA"
Description:  "FHIR Document Genomics Report ctDNA for Theon Sheffield"
Usage: #example
* insert DocumentBundle("088ce7a7-d6ca-44ac-b345-208866d4f496", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:4bc6be60-53d2-4143-8239-f3e2d257e61f", Composition-GenomicsReport-ctDNA)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec", ServiceRequest-ctDNA)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
* insert EntryDocument("urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3", DiagnosticReport-ctDNA)
* insert EntryDocument("urn:uuid:f80f704c-b2b2-4912-ac6f-e62aaadd4ff0", GenomicStudy-ctDNA)
* insert EntryDocument("urn:uuid:cd491a5f-62ec-4f6b-904f-206bae2c9b20", 51967-8-ctDNA)
* insert EntryDocument("urn:uuid:b3b6b20f-8e5a-432c-8155-579dc4d60a09", 51968-6-ctDNA)
* insert EntryDocument("urn:uuid:13028359-6a38-4dff-8978-55a57dbdfb56",DocumentReference-ctDNA)
* insert EntryDocument("urn:uuid:d6eeedd1-92d3-45b9-bf33-6401e804425f",Binary-Sample)
