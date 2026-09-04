Instance: GMSWGSCancerAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "GMS WGS Cancer Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the **NHS Genomic Medicine Service
(GMS) Whole Genome Sequencing (WGS) Test Request - Cancer** form (the
national GMS-branded form, not NW GLH-specific), used alongside the [common
core order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). Like
[GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html)
and [dWGS](dWGS.html), this form has no Whole Genome Sequencing Test
Category in the common core's Test Code branches, so its own Test Directory
Clinical Indication item fills that gap directly.
"""
Usage:  #definition

* title = "GMS WGS Cancer Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GMSWGSCancerAskAtOrderEntry"
* derivedFrom = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"
* derivedFrom.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
  * valueCoding = http://hl7.org/fhir/questionnaire-derivationType#extends

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

// Requesting organisation / GLH laboratory to receive sample

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21-requesting-cancer"
    * text = "Requesting organisation"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * item[+]
      * linkId = "HL7/ORC-21-requesting-cancer-designNote"
      * type = #display
      * text = "Same concept as the common core's own Referring Organisation ODS Code / Ordering Facility (HL7/ORC-21) - see GMS WGS Rare Disease's equivalent item for the same requester/performer split used by dWGS."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "NOS/GLHLaboratory"
    * text = "GLH laboratory to receive sample"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.performer"

// Reason NHS Number not available

  * item[+]
    * type = #string
    * linkId = "NOS/ReasonNHSNumberNotAvailable-cancer"
    * code[+] = $nwgmsa#ReasonNHSNumberNotAvailable
    * text = "Reason NHS Number not available (e.g. patient not eligible, foreign national)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber.extension"

// Presentation status

  * item[+]
    * type = #choice
    * linkId = "NOS/PresentationStatus"
    * code[+] = $nwgmsa#PresentationStatus
    * text = "Presentation status"
    * answerOption[+].valueCoding = $nwgmsa#PresentationFirstDiagnosis
    * answerOption[+].valueCoding = $nwgmsa#PresentationRecurrenceRelapse
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "http://hl7.org/fhir/StructureDefinition/Condition#Condition.clinicalStatus"

// Additional clinical information

  * item[+]
    * type = #string
    * linkId = "NOS/AdditionalClinicalInformation"
    * text = "Additional clinical information (previous tumours, molecular testing, relevant treatment history)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"
    * item[+]
      * linkId = "NOS/AdditionalClinicalInformation-designNote"
      * type = #display
      * text = "Same FHIR target as the common core's own Relevant clinical information and family history (HL7/NTE-1) and dWGS's Clinical Information (dWGS/clinical_information)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Test Directory Clinical Indication & code

  * item[+]
    * type = #choice
    * linkId = "NOS/TestDirectoryClinicalIndication-cancer"
    * text = "Test Directory Clinical Indication & code (cancer type & sub-type)"
    * required = true
    * answerValueSet = Canonical(GenomicTestCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "NOS/TestDirectoryClinicalIndication-cancer-designNote"
      * type = #display
      * text = "Same gap-fill as GMS WGS Rare Disease and dWGS Ask At Order Entry's own Test Code items - the common core's Cancer Test Code branch (HL7/OBR-4-c) is scoped to GenomicCancer, not Whole Genome Sequencing."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "SolidTumour"
    * text = "Solid tumour requests only"

    * item[+]
      * type = #choice
      * linkId = "NOS/TumourPresentationType"
      * code[+] = $nwgmsa#TumourPresentationType
      * text = "Tumour presentation type"
      * answerOption[+].valueCoding = $nwgmsa#TumourPresentationPrimary
      * answerOption[+].valueCoding = $nwgmsa#TumourPresentationMetastatic
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
      * answerOption[+].valueCoding = $nwgmsa#TumourPresentationLymphoma
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

    * item[+]
      * type = #string
      * linkId = "NOS/HistopathologyLabID"
      * code[+] = $nwgmsa#HistopathologyLabID
      * text = "Histopathology Lab ID"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier.assigner.identifier.value"
      * item[+]
        * linkId = "NOS/HistopathologyLabID-designNote"
        * type = #display
        * text = "Same underlying concept as the common core's own Pathology Laboratory Hospital/Trust ID (LN/80398-1-ODS)."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #date
      * linkId = "NOS/DateOfDiagnosis-solid"
      * text = "Date of this diagnosis"
      * definition = "http://hl7.org/fhir/StructureDefinition/Condition#Condition.onsetDateTime"

    * item[+]
      * type = #string
      * linkId = "NOS/TumourTopography"
      * text = "Tumour topography"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.bodySite"
      * item[+]
        * linkId = "NOS/TumourTopography-designNote"
        * type = #display
        * text = "Overlaps conceptually with the common core's own Tissue source/organ of origin (LN/39111-0) and dWGS's Sample Topography (dWGS/received_sample_topography)."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "NOS/TumourMorphology-solid"
      * text = "Tumour morphology"
      * item[+]
        * linkId = "NOS/TumourMorphology-solid-designNote"
        * type = #display
        * text = "Same unmapped concept as dWGS's Sample Morphology (dWGS/received_sample_morphology) - no clean FHIR field identified in either case."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "NOS/AdditionalTumourInformation"
      * text = "Additional tumour information (e.g. site of metastasis, unknown primary)"

  * item[+]
    * type = #group
    * linkId = "HaemOncLiquidTumour"
    * text = "Haemato-oncology liquid tumour requests only"

    * item[+]
      * type = #choice
      * linkId = "NOS/HaematoOncologyLiquidTumourType"
      * code[+] = $nwgmsa#HaematoOncologyLiquidTumourType
      * text = "Haemato-oncology liquid tumour type"
      * answerOption[+].valueCoding = $sct#91861009 "Acute myeloid leukaemia (AML)"
      * answerOption[+].valueCoding = $sct#84228005 "Acute lymphoblastic leukaemia (ALL)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

    * item[+]
      * type = #string
      * linkId = "NOS/SIHMDSLabID"
      * code[+] = $nwgmsa#SIHMDSLabID
      * text = "SIHMDS Lab ID"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier.assigner.identifier.value"

    * item[+]
      * type = #date
      * linkId = "NOS/DateOfDiagnosis-haemonc"
      * text = "Date of this diagnosis"
      * definition = "http://hl7.org/fhir/StructureDefinition/Condition#Condition.onsetDateTime"

// Tumour sample (being sent to GLH DNA extraction lab)

  * item[+]
    * type = #group
    * linkId = "TumourSpecimen"
    * text = "Tumour sample (being sent to GLH DNA extraction lab)"
    * item[+]
      * linkId = "TumourSpecimen-designNote"
      * type = #display
      * text = "Sample type (Fresh frozen tumour/Bone marrow/Blood EDTA/Other), Sample ID, Collection date/time and Sample volume map onto the common core's own Specimen group - not re-declared here."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #quantity
      * linkId = "NOS/NeoplasticCellContent-gms"
      * code[+] = $nwgmsa#NeoplasticCellContent
      * text = "% Malignant nuclei / blasts (or equivalent)"
      * required = true
      * extension[unit].valueCoding = $ucum#% "%"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
      * item[+]
        * linkId = "NOS/NeoplasticCellContent-gms-designNote"
        * type = #display
        * text = "Same underlying concept as WGS Local Test Order's Neoplastic cell content (NOS/NeoplasticCellContent-wgs) and dWGS's Tumour Content (dWGS/received_sample_tumour_content_pct) - reuses the same local code."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #decimal
      * linkId = "NOS/NucleatedCellCount"
      * code[+] = $nwgmsa#NucleatedCellCount
      * text = "Nucleated cell count (if bone marrow/peripheral blood)"

// Germline sample (being sent to GLH DNA extraction lab)

  * item[+]
    * type = #group
    * linkId = "GermlineSpecimen"
    * text = "Germline sample (being sent to GLH DNA extraction lab)"
    * item[+]
      * linkId = "GermlineSpecimen-designNote"
      * type = #display
      * text = "Sample type (Blood EDTA/Saliva/Fibroblasts/Skin biopsy/Other), Sample ID, Collection date/time, Sample volume and Comments map onto the common core's own Specimen group - not re-declared here."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Record of Discussion

  * item[+]
    * type = #choice
    * linkId = "NOS/RODToFollow-gms-cancer"
    * code[+] = $nwgmsa#RODToFollow
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * text = "Record of Discussion (ROD) attached, or to follow"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Attached"
    * answerOption[+].valueCoding = $loinc#LA32-8 "To follow"

// Main contact (if different from responsible consultant)

  * item[+]
    * type = #group
    * linkId = "MainContact-cancer"
    * code[+] = $nwgmsa#MainContact
    * text = "Main contact (if different from responsible consultant)"
    * item[+]
      * linkId = "MainContact-cancer-designNote"
      * type = #display
      * text = "Responsible consultant maps directly onto the common core's own Healthcare Professional group and is not re-declared here. Main Contact is the same genuinely-additional-person gap identified on GMS WGS Rare Disease and Genomic Test Order - Common Fields We May Have Missed (Copy Report To)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactName-cancer"
      * text = "Name"
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactDepartmentAddress-cancer"
      * text = "Department address"
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactPhone-cancer"
      * text = "Phone"
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactEmail-cancer"
      * text = "Email"
