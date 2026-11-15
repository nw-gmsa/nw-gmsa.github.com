// FHIR Messages for the Whole Genome Sequencing ExampleScenario: the Laboratory Order (LAB-1) for the dWGS Trio
// referral r26000000203 from North Cumbria Integrated Care NHS FT (RNN) to the Requesting Genomic Laboratory
// (NE&Y Genomics, 699N0), and the RGL's Laboratory Report (LAB-3) back to the Trust.
// In practice the referral is registered in Genomics England's TOMS, which is not FHIR; the O19 message
// illustrates the content of the referral as it reaches the RGL. Its subject is the family.
// Later orders and reports reference the referral by its NGIS referral_id and do not carry it.
// The referral, family and family members are referenced by relative references, so their entries use RESTful fullUrls.
// Fictitious example: identifiers, dates and results are illustrative only.

// Laboratory Order (LAB-1)

Instance: MessageHeader-O19-WGS-Referral
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order R27.3 (O19), dWGS Trio referral r26000000203"
Description: "Fictitious example: LAB-1 referral from NORTH CUMBRIA INTEGRATED CARE NHS FOUNDATION TRUST to the RGL, NE&Y GENOMICS"
Usage: #example

* meta.lastUpdated = "2026-08-10T10:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O19
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
Title: "Bundle 'Message' - Laboratory Order R27.3 (O19), dWGS Trio referral r26000000203"
Description: "Fictitious example: the LAB-1 referral for the Trio family r26000000203 in the [Whole Genome Sequencing](ExampleScenario-WholeGenomeSequencing.html) scenario. The original order has the [Family Genetic Group](Group-FamilyGeneticGroup-dWGS-Trio-r26000000203.html) as its subject, and a `Patient` for each member of the family, referenced from `Group.member.entity`. Illustrates the CIP-API `REFERRAL`, `PEDIGREE` and `PEDIGREE_MEMBER`. Later sub-orders and reports reference the referral by its NGIS referral_id and do not include it."
Usage: #example
* insert MessageBundle("urn:uuid:12b7d4f6-088c-4c27-994b-a19901a9d6f3", "2026-08-10T10:00:00+00:00")
* insert EntryDocument("urn:uuid:716c6790-993a-4f5d-89ed-1cbf106180a6", MessageHeader-O19-WGS-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/ServiceRequest/ServiceRequest-dWGS-Trio-r26000000203-Referral", ServiceRequest-dWGS-Trio-r26000000203-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Group/FamilyGeneticGroup-dWGS-Trio-r26000000203", FamilyGeneticGroup-dWGS-Trio-r26000000203)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough", Patient-Brough)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Patient/Patient-Editestpatient-Thirteen", Patient-Editestpatient-Thirteen)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Patient/Patient-Editestpatient-Six", Patient-Editestpatient-Six)

// Laboratory Report (LAB-3)

Instance: DiagnosticReport-WGS-Referral
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R27.3 Paediatric disorders (WGS), dWGS Trio referral r26000000203"
Description: "Fictitious example: the RGL's LAB-3 report for the referral, based on the original order, which it identifies by the NGIS referral_id. Logically a report on the whole family; the Proband is the subject, as the DiagnosticReport profile only allows a Patient."
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

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R27.3 Paediatric disorders (trio whole genome sequencing) for Gilly BROUGH. Pathogenic de novo MECP2 variant NM_004992.4:c.763C&gt;T p.(Arg255Ter), consistent with the referral indication.</p></div>"
* result[+].reference = "urn:uuid:59721fb3-b791-4ff8-8f8d-a9a44c602c05"
* result[+].reference = "urn:uuid:c19d9c74-cfb6-428d-8ce8-7aca96b5f53b"
* insert ReportPDF(urn:uuid:cf3bc470-4956-4fe7-989a-2fb876905021, R27.3 Laboratory Report - Gilly BROUGH, 2026-11-02)

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
Description: "Fictitious example: the RGL's LAB-3 Laboratory Report for the referral in the [Whole Genome Sequencing](ExampleScenario-WholeGenomeSequencing.html) scenario. The report identifies the original order by its NGIS referral_id; the original order is not included. See the [WGS FHIR Document](Bundle-FHIRDocumentGeneticReportBundle-WGS.html) for the report content with its variants."
Usage: #example
* insert MessageBundle("urn:uuid:759b5ea3-98d0-4ec7-a954-59d00a1160f4", "2026-11-02T12:00:00+00:00")
* insert EntryDocument("urn:uuid:f9153314-1f04-465e-b1a9-168b953e6e2f", MessageHeader-R01-WGS-Referral)
* insert EntryDocument("https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough", Patient-Brough)
* insert EntryDocument("urn:uuid:efc76d09-a4d9-46cb-8aa5-98748594ceae", DiagnosticReport-WGS-Referral)
* insert EntryDocument("urn:uuid:59721fb3-b791-4ff8-8f8d-a9a44c602c05", Variant-WGS-Referral-MECP2)
* insert EntryDocument("urn:uuid:c19d9c74-cfb6-428d-8ce8-7aca96b5f53b", DiagnosticImplication-WGS-Referral-MECP2)
* insert EntryDocument("urn:uuid:0349b609-bc9c-40e2-8c34-ee322adceca8", DocumentReference-WGS-Referral)
* insert EntryDocument("urn:uuid:cf3bc470-4956-4fe7-989a-2fb876905021", Binary-Sample)

// Results and report document

Instance: Variant-WGS-Referral-MECP2
InstanceOf: Variant
Title: "Variant - MECP2, dWGS Trio referral r26000000203"
Description: "Fictitious example: the de novo MECP2 variant found in the Proband by trio whole genome sequencing, interpreted by the RGL"
Usage: #example

* insert GenomicResultObservation(59721fb3-b791-4ff8-8f8d-a9a44c602c05, 2026-10-28T14:10:00+00:00, 699N0, NE&Y GENOMICS)
* code = $loinc#69548-6 "Genetic variant assessment"
* subject.reference = "https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* method.text = "Whole genome sequencing (trio)"
* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:6990 "MECP2"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_004992.4
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_004992.4:c.763C>T
* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"NP_004983.1:p.(Arg255Ter)"
* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6683-2 "Germline"
* component[+].code = $loinc#53034-5 "Allelic state"
* component[=].valueCodeableConcept = $loinc#LA6706-1 "Heterozygous"

Instance: DiagnosticImplication-WGS-Referral-MECP2
InstanceOf: DiagnosticImplication
Title: "Diagnostic Implication - MECP2, dWGS Trio referral r26000000203"
Description: "Fictitious example: pathogenic classification of the de novo MECP2 variant"
Usage: #example

* insert GenomicResultObservation(c19d9c74-cfb6-428d-8ce8-7aca96b5f53b, 2026-10-28T14:10:00+00:00, 699N0, NE&Y GENOMICS)
* subject.reference = "https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"
* derivedFrom.reference = "urn:uuid:59721fb3-b791-4ff8-8f8d-a9a44c602c05"
* component[clinical-significance].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[predicted-phenotype].valueCodeableConcept.text = "MECP2-related disorder (Rett syndrome)"
* component[conclusion-string].valueString = "De novo pathogenic MECP2 variant, consistent with the referral indication."

Instance: DocumentReference-WGS-Referral
InstanceOf: DocumentReference
Title: "Document Reference - R27.3 Laboratory Report PDF, dWGS Trio referral r26000000203"
Description: "Fictitious example: the RGL's LAB-3 report as a PDF, related to its DiagnosticReport and to the referral by its NGIS referral_id (Order Group Number)"
Usage: #example

* identifier[+].value = "0349b609-bc9c-40e2-8c34-ee322adceca8"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "699N0"
* status = #current
* date = "2026-11-02T12:00:00+00:00"
* type = $sct#1054161000000101 "Genetic report"
* context.related[DiagnosticReport]
  * reference = "urn:uuid:efc76d09-a4d9-46cb-8aa5-98748594ceae"
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "http://www.acme.org/diagnosticreport/identifiers/699N0"
  * identifier.value = "NEY26-r26000000203"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699N0"
* context.related[OrderGroupNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PGN
  * identifier.system = "https://genomicsengland.co.uk/healthcare/referral-id"
  * identifier.value = "r26000000203"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "8J834"
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:cf3bc470-4956-4fe7-989a-2fb876905021"
* context.event[+] = $test-directory#R27.3
* subject.reference = "https://fhir.nwgenomics.nhs.uk/Patient/Patient-Brough"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"
