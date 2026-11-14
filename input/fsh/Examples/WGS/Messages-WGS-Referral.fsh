// FHIR Messages for the Whole Genome Sequencing ExampleScenario: the Laboratory Order (LAB-1) for the dWGS Trio
// referral r26000000203 from North Cumbria Integrated Care NHS FT (RNN) to the Requesting Genomic Laboratory
// (NE&Y Genomics, 699N0), and the RGL's Laboratory Report (LAB-3) back to the Trust.
// In practice the referral is registered in Genomics England's TOMS, which is not FHIR; the O21 message
// illustrates the content of the referral as it reaches the RGL.
// The referral, family and family members are referenced by relative references, so their entries use RESTful fullUrls.
// Fictitious example: identifiers, dates and results are illustrative only.

// Laboratory Order (LAB-1)

Instance: MessageHeader-O21-WGS-Referral
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order R27.3 (O21), dWGS Trio referral r26000000203"
Description: "Fictitious example: LAB-1 referral from NORTH CUMBRIA INTEGRATED CARE NHS FOUNDATION TRUST to the RGL, NE&Y GENOMICS"
Usage: #example

* meta.lastUpdated = "2026-08-10T10:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "RNN"
* sender.display = "NORTH CUMBRIA INTEGRATED CARE NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699N0"
* destination.receiver.display = "NE&Y GENOMICS"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NEYGenomics"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RNN"
* source.software = "NCIC EPR"
* focus[+]
  * reference = "https://fhir.nwgenomics.nhs.uk/ServiceRequest/ServiceRequest-dWGS-Trio-r26000000203-Referral"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-WGS-Referral
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order R27.3 (O21), dWGS Trio referral r26000000203"
Description: "Fictitious example: the LAB-1 referral for the Trio family r26000000203 in the [Whole Genome Sequencing](ExampleScenario-WholeGenomeSequencing.html) scenario. The original order has the [Family Genetic Group](Group-FamilyGeneticGroup-dWGS-Trio-r26000000203.html) as its subject, with a FamilyMemberHistory for each family member's relationship to the Proband. Illustrates the CIP-API `REFERRAL`, `PEDIGREE` and `PEDIGREE_MEMBER`."
Usage: #example
* insert MessageBundle("urn:uuid:12b7d4f6-088c-4c27-994b-a19901a9d6f3", "2026-08-10T10:00:00+00:00")
* insert EntryDocument("urn:uuid:716c6790-993a-4f5d-89ed-1cbf106180a6", MessageHeader-O21-WGS-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/ServiceRequest/ServiceRequest-dWGS-Trio-r26000000203-Referral", ServiceRequest-dWGS-Trio-r26000000203-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Group/FamilyGeneticGroup-dWGS-Trio-r26000000203", FamilyGeneticGroup-dWGS-Trio-r26000000203)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/FamilyMemberHistory/FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000105", FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000105)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/FamilyMemberHistory/FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000106", FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000106)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough", Patient-Brough)

// Laboratory Report (LAB-3)

Instance: DiagnosticReport-WGS-Referral
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R27.3 Paediatric disorders (WGS), dWGS Trio referral r26000000203"
Description: "Fictitious example: the RGL's LAB-3 report for the referral, based on the original order. Logically a report on the whole family; the Proband is the subject, as the DiagnosticReport profile only allows a Patient."
Usage: #example

* identifier[ReportIdentifier]
  * value = "NEY26-r26000000203"
  * system = "http://www.acme.org/diagnosticreport/identifiers/699N0"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699N0"
* basedOn[OrderFillerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "https://genomicsengland.co.uk/healthcare/referral-id"
  * identifier.value = "r26000000203"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "8J834"
  * reference = "https://fhir.nwgenomics.nhs.uk/ServiceRequest/ServiceRequest-dWGS-Trio-r26000000203-Referral"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R27.3
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"
* effectiveDateTime = "2026-08-18T00:00:00+00:00"
* issued = "2026-11-02T12:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699N0"
  * type = #Organization
  * display = "NE&Y GENOMICS"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C2345678"
  * display = "FICTITIOUS, Hannah"
* conclusion = "Trio whole genome sequencing: pathogenic de novo MECP2 variant detected in the Proband, consistent with the referral indication. The variant was not detected in either parent."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"

Instance: MessageHeader-R01-WGS-Referral
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R27.3 (R01), dWGS Trio referral r26000000203"
Description: "Fictitious example: LAB-3 report from the RGL, NE&Y GENOMICS, to NORTH CUMBRIA INTEGRATED CARE NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-11-02T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699N0"
* sender.display = "NE&Y GENOMICS"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RNN"
* destination.receiver.display = "NORTH CUMBRIA INTEGRATED CARE NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RNN"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NEYGenomics"
* source.software = "NE&Y Genomics"
* focus[+]
  * reference = "urn:uuid:efc76d09-a4d9-46cb-8aa5-98748594ceae"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-WGS-Referral
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R27.3 (R01), dWGS Trio referral r26000000203"
Description: "Fictitious example: the RGL's LAB-3 Laboratory Report for the referral in the [Whole Genome Sequencing](ExampleScenario-WholeGenomeSequencing.html) scenario. See the [WGS FHIR Document](Bundle-FHIRDocumentGeneticReportBundle-WGS.html) for the report content with its variants."
Usage: #example
* insert MessageBundle("urn:uuid:759b5ea3-98d0-4ec7-a954-59d00a1160f4", "2026-11-02T12:00:00+00:00")
* insert EntryDocument("urn:uuid:f9153314-1f04-465e-b1a9-168b953e6e2f", MessageHeader-R01-WGS-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough", Patient-Brough)
* insert EntryDocument("urn:uuid:efc76d09-a4d9-46cb-8aa5-98748594ceae", DiagnosticReport-WGS-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/ServiceRequest/ServiceRequest-dWGS-Trio-r26000000203-Referral", ServiceRequest-dWGS-Trio-r26000000203-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Group/FamilyGeneticGroup-dWGS-Trio-r26000000203", FamilyGeneticGroup-dWGS-Trio-r26000000203)
