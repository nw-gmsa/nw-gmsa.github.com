// FHIR Messages for the Suspected Blood Cancer - Haemato-Oncology Diagnostics ExampleScenario: the Laboratory Order (LAB-1)
// from Tameside and Glossop Integrated Care NHS FT (RMP) to haemato-oncology diagnostics at Manchester University NHS FT
// (R0A), its reflex sub-orders (LAB-35) to the cytogenetics laboratory and to the North West GLH (699X0), their reports
// (LAB-36), and the combined Laboratory Report (LAB-3).
// Illustrative future-state example, using generic roles. Fictitious: identifiers, dates and results are illustrative only.

// Patient

Instance: Patient-Tameside
InstanceOf: Patient
Title: "Patient - Hodor Tameside NHS Number: 9737383397"
Description: "Test Patient for Greater Manchester ICS - the patient with suspected acute myeloid leukaemia in the Suspected Blood Cancer - Haemato-Oncology Diagnostics scenario"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383397"
* name.use = #official
* name.family = "TAMESIDE"
* name.given = "Hodor"
* birthDate = "1960-07-27"
* gender = #male
* address[+]
  * use = #home
  * type = #both
  * line[+] = "Stockport Road"
  * city = "TAMESIDE"
  * postalCode = "OL7 0NS"
* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "P89020"

RuleSet: TamesideSubject
* subject.reference = "urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251"
* subject.display = "Hodor TAMESIDE"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383397"

RuleSet: HaematoOncologyOrderPlacerNumber
* type = "ServiceRequest"
* identifier.type = $v2-0203#PLAC
* identifier.system = "http://www.acme.org/servicerequest/RMP"
* identifier.value = "RMP-26-30417"
* identifier.assigner.identifier.system = $ods-code
* identifier.assigner.identifier.value = "RMP"

Instance: PractitionerRole-Requester-Haematology-RMP
InstanceOf: PractitionerRole
Title: "PractitionerRole - consultant haematologist (Tameside and Glossop Integrated Care NHS FT)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C5432198"
* practitioner.display = "FICTITIOUS, Anil"
* organization.identifier.system = $ods-code
* organization.identifier.value = "RMP"
* organization.display = "TAMESIDE AND GLOSSOP INTEGRATED CARE NHS FOUNDATION TRUST"

// Laboratory Order (LAB-1)

Instance: Specimen-HaematoOncology
InstanceOf: Specimen
Title: "Specimen - bone marrow aspirate (Hodor Tameside)"
Description: "Fictitious example: bone marrow aspirate for haemato-oncology diagnostics"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "26RMP-BM-002871"
  * system = "http://www.acme.org/specimen/RMP"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RMP"
* status = #available
* insert TamesideSubject
* type = $sct#119359002 "Bone marrow specimen"
* type.text = "Bone marrow aspirate"
* collection.collectedDateTime = "2026-10-12T10:00:00+00:00"
* receivedTime = "2026-10-12T15:00:00+00:00"

Instance: ServiceRequest-HaematoOncology
InstanceOf: ServiceRequest
Title: "ServiceRequest - suspected acute myeloid leukaemia, referral to haemato-oncology diagnostics"
Description: "Fictitious example: the single LAB-1 order for a suspected blood cancer. It is coded with the karyotype test (M80.3); haemato-oncology diagnostics decides on further genomic testing."
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/RMP"
* identifier[OrderPlacerNumber].value = "RMP-26-30417"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "RMP"
* status = #active
* intent = #order
* priority = #urgent
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* authoredOn = "2026-10-12"
* code = $test-directory#M80.3
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:d01f0024-4571-4b95-a60d-e1a3e1121e56"
  * identifier.system = $ods-code
  * identifier.value = "RMP"
* insert TamesideSubject
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* specimen[+].reference = "urn:uuid:8e84acdf-b5be-4f3d-a32f-b9bb142eb0db"
* reasonCode[+] = $GCC#M80 "Acute Myeloid Leukaemia"
* note[+].text = "Pancytopenia with circulating blasts. Suspected acute myeloid leukaemia. Bone marrow aspirate sent."

Instance: MessageHeader-O21-HaematoOncology
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order (O21), suspected acute myeloid leukaemia"
Description: "Fictitious example: LAB-1 order from TAMESIDE AND GLOSSOP INTEGRATED CARE NHS FOUNDATION TRUST to haemato-oncology diagnostics at MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-10-12T11:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "RMP"
* sender.display = "TAMESIDE AND GLOSSOP INTEGRATED CARE NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RMP"
* source.software = "TGICFT EPR"
* focus[+]
  * reference = "urn:uuid:1808b469-5690-46cb-8915-8c283209a194"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-HaematoOncology
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order (O21), suspected acute myeloid leukaemia"
Description: "Fictitious example: the single LAB-1 order to haemato-oncology diagnostics in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:8c88611b-8a59-4386-b5db-aaf28b5acc1c", "2026-10-12T11:00:00+00:00")
* insert EntryDocument("urn:uuid:01172216-b5e2-4663-8b7d-4252ca811883", MessageHeader-O21-HaematoOncology)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:1808b469-5690-46cb-8915-8c283209a194", ServiceRequest-HaematoOncology)
* insert EntryDocument("urn:uuid:d01f0024-4571-4b95-a60d-e1a3e1121e56", PractitionerRole-Requester-Haematology-RMP)
* insert EntryDocument("urn:uuid:8e84acdf-b5be-4f3d-a32f-b9bb142eb0db", Specimen-HaematoOncology)

// Reflex sub-order to the cytogenetics laboratory (LAB-35)

RuleSet: HaematoOncologySubOrder(value, code, performerOds, performerName)
* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/R0A-haemato-oncology"
* identifier[OrderPlacerNumber].value = "{value}"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "R0A"
* basedOn[+]
  * insert HaematoOncologyOrderPlacerNumber
* status = #active
* intent = #filler-order
* priority = #urgent
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* code = $test-directory#{code}
* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* insert TamesideSubject
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "{performerOds}"
  * display = "{performerName}"
* specimen[+].reference = "urn:uuid:8e84acdf-b5be-4f3d-a32f-b9bb142eb0db"
* reasonCode[+] = $GCC#M80 "Acute Myeloid Leukaemia"

Instance: ServiceRequest-HaematoOncology-Cytogenetics
InstanceOf: ServiceRequest
Title: "ServiceRequest - M80.3 AML karyotype (reflex sub-order to the cytogenetics laboratory)"
Description: "Fictitious example: the LAB-35 cytogenetics reflex sub-order from haemato-oncology diagnostics, based on the Laboratory Order (identified by its Order Placer Number)"
Usage: #example

* insert HaematoOncologySubOrder(HO26-11872-C, M80.3, R0A, CYTOGENETICS LABORATORY - MANCHESTER UNIVERSITY NHS FOUNDATION TRUST)
* authoredOn = "2026-10-12"

Instance: MessageHeader-O21-HaematoOncology-Cytogenetics
InstanceOf: MessageHeader
Title: "Message Header - Sub-order M80.3 (O21), cytogenetics reflex"
Description: "Fictitious example: LAB-35 sub-order from haemato-oncology diagnostics to the cytogenetics laboratory"
Usage: #example

* meta.lastUpdated = "2026-10-12T16:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "CYTOGENETICS LABORATORY, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:048c1f89-7738-4416-810a-3d776899e95f"
  * type = #ServiceRequest

Instance: GenomicsSubOrderMessage-HaematoOncology-Cytogenetics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order M80.3 (O21), cytogenetics reflex"
Description: "Fictitious example: the LAB-35 cytogenetics reflex sub-order in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario. `intent` = `filler-order` and `basedOn` the Laboratory Order, identified by its Order Placer Number"
Usage: #example
* insert MessageBundle("urn:uuid:195cb561-a4cb-41eb-b9b0-de09b7715ad3", "2026-10-12T16:00:00+00:00")
* insert EntryDocument("urn:uuid:555b8c9f-381f-4dce-b54f-70df3becce5d", MessageHeader-O21-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:048c1f89-7738-4416-810a-3d776899e95f", ServiceRequest-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:8e84acdf-b5be-4f3d-a32f-b9bb142eb0db", Specimen-HaematoOncology)

// Cytogenetic report (LAB-36)

Instance: Observation-HaematoOncology-Karyotype
InstanceOf: Observation
Title: "Observation - karyotype (ISCN), Hodor Tameside"
Description: "Fictitious example: the bone marrow karyotype in ISCN, reported by the cytogenetics laboratory"
Usage: #example

* identifier[+].value = "259bd44f-c536-40a0-a305-fe41b2020a9b"
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#62356-1 "Chromosome analysis result in ISCN expression"
* insert TamesideSubject
* effectiveDateTime = "2026-10-12T10:00:00+00:00"
* performer[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "CYTOGENETICS LABORATORY, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* valueString = "47,XY,+8,del(7)(q22q36)[18]/46,XY[2]"
* note[+].text = "Abnormal male karyotype with trisomy 8 and an interstitial deletion of the long arm of chromosome 7, in 18 of 20 cells."

Instance: DiagnosticReport-HaematoOncology-Cytogenetics
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M80.3 AML karyotype (cytogenetics laboratory), Hodor Tameside"
Description: "Fictitious example: the cytogenetics laboratory's LAB-36 report, based on the cytogenetics sub-order"
Usage: #example

* identifier[ReportIdentifier]
  * value = "CY26-04411"
  * system = "http://www.acme.org/diagnosticreport/identifiers/R0A-cytogenetics"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/R0A-haemato-oncology"
  * identifier.value = "HO26-11872-C"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M80.3
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* insert TamesideSubject
* effectiveDateTime = "2026-10-12T10:00:00+00:00"
* issued = "2026-10-16T12:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * type = #Organization
  * display = "CYTOGENETICS LABORATORY, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C6789012"
  * display = "FICTITIOUS, Clara"
* conclusion = "Abnormal karyotype with trisomy 8 and deletion of 7q, recognised findings in myeloid neoplasms."
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M80.3 AML karyotype for Hodor TAMESIDE: 47,XY,+8,del(7)(q22q36)[18]/46,XY[2]. Abnormal karyotype with trisomy 8 and deletion of 7q, recognised findings in myeloid neoplasms.</p></div>"
* insert ReportPDF(urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104, Cytogenetic report - Hodor TAMESIDE, 2026-10-16)

Instance: DocumentReference-HaematoOncology-Cytogenetics
InstanceOf: DocumentReference
Title: "Document Reference - cytogenetic report PDF, Hodor Tameside"
Description: "Fictitious example: the cytogenetics laboratory's LAB-36 report as a PDF. It is sent with the cytogenetic report, attached to the molecular genomic sub-order as supporting information, and included with the combined report"
Usage: #example

* insert ReportPDFDocumentReferenceByIdentifier(b816a8be-0cff-486e-abf6-f3a4632193ed, R0A, 2026-10-16T12:00:00+00:00, http://www.acme.org/diagnosticreport/identifiers/R0A-cytogenetics, CY26-04411, http://www.acme.org/servicerequest/R0A-haemato-oncology, HO26-11872-C, R0A, urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104, M80.3)
* insert TamesideSubject

Instance: MessageHeader-R01-HaematoOncology-Cytogenetics
InstanceOf: MessageHeader
Title: "Message Header - Sub-order report M80.3 (R01), cytogenetics"
Description: "Fictitious example: LAB-36 report from the cytogenetics laboratory to haemato-oncology diagnostics"
Usage: #example

* meta.lastUpdated = "2026-10-16T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "CYTOGENETICS LABORATORY, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:17c64a5f-b840-4802-af3c-9b03b3b438d2"
  * type = #DiagnosticReport

Instance: GenomicsSubOrderReportMessage-HaematoOncology-Cytogenetics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order report M80.3 (R01), cytogenetics"
Description: "Fictitious example: the cytogenetics laboratory's LAB-36 report in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario, with the report as a PDF (`DocumentReference` and `Binary`) and no discrete results"
Usage: #example
* insert MessageBundle("urn:uuid:d576368f-989b-421c-985a-1686daa6fcd7", "2026-10-16T12:00:00+00:00")
* insert EntryDocument("urn:uuid:eeea45be-f775-45b8-944c-9ae35f4fa61c", MessageHeader-R01-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:17c64a5f-b840-4802-af3c-9b03b3b438d2", DiagnosticReport-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:b816a8be-0cff-486e-abf6-f3a4632193ed", DocumentReference-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104", Binary-Sample)

// Molecular genomic reflex sub-order to the North West GLH (LAB-35)

Instance: ServiceRequest-HaematoOncology-Molecular
InstanceOf: ServiceRequest
Title: "ServiceRequest - M80.2 AML multi-target NGS panel (reflex sub-order to the North West GLH)"
Description: "Fictitious example: the LAB-35 molecular genomic reflex sub-order from haemato-oncology diagnostics, placed because of the cytogenetic findings, based on the Laboratory Order (identified by its Order Placer Number)"
Usage: #example

* insert HaematoOncologySubOrder(HO26-11872-M, M80.2, 699X0, NORTH WEST GLH)
* authoredOn = "2026-10-16"
* note[+].text = "Abnormal karyotype: trisomy 8 and del(7q). Please test for small variants (AML multi-target NGS panel)."
// The previous genomic report (the cytogenetic report PDF) as clinical context
* supportingInfo[clinicalContext]
  * reference = "urn:uuid:b816a8be-0cff-486e-abf6-f3a4632193ed"
  * type = "DocumentReference"
  * display = "Cytogenetic report - karyotype"

Instance: MessageHeader-O21-HaematoOncology-Molecular
InstanceOf: MessageHeader
Title: "Message Header - Sub-order M80.2 (O21), molecular genomic reflex"
Description: "Fictitious example: LAB-35 sub-order from haemato-oncology diagnostics to NORTH WEST GLH"
Usage: #example

* meta.lastUpdated = "2026-10-16T14:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:8c4a359c-f1f8-4e86-b84a-9c68bcc94300"
  * type = #ServiceRequest

Instance: GenomicsSubOrderMessage-HaematoOncology-Molecular
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order M80.2 (O21), molecular genomic reflex"
Description: "Fictitious example: the LAB-35 molecular genomic reflex sub-order in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario. `intent` = `filler-order` and `basedOn` the Laboratory Order, identified by its Order Placer Number. The previous genomic report (the cytogenetic report PDF) is attached as `ServiceRequest.supportingInfo`"
Usage: #example
* insert MessageBundle("urn:uuid:5f5b90b1-c8c4-4c9a-ac84-267aebd05487", "2026-10-16T14:00:00+00:00")
* insert EntryDocument("urn:uuid:81bbe499-b61f-40dc-bbe5-d7d28b47830d", MessageHeader-O21-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:8c4a359c-f1f8-4e86-b84a-9c68bcc94300", ServiceRequest-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:8e84acdf-b5be-4f3d-a32f-b9bb142eb0db", Specimen-HaematoOncology)
* insert EntryDocument("urn:uuid:b816a8be-0cff-486e-abf6-f3a4632193ed", DocumentReference-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104", Binary-Sample)

// Molecular genomic report (LAB-36)

Instance: Variant-HaematoOncology-TP53
InstanceOf: Variant
Title: "Variant - TP53, Hodor Tameside"
Description: "Fictitious example: the somatic TP53 variant found by the North West GLH's AML multi-target NGS panel"
Usage: #example

* insert GenomicResultObservation(56e20f19-4d2f-41a7-99f4-cc377327a702, 2026-10-23T12:00:00+00:00, 699X0, NORTH WEST GLH)
* code = $loinc#69548-6 "Genetic variant assessment"
* insert TamesideSubject
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* method.text = "AML multi-target NGS panel"
* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:11998 "TP53"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_000546.6
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_000546.6:c.817C>T
* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"NP_000537.3:p.(Arg273Cys)"
* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6684-0 "Somatic"
* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity = 42 '%' "%"

Instance: DiagnosticImplication-HaematoOncology-TP53
InstanceOf: DiagnosticImplication
Title: "Diagnostic Implication - TP53, Hodor Tameside"
Description: "Fictitious example: pathogenic classification of the somatic TP53 variant in acute myeloid leukaemia"
Usage: #example

* insert GenomicResultObservation(fcf068ca-7140-47cb-a6af-5d2a8be60d7a, 2026-10-23T12:00:00+00:00, 699X0, NORTH WEST GLH)
* insert TamesideSubject
* derivedFrom.reference = "urn:uuid:56e20f19-4d2f-41a7-99f4-cc377327a702"
* component[clinical-significance].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[predicted-phenotype].valueCodeableConcept = $sct#91861009 "Acute myeloid leukemia, disease"
* component[conclusion-string].valueString = "Pathogenic somatic TP53 variant, an adverse-risk finding in acute myeloid leukaemia."

Instance: DiagnosticReport-HaematoOncology-Molecular
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M80.2 AML multi-target NGS panel (North West GLH), Hodor Tameside"
Description: "Fictitious example: the North West GLH's LAB-36 report, based on the molecular genomic sub-order"
Usage: #example

* identifier[ReportIdentifier]
  * value = "G26-50233"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/R0A-haemato-oncology"
  * identifier.value = "HO26-11872-M"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M80.2
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* insert TamesideSubject
* effectiveDateTime = "2026-10-12T10:00:00+00:00"
* issued = "2026-10-23T12:00:00+00:00"
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
* conclusion = "Pathogenic somatic TP53 variant NM_000546.6:c.817C>T p.(Arg273Cys), variant allele frequency 42%."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M80.2 AML multi-target NGS panel for Hodor TAMESIDE: pathogenic somatic TP53 variant NM_000546.6:c.817C&gt;T p.(Arg273Cys), variant allele frequency 42%.</p></div>"
* insert ReportPDF(urn:uuid:9c686183-067e-445f-9b47-ae3fc99cfe3e, Molecular genomic report - Hodor TAMESIDE, 2026-10-23)

Instance: DocumentReference-HaematoOncology-Molecular
InstanceOf: DocumentReference
Title: "Document Reference - molecular genomic report PDF, Hodor Tameside"
Description: "Fictitious example: the North West GLH's LAB-36 report as a PDF. It is sent with the molecular genomic report and included with the combined report"
Usage: #example

* insert ReportPDFDocumentReferenceByIdentifier(b89807ea-8296-416e-bcab-77593fd26c7b, 699X0, 2026-10-23T12:00:00+00:00, http://www.acme.org/diagnosticreport/identifiers, G26-50233, http://www.acme.org/servicerequest/R0A-haemato-oncology, HO26-11872-M, R0A, urn:uuid:9c686183-067e-445f-9b47-ae3fc99cfe3e, M80.2)
* insert TamesideSubject

Instance: MessageHeader-R01-HaematoOncology-Molecular
InstanceOf: MessageHeader
Title: "Message Header - Sub-order report M80.2 (R01), molecular genomic"
Description: "Fictitious example: LAB-36 report from NORTH WEST GLH to haemato-oncology diagnostics"
Usage: #example

* meta.lastUpdated = "2026-10-23T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:afe03b57-e640-4834-b7d1-3fd38c6183df"
  * type = #DiagnosticReport

Instance: GenomicsSubOrderReportMessage-HaematoOncology-Molecular
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order report M80.2 (R01), molecular genomic"
Description: "Fictitious example: the North West GLH's LAB-36 report in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario, with the report as a PDF (`DocumentReference` and `Binary`) and no discrete results"
Usage: #example
* insert MessageBundle("urn:uuid:1c88f6ad-21d9-48ca-b040-d32ec99922b3", "2026-10-23T12:00:00+00:00")
* insert EntryDocument("urn:uuid:4afe5c64-3b1a-4cac-8863-3ad1afd3df7b", MessageHeader-R01-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:afe03b57-e640-4834-b7d1-3fd38c6183df", DiagnosticReport-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:b89807ea-8296-416e-bcab-77593fd26c7b", DocumentReference-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:9c686183-067e-445f-9b47-ae3fc99cfe3e", Binary-Sample)

// Combined Laboratory Report (LAB-3)

Instance: DiagnosticReport-HaematoOncology-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - suspected acute myeloid leukaemia, combined haemato-oncology laboratory report, Hodor Tameside"
Description: "Fictitious example: haemato-oncology diagnostics' combined LAB-3 laboratory report to the requesting clinician, based on the Laboratory Order (identified by its Order Placer Number). It is based on the cytogenetic and molecular genomic reports (LAB-36), linked by their Report Identifiers using the supportingInfo extension, and both are included in the message as PDFs"
Usage: #example

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Combined haemato-oncology laboratory report for Hodor TAMESIDE. Acute myeloid leukaemia: abnormal karyotype with trisomy 8 and deletion of 7q (cytogenetic report CY26-04411), and a pathogenic somatic TP53 variant (molecular genomic report G26-50233).</p></div>"
// The cytogenetic and molecular genomic reports (LAB-36) this report is based on
// (written with explicit urls: SUSHI cannot import the R5 extension's definition, which has no snapshot)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCodeableConcept.text = "Cytogenetic report (LAB-36)"
* extension[=].extension[+].url = "reference"
* extension[=].extension[=].valueReference.type = "DiagnosticReport"
* extension[=].extension[=].valueReference.identifier.system = "http://www.acme.org/diagnosticreport/identifiers/R0A-cytogenetics"
* extension[=].extension[=].valueReference.identifier.value = "CY26-04411"
* extension[=].extension[=].valueReference.display = "Cytogenetic report CY26-04411"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.supportingInfo"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCodeableConcept.text = "Molecular genomic report (LAB-36)"
* extension[=].extension[+].url = "reference"
* extension[=].extension[=].valueReference.type = "DiagnosticReport"
* extension[=].extension[=].valueReference.identifier.system = "http://www.acme.org/diagnosticreport/identifiers"
* extension[=].extension[=].valueReference.identifier.value = "G26-50233"
* extension[=].extension[=].valueReference.display = "Molecular genomic report G26-50233"
* identifier[ReportIdentifier]
  * value = "HO26-11872"
  * system = "http://www.acme.org/diagnosticreport/identifiers/R0A-haemato-oncology"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* basedOn[OrderPlacerNumber]
  * insert HaematoOncologyOrderPlacerNumber
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M80.3
* code.coding[+] = $sct#371528001 "Pathology report"
* insert TamesideSubject
* effectiveDateTime = "2026-10-12T10:00:00+00:00"
* issued = "2026-10-24T10:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * type = #Organization
  * display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C7890123"
  * display = "FICTITIOUS, Owen"
* conclusion = "Acute myeloid leukaemia. Abnormal karyotype with trisomy 8 and deletion of 7q, and a pathogenic somatic TP53 variant (adverse risk). See the attached cytogenetic and molecular genomic reports."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* insert ReportPDF(urn:uuid:9f5aeb0b-6098-4ace-83bd-933e85814e96, Haemato-oncology laboratory report - Hodor TAMESIDE, 2026-10-24)

Instance: DocumentReference-HaematoOncology-Report
InstanceOf: DocumentReference
Title: "Document Reference - combined haemato-oncology laboratory report PDF, Hodor Tameside"
Description: "Fictitious example: the combined LAB-3 laboratory report as a PDF, related to its DiagnosticReport and the Laboratory Order"
Usage: #example

* identifier[+].value = "e07c13d3-3697-413b-bf40-59642424cc7e"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "R0A"
* status = #current
* date = "2026-10-24T10:00:00+00:00"
* type = $sct#4241000179101 "Laboratory report"
* context.related[DiagnosticReport]
  * reference = "urn:uuid:34b2be2b-55bd-42eb-a19e-faa62822e5e8"
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "http://www.acme.org/diagnosticreport/identifiers/R0A-haemato-oncology"
  * identifier.value = "HO26-11872"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
* context.related[OrderPlacerNumber]
  * insert HaematoOncologyOrderPlacerNumber
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:9f5aeb0b-6098-4ace-83bd-933e85814e96"
* insert TamesideSubject

Instance: MessageHeader-R01-HaematoOncology
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report (R01), combined haemato-oncology report"
Description: "Fictitious example: LAB-3 report from haemato-oncology diagnostics at MANCHESTER UNIVERSITY NHS FOUNDATION TRUST to TAMESIDE AND GLOSSOP INTEGRATED CARE NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-10-24T10:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "HAEMATO-ONCOLOGY DIAGNOSTICS, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RMP"
* destination.receiver.display = "TAMESIDE AND GLOSSOP INTEGRATED CARE NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RMP"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:34b2be2b-55bd-42eb-a19e-faa62822e5e8"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-HaematoOncology
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report (R01), combined haemato-oncology laboratory report"
Description: "Fictitious example: the combined LAB-3 Laboratory Report in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario, a laboratory report with the report as a PDF. The cytogenetic and molecular genomic reports are included as PDFs, and the report links to them by their Report Identifiers"
Usage: #example
* insert MessageBundle("urn:uuid:091dfc80-2031-4efd-b946-9f2abde7ac43", "2026-10-24T10:00:00+00:00")
* insert EntryDocument("urn:uuid:e01fa368-f767-423f-b966-ec25a4830235", MessageHeader-R01-HaematoOncology)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:34b2be2b-55bd-42eb-a19e-faa62822e5e8", DiagnosticReport-HaematoOncology-Report)
// The two genetic reports, as PDFs
* insert EntryDocument("urn:uuid:b816a8be-0cff-486e-abf6-f3a4632193ed", DocumentReference-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104", Binary-Sample)
* insert EntryDocument("urn:uuid:b89807ea-8296-416e-bcab-77593fd26c7b", DocumentReference-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:9c686183-067e-445f-9b47-ae3fc99cfe3e", Binary-Sample)
* insert EntryDocument("urn:uuid:e07c13d3-3697-413b-bf40-59642424cc7e", DocumentReference-HaematoOncology-Report)
* insert EntryDocument("urn:uuid:9f5aeb0b-6098-4ace-83bd-933e85814e96", Binary-Sample)

// T02 FHIR Message (Document and Document Notification): the report PDF

Instance: MessageHeader-T02-HaematoOncology-Cytogenetics
InstanceOf: MessageHeader
Title: "Message Header - Document Notification (T02), cytogenetic report"
Description: "Fictitious example: the report PDF from CYTOGENETICS LABORATORY - MANCHESTER UNIVERSITY NHS FOUNDATION TRUST to NHS GREATER MANCHESTER INTEGRATED CARE BOARD"
Usage: #example

* insert T02MessageHeader(2026-10-16T12:05:00+00:00, R0A, CYTOGENETICS LABORATORY - MANCHESTER UNIVERSITY NHS FOUNDATION TRUST, QOP, NHS GREATER MANCHESTER INTEGRATED CARE BOARD, https://fhir.nwgenomics.nhs.uk/Endpoint/GMCR, urn:uuid:b816a8be-0cff-486e-abf6-f3a4632193ed, urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104)

Instance: DocumentMessage-HaematoOncology-Cytogenetics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Document Notification (T02), cytogenetic report"
Description: "Fictitious example: the cytogenetics laboratory's report PDF sent to the regional shared care record in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario, as a T02 FHIR Message - the FHIR equivalent of HL7 v2 `MDM^T02`. It carries the report PDF as a `DocumentReference` and `Binary`. See [Document and Document Notification](MessageDefinition-original-document.html)."
Usage: #example
* insert MessageBundle("urn:uuid:6886e253-bac5-4a0d-a1ff-cce4ea99c639", "2026-10-16T12:05:00+00:00")
* insert EntryDocument("urn:uuid:8a1ef3c2-098c-4e43-8803-cb3ce8582ac0", MessageHeader-T02-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:b816a8be-0cff-486e-abf6-f3a4632193ed", DocumentReference-HaematoOncology-Cytogenetics)
* insert EntryDocument("urn:uuid:3f09fddb-1350-454f-9a36-c1883f631104", Binary-Sample)

// T02 FHIR Message (Document and Document Notification): the report PDF

Instance: MessageHeader-T02-HaematoOncology-Molecular
InstanceOf: MessageHeader
Title: "Message Header - Document Notification (T02), molecular genomic report"
Description: "Fictitious example: the report PDF from NORTH WEST GLH to NHS GREATER MANCHESTER INTEGRATED CARE BOARD"
Usage: #example

* insert T02MessageHeader(2026-10-23T12:05:00+00:00, 699X0, NORTH WEST GLH, QOP, NHS GREATER MANCHESTER INTEGRATED CARE BOARD, https://fhir.nwgenomics.nhs.uk/Endpoint/GMCR, urn:uuid:b89807ea-8296-416e-bcab-77593fd26c7b, urn:uuid:9c686183-067e-445f-9b47-ae3fc99cfe3e)

Instance: DocumentMessage-HaematoOncology-Molecular
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Document Notification (T02), molecular genomic report"
Description: "Fictitious example: the North West GLH's molecular genomic report PDF sent to the regional shared care record in the [Suspected Blood Cancer - Haemato-Oncology Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html) scenario, as a T02 FHIR Message - the FHIR equivalent of HL7 v2 `MDM^T02`. It carries the report PDF as a `DocumentReference` and `Binary`. See [Document and Document Notification](MessageDefinition-original-document.html)."
Usage: #example
* insert MessageBundle("urn:uuid:e1e801e5-e62c-4342-ae7b-1d51cbc16290", "2026-10-23T12:05:00+00:00")
* insert EntryDocument("urn:uuid:0e153cb8-4986-4dbd-bd2a-689e32ee0c95", MessageHeader-T02-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:4fa015ae-f0c2-48fe-a494-644c501f8251", Patient-Tameside)
* insert EntryDocument("urn:uuid:b89807ea-8296-416e-bcab-77593fd26c7b", DocumentReference-HaematoOncology-Molecular)
* insert EntryDocument("urn:uuid:9c686183-067e-445f-9b47-ae3fc99cfe3e", Binary-Sample)
