// FHIR Messages for the Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA ExampleScenario: the M2.1 genomic reflex
// order (O21) from the Royal Blackburn Hospital laboratory (690D0) to the North West GLH (699X0), with the pathology results
// as prior results, and the Genomic Report (R01) back to the laboratory. Converted from the HL7 v2 examples in the Testing
// repo (Input/PathologyReflex/) and the use case
// https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md
// Fictitious example: identifiers, dates and results are illustrative only.

Instance: Patient-Burnley
InstanceOf: Patient
Title: "Patient - Selyse Burnley NHS Number: 9737383389"
Description: "Test Patient for Lancashire and South Cumbria ICS - the patient with relapsed ovarian cancer in the Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA scenario"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383389"
* identifier[1].type = $v2-0203#MR
* identifier[1].value = "690D07418265"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "690D0"
* identifier[2].type = $v2-0203#MR
* identifier[2].value = "RXN7316420"
* identifier[2].assigner.identifier.system = $ods-code
* identifier[2].assigner.identifier.value = "RXN"
* name.use = #official
* name.family = "BURNLEY"
* name.given = "Selyse"
* birthDate = "1967-09-18"
* gender = #female
* address[+]
  * use = #home
  * type = #both
  * line[+] = "Manchester Road"
  * city = "Burnley"
  * district = "Lancashire"
  * postalCode = "BB11 9SA"
* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "Y00206"

RuleSet: BurnleySubject
* subject.reference = "urn:uuid:f8622205-705b-47f6-92ae-c2609a4b4ce3"
* subject.display = "Selyse BURNLEY"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383389"

// The original pathology order (HL7 v2 prior ORC-2 / OBR-2), placed by Lancashire Teaching Hospitals
RuleSet: PathologyOrderBasedOn
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RXN"
  * identifier.value = "EPR-552871"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RXN"

// A pathology result Observation, performed by the pathologist at the Royal Blackburn Hospital laboratory
RuleSet: PathologyResult(id, date)
* identifier[+].value = "{id}"
* status = #final
* effectiveDateTime = "{date}"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* performer[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C7890123"
  * display = "FICTITIOUS, Morgan"
* insert BurnleySubject

Instance: PractitionerRole-Pathologist-690D0
InstanceOf: PractitionerRole
Title: "PractitionerRole - consultant pathologist (Royal Blackburn Hospital laboratory)"
Description: "Fictitious example: the pathologist who places the genomic reflex order (HL7 v2 ORC-12/OBR-16 of the genomic order)"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C7890123"
* practitioner.display = "FICTITIOUS, Morgan"
* organization.identifier.system = $ods-code
* organization.identifier.value = "690D0"
* organization.display = "ROYAL BLACKBURN HOSPITAL LABORATORY"

Instance: PractitionerRole-Requester-GynaeOncology-RXN
InstanceOf: PractitionerRole
Title: "PractitionerRole - gynaecological oncologist (Lancashire Teaching Hospitals)"
Description: "Fictitious example: the clinician who ordered the original pathology test (HL7 v2 ORC-12/OBR-16 of the prior result)"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C5678901"
* practitioner.display = "FICTITIOUS, Priya"
* organization.identifier.system = $ods-code
* organization.identifier.value = "RXN"
* organization.display = "LANCASHIRE TEACHING HOSPITALS NHS FOUNDATION TRUST"

// Genomic Reflex Order (LAB-35)

Instance: Specimen-PathologyReflex-BlockA3
InstanceOf: Specimen
Title: "Specimen - FFPE block A3, ovarian cancer resection (sections sent)"
Description: "Fictitious example: the block the sections were cut from (HL7 v2 SPM). Tissue taken at surgery (SPM-7) from the ovary (SPM-8) in March 2025 (SPM-17)"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "H25-11823-A3"
  * system = "http://www.acme.org/specimen/690D0"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690D0"
* status = #available
* insert BurnleySubject
* type = $sct#441652008 "Formalin-fixed paraffin-embedded tissue specimen"
* collection.collectedDateTime = "2025-03-14T10:00:00+00:00"
* collection.method = $sct#65801008 "Excision"
* collection.bodySite = $sct#15497006 "Ovarian structure"
* receivedTime = "2025-03-14T15:00:00+00:00"
* note[+].text = "10 x 5 um sections and marked H&E guide slide from block A3."

Instance: Observation-PathologyReflex-RelapsedDisease
InstanceOf: ObservationOrder
Title: "Observation - relapsed disease confirmation (ask at order entry), Selyse Burnley"
Description: "Fictitious example: the confirmation that the patient has relapsed high-grade disease and is second line or beyond (HL7 v2 OBX on the genomic order)"
Usage: #example

* identifier[+].value = "19a32dd4-e8c2-4a9c-887a-180aeb7cd80e"
* status = #final
* code = $nwgmsa#RelapsedDiseaseConfirmation
* insert BurnleySubject
* effectiveDateTime = "2026-11-03T14:30:00+00:00"
* valueBoolean = true

// Prior result 1: the original histopathology report
RuleSet: PathologyReportContent
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Histopathology, ovarian cancer resection, for Selyse BURNLEY. High grade serous carcinoma of the ovary.</p></div>"
* identifier[ReportIdentifier]
  * value = "H25-11823"
  * system = "http://www.acme.org/diagnosticreport/identifiers/690D0"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690D0"
* insert PathologyOrderBasedOn
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"
* code.coding[+] = http://www.acme.org/CodeSystem/690D0#HISTO "Histopathology"
* code.coding[+] = $sct#1054291000000102 "Cellular pathology report"
* insert BurnleySubject
* effectiveDateTime = "2025-03-14T10:00:00+00:00"
* issued = "2025-03-21T16:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "690D0"
  * type = #Organization
  * display = "ROYAL BLACKBURN HOSPITAL LABORATORY"
* resultsInterpreter[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C7890123"
  * display = "FICTITIOUS, Morgan"
* conclusion = "High grade serous carcinoma of the ovary."
* insert ReportPDF(urn:uuid:052c40aa-02bc-4db7-a44d-524cb2757922, Cellular pathology report - Selyse BURNLEY, 2025-03-21)

Instance: DiagnosticReport-PathologyReflex-Histopathology-ReportOnly
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - Histopathology, ovarian cancer resection, Selyse Burnley (report only)"
Description: "Fictitious example: the original pathology report, sent as a prior result of the genomic reflex order - the report as a PDF, with no discrete results. It keeps the original pathology order (Order Placer Number, assigned by Lancashire Teaching Hospitals)"
Usage: #example

* insert PathologyReportContent

Instance: DiagnosticReport-PathologyReflex-Histopathology
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - Histopathology, ovarian cancer resection, Selyse Burnley"
Description: "Fictitious example: the original pathology report, sent as a prior result of the genomic reflex order - the report as a PDF, the primary site and the LOINC 77753-2 Tumor morphology panel"
Usage: #example

* insert PathologyReportContent
* result[+].reference = "urn:uuid:2960aa5d-969b-48ce-9909-515ca62954b0"
* result[+].reference = "urn:uuid:c8ad0356-bc13-4452-b7c2-95b2b4eef0c3"

Instance: Observation-PathologyReflex-PrimarySite
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - primary site (cancer), Selyse Burnley"
Description: "Fictitious example: LOINC 21855-2 Primary site, with the COSD Pathology item pCR6410 as the alternate code. The value is ICD-O-3 topography, with the SNOMED CT body structure as the alternate"
Usage: #example

* insert PathologyResult(2960aa5d-969b-48ce-9909-515ca62954b0, 2025-03-21T16:00:00+00:00)
* code.coding[+] = $loinc#21855-2 "Primary site Cancer"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR6410 "Topography (SNOMED)"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#C56.9 "Ovary"
* valueCodeableConcept.coding[+] = $sct#15497006 "Ovarian structure"
* specimen.reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"

Instance: Observation-PathologyReflex-TumorMorphologyPanel
InstanceOf: ObservationPanel
Title: "Observation - Tumor morphology panel (cancer), Selyse Burnley"
Description: "Fictitious example: LOINC 77753-2 Tumor morphology panel, with histology and behaviour as its members"
Usage: #example

* identifier[+].value = "c8ad0356-bc13-4452-b7c2-95b2b4eef0c3"
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = $loinc#77753-2 "Tumor morphology panel Cancer"
* insert BurnleySubject
* effectiveDateTime = "2025-03-21T16:00:00+00:00"
* performer[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99"
  * display = "FICTITIOUS, Morgan"
* specimen.reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"
* hasMember[+].reference = "urn:uuid:f1d90438-d286-415b-a65f-430a7eeccbd6"
* hasMember[+].reference = "urn:uuid:ab6755d1-f22f-4374-9f45-7213383ec08f"

Instance: Observation-PathologyReflex-Histology
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - histology (cancer), Selyse Burnley"
Description: "Fictitious example: LOINC 31205-8 Histology ICD-O-3, with the COSD Pathology item pCR6420 as the alternate code. The value is ICD-O-3 morphology, with the SNOMED CT morphology as the alternate"
Usage: #example

* insert PathologyResult(f1d90438-d286-415b-a65f-430a7eeccbd6, 2025-03-21T16:00:00+00:00)
* code.coding[+] = $loinc#31205-8 "Histology ICD-O-3 Cancer"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR6420 "Morphology (SNOMED)"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#8461 "High grade serous carcinoma"
* valueCodeableConcept.coding[+] = $sct#703563003 "High grade serous carcinoma"
* specimen.reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"

Instance: Observation-PathologyReflex-Behavior
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - behaviour (cancer), Selyse Burnley"
Description: "Fictitious example: LOINC 31206-6 Behavior ICD-O-3 - 3, malignant, primary site"
Usage: #example

* insert PathologyResult(ab6755d1-f22f-4374-9f45-7213383ec08f, 2025-03-21T16:00:00+00:00)
* code = $loinc#31206-6 "Behavior ICD-O-3 Cancer"
* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/icd-o-3#3 "Malignant, primary site"
* specimen.reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"

// Prior result 2: the pathology laboratory's tumour assessment of block A3 for molecular testing
Instance: DiagnosticReport-PathologyReflex-TumourAssessment
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - Tumour assessment for molecular testing, block A3, Selyse Burnley"
Description: "Fictitious example: the pathologist's review of block A3 for molecular testing, a result of the same pathology order, sent as a prior result of the genomic reflex order. There is no LOINC panel for this, so the laboratory's local code is used"
Usage: #example

* identifier[ReportIdentifier]
  * value = "H25-11823-TMA"
  * system = "http://www.acme.org/diagnosticreport/identifiers/690D0"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690D0"
* insert PathologyOrderBasedOn
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"
* code = http://www.acme.org/CodeSystem/690D0#TMA "Tumour assessment for molecular testing"
* insert BurnleySubject
* effectiveDateTime = "2025-03-14T10:00:00+00:00"
* issued = "2026-11-02T11:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "690D0"
  * type = #Organization
  * display = "ROYAL BLACKBURN HOSPITAL LABORATORY"
* resultsInterpreter[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C7890123"
  * display = "FICTITIOUS, Morgan"
* specimen[+].reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"
* result[+].reference = "urn:uuid:598f53aa-0484-429e-9552-107d646fa7b1"

Instance: Observation-PathologyReflex-TumourCellContent
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - tumour cell content, block A3, Selyse Burnley"
Description: "Fictitious example: approximate % neoplastic nuclei in the tumour area ringed on the H&E guide slide. No LOINC or SNOMED CT code exists for this in tissue, so the laboratory's local code is used. Unlike HL7 v2, the Observation references the block it was assessed on (Observation.specimen)"
Usage: #example

* insert PathologyResult(598f53aa-0484-429e-9552-107d646fa7b1, 2026-11-02T11:00:00+00:00)
* code = http://www.acme.org/CodeSystem/690D0#TCC "Tumour cell content"
* valueQuantity = 60 '%' "percent"
* specimen.reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"

RuleSet: PathologyReflexServiceRequestContent
* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/690D0"
* identifier[OrderPlacerNumber].value = "G26-04417-1"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "690D0"
// HL7 v2 ORC-8 Parent: the original pathology order
* basedOn[+]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RXN"
  * identifier.value = "EPR-552871"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RXN"
* status = #active
* intent = #reflex-order
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* authoredOn = "2026-11-03T14:30:00+00:00"
* code = $test-directory#M2.1 "Ovarian Carcinoma, Multi-target NGS panel - small variant (BRCA1, BRCA2, SMARCA4)"
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99"
  * identifier.system = $ods-code
  * identifier.value = "690D0"
* insert BurnleySubject
* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* specimen[+].reference = "urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d"
* reasonCode[+] = $GCC#M2 "Ovarian Carcinoma"
* supportingInfo[OrderEntryQuestions]
  * reference = "urn:uuid:19a32dd4-e8c2-4a9c-887a-180aeb7cd80e"
  * type = "Observation"
* note[+].text = "Relapsed high-grade serous ovarian carcinoma, second line. Tumour BRCA for PARP inhibitor eligibility."

Instance: ServiceRequest-PathologyReflex-ReportOnly
InstanceOf: ServiceRequest
Title: "ServiceRequest - M2.1 Ovarian Carcinoma tumour BRCA, reflex from pathology (report only)"
Description: "Fictitious example: genomic reflex order from the Royal Blackburn Hospital laboratory, with the original pathology report as a prior result (supportingInfo[priorResult])"
Usage: #example

* insert PathologyReflexServiceRequestContent
* supportingInfo[priorResult]
  * reference = "urn:uuid:51c45c3b-8de0-4ae8-9d35-f6ecf94ad4da"
  * type = "DiagnosticReport"
  * display = "Histopathology - ovarian cancer resection"

Instance: ServiceRequest-PathologyReflex
InstanceOf: ServiceRequest
Title: "ServiceRequest - M2.1 Ovarian Carcinoma tumour BRCA, reflex from pathology"
Description: "Fictitious example: genomic reflex order from the Royal Blackburn Hospital laboratory, with the original pathology report (and its discrete results) and the tumour assessment of block A3 as prior results (supportingInfo[priorResult])"
Usage: #example

* insert PathologyReflexServiceRequestContent
* supportingInfo[priorResult][+]
  * reference = "urn:uuid:84da2bf0-4a8a-4922-919d-0e8ef76eb289"
  * type = "DiagnosticReport"
  * display = "Histopathology - ovarian cancer resection"
* supportingInfo[priorResult][+]
  * reference = "urn:uuid:cbcc3ee3-b2b2-46d2-bcaa-d91919214847"
  * type = "DiagnosticReport"
  * display = "Tumour assessment for molecular testing - block A3"

RuleSet: PathologyReflexO21Header(date)
* meta.lastUpdated = "{date}"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "690D0"
* sender.display = "ROYAL BLACKBURN HOSPITAL LABORATORY"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/690D0"
* source.software = "LIMS"

Instance: MessageHeader-O21-PathologyReflex-ReportOnly
InstanceOf: MessageHeader
Title: "Message Header - Genomic Reflex Order M2.1 (O21), pathology report only"
Description: "Fictitious example: LAB-35 genomic reflex order from ROYAL BLACKBURN HOSPITAL LABORATORY to NORTH WEST GLH"
Usage: #example

* insert PathologyReflexO21Header(2026-11-03T14:30:00+00:00)
* focus[+]
  * reference = "urn:uuid:5f414f62-234a-4430-a911-27cbe775a121"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-PathologyReflex-ReportOnly
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomic Reflex Order M2.1 (O21), pathology report only"
Description: "Fictitious example: the LAB-35 Genomic Reflex Order in the [Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA](ExampleScenario-PathologyReflexTumourBRCA.html) scenario, converted from the HL7 v2 OML^O21. The original pathology report is a prior result (a DiagnosticReport with the report as a PDF), which keeps the original order and who placed it"
Usage: #example
* insert MessageBundle("urn:uuid:b71e4d09-2c6a-4f83-9e15-6a0d3c8f2e71", "2026-11-03T14:30:00+00:00")
* insert EntryDocument("urn:uuid:4acd105c-41ba-429a-bfe1-d0174b978b86", MessageHeader-O21-PathologyReflex-ReportOnly)
* insert EntryDocument("urn:uuid:f8622205-705b-47f6-92ae-c2609a4b4ce3", Patient-Burnley)
* insert EntryDocument("urn:uuid:5f414f62-234a-4430-a911-27cbe775a121", ServiceRequest-PathologyReflex-ReportOnly)
* insert EntryDocument("urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99", PractitionerRole-Pathologist-690D0)
* insert EntryDocument("urn:uuid:19a32dd4-e8c2-4a9c-887a-180aeb7cd80e", Observation-PathologyReflex-RelapsedDisease)
* insert EntryDocument("urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d", Specimen-PathologyReflex-BlockA3)
* insert EntryDocument("urn:uuid:51c45c3b-8de0-4ae8-9d35-f6ecf94ad4da", DiagnosticReport-PathologyReflex-Histopathology-ReportOnly)
* insert EntryDocument("urn:uuid:fa4d22b6-556d-40a8-9355-013d373bbabd", PractitionerRole-Requester-GynaeOncology-RXN)
* insert EntryDocument("urn:uuid:052c40aa-02bc-4db7-a44d-524cb2757922", Binary-Sample)

Instance: MessageHeader-O21-PathologyReflex
InstanceOf: MessageHeader
Title: "Message Header - Genomic Reflex Order M2.1 (O21), with discrete pathology results"
Description: "Fictitious example: LAB-35 genomic reflex order from ROYAL BLACKBURN HOSPITAL LABORATORY to NORTH WEST GLH"
Usage: #example

* insert PathologyReflexO21Header(2026-11-03T14:30:00+00:00)
* focus[+]
  * reference = "urn:uuid:bf760f03-0d46-46f1-bf21-f0e87361e2fe"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-PathologyReflex
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomic Reflex Order M2.1 (O21), with discrete pathology results"
Description: "Fictitious example: the LAB-35 Genomic Reflex Order in the [Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA](ExampleScenario-PathologyReflexTumourBRCA.html) scenario, converted from the HL7 v2 OML^O21. The prior results are the original pathology report (PDF, primary site and the LOINC 77753-2 Tumor morphology panel) and the pathology laboratory's tumour assessment of block A3"
Usage: #example
* insert MessageBundle("urn:uuid:3f0c9e52-6b1d-4c1e-9a57-2d8f1b7e4a10", "2026-11-03T14:30:00+00:00")
* insert EntryDocument("urn:uuid:1361cf6c-66f7-4d25-a86f-e212ee9849c8", MessageHeader-O21-PathologyReflex)
* insert EntryDocument("urn:uuid:f8622205-705b-47f6-92ae-c2609a4b4ce3", Patient-Burnley)
* insert EntryDocument("urn:uuid:bf760f03-0d46-46f1-bf21-f0e87361e2fe", ServiceRequest-PathologyReflex)
* insert EntryDocument("urn:uuid:8a25c8e6-9187-46bc-a000-275d58fafa99", PractitionerRole-Pathologist-690D0)
* insert EntryDocument("urn:uuid:19a32dd4-e8c2-4a9c-887a-180aeb7cd80e", Observation-PathologyReflex-RelapsedDisease)
* insert EntryDocument("urn:uuid:664ff878-e6b4-4356-a14f-1f1cb054005d", Specimen-PathologyReflex-BlockA3)
* insert EntryDocument("urn:uuid:84da2bf0-4a8a-4922-919d-0e8ef76eb289", DiagnosticReport-PathologyReflex-Histopathology)
* insert EntryDocument("urn:uuid:fa4d22b6-556d-40a8-9355-013d373bbabd", PractitionerRole-Requester-GynaeOncology-RXN)
* insert EntryDocument("urn:uuid:052c40aa-02bc-4db7-a44d-524cb2757922", Binary-Sample)
* insert EntryDocument("urn:uuid:2960aa5d-969b-48ce-9909-515ca62954b0", Observation-PathologyReflex-PrimarySite)
* insert EntryDocument("urn:uuid:c8ad0356-bc13-4452-b7c2-95b2b4eef0c3", Observation-PathologyReflex-TumorMorphologyPanel)
* insert EntryDocument("urn:uuid:f1d90438-d286-415b-a65f-430a7eeccbd6", Observation-PathologyReflex-Histology)
* insert EntryDocument("urn:uuid:ab6755d1-f22f-4374-9f45-7213383ec08f", Observation-PathologyReflex-Behavior)
* insert EntryDocument("urn:uuid:cbcc3ee3-b2b2-46d2-bcaa-d91919214847", DiagnosticReport-PathologyReflex-TumourAssessment)
* insert EntryDocument("urn:uuid:598f53aa-0484-429e-9552-107d646fa7b1", Observation-PathologyReflex-TumourCellContent)

// Genomic Report (LAB-36)

Instance: Specimen-PathologyReflex-Sections
InstanceOf: Specimen
Title: "Specimen - sections from FFPE block A3 (as received by the North West GLH)"
Description: "Fictitious example: the sections and marked H&E guide slide from block A3, with the received time at the GLH (HL7 v2 SPM-18)"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "H25-11823-A3"
  * system = "http://www.acme.org/specimen/690D0"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690D0"
* status = #available
* insert BurnleySubject
* type = $sct#441652008 "Formalin-fixed paraffin-embedded tissue specimen"
* collection.collectedDateTime = "2025-03-14T10:00:00+00:00"
* collection.method = $sct#65801008 "Excision"
* collection.bodySite = $sct#15497006 "Ovarian structure"
* receivedTime = "2026-11-05T09:00:00+00:00"

Instance: Variant-PathologyReflex-BRCA1
InstanceOf: Variant
Title: "Variant - BRCA1 (tumour), Selyse Burnley"
Description: "Fictitious example: the BRCA1 variant found in the tumour by the North West GLH. No genomic source class: a tumour test cannot tell whether the variant is somatic or germline"
Usage: #example

* insert GenomicResultObservation(3c03d0e7-e594-472e-8a6b-220cbabcc667, 2026-11-20T12:00:00+00:00, 699X0, NORTH WEST GLH)
* code = $loinc#69548-6 "Genetic variant assessment"
* insert BurnleySubject
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* specimen.reference = "urn:uuid:3a66a475-3b3c-41cd-bb0d-1d036d5abe5b"
* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:1100 "BRCA1"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_007294.4
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_007294.4:c.68_69del
* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#NP_009225.1:p.(Glu23ValfsTer17)
* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity = 0.58 '1' "relative frequency of a particular allele in the specimen"

Instance: DiagnosticImplication-PathologyReflex-BRCA1
InstanceOf: DiagnosticImplication
Title: "Diagnostic Implication - BRCA1 (tumour), Selyse Burnley"
Description: "Fictitious example: pathogenic classification of the BRCA1 variant found in the tumour"
Usage: #example

* insert GenomicResultObservation(2b47d865-d151-4dbe-bca2-821b13822071, 2026-11-20T12:00:00+00:00, 699X0, NORTH WEST GLH)
* insert BurnleySubject
* derivedFrom.reference = "urn:uuid:3c03d0e7-e594-472e-8a6b-220cbabcc667"
* component[clinical-significance].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[conclusion-string].valueString = "Pathogenic BRCA1 variant detected in the tumour. Germline testing is recommended, as a tumour test cannot tell whether the variant is inherited."

RuleSet: PathologyReflexReportContent
// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M2.1 Ovarian Carcinoma, tumour BRCA, for Selyse BURNLEY. Pathogenic BRCA1 variant NM_007294.4:c.68_69del detected in the tumour.</p></div>"
* identifier[ReportIdentifier]
  * value = "T26-71203"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/690D0"
  * identifier.value = "G26-04417-1"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "690D0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M2.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* insert BurnleySubject
* effectiveDateTime = "2025-03-14T10:00:00+00:00"
* issued = "2026-11-20T12:00:00+00:00"
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
* specimen[+].reference = "urn:uuid:3a66a475-3b3c-41cd-bb0d-1d036d5abe5b"
* conclusion = "Pathogenic BRCA1 variant detected in the tumour. Germline testing is recommended."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* insert ReportPDF(urn:uuid:9996b0aa-1ee8-4357-8c51-ecea3f36e7c9, M2.1 Genomic Report - Selyse BURNLEY, 2026-11-20)

Instance: DiagnosticReport-PathologyReflex-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M2.1 Ovarian Carcinoma tumour BRCA, Selyse Burnley"
Description: "Fictitious example: the North West GLH's LAB-36 report to the pathology laboratory, based on the reflex order (identified by its Order Placer Number), with the report as a PDF and no discrete results"
Usage: #example

* insert PathologyReflexReportContent

Instance: DiagnosticReport-PathologyReflex-Report-Enhanced
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M2.1 Ovarian Carcinoma tumour BRCA, Selyse Burnley (enhanced)"
Description: "Fictitious example: the LAB-36 report enhanced with the discrete results - the BRCA1 variant and its classification"
Usage: #example

* insert PathologyReflexReportContent
* result[+].reference = "urn:uuid:3c03d0e7-e594-472e-8a6b-220cbabcc667"
* result[+].reference = "urn:uuid:2b47d865-d151-4dbe-bca2-821b13822071"

Instance: DocumentReference-PathologyReflex-Report
InstanceOf: DocumentReference
Title: "Document Reference - M2.1 Genomic Report PDF, Selyse Burnley"
Description: "Fictitious example: the North West GLH's report as a PDF, related to its DiagnosticReport and the reflex order"
Usage: #example

* insert ReportPDFDocumentReferenceByIdentifier(34d286e2-c09a-4ce9-b0fb-5105a4364a16, 699X0, 2026-11-20T12:00:00+00:00, http://www.acme.org/diagnosticreport/identifiers, T26-71203, http://www.acme.org/servicerequest/690D0, G26-04417-1, 690D0, urn:uuid:9996b0aa-1ee8-4357-8c51-ecea3f36e7c9, M2.1)
* insert BurnleySubject

RuleSet: PathologyReflexR01Header(focus)
* meta.lastUpdated = "2026-11-20T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "690D0"
* destination.receiver.display = "ROYAL BLACKBURN HOSPITAL LABORATORY"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/690D0"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "iGene"
* focus[+]
  * reference = "{focus}"
  * type = #DiagnosticReport

Instance: MessageHeader-R01-PathologyReflex
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report M2.1 (R01), PDF only"
Description: "Fictitious example: LAB-36 report from NORTH WEST GLH to ROYAL BLACKBURN HOSPITAL LABORATORY"
Usage: #example

* insert PathologyReflexR01Header(urn:uuid:395fa9df-8e4d-4f9f-b748-2ab8be97bffc)

Instance: GenomicsReportMessage-PathologyReflex
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomic Report M2.1 (R01), PDF only"
Description: "Fictitious example: the LAB-36 Genomic Report in the [Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA](ExampleScenario-PathologyReflexTumourBRCA.html) scenario, converted from the HL7 v2 ORU^R01 - the current capability: the report as a PDF (`DocumentReference` and `Binary`), with no discrete results"
Usage: #example
* insert MessageBundle("urn:uuid:5c2e8f17-94a3-4b6d-a0e1-3f7d9b2c6a48", "2026-11-20T12:00:00+00:00")
* insert EntryDocument("urn:uuid:9319a7ce-4f29-467c-8f43-28c9999e715e", MessageHeader-R01-PathologyReflex)
* insert EntryDocument("urn:uuid:f8622205-705b-47f6-92ae-c2609a4b4ce3", Patient-Burnley)
* insert EntryDocument("urn:uuid:395fa9df-8e4d-4f9f-b748-2ab8be97bffc", DiagnosticReport-PathologyReflex-Report)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:3a66a475-3b3c-41cd-bb0d-1d036d5abe5b", Specimen-PathologyReflex-Sections)
* insert EntryDocument("urn:uuid:34d286e2-c09a-4ce9-b0fb-5105a4364a16", DocumentReference-PathologyReflex-Report)
* insert EntryDocument("urn:uuid:9996b0aa-1ee8-4357-8c51-ecea3f36e7c9", Binary-Sample)

Instance: MessageHeader-R01-PathologyReflex-Enhanced
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report M2.1 (R01), enhanced"
Description: "Fictitious example: LAB-36 enhanced report from NORTH WEST GLH to ROYAL BLACKBURN HOSPITAL LABORATORY"
Usage: #example

* insert PathologyReflexR01Header(urn:uuid:395fa9df-8e4d-4f9f-b748-2ab8be97bffc)

Instance: GenomicsReportMessage-PathologyReflex-Enhanced
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomic Report M2.1 (R01), enhanced"
Description: "Fictitious example: the LAB-36 Genomic Report in the [Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA](ExampleScenario-PathologyReflexTumourBRCA.html) scenario, converted from the HL7 v2 ORU^R01 - the enhanced report: the PDF, with the BRCA1 variant and its classification as discrete results"
Usage: #example
* insert MessageBundle("urn:uuid:8d41a7c3-2e95-4f0b-b6d8-7c19e0a3f5b2", "2026-11-20T12:00:00+00:00")
* insert EntryDocument("urn:uuid:d39605fa-d8a2-44f5-a853-df172bda8cc2", MessageHeader-R01-PathologyReflex-Enhanced)
* insert EntryDocument("urn:uuid:f8622205-705b-47f6-92ae-c2609a4b4ce3", Patient-Burnley)
* insert EntryDocument("urn:uuid:395fa9df-8e4d-4f9f-b748-2ab8be97bffc", DiagnosticReport-PathologyReflex-Report-Enhanced)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:3a66a475-3b3c-41cd-bb0d-1d036d5abe5b", Specimen-PathologyReflex-Sections)
* insert EntryDocument("urn:uuid:3c03d0e7-e594-472e-8a6b-220cbabcc667", Variant-PathologyReflex-BRCA1)
* insert EntryDocument("urn:uuid:2b47d865-d151-4dbe-bca2-821b13822071", DiagnosticImplication-PathologyReflex-BRCA1)
* insert EntryDocument("urn:uuid:34d286e2-c09a-4ce9-b0fb-5105a4364a16", DocumentReference-PathologyReflex-Report)
* insert EntryDocument("urn:uuid:9996b0aa-1ee8-4357-8c51-ecea3f36e7c9", Binary-Sample)
