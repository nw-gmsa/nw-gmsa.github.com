// Laboratory Report (LTW LAB-3) R01 messages for the MRD Monitoring ExampleScenario: from the NW GLH (699X0) to
// Leeds Teaching Hospitals NHS Trust (RR8), based on the Laboratory Order ServiceRequest-BCRABL.
// iGene sends the Laboratory Report with the report as a PDF only (GenomicsReportMessage-BCRABL). The RIE looks up the
// discrete results in the FHIR Repository - the Cepheid GeneXpert test result (TestResultsMessage-BCRABL-Cepheid) is
// based on the work order T26-61BC, which is also the Laboratory Report identifier - and sends Leeds an enhanced R01
// with the discrete results (GenomicsReportMessage-BCRABL-Enhanced).
// iGene uses its test number (iGene/ReportIdentifier) as the Laboratory Report identifier.
// Fictitious example: identifiers, dates and results are illustrative only.

RuleSet: BCRABLReportContent
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M84.2 Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR, for Rob LEEDS. BCR-ABL1 POSITIVE, above the upper limit of quantification.</p></div>"
* identifier[ReportIdentifier]
  * value = "T26-61BC"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RR8"
  * identifier.value = "RR8-26-08812"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RR8"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[ProcedureCodeGenomicTestDirectory] = $GTD#M84.2
* code.coding[UKCoreReportCode] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Rob LEEDS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383222"
* effectiveDateTime = "2026-07-10T09:30:00+01:00"
* issued = "2026-07-14T14:10:00+01:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NORTH WEST GLH"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"
* specimen[+].reference = "urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22"
* conclusion = "BCR-ABL1 POSITIVE, above the upper limit of quantification (55.00% IS)."
* insert ReportPDF(urn:uuid:9c44c546-8f74-4b46-a6f1-af32a9526b13, M84.2 Laboratory Report - Rob LEEDS, 2026-07-14)

Instance: DiagnosticReport-BCRABL-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M84.2 Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR, Rob Leeds"
Description: "Fictitious example: the North West GLH's LAB-3 report to Leeds Teaching Hospitals, based on the Laboratory Order (identified by its Order Placer Number), with the report as a PDF and no discrete results"
Usage: #example

* insert BCRABLReportContent

Instance: DiagnosticReport-BCRABL-Report-Enhanced
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M84.2 Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR, Rob Leeds (enhanced with discrete results)"
Description: "Fictitious example: the Laboratory Report enhanced by the RIE, with the BCR-ABL1 result looked up in the FHIR Repository added as `result`"
Usage: #example

* insert BCRABLReportContent
// Added by the RIE from the FHIR Repository
* result[+].reference = "urn:uuid:79d87e2a-9c77-4ab6-ae71-b92d3a962e22"

Instance: DocumentReference-BCRABL-Report
InstanceOf: DocumentReference
Title: "Document Reference - M84.2 Laboratory Report PDF, Rob Leeds"
Description: "Fictitious example: the North West GLH's LAB-3 report as a PDF, related to its DiagnosticReport and the Laboratory Order"
Usage: #example

* insert ReportPDFDocumentReferenceByIdentifier(83d04ada-e52d-4e5b-ae04-8c80c2f786a4, 699X0, 2026-07-14T14:10:00+01:00, https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier, T26-61BC, http://www.acme.org/servicerequest/RR8, RR8-26-08812, RR8, urn:uuid:9c44c546-8f74-4b46-a6f1-af32a9526b13, M84.2)
* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Rob LEEDS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383222"

Instance: MessageHeader-R01-BCRABL
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report M84.2 BCR-ABL1 MRD monitoring (R01)"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to LEEDS TEACHING HOSPITALS NHS TRUST"
Usage: #example

* meta.lastUpdated = "2026-07-14T14:10:00+01:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RR8"
* destination.receiver.display = "LEEDS TEACHING HOSPITALS NHS TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RR8"
* source.name = "iGene"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"
* focus[+]
  * reference = "urn:uuid:cb6462d4-2aed-428b-84c1-5cf1af4a333a"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-BCRABL
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report M84.2 BCR-ABL1 MRD monitoring (R01)"
Description: "Fictitious example: the LAB-3 Laboratory Report to Leeds Teaching Hospitals in the [Measurable Residual Disease (MRD) Monitoring](ExampleScenario-MRDMonitoring.html) scenario, with the report as a PDF (`DocumentReference` and `Binary`) and no discrete results. The RIE enhances it with the discrete results from the FHIR Repository before it reaches Leeds - see [GenomicsReportMessage-BCRABL-Enhanced](Bundle-GenomicsReportMessage-BCRABL-Enhanced.html)"
Usage: #example
* insert MessageBundle("urn:uuid:f99fdc1c-8ced-43f0-8497-b82f03b99a3e", "2026-07-14T14:10:00+01:00")
* insert EntryDocument("urn:uuid:0368284e-dfe8-4702-8f91-dfdba3cbc141", MessageHeader-R01-BCRABL)
* insert EntryDocument("urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71", Patient-Leeds)
* insert EntryDocument("urn:uuid:cb6462d4-2aed-428b-84c1-5cf1af4a333a", DiagnosticReport-BCRABL-Report)
* insert EntryDocument("urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22", Specimen-BCRABL)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:83d04ada-e52d-4e5b-ae04-8c80c2f786a4", DocumentReference-BCRABL-Report)
* insert EntryDocument("urn:uuid:9c44c546-8f74-4b46-a6f1-af32a9526b13", Binary-Sample)

// Laboratory Report enhanced by the RIE with the discrete results from the FHIR Repository

Instance: MessageHeader-R01-BCRABL-Enhanced
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report M84.2 BCR-ABL1 MRD monitoring (R01, enhanced with discrete results)"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to LEEDS TEACHING HOSPITALS NHS TRUST, enhanced by the RIE"
Usage: #example

* meta.lastUpdated = "2026-07-14T14:11:00+01:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RR8"
* destination.receiver.display = "LEEDS TEACHING HOSPITALS NHS TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RR8"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:a0d78fe6-bbf8-4098-ac10-9db6dee1f1e3"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-BCRABL-Enhanced
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report M84.2 BCR-ABL1 MRD monitoring (R01, enhanced with discrete results)"
Description: "Fictitious example: the LAB-3 Laboratory Report to Leeds Teaching Hospitals in the [Measurable Residual Disease (MRD) Monitoring](ExampleScenario-MRDMonitoring.html) scenario, enhanced by the RIE: the BCR-ABL1 result looked up in the FHIR Repository is added to the report's `result` and to the message, alongside the report as a PDF. Shows that an ORU^R01 can carry discrete results"
Usage: #example
* insert MessageBundle("urn:uuid:efb2210f-bfe0-47ca-b46a-2a04f71994bf", "2026-07-14T14:11:00+01:00")
* insert EntryDocument("urn:uuid:52babcd9-d00f-496b-bb23-075a7f92e429", MessageHeader-R01-BCRABL-Enhanced)
* insert EntryDocument("urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71", Patient-Leeds)
* insert EntryDocument("urn:uuid:a0d78fe6-bbf8-4098-ac10-9db6dee1f1e3", DiagnosticReport-BCRABL-Report-Enhanced)
* insert EntryDocument("urn:uuid:79d87e2a-9c77-4ab6-ae71-b92d3a962e22", Observation-BCRABL-Report)
* insert EntryDocument("urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22", Specimen-BCRABL)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:83d04ada-e52d-4e5b-ae04-8c80c2f786a4", DocumentReference-BCRABL-Report)
* insert EntryDocument("urn:uuid:9c44c546-8f74-4b46-a6f1-af32a9526b13", Binary-Sample)
