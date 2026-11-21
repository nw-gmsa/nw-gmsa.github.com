// FHIR Messages for the first stage of the Lynch Syndrome ExampleScenario: the pathology to genomics reflex. Tumour MMR
// immunohistochemistry on a colonoscopy biopsy shows loss of MLH1 and PMS2, so the Manchester Royal Infirmary laboratory
// (690S0) orders M1.5 MLH1 promoter hypermethylation from the North West GLH (699X0), with the pathology results as prior
// results (O21), and the GLH reports back to the laboratory (R01). Converted from the original HL7 v2 messages in the Testing
// repo (Input/Scenarios/LynchSyndrome/V2/) and the use case
// https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md
// Fictitious example: identifiers, dates and results are illustrative only.

// LiverpoolSubject is defined in Chimerism/Chimerism.fsh

// The original pathology order (HL7 v2 prior ORC-2 / OBR-2), placed by Manchester University NHS Foundation Trust
RuleSet: LynchPathologyOrderBasedOn
* basedOn[OrderPlacerNumber]
  * reference = "urn:uuid:a65a592a-2096-46a5-921d-5051b73aac06"
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/R0A"
  * identifier.value = "1583320"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"

// A pathology result Observation, performed by the pathologist at the Manchester Royal Infirmary laboratory
RuleSet: LynchPathologyResult(id, date)
* identifier[+].value = "{id}"
* status = #final
* effectiveDateTime = "{date}"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* performer[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:e84c7e76-b0a0-4c66-971b-4ae2d03ecd5e"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C2468013"
  * display = "FICTITIOUS, Anika"
* insert LiverpoolSubject
* specimen.reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"

RuleSet: LynchPathologyPerformer
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "690S0"
  * type = #Organization
  * display = "MANCHESTER ROYAL INFIRMARY LABORATORY"
* resultsInterpreter[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:e84c7e76-b0a0-4c66-971b-4ae2d03ecd5e"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C2468013"
  * display = "FICTITIOUS, Anika"

Instance: PractitionerRole-Pathologist-690S0
InstanceOf: PractitionerRole
Title: "PractitionerRole - consultant histopathologist (Manchester Royal Infirmary laboratory)"
Description: "Fictitious example: the pathologist who reports the biopsy and places the genomic reflex order (HL7 v2 ORC-12/OBR-16 of the genomic order)"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C2468013"
* practitioner.display = "FICTITIOUS, Anika"
* organization.identifier.system = $ods-code
* organization.identifier.value = "690S0"
* organization.display = "MANCHESTER ROYAL INFIRMARY LABORATORY"

// Genomic Reflex Order (LAB-35)

RuleSet: LynchReflexSpecimenContent
* identifier[PlacerSpecimenNumber]
  * value = "H23-41022-A1-S1"
  * system = "http://www.acme.org/specimen/690S0"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690S0"
* status = #available
* insert LiverpoolSubject
* type = $sct#441652008 "Formalin-fixed paraffin-embedded tissue specimen"
* parent.identifier
  * value = "H23-41022-A1"
  * system = "http://www.acme.org/specimen/690S0"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690S0"
* collection.collector.identifier.assigner.identifier.system = $ods-code
* collection.collector.identifier.assigner.identifier.value = "R0A"
* collection.collector.display = "Manchester University NHS Foundation Trust"
* collection.collectedDateTime = "2023-08-14T10:00:00+00:00"
* collection.method = $sct#86273004 "Biopsy"
* collection.bodySite = $sct#32713005 "Caecum structure"
* contained[0] = Substance-LynchReflex-Formalin
* processing[0].additive = Reference(Substance-LynchReflex-Formalin)

Instance: Specimen-LynchReflex-BlockA1
InstanceOf: Specimen
Title: "Specimen - sections from FFPE block A1, caecal biopsy"
Description: "Fictitious example: the sections sent (HL7 v2 SPM-2), cut from block A1 of the colonoscopy biopsy (parent, SPM-3), fixed in buffered formalin (SPM-6). Biopsy (SPM-7) of the caecum (SPM-8) at Manchester University NHS Foundation Trust (R0A, OBR-10) in August 2023 (SPM-17)"
Usage: #example

* insert LynchReflexSpecimenContent
* receivedTime = "2023-08-14T15:00:00+00:00"
* note[+].text = "10 x 5 um sections and marked H&E guide slide from block A1."

Instance: Substance-LynchReflex-Formalin
InstanceOf: http://hl7.eu/fhir/laboratory/StructureDefinition/Substance-additive-eu-lab
Title: "Substance - buffered 10% formalin (fixative)"
Description: "Fictitious example: the fixative of FFPE block A1 (HL7 v2 SPM-6)"
Usage: #inline

* code = http://terminology.hl7.org/CodeSystem/v2-0371#BF10 "Buffered 10% formalin"

// The original pathology order (HL7 v2 prior-results ORC|RE / OBR), placed by Manchester University NHS Foundation Trust and
// filled by the Manchester Royal Infirmary laboratory
Instance: ServiceRequest-LynchReflex-OriginalOrder
InstanceOf: http://hl7.eu/fhir/laboratory/StructureDefinition/ServiceRequest-eu-lab
Title: "ServiceRequest - Histopathology, colonoscopy biopsy (the original pathology order), Ned Liverpool"
Description: "Fictitious example: the original pathology order the genomic reflex order is based on (HL7 v2 ORC-8 Parent), sent with its results as prior results. Completed (HL7 v2 ORC-5 CM) and filled by the Manchester Royal Infirmary laboratory (filler-order). It is not the order being asked for, so it isn't in MessageHeader.focus"
Usage: #example

* identifier[+]
  * type = $v2-0203#PLAC
  * system = "http://www.acme.org/servicerequest/R0A"
  * value = "1583320"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* identifier[+]
  * type = $v2-0203#FILL
  * system = "http://www.acme.org/servicerequest/690S0"
  * value = "H23-41022"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690S0"
* status = #completed
* intent = #filler-order
* category[+] = $sct#108252007 "Laboratory procedure"
* code = http://www.acme.org/CodeSystem/690S0#HISTO "Histopathology"
* insert LiverpoolSubject
* requester
  * type = "PractitionerRole"
  * reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C3456789"
  * display = "Dr Samuel Darwin"
* performer[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "690S0"
  * display = "MANCHESTER ROYAL INFIRMARY LABORATORY"
* specimen[+].reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"

// Prior result 1: the original histopathology report, with its discrete results
Instance: DiagnosticReport-LynchReflex-Histopathology
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - Histopathology, colonoscopy biopsy, Ned Liverpool"
Description: "Fictitious example: the original pathology report, sent as a prior result of the genomic reflex order - the report as a PDF, the primary site, the LOINC 77753-2 Tumor morphology panel and the mismatch repair immunohistochemistry. It keeps the original pathology order (Order Placer Number, assigned by Manchester University NHS Foundation Trust)"
Usage: #example

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Histopathology, colonoscopy biopsy of the caecum, for Ned LIVERPOOL. Adenocarcinoma. Loss of nuclear expression of MLH1 and PMS2; MSH2 and MSH6 retained.</p></div>"
* identifier[ReportIdentifier]
  * value = "H23-41022"
  * system = "http://www.acme.org/diagnosticreport/identifiers/690S0"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690S0"
* insert LynchPathologyOrderBasedOn
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"
* code.coding[+] = http://www.acme.org/CodeSystem/690S0#HISTO "Histopathology"
* code.coding[+] = $sct#1054291000000102 "Cellular pathology report"
* insert LiverpoolSubject
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T09:00:00+00:00"
* insert LynchPathologyPerformer
* specimen[+].reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"
* result[+].reference = "urn:uuid:2fa5cc1a-7a1e-4c99-ad10-50845819be31"
* result[+].reference = "urn:uuid:6572babb-2723-46d3-a65b-eaf63efcb04d"
* result[+].reference = "urn:uuid:e4421bf6-020a-4700-80ab-a961e97d5ef0"
* conclusion = "Caecum, biopsy: adenocarcinoma. Mismatch repair deficient - loss of MLH1 and PMS2."
* insert ReportPDF(urn:uuid:56b5f338-78a0-41cc-9e44-8272b7450c4a, Cellular pathology report - Ned LIVERPOOL, 2023-08-21)

Instance: Observation-LynchReflex-PrimarySite
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - primary site (cancer), Ned Liverpool"
Description: "Fictitious example: LOINC 21855-2 Primary site, with the COSD Pathology item pCR6410 as the alternate code. The value is ICD-O-3 topography, with the SNOMED CT body structure as the alternate"
Usage: #example

* insert LynchPathologyResult(2fa5cc1a-7a1e-4c99-ad10-50845819be31, 2023-08-21T09:00:00+00:00)
* code.coding[+] = $loinc#21855-2 "Primary site Cancer"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR6410 "Topography (SNOMED)"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#C18.0 "Cecum"
* valueCodeableConcept.coding[+] = $sct#32713005 "Caecum structure"

Instance: Observation-LynchReflex-TumorMorphologyPanel
InstanceOf: ObservationPanel
Title: "Observation - Tumor morphology panel (cancer), Ned Liverpool"
Description: "Fictitious example: LOINC 77753-2 Tumor morphology panel, with histology and behaviour as its members"
Usage: #example

* identifier[+].value = "6572babb-2723-46d3-a65b-eaf63efcb04d"
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = $loinc#77753-2 "Tumor morphology panel Cancer"
* insert LiverpoolSubject
* effectiveDateTime = "2023-08-21T09:00:00+00:00"
* performer[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:e84c7e76-b0a0-4c66-971b-4ae2d03ecd5e"
  * display = "FICTITIOUS, Anika"
* specimen.reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"
* hasMember[+].reference = "urn:uuid:8bacec0e-56e8-4e2e-a4cb-5218728c939e"
* hasMember[+].reference = "urn:uuid:20664699-059a-4a44-b1b1-2cdc90e48f0d"

Instance: Observation-LynchReflex-Histology
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - histology (cancer), Ned Liverpool"
Description: "Fictitious example: LOINC 31205-8 Histology ICD-O-3, with the COSD Pathology item pCR6420 as the alternate code. The value is ICD-O-3 morphology, with the SNOMED CT morphology as the alternate"
Usage: #example

* insert LynchPathologyResult(8bacec0e-56e8-4e2e-a4cb-5218728c939e, 2023-08-21T09:00:00+00:00)
* code.coding[+] = $loinc#31205-8 "Histology ICD-O-3 Cancer"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR6420 "Morphology (SNOMED)"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#8140 "Adenocarcinoma, NOS"
* valueCodeableConcept.coding[+] = $sct#35917007 "Adenocarcinoma"

Instance: Observation-LynchReflex-Behavior
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - behaviour (cancer), Ned Liverpool"
Description: "Fictitious example: LOINC 31206-6 Behavior ICD-O-3 - 3, malignant, primary site"
Usage: #example

* insert LynchPathologyResult(20664699-059a-4a44-b1b1-2cdc90e48f0d, 2023-08-21T09:00:00+00:00)
* code = $loinc#31206-6 "Behavior ICD-O-3 Cancer"
* valueCodeableConcept = http://terminology.hl7.org/CodeSystem/icd-o-3#3 "Malignant, primary site"

Instance: Observation-LynchReflex-MMRPanel
InstanceOf: ObservationPanel
Title: "Observation - mismatch repair immunohistochemistry, Ned Liverpool"
Description: "Fictitious example: the mismatch repair (MMR) protein immunohistochemistry, with the four proteins as its members - the result that triggers the reflex order. There is no LOINC panel for this, so the laboratory's local code is used"
Usage: #example

* identifier[+].value = "e4421bf6-020a-4700-80ab-a961e97d5ef0"
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = http://www.acme.org/CodeSystem/690S0#MMR "Mismatch repair immunohistochemistry"
* insert LiverpoolSubject
* effectiveDateTime = "2023-08-21T09:00:00+00:00"
* performer[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:e84c7e76-b0a0-4c66-971b-4ae2d03ecd5e"
  * display = "FICTITIOUS, Anika"
* specimen.reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"
* hasMember[+].reference = "urn:uuid:34247921-30db-49a0-bba1-088a54615ecb"
* hasMember[+].reference = "urn:uuid:17f273be-06e4-4797-9494-3be3c4f4a476"
* hasMember[+].reference = "urn:uuid:ac84da3f-eabe-45a9-bbc5-8744b0b976af"
* hasMember[+].reference = "urn:uuid:a037aa24-4999-4457-8438-1dc56487a3ed"

Instance: Observation-LynchReflex-MLH1
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - MLH1 immunohistochemistry, Ned Liverpool"
Description: "Fictitious example: LOINC 81691-8 MLH-1 Ag [Presence] by immune stain, with the COSD Pathology item pCR7020 MLH1 Nuclear Expression Intact as the alternate code. Absent - loss of nuclear expression"
Usage: #example

* insert LynchPathologyResult(34247921-30db-49a0-bba1-088a54615ecb, 2023-08-21T09:00:00+00:00)
* code.coding[+] = $loinc#81691-8 "MLH-1 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7020 "MLH1 Nuclear Expression Intact"
* valueCodeableConcept = $loinc#LA9634-2 "Absent"

Instance: Observation-LynchReflex-PMS2
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - PMS2 immunohistochemistry, Ned Liverpool"
Description: "Fictitious example: LOINC 81694-2 PMS2 Ag [Presence] by immune stain, with the COSD Pathology item pCR7030 PMS2 Nuclear Expression Intact as the alternate code. Absent - loss of nuclear expression"
Usage: #example

* insert LynchPathologyResult(17f273be-06e4-4797-9494-3be3c4f4a476, 2023-08-21T09:00:00+00:00)
* code.coding[+] = $loinc#81694-2 "PMS2 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7030 "PMS2 Nuclear Expression Intact"
* valueCodeableConcept = $loinc#LA9634-2 "Absent"

Instance: Observation-LynchReflex-MSH2
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - MSH2 immunohistochemistry, Ned Liverpool"
Description: "Fictitious example: LOINC 81692-6 MSH-2 Ag [Presence] by immune stain, with the COSD Pathology item pCR7040 MSH2 Nuclear Expression Intact as the alternate code. Present - expression retained"
Usage: #example

* insert LynchPathologyResult(ac84da3f-eabe-45a9-bbc5-8744b0b976af, 2023-08-21T09:00:00+00:00)
* code.coding[+] = $loinc#81692-6 "MSH-2 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7040 "MSH2 Nuclear Expression Intact"
* valueCodeableConcept = $loinc#LA9633-4 "Present"

Instance: Observation-LynchReflex-MSH6
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - MSH6 immunohistochemistry, Ned Liverpool"
Description: "Fictitious example: LOINC 81693-4 MSH-6 Ag [Presence] by immune stain, with the COSD Pathology item pCR7050 MSH6 Nuclear Expression Intact as the alternate code. Present - expression retained"
Usage: #example

* insert LynchPathologyResult(a037aa24-4999-4457-8438-1dc56487a3ed, 2023-08-21T09:00:00+00:00)
* code.coding[+] = $loinc#81693-4 "MSH-6 Ag [Presence] in Cancer specimen by Immune stain"
* code.coding[+] = http://www.acme.org/CodeSystem/COSD#pCR7050 "MSH6 Nuclear Expression Intact"
* valueCodeableConcept = $loinc#LA9633-4 "Present"

// Prior result 2: the pathology laboratory's tumour assessment of block A1 for molecular testing
Instance: DiagnosticReport-LynchReflex-TumourAssessment
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - Tumour assessment for molecular testing, block A1, Ned Liverpool"
Description: "Fictitious example: the pathologist's review of block A1 for molecular testing, a result of the same pathology order, sent as a prior result of the genomic reflex order. There is no LOINC panel for this, so the laboratory's local code is used"
Usage: #example

* identifier[ReportIdentifier]
  * value = "H23-41022-TMA"
  * system = "http://www.acme.org/diagnosticreport/identifiers/690S0"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "690S0"
* insert LynchPathologyOrderBasedOn
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"
* code = http://www.acme.org/CodeSystem/690S0#TMA "Tumour assessment for molecular testing"
* insert LiverpoolSubject
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-08-21T11:00:00+00:00"
* insert LynchPathologyPerformer
* specimen[+].reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"
* result[+].reference = "urn:uuid:bf5ddd8f-6f3c-4fd9-bcf2-3c6dc8efb169"

Instance: Observation-LynchReflex-TumourCellContent
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - tumour cell content, block A1, Ned Liverpool"
Description: "Fictitious example: approximate % neoplastic nuclei in the tumour area ringed on the H&E guide slide (MDS PS-026). No LOINC or SNOMED CT code exists for this in tissue, so the laboratory's local code is used"
Usage: #example

* insert LynchPathologyResult(bf5ddd8f-6f3c-4fd9-bcf2-3c6dc8efb169, 2023-08-21T11:00:00+00:00)
* code = http://www.acme.org/CodeSystem/690S0#TCC "Tumour cell content"
* valueQuantity = 40 '%' "percent"

Instance: ServiceRequest-LynchReflex
InstanceOf: ServiceRequest
Title: "ServiceRequest - M1.5 Colorectal Carcinoma MLH1 promoter hypermethylation, reflex from pathology"
Description: "Fictitious example: genomic reflex order from the Manchester Royal Infirmary laboratory after MMR immunohistochemistry showed loss of MLH1 and PMS2, with the original pathology report (and its discrete results) and the tumour assessment of block A1 as prior results (supportingInfo[priorResult])"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/690S0"
* identifier[OrderPlacerNumber].value = "G23-08317-1"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "690S0"
// HL7 v2 ORC-8 Parent: the original pathology order
* basedOn[+]
  * reference = "urn:uuid:a65a592a-2096-46a5-921d-5051b73aac06"
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/R0A"
  * identifier.value = "1583320"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
* status = #active
* intent = #reflex-order
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* authoredOn = "2023-08-21T14:00:00+00:00"
* code = $test-directory#M1.5 "Colorectal Carcinoma, MLH1 promoter hypermethylation"
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:e84c7e76-b0a0-4c66-971b-4ae2d03ecd5e"
  * identifier.system = $ods-code
  * identifier.value = "690S0"
* insert LiverpoolSubject
* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* specimen[+].reference = "urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f"
* reasonCode[+] = $GCC#M1 "Colorectal Carcinoma"
* supportingInfo[priorResult][+]
  * reference = "urn:uuid:fefbba27-ceb8-489a-9711-19b4c631a63f"
  * type = "DiagnosticReport"
  * display = "Histopathology - colonoscopy biopsy"
* supportingInfo[priorResult][+]
  * reference = "urn:uuid:65258e46-4688-47b3-990b-9a62a577cf3c"
  * type = "DiagnosticReport"
  * display = "Tumour assessment for molecular testing - block A1"
* note[+].text = "Caecal adenocarcinoma. Loss of MLH1 and PMS2 on MMR immunohistochemistry. MLH1 promoter hypermethylation for Lynch syndrome triage."

Instance: MessageHeader-O21-LynchReflex
InstanceOf: MessageHeader
Title: "Message Header - Genomic Reflex Order M1.5 (O21)"
Description: "Fictitious example: LAB-35 genomic reflex order from MANCHESTER ROYAL INFIRMARY LABORATORY to NORTH WEST GLH"
Usage: #example

* meta.lastUpdated = "2023-08-21T14:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "690S0"
* sender.display = "MANCHESTER ROYAL INFIRMARY LABORATORY"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/690S0"
* source.software = "LIMS"
* focus[+]
  * reference = "urn:uuid:105f2311-c45a-4317-bef6-1ff0b332dcb9"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-LynchReflex
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomic Reflex Order M1.5 (O21)"
Description: "Fictitious example: the LAB-35 Genomic Reflex Order in the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario, converted from the HL7 v2 OML^O21. The prior results are the original pathology report (PDF, primary site, the LOINC 77753-2 Tumor morphology panel and the MMR immunohistochemistry) and the pathology laboratory's tumour assessment of block A1"
Usage: #example
* insert MessageBundle("urn:uuid:952c8215-d682-4b79-a652-5e73ba1a7584", "2023-08-21T14:00:00+00:00")
* insert EntryDocument("urn:uuid:7ab46368-bc0f-480e-92c4-1593c8ec9e4a", MessageHeader-O21-LynchReflex)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:105f2311-c45a-4317-bef6-1ff0b332dcb9", ServiceRequest-LynchReflex)
* insert EntryDocument("urn:uuid:e84c7e76-b0a0-4c66-971b-4ae2d03ecd5e", PractitionerRole-Pathologist-690S0)
* insert EntryDocument("urn:uuid:44b9319c-0a3a-4782-8a55-013968cfad1f", Specimen-LynchReflex-BlockA1)
* insert EntryDocument("urn:uuid:fefbba27-ceb8-489a-9711-19b4c631a63f", DiagnosticReport-LynchReflex-Histopathology)
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
* insert EntryDocument("urn:uuid:56b5f338-78a0-41cc-9e44-8272b7450c4a", Binary-Sample)
* insert EntryDocument("urn:uuid:2fa5cc1a-7a1e-4c99-ad10-50845819be31", Observation-LynchReflex-PrimarySite)
* insert EntryDocument("urn:uuid:6572babb-2723-46d3-a65b-eaf63efcb04d", Observation-LynchReflex-TumorMorphologyPanel)
* insert EntryDocument("urn:uuid:8bacec0e-56e8-4e2e-a4cb-5218728c939e", Observation-LynchReflex-Histology)
* insert EntryDocument("urn:uuid:20664699-059a-4a44-b1b1-2cdc90e48f0d", Observation-LynchReflex-Behavior)
* insert EntryDocument("urn:uuid:e4421bf6-020a-4700-80ab-a961e97d5ef0", Observation-LynchReflex-MMRPanel)
* insert EntryDocument("urn:uuid:34247921-30db-49a0-bba1-088a54615ecb", Observation-LynchReflex-MLH1)
* insert EntryDocument("urn:uuid:17f273be-06e4-4797-9494-3be3c4f4a476", Observation-LynchReflex-PMS2)
* insert EntryDocument("urn:uuid:ac84da3f-eabe-45a9-bbc5-8744b0b976af", Observation-LynchReflex-MSH2)
* insert EntryDocument("urn:uuid:a037aa24-4999-4457-8438-1dc56487a3ed", Observation-LynchReflex-MSH6)
* insert EntryDocument("urn:uuid:65258e46-4688-47b3-990b-9a62a577cf3c", DiagnosticReport-LynchReflex-TumourAssessment)
* insert EntryDocument("urn:uuid:bf5ddd8f-6f3c-4fd9-bcf2-3c6dc8efb169", Observation-LynchReflex-TumourCellContent)
* insert EntryDocument("urn:uuid:a65a592a-2096-46a5-921d-5051b73aac06", ServiceRequest-LynchReflex-OriginalOrder)

// Genomic Report (LAB-36)

Instance: Specimen-LynchReflex-Sections
InstanceOf: Specimen
Title: "Specimen - sections from FFPE block A1 (as received by the North West GLH)"
Description: "Fictitious example: the sections and marked H&E guide slide from block A1, with the received time at the GLH (HL7 v2 SPM-18)"
Usage: #example

* insert LynchReflexSpecimenContent
* receivedTime = "2023-08-23T09:00:00+00:00"

Instance: Observation-LynchReflex-MLH1Methylation
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - MLH1 promoter hypermethylation, Ned Liverpool"
Description: "Fictitious example: LOINC 58416-9 MLH1 gene methylation [Presence] - not detected"
Usage: #example

* identifier[+].value = "b190a6a4-54b0-4214-8567-650b633ddd50"
* status = #final
* effectiveDateTime = "2023-09-01T12:00:00+00:00"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* performer[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* insert LiverpoolSubject
* code = $loinc#58416-9 "MLH1 gene methylation [Presence] in Blood or Tissue by Molecular genetics method"
* valueCodeableConcept = $loinc#LA11883-8 "Not detected"
* specimen.reference = "urn:uuid:5fcc10f6-959c-41ba-a415-7d203873b220"

Instance: DiagnosticReport-LynchReflex-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - M1.5 Colorectal Carcinoma MLH1 promoter hypermethylation, Ned Liverpool"
Description: "Fictitious example: the North West GLH's LAB-36 report to the pathology laboratory, based on the reflex order (identified by its Order Placer Number), with the report as a PDF and the methylation result as a discrete result"
Usage: #example

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M1.5 Colorectal Carcinoma, MLH1 promoter hypermethylation, for Ned LIVERPOOL. MLH1 promoter hypermethylation not detected. Germline testing for Lynch syndrome (R210) is recommended.</p></div>"
* identifier[ReportIdentifier]
  * value = "T23-55120"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/690S0"
  * identifier.value = "G23-08317-1"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "690S0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M1.5
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* insert LiverpoolSubject
* effectiveDateTime = "2023-08-14T10:00:00+00:00"
* issued = "2023-09-01T12:00:00+00:00"
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
* specimen[+].reference = "urn:uuid:5fcc10f6-959c-41ba-a415-7d203873b220"
* result[+].reference = "urn:uuid:b190a6a4-54b0-4214-8567-650b633ddd50"
* conclusion = "MLH1 promoter hypermethylation not detected. The loss of MLH1 and PMS2 may be due to Lynch syndrome; germline testing (R210) is recommended."
* conclusionCode[+] = $GTOC#432 "NO TARGET DETECTED OR TARGET DETECTED BELOW A LEVEL REQUIRING CLINICAL ACTION"
* insert ReportPDF(urn:uuid:a7b81627-49c6-4675-b0d0-dbcf34f3b37a, M1.5 Genomic Report - Ned LIVERPOOL, 2023-09-01)

Instance: DocumentReference-LynchReflex-Report
InstanceOf: DocumentReference
Title: "Document Reference - M1.5 Genomic Report PDF, Ned Liverpool"
Description: "Fictitious example: the North West GLH's report as a PDF, related to its DiagnosticReport and the reflex order"
Usage: #example

* insert ReportPDFDocumentReferenceByIdentifier(00ae12e6-6e5a-4fb1-af19-aec069eadc40, 699X0, 2023-09-01T12:00:00+00:00, http://www.acme.org/diagnosticreport/identifiers, T23-55120, http://www.acme.org/servicerequest/690S0, G23-08317-1, 690S0, urn:uuid:a7b81627-49c6-4675-b0d0-dbcf34f3b37a, M1.5)
* insert LiverpoolSubject

Instance: MessageHeader-R01-LynchReflex
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report M1.5 (R01)"
Description: "Fictitious example: LAB-36 report from NORTH WEST GLH to MANCHESTER ROYAL INFIRMARY LABORATORY"
Usage: #example

* meta.lastUpdated = "2023-09-01T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "690S0"
* destination.receiver.display = "MANCHESTER ROYAL INFIRMARY LABORATORY"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/690S0"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "iGene"
* focus[+]
  * reference = "urn:uuid:b02025df-4e49-41ef-8c7c-4432f12cb090"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-LynchReflex
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomic Report M1.5 (R01)"
Description: "Fictitious example: the LAB-36 Genomic Report in the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario, converted from the HL7 v2 ORU^R01 - the report as a PDF, with the MLH1 promoter hypermethylation result as a discrete result"
Usage: #example
* insert MessageBundle("urn:uuid:1a3c8591-1c1e-4723-a88d-47473ca67ecd", "2023-09-01T12:00:00+00:00")
* insert EntryDocument("urn:uuid:3a419d41-c35b-4f8b-a50c-31c98e38dfc4", MessageHeader-R01-LynchReflex)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:b02025df-4e49-41ef-8c7c-4432f12cb090", DiagnosticReport-LynchReflex-Report)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:5fcc10f6-959c-41ba-a415-7d203873b220", Specimen-LynchReflex-Sections)
* insert EntryDocument("urn:uuid:b190a6a4-54b0-4214-8567-650b633ddd50", Observation-LynchReflex-MLH1Methylation)
* insert EntryDocument("urn:uuid:00ae12e6-6e5a-4fb1-af19-aec069eadc40", DocumentReference-LynchReflex-Report)
* insert EntryDocument("urn:uuid:a7b81627-49c6-4675-b0d0-dbcf34f3b37a", Binary-Sample)
