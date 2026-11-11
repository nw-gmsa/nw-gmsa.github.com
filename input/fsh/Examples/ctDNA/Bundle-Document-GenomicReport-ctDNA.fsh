Instance: Composition-GenomicsReport-ctDNA
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report ctDNA UGR"
Description: "Composition - Genomics Report ctDNA"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3"

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
* attester[+].mode = #legal
* attester[=].time = "2025-10-14T15:59:16+00:00"
* attester[=].party.reference = "urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02"
* attester[=].party.display = "Jonathan Edgerley"

* title = "Composition Genomics Report ctDNA"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* section[Referral]
  * title = "Referral"
  * code = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M4 Non-Small Cell Lung Cancer. M4.14 multi-target ctDNA panel.</p></div>"
  * entry[+].reference = "urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec"

* section[Specimen]
  * title = "Specimen"
  * code = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Blood specimen for ctDNA. Collected 29-Jun-2026, received 30-Jun-2026.</p></div>"
  * entry[+].reference = "urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5"

* section[ResultSummary]
  * title = "Result summary"
  * code = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION.</p></div>"
  * entry[+].reference = "urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3"

* section[Results]
  * title = "Results"
  * code = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>EGFR NM_005228.5:c.2369C&gt;T detected in circulating tumour DNA (somatic), mutant allele fraction 0.42%.</p></div>"
  * entry[+].reference = "urn:uuid:00c22e97-a226-4845-b17a-e24ec1f4f77a"

* section[Interpretation]
  * title = "Interpretation"
  * code = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>An EGFR variant was detected in circulating tumour DNA at a level requiring clinical action.</p></div>"

* section[Methodology]
  * title = "Methodology and limitations"
  * code = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Targeted variant analysis of EGFR in circulating tumour DNA by digital PCR. A negative result only rules out variants at the positions tested.</p></div>"
  * entry[+].reference = "urn:uuid:e1e2150d-ba34-4247-83a2-5bc9ab93ba22"



Instance: FHIRDocumentGeneticReportBundle-ctDNA
InstanceOf: BundleDocument
Title:       "Bundle `Document` - Genomics Report ctDNA"
Description:  "FHIR Document Genomics Report ctDNA for Theon Sheffield"
Usage: #example
* insert DocumentBundle("088ce7a7-d6ca-44ac-b345-208866d4f496", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:4bc6be60-53d2-4143-8239-f3e2d257e61f", Composition-GenomicsReport-ctDNA)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec", ServiceRequest-ctDNA)
// Reqyester PractitionerRole
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
* insert EntryDocument("urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3", DiagnosticReport-ctDNA)
* insert EntryDocument("urn:uuid:00c22e97-a226-4845-b17a-e24ec1f4f77a", variant-egfr)
* insert EntryDocument("urn:uuid:e1e2150d-ba34-4247-83a2-5bc9ab93ba22", genomic-study-analysis-egfr-dpcr)
//* insert EntryDocument("urn:uuid:f80f704c-b2b2-4912-ac6f-e62aaadd4ff0", GenomicStudy-ctDNA)
//* insert EntryDocument("urn:uuid:cd491a5f-62ec-4f6b-904f-206bae2c9b20", 51967-8-ctDNA)
//* insert EntryDocument("urn:uuid:b3b6b20f-8e5a-432c-8155-579dc4d60a09", 51968-6-ctDNA)

