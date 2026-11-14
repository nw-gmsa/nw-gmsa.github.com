// Laboratory Report (LAB-3) R01 message for the Lynch Syndrome ExampleScenario: from the North West GLH (699X0)
// to Manchester University NHS FT (R0A). It carries the same results as the FHIR Document
// (FHIRDocumentGeneticReportBundle2), plus the report as a PDF.
// Fictitious example: identifiers, dates and results are illustrative only.

Instance: DiagnosticReport-LynchSyndrome-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R210.2 Inherited MMR deficiency (Lynch syndrome), Ned Liverpool"
Description: "Fictitious example: the North West GLH's LAB-3 report, based on the Laboratory Order (identified by its Order Placer Number), with the variant, diagnostic implication and genomic study as results"
Usage: #example

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R210.2 Inherited MMR deficiency (Lynch syndrome), for Ned LIVERPOOL. Heterozygous pathogenic germline variant detected, consistent with inherited MMR deficiency (Lynch syndrome).</p></div>"
* identifier[ReportIdentifier]
  * value = "98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "66717"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R210.2
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"
* encounter.identifier
  * value = "66717"
  * system = "http://www.acme.org/encounter/identifiers/RBS"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBS"
* effectiveDateTime = "2023-09-07T11:45:41+00:00"
* issued = "2023-09-12T10:00:00+00:00"
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
* conclusion = "Heterozygous pathogenic germline variant detected, consistent with inherited MMR deficiency (Lynch syndrome)."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* result[+].reference = "urn:uuid:6beb613f-d303-42af-b025-86e8e0872061"
* result[+].reference = "urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa"
* result[+].reference = "urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99"
* insert ReportPDF(urn:uuid:1d9c307b-47f0-4e59-93a8-9d849086cdad, R210.2 Laboratory Report - Ned LIVERPOOL, 2023-09-12)

Instance: DocumentReference-LynchSyndrome-Report
InstanceOf: DocumentReference
Title: "Document Reference - R210.2 Laboratory Report PDF, Ned Liverpool"
Description: "Fictitious example: the North West GLH's LAB-3 report as a PDF, related to its DiagnosticReport and the Laboratory Order"
Usage: #example

* insert ReportPDFDocumentReference(2c63c3b1-caae-4b8d-835e-f75ccc46ad12, 699X0, 2023-09-12T10:00:00+00:00, urn:uuid:72f52594-d87e-4631-a208-838e720611a4, http://www.acme.org/diagnosticreport/identifiers, 98763a9b-98d4-4cfc-b760-1db086ec52a1, http://www.acme.org/servicerequest, 66717, 699X0, urn:uuid:1d9c307b-47f0-4e59-93a8-9d849086cdad, R210.2)
* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

Instance: MessageHeader-R01-LynchSyndrome
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R210.2 (R01), Inherited MMR deficiency (Lynch syndrome)"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2023-09-12T10:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:72f52594-d87e-4631-a208-838e720611a4"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-LynchSyndrome
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R210.2 (R01), Inherited MMR deficiency (Lynch syndrome)"
Description: "Fictitious example: the LAB-3 Laboratory Report in the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario, with the variant, diagnostic implication and genomic study results and the report as a PDF. The FHIR Document for the central repository includes all of these results."
Usage: #example
* insert MessageBundle("urn:uuid:7eb71d05-7be1-437f-8560-0a2246dc987e", "2023-09-12T10:00:00+00:00")
* insert EntryDocument("urn:uuid:5e9d9b1a-f90a-4b17-abe8-a23be56201de", MessageHeader-R01-LynchSyndrome)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:72f52594-d87e-4631-a208-838e720611a4", DiagnosticReport-LynchSyndrome-Report)
* insert EntryDocument("urn:uuid:6beb613f-d303-42af-b025-86e8e0872061", 6beb613f-d303-42af-b025-86e8e0872061)
* insert EntryDocument("urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa", 0878c5de-c22f-4e31-841a-a82ad31c93aa)
* insert EntryDocument("urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99", 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:2c63c3b1-caae-4b8d-835e-f75ccc46ad12", DocumentReference-LynchSyndrome-Report)
* insert EntryDocument("urn:uuid:1d9c307b-47f0-4e59-93a8-9d849086cdad", Binary-Sample)
