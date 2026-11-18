// Laboratory Report (LAB-3) R01 message for the Pharmacogenomics ExampleScenario: from the North West GLH (699X0)
// to Liverpool Heart and Chest Hospital (RBQ), with the report as a PDF and no discrete results.
// The RIE looks up the discrete results in the FHIR Repository and adds them to the report as an enhanced R01
// (GenomicsReportMessage-Pharmacogenomics-Enhanced), used internally to create the FHIR Document
// (FHIRDocumentGeneticReportBundle-Pharmacogenomics), which adds the Composition.
// Fictitious example: identifiers, dates and results are illustrative only.

RuleSet: PharmacogenomicsReportContent
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R454.1 CYP2C19 genotyping before mavacamten, for Mace NORTHWICH. CYP2C19 *2/*2 - poor metaboliser.</p></div>"
* identifier[ReportIdentifier]
  * value = "e9a1b7c4-pgx-r454"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "71388"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R454.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"
* effectiveDateTime = "2026-10-27T10:15:00+00:00"
* issued = "2026-11-02T15:45:00+00:00"
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
* conclusion = "CYP2C19 *2/*2 - poor metaboliser."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* insert ReportPDF(urn:uuid:f9d86d34-fb27-48a0-aea6-02cca332a64e, R454.1 Laboratory Report - Mace NORTHWICH, 2026-11-02)

Instance: DiagnosticReport-Pharmacogenomics-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R454.1 CYP2C19 genotyping before mavacamten, Mace Northwich"
Description: "Fictitious example: the North West GLH's LAB-3 report, based on the Laboratory Order (identified by its Order Placer Number), with the report as a PDF and no discrete results"
Usage: #example

* insert PharmacogenomicsReportContent

Instance: DiagnosticReport-Pharmacogenomics-Report-Enhanced
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R454.1 CYP2C19 genotyping before mavacamten, Mace Northwich (enhanced with discrete results)"
Description: "Fictitious example: the Laboratory Report enhanced by the RIE, with the genotype, haplotype, therapeutic implication and genomic study looked up in the FHIR Repository added as `result`"
Usage: #example

* insert PharmacogenomicsReportContent
// Added by the RIE from the FHIR Repository
* result[+].reference = "urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b"
* result[+].reference = "urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff"
* result[+].reference = "urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1"
* result[+].reference = "urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2"

Instance: DocumentReference-Pharmacogenomics-Report
InstanceOf: DocumentReference
Title: "Document Reference - R454.1 Laboratory Report PDF, Mace Northwich"
Description: "Fictitious example: the North West GLH's LAB-3 report as a PDF, related to its DiagnosticReport and the Laboratory Order"
Usage: #example

* insert ReportPDFDocumentReferenceByIdentifier(8a595a14-5fa3-4051-832c-e5bf4d80373b, 699X0, 2026-11-02T15:45:00+00:00, http://www.acme.org/diagnosticreport/identifiers, e9a1b7c4-pgx-r454, http://www.acme.org/servicerequest, 71388, 699X0, urn:uuid:f9d86d34-fb27-48a0-aea6-02cca332a64e, R454.1)
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"

Instance: MessageHeader-R01-Pharmacogenomics
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R454.1 (R01), CYP2C19 genotyping before mavacamten"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to LIVERPOOL HEART AND CHEST HOSPITAL NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-11-02T15:45:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RBQ"
* destination.receiver.display = "LIVERPOOL HEART AND CHEST HOSPITAL NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RBQ"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:dac39d4d-1955-4ad5-96c1-e033b7801687"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-Pharmacogenomics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R454.1 (R01), CYP2C19 genotyping before mavacamten"
Description: "Fictitious example: the LAB-3 Laboratory Report in the [Pharmacogenomics](ExampleScenario-Pharmacogenomics.html) scenario, with the report as a PDF (`DocumentReference` and `Binary`) and no discrete results. The discrete results are looked up in the FHIR Repository and added when the FHIR Document is created."
Usage: #example
* insert MessageBundle("urn:uuid:17622acd-9f03-4fed-97de-9e819696bb54", "2026-11-02T15:45:00+00:00")
* insert EntryDocument("urn:uuid:7af90dcd-fada-4c9c-ae2e-a025214d925f", MessageHeader-R01-Pharmacogenomics)
* insert EntryDocument("urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a", Patient-Northwich)
* insert EntryDocument("urn:uuid:dac39d4d-1955-4ad5-96c1-e033b7801687", DiagnosticReport-Pharmacogenomics-Report)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:8a595a14-5fa3-4051-832c-e5bf4d80373b", DocumentReference-Pharmacogenomics-Report)
* insert EntryDocument("urn:uuid:f9d86d34-fb27-48a0-aea6-02cca332a64e", Binary-Sample)

// Laboratory Report enhanced by the RIE with the discrete results from the FHIR Repository (internal to the RIE)

Instance: MessageHeader-R01-Pharmacogenomics-Enhanced
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R454.1 (R01, enhanced with discrete results), CYP2C19 genotyping before mavacamten"
Description: "Fictitious example: the LAB-3 report enhanced by the RIE with the discrete results from the FHIR Repository, used internally to create the FHIR Document"
Usage: #example

* meta.lastUpdated = "2026-11-02T15:50:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.name = "RIE"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.name = "RIE"
* source.software = "RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* focus[+]
  * reference = "urn:uuid:b233b087-27fe-4f77-b395-181aa676ac1f"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-Pharmacogenomics-Enhanced
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R454.1 (R01, enhanced with discrete results), CYP2C19 genotyping before mavacamten"
Description: "Fictitious example: the LAB-3 Laboratory Report in the [Pharmacogenomics](ExampleScenario-Pharmacogenomics.html) scenario, enhanced by the RIE: the genotype, haplotype, therapeutic implication and genomic study looked up in the FHIR Repository are added to the report's `result` and to the message, alongside the report as a PDF. Used internally to create the [FHIR Document](Bundle-FHIRDocumentGeneticReportBundle-Pharmacogenomics.html), which adds the `Composition`, as in [Measurable Residual Disease (MRD) Monitoring](ExampleScenario-MRDMonitoring.html)"
Usage: #example
* insert MessageBundle("urn:uuid:b79391b4-948c-4ede-9b3d-af8761a5e7a3", "2026-11-02T15:50:00+00:00")
* insert EntryDocument("urn:uuid:4e114f69-a77a-4d3b-ae36-904d5ef28bab", MessageHeader-R01-Pharmacogenomics-Enhanced)
* insert EntryDocument("urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a", Patient-Northwich)
* insert EntryDocument("urn:uuid:b233b087-27fe-4f77-b395-181aa676ac1f", DiagnosticReport-Pharmacogenomics-Report-Enhanced)
* insert EntryDocument("urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b", Genotype-Pharmacogenomics-CYP2C19)
* insert EntryDocument("urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff", Haplotype-Pharmacogenomics-CYP2C19-2)
* insert EntryDocument("urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1", TherapeuticImplication-Pharmacogenomics-Mavacamten)
* insert EntryDocument("urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2", GenomicStudyPanel-Pharmacogenomics)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:8a595a14-5fa3-4051-832c-e5bf4d80373b", DocumentReference-Pharmacogenomics-Report)
* insert EntryDocument("urn:uuid:f9d86d34-fb27-48a0-aea6-02cca332a64e", Binary-Sample)
