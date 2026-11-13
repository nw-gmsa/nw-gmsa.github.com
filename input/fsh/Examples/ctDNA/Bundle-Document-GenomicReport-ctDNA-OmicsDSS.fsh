// OMICS DSS and UGR Reporting scenario, steps 4 and 5. The resources are kept together in workflow order to demonstrate the scenario.
// Step 4: iGene (Lab 1) writes the narrative Laboratory Report (LTW LAB-3) for ctDNA order T26-59XG.
// Step 5: the RIE merges that report with the LAB-5 test results held in the FHIR Repository (adding their Observations to result)
// and builds a FHIR Document for the UGR. The Test Results are also placed in the Results from other laboratories section.
// Fictitious example: identifiers, dates and results are illustrative only.

// Content shared by the LAB-3 report and the version the RIE merges into the FHIR Document
RuleSet: iGeneNarrativeReportContent
* identifier[ReportIdentifier]
  * value = "T26-59XG"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* basedOn[OrderFillerNumber]
  * type = "ServiceRequest"
  * reference = "urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec"
  * identifier.type = $v2-0203#FILL
  * identifier.value = "T26-59XG"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* status = #final
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ctDNA genomic report for Theon SHEFFIELD. M4.14 Non-Small Cell Lung Cancer, multi-target ctDNA panel. EGFR NM_005228.5:c.2369C&gt;T p.(Thr790Met) detected in circulating tumour DNA (somatic). Outcome: TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION.</p></div>"
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code.coding[+] = $GTD#M4.14
* code.coding[+] = $sct#1054161000000101 "Genetic report"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* effectiveDateTime = "2026-07-08T09:30:00+00:00"
* issued = "2026-07-08T09:30:00+00:00"

* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"

* resultsInterpreter[author]
  * display = "Jonathan Edgerley"

* specimen[+].reference = "urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5"

* conclusion = "EGFR p.(Thr790Met) detected in circulating tumour DNA at a level requiring clinical action."
* conclusionCode[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicTestOutcomeCode#431 "TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION"


// The LAB-5 test results the report is based on
// (written with explicit urls: SUSHI cannot import the R5 extension's definition, which has no snapshot)
RuleSet: SupportingInfoTestResults
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCodeableConcept.text = "Test results (LAB-5)"
* extension[=].extension[+].url = "reference"
* extension[=].extension[=].valueReference.type = "DiagnosticReport"
* extension[=].extension[=].valueReference.identifier.system = "https://fhir.nwgenomics.nhs.uk/OmicsDSS/ResultIdentifier"
* extension[=].extension[=].valueReference.identifier.value = "DSS26-000873"
* extension[=].extension[=].valueReference.display = "OmicsDSS test results DSS26-000873"


Instance: DiagnosticReport-ctDNA-iGene-NarrativeReport
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - ctDNA narrative Laboratory Report (iGene, LAB-3)"
Description: "Fictitious example: iGene's clinically validated narrative report for ctDNA order T26-59XG, as sent in LTW LAB-3. It has no results of its own; the test results it is based on are linked by identifier using the supportingInfo extension."
Usage: #example

* insert iGeneNarrativeReportContent
* insert SupportingInfoTestResults


Instance: DiagnosticReport-ctDNA-iGene-MergedReport
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - ctDNA Laboratory Report merged with Test Results (RIE, FHIR Document)"
Description: "Fictitious example: the RIE's merge of iGene's narrative Laboratory Report (LAB-3) with the OmicsDSS test results (LAB-5) it is based on, for the FHIR Document. The report now lists the test results' Observations in result, and the supportingInfo extension also resolves to the Test Results in the document."
Usage: #example

* insert iGeneNarrativeReportContent
* insert SupportingInfoTestResults
* extension[=].extension[=].valueReference.reference = "urn:uuid:38be35e1-1df1-40fb-a055-c012dada778f"

// Added by the RIE from the Test Results
* result[+].reference = "urn:uuid:eb1f8ec5-f9ff-4472-97f9-77999460b8c8"


Instance: MessageHeaderR01ctDNAiGeneNarrativeReport
InstanceOf: MessageHeader
Title: "Message Header - ctDNA iGene narrative Laboratory Report R01 (LAB-3)"
Description: "Fictitious example: LAB-3 Laboratory Report message from iGene to the Order Placer"
Usage: #example

* meta.lastUpdated = "2026-07-08T09:31:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RHQ"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPR"

* source.name = "iGene"
* source.software = "iGene"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"

* focus[+]
  * reference = "urn:uuid:67159039-af7c-4243-84dc-22fd801a34d9"
  * type = #DiagnosticReport


Instance: ReportMessage-ctDNA-iGene-NarrativeReport
InstanceOf: BundleMessage
Title: "Bundle 'Message' - ctDNA iGene narrative Laboratory Report R01 (LAB-3)"
Description: "Fictitious example: iGene sends its narrative Laboratory Report for ctDNA order T26-59XG to the Order Placer (LTW LAB-3). The RIE also sends a copy to the FHIR Repository using $process-message."
Usage: #example
* insert MessageBundle("urn:uuid:9ef2a202-3c7e-49ab-81ce-49f7d0203c72", "2026-07-08T09:31:00+00:00")
* insert EntryDocument("urn:uuid:3409dfdb-6777-41ec-b2ff-0dd7b7e47f6f", MessageHeaderR01ctDNAiGeneNarrativeReport)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:67159039-af7c-4243-84dc-22fd801a34d9", DiagnosticReport-ctDNA-iGene-NarrativeReport)
* insert EntryDocument("urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec", ServiceRequest-ctDNA)
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)


Instance: Composition-GenomicsReport-ctDNA-OmicsDSS
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report ctDNA UGR (OMICS DSS)"
Description: "Fictitious example: the RIE combines iGene's narrative Laboratory Report (LAB-3) with the OmicsDSS test results (LAB-5) for the UGR"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:0b817ddc-0f04-41dc-ae66-e2eebb24037a"

* identifier
  * value = "T26-59XG"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
* type.coding[+] = $GTD#M4.14
* type.coding[+] = $sct#1054161000000101 "Genetic report"

* date = "2026-07-08T09:30:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "North West Genomics"
* attester[+].mode = #legal
* attester[=].time = "2026-07-08T09:30:00+00:00"
* attester[=].party.reference = "urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02"
* attester[=].party.display = "Jonathan Edgerley"

* title = "Composition Genomics Report ctDNA (OMICS DSS)"

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
  * entry[+].reference = "urn:uuid:0b817ddc-0f04-41dc-ae66-e2eebb24037a"

* section[Results]
  * title = "Results"
  * code = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>One somatic sequence variant detected in circulating tumour DNA.</p></div>"
  * section[+]
    * title = "Simple variants"
    * code = $loinc#81250-3
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>EGFR NM_005228.5:c.2369C&gt;T p.(Thr790Met) detected in circulating tumour DNA (somatic), variant allele fraction 0.42%.</p></div>"
    * entry[+].reference = "urn:uuid:eb1f8ec5-f9ff-4472-97f9-77999460b8c8"

* section[OtherLaboratoryResults]
  * title = "Results from other laboratories"
  * code = GenomicReportSection#other-laboratory-results
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Test results DSS26-000873 from the sequencing laboratory, with variant calling by OmicsDSS.</p></div>"
  * entry[+].reference = "urn:uuid:38be35e1-1df1-40fb-a055-c012dada778f"

* section[Interpretation]
  * title = "Interpretation"
  * code = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>EGFR p.(Thr790Met) was detected in circulating tumour DNA at a level requiring clinical action.</p></div>"

* section[Methodology]
  * title = "Methodology and limitations"
  * code = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Targeted sequencing of circulating tumour DNA, with variant calling by OmicsDSS. A negative result only rules out variants in the regions tested.</p></div>"


Instance: FHIRDocumentGeneticReportBundle-ctDNA-OmicsDSS
InstanceOf: BundleDocument
Title: "Bundle 'Document' - Genomics Report ctDNA UGR (OMICS DSS)"
Description: "Fictitious example: FHIR Document created by the RIE from the FHIR Repository, combining iGene's narrative Laboratory Report (LAB-3) with the OmicsDSS test results (LAB-5), for the UGR"
Usage: #example
* insert DocumentBundle("a67b85b7-dea7-424b-9281-e002f78a5698", "2026-07-08T09:45:00+00:00")
* insert EntryDocument("urn:uuid:b212d40d-70eb-4599-98a7-9a8533bc1271", Composition-GenomicsReport-ctDNA-OmicsDSS)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec", ServiceRequest-ctDNA)
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
* insert EntryDocument("urn:uuid:0b817ddc-0f04-41dc-ae66-e2eebb24037a", DiagnosticReport-ctDNA-iGene-MergedReport)
* insert EntryDocument("urn:uuid:38be35e1-1df1-40fb-a055-c012dada778f", DiagnosticReport-ctDNA-OmicsDSS-TestResults)
* insert EntryDocument("urn:uuid:eb1f8ec5-f9ff-4472-97f9-77999460b8c8", variant-egfr-omicsdss)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
