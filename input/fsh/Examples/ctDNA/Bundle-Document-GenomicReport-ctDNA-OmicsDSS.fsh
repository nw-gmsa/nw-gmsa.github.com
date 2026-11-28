// ctDNA scenario, steps 5 and 6 (Laboratory Report and FHIR Document). The resources are kept together in workflow order to demonstrate the scenario.
// Step 5: iGene (Lab 1) writes the narrative Laboratory Report (LTW LAB-3) for ctDNA order T26-59XG.
// Step 6: the LAB-3 report triggers the RIE to look up the LAB-5 test results held in the FHIR Repository. The RIE merges them
// into the report (adding their Observations to result) as an enhanced R01 (ReportMessage-ctDNA-iGene-Enhanced), used
// internally, and converts that into a FHIR Document for the UGR. The Test Results are also placed in the Results from other laboratories section.
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
  * display = "FICTITIOUS, Morgan"

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
Description: "Fictitious example: iGene's clinically validated narrative report for ctDNA order T26-59XG, as sent in LTW LAB-3, with the report as a PDF. It has no results of its own; the test results it is based on are linked by identifier using the supportingInfo extension."
Usage: #example

* insert iGeneNarrativeReportContent
* insert SupportingInfoTestResults
* insert ReportPDF(urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac, ctDNA Laboratory Report - Theon SHEFFIELD, 2026-07-08)


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
* insert ReportPDF(urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac, ctDNA Laboratory Report - Theon SHEFFIELD, 2026-07-08)


Instance: MessageHeaderR01ctDNAiGeneEnhanced
InstanceOf: MessageHeader
Title: "Message Header - ctDNA Laboratory Report R01 enhanced with the Test Results (RIE)"
Description: "Fictitious example: the LAB-3 Laboratory Report enhanced by the RIE with the discrete results from the FHIR Repository, used internally before it is converted into a FHIR Document"
Usage: #example

* meta.lastUpdated = "2026-07-08T09:40:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.name = "RIE"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* source.name = "RIE"
* source.software = "RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* focus[+]
  * reference = "urn:uuid:0b817ddc-0f04-41dc-ae66-e2eebb24037a"
  * type = #DiagnosticReport


Instance: ReportMessage-ctDNA-iGene-Enhanced
InstanceOf: BundleMessage
Title: "Bundle 'Message' - ctDNA Laboratory Report R01 enhanced with the Test Results (RIE, internal)"
Description: "Fictitious example: the RIE looks up the OmicsDSS test results (LAB-5) in the FHIR Repository and adds them to iGene's narrative Laboratory Report (LAB-3): the report's `result` lists the test results' `Observation`s, and the `supportingInfo` extension resolves to the Test Results in the message. Used internally as the step before converting into the [FHIR Document](Bundle-FHIRDocumentGeneticReportBundle-ctDNA-OmicsDSS.html), as in [Measurable Residual Disease (MRD) Monitoring](ExampleScenario-MRDMonitoring.html)"
Usage: #example
* insert MessageBundle("urn:uuid:8de9e562-eb54-4cf6-8457-fef37505148a", "2026-07-08T09:40:00+00:00")
* insert EntryDocument("urn:uuid:db0e49f5-409e-400c-8ee4-e0986f68a297", MessageHeaderR01ctDNAiGeneEnhanced)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:0b817ddc-0f04-41dc-ae66-e2eebb24037a", DiagnosticReport-ctDNA-iGene-MergedReport)
* insert EntryDocument("urn:uuid:38be35e1-1df1-40fb-a055-c012dada778f", DiagnosticReport-ctDNA-OmicsDSS-TestResults)
* insert EntryDocument("urn:uuid:eb1f8ec5-f9ff-4472-97f9-77999460b8c8", variant-egfr-omicsdss)
* insert EntryDocument("urn:uuid:362377e5-ae0f-4b2f-b245-85eb323b6187", PractitionerRole-OmicsDSS)
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
* insert EntryDocument("urn:uuid:bdf9908e-ffac-4f39-a546-5aa527700b73", DocumentReference-ctDNA-Report)
* insert EntryDocument("urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac", Binary-Sample)


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
Description: "Fictitious example: iGene sends its narrative Laboratory Report for ctDNA order T26-59XG to the Order Placer (LTW LAB-3), with the report as a PDF (`DocumentReference` and `Binary`). The RIE also sends a copy to the FHIR Repository using $process-message."
Usage: #example
* insert MessageBundle("urn:uuid:9ef2a202-3c7e-49ab-81ce-49f7d0203c72", "2026-07-08T09:31:00+00:00")
* insert EntryDocument("urn:uuid:3409dfdb-6777-41ec-b2ff-0dd7b7e47f6f", MessageHeaderR01ctDNAiGeneNarrativeReport)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:67159039-af7c-4243-84dc-22fd801a34d9", DiagnosticReport-ctDNA-iGene-NarrativeReport)
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
* insert EntryDocument("urn:uuid:bdf9908e-ffac-4f39-a546-5aa527700b73", DocumentReference-ctDNA-Report)
* insert EntryDocument("urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac", Binary-Sample)


// Copy of the Laboratory Report to the Order Placer Manager (NE&Y GMSA), without the report (no PDF, DocumentReference or Binary)

Instance: DiagnosticReport-ctDNA-iGene-NarrativeReport-OrderPlacerManager
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - ctDNA Laboratory Report, copy for the Order Placer Manager (no report PDF)"
Description: "Fictitious example: iGene's narrative Laboratory Report for ctDNA order T26-59XG as copied to the Order Placer Manager: the same report without the report PDF (`presentedForm`)"
Usage: #example

* insert iGeneNarrativeReportContent
* insert SupportingInfoTestResults


Instance: MessageHeaderR01ctDNAOrderPlacerManager
InstanceOf: MessageHeader
Title: "Message Header - ctDNA Laboratory Report R01, copy to the Order Placer Manager"
Description: "Fictitious example: copy of the LAB-3 Laboratory Report message, without the report PDF, from the North West GLH to NE&Y GMSA, the Order Placer Manager"
Usage: #example

* meta.lastUpdated = "2026-07-08T09:32:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699N0"
* destination.receiver.display = "NEY GMSA"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NEYAWSSQS"

* source.name = "RIE"
* source.software = "RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* focus[+]
  * reference = "urn:uuid:9aec457d-d16b-4a12-a773-5347c20f0db1"
  * type = #DiagnosticReport


Instance: ReportMessage-ctDNA-iGene-OrderPlacerManager
InstanceOf: BundleMessage
Title: "Bundle 'Message' - ctDNA Laboratory Report R01, copy to the Order Placer Manager (no report PDF)"
Description: "Fictitious example: the RIE sends a copy of iGene's Laboratory Report for ctDNA order T26-59XG to NE&Y GMSA, the Order Placer Manager that monitors orders placed in its region, in the [ctDNA](ExampleScenario-ctDNA.html) scenario. The report PDF is removed: there is no `presentedForm`, `DocumentReference` or `Binary`."
Usage: #example
* insert MessageBundle("urn:uuid:42854213-807a-41fc-82be-d8950d576020", "2026-07-08T09:32:00+00:00")
* insert EntryDocument("urn:uuid:8a62dcfb-6171-4b40-99b9-679c75404eef", MessageHeaderR01ctDNAOrderPlacerManager)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:9aec457d-d16b-4a12-a773-5347c20f0db1", DiagnosticReport-ctDNA-iGene-NarrativeReport-OrderPlacerManager)
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
* attester[=].party.display = "FICTITIOUS, Morgan"

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
Description: "Fictitious example: FHIR Document converted by the RIE from the enhanced R01 (ReportMessage-ctDNA-iGene-Enhanced), combining iGene's narrative Laboratory Report (LAB-3) with the OmicsDSS test results (LAB-5), for the UGR"
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
* insert EntryDocument("urn:uuid:362377e5-ae0f-4b2f-b245-85eb323b6187", PractitionerRole-OmicsDSS)
* insert EntryDocument("urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac", Binary-Sample)

Instance: DocumentReference-ctDNA-Report
InstanceOf: DocumentReference
Title: "Document Reference - ctDNA Laboratory Report PDF, Theon Sheffield"
Description: "Fictitious example: the narrative Laboratory Report for ctDNA order T26-59XG as a PDF, related to its DiagnosticReport by its Report Identifier and to the order by its Order Group Number"
Usage: #example

* identifier[+].value = "bdf9908e-ffac-4f39-a546-5aa527700b73"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "699X0"
* status = #current
* date = "2026-07-08T09:30:00+00:00"
* type = $sct#1054161000000101 "Genetic report"
* context.related[DiagnosticReport]
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.value = "T26-59XG"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* context.related[OrderGroupNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PGN
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReferralIdentifier"
  * identifier.value = "R26-15AY"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac"
* context.event[+] = $test-directory#M4.14
* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

// T02 FHIR Message (Document and Document Notification): the report PDF
* author[+].identifier.system = $ods-code
* author[=].identifier.value = "699X0"
* custodian.identifier.system = $ods-code
* custodian.identifier.value = "699X0"

Instance: MessageHeader-T02-ctDNA
InstanceOf: MessageHeader
Title: "Message Header - Document Notification (T02), M4.14 ctDNA"
Description: "Fictitious example: the report PDF from NORTH WEST GLH to NHS SOUTH YORKSHIRE INTEGRATED CARE BOARD"
Usage: #example

* insert T02MessageHeader(2026-07-08T09:35:00+00:00, 699X0, NORTH WEST GLH, QF7, NHS SOUTH YORKSHIRE INTEGRATED CARE BOARD, https://fhir.nwgenomics.nhs.uk/Endpoint/QF7, urn:uuid:bdf9908e-ffac-4f39-a546-5aa527700b73, urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac)

Instance: DocumentMessage-ctDNA
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Document Notification (T02), M4.14 ctDNA"
Description: "Fictitious example: the narrative Laboratory Report PDF sent to the regional shared care record by the RIE in the [Lung Cancer - Liquid Biopsy (ctDNA)](ExampleScenario-ctDNA.html) scenario, as a T02 FHIR Message - the FHIR equivalent of HL7 v2 `MDM^T02`. It carries the report PDF as a `DocumentReference` and `Binary`. See [Document and Document Notification](MessageDefinition-original-document.html)."
Usage: #example
* insert MessageBundle("urn:uuid:c43d474b-af21-4558-bdd7-f83c9b279651", "2026-07-08T09:35:00+00:00")
* insert EntryDocument("urn:uuid:be80f4b5-4f83-4d0c-a4b1-1d9dd0ac9413", MessageHeader-T02-ctDNA)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:bdf9908e-ffac-4f39-a546-5aa527700b73", DocumentReference-ctDNA-Report)
* insert EntryDocument("urn:uuid:158c1e5d-591c-4bcc-97e2-c958aadd44ac", Binary-Sample)
