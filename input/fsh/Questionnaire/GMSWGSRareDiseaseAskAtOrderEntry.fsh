Instance: GMSWGSRareDiseaseAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "GMS WGS Rare Disease Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the **NHS Genomic Medicine Service
(GMS) Whole Genome Sequencing (WGS) Test Request - Rare Disease** form (the
national GMS-branded form, not NW GLH-specific), used alongside the [common
core order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). Like
[dWGS](dWGS.html), this form has no Whole Genome Sequencing Test Category in
the common core's Test Code branches, so its own Test Directory Clinical
Indication item fills that gap directly - see [dWGS Ask At Order
Entry](Questionnaire-dWGSAskAtOrderEntry.html) for the same fix applied to
the distributed sub-contracted pathway. **HPO (Human Phenotype Ontology)
terms are mandatory on this form** - WGS analysis cannot start without at
least one - see [Genomic Test Order - Common Fields We May Have
Missed](Questionnaire-GenomicTestOrder.html#common-fields-we-may-have-missed).
"""
Usage:  #definition

* title = "GMS WGS Rare Disease Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GMSWGSRareDiseaseAskAtOrderEntry"
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

// Requesting organisation / GMS laboratory

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21-requesting"
    * text = "Requesting organisation"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * item[+]
      * linkId = "HL7/ORC-21-requesting-designNote"
      * type = #display
      * text = "Same concept as the common core's own Referring Organisation ODS Code / Ordering Facility (HL7/ORC-21) - kept as its own item here to sit alongside GMS laboratory below, the same requester/performer split used by dWGS's Original Ordering Facility Code / Filler Order Ordering Facility Code pair."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "NOS/GMSLaboratory"
    * text = "GMS laboratory (to receive sample)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.performer"

// Family test type

  * item[+]
    * type = #string
    * linkId = "NOS/FamilyTestType"
    * code[+] = $nwgmsa#FamilyTestType
    * text = "Family test (Singleton/Trio/Other)"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "NOS/FamilyTestType-designNote"
      * type = #display
      * text = "Same underlying concept as dWGS's Family Structure (NOS/FamilyStructure) on dWGS Ask At Order Entry, but with different answer options - this form offers Singleton/Trio/Other (with a number), not Duo, since a Duo is presumably covered by 'Other'."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Reason NHS Number not available

  * item[+]
    * type = #string
    * linkId = "NOS/ReasonNHSNumberNotAvailable"
    * code[+] = $nwgmsa#ReasonNHSNumberNotAvailable
    * text = "Reason NHS Number not available (e.g. patient not eligible, foreign national)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber.extension"

// Clinical priority / urgency reason

  * item[+]
    * type = #string
    * linkId = "NOS/UrgencyReason"
    * code[+] = $nwgmsa#UrgencyReason
    * text = "Reason for urgency, if requesting priority over the standard non-urgent pathway"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"
    * item[+]
      * linkId = "NOS/UrgencyReason-designNote"
      * type = #display
      * text = "The Clinical Priority selection itself is the same concept as the common core's own Priority item (LN/82768-3) - only the free-text urgency justification is new here."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Reason for diagnostic test (clinical utility)

  * item[+]
    * type = #choice
    * linkId = "NOS/ReasonForDiagnosticTest"
    * text = "Reason for diagnostic test"
    * required = true
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#ClinicalUtilityPatientManagement
    * answerOption[+].valueCoding = $nwgmsa#ClinicalUtilityReproductiveDecision
    * answerOption[+].valueCoding = $nwgmsa#ClinicalUtilityPredictiveTesting
    * item[+]
      * linkId = "NOS/ReasonForDiagnosticTest-designNote"
      * type = #display
      * text = "Identical wording and options to Clinical utility on Rare Disease Genomic Testing Ask At Order Entry (NOS/ClinicalUtility, for the NW GLH DOC4900 paper form) - the same three options, reused here rather than re-defined."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Record of Discussion

  * item[+]
    * type = #choice
    * linkId = "NOS/RODToFollow-gms-rd"
    * code[+] = $nwgmsa#RODToFollow
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * text = "Record of Discussion (ROD) attached, or to follow"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Attached"
    * answerOption[+].valueCoding = $loinc#LA32-8 "To follow"

// Test Directory Clinical Indication & code

  * item[+]
    * type = #choice
    * linkId = "NOS/TestDirectoryClinicalIndication-rd"
    * text = "Test Directory Clinical Indication & code (reason for testing)"
    * required = true
    * answerValueSet = Canonical(GenomicTestCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "NOS/TestDirectoryClinicalIndication-rd-designNote"
      * type = #display
      * text = "Same gap-fill as dWGS Ask At Order Entry's Test Code (dWGS/clinical_indication_test_type_id) - the common core's own Test Code item only fires for Rare and Inherited Disease/Haemoglobinopathy/Cancer Test Categories, none of which cover Whole Genome Sequencing."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Additional panel(s)

  * item[+]
    * type = #string
    * linkId = "NOS/AdditionalPanels"
    * code[+] = $nwgmsa#AdditionalPanels
    * text = "Additional panel(s) (mandatory for R89) - GMS Rare Disease Virtual panels, Genomics England PanelApp"
    * item[+]
      * linkId = "NOS/AdditionalPanels-designNote"
      * type = #display
      * text = "No FHIR mapping or coding system confirmed yet - Genomics England PanelApp panel names/versions are not currently represented anywhere in this IG."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Proband's age at onset of clinical features

  * item[+]
    * type = #decimal
    * linkId = "NOS/ProbandAgeAtOnset"
    * code[+] = $nwgmsa#ProbandAgeAtOnset
    * text = "Proband's age at onset of clinical features"
    * definition = "http://hl7.org/fhir/StructureDefinition/Condition#Condition.onsetAge"
    * item[+]
      * linkId = "NOS/ProbandAgeAtOnset-designNote"
      * type = #display
      * text = "Distinct from the common core's Age at collection (ageAtCollection) item, which is the patient's age when the specimen was taken, not when clinical features first appeared."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// State if specific rare disease is suspected or confirmed

  * item[+]
    * type = #string
    * linkId = "NOS/SpecificRareDiseaseSuspected"
    * code[+] = $nwgmsa#SpecificRareDiseaseSuspected
    * text = "State if specific rare disease is suspected or confirmed"
    * item[+]
      * linkId = "NOS/SpecificRareDiseaseSuspected-designNote"
      * type = #display
      * text = "Free-text complement to the common core's own coded CITT code (Specific disease suspected/reason for testing, LN/51967-8, ServiceRequest.reasonCode) - not a replacement for it."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Life status

  * item[+]
    * type = #choice
    * linkId = "NOS/LifeStatus"
    * text = "Life status"
    * answerOption[+].valueCoding = $sct#438949009 "Alive"
    * answerOption[+].valueCoding = $sct#419099009 "Deceased"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.deceasedBoolean"

// Family members to be tested

  * item[+]
    * type = #reference
    * linkId = "NOS/FamilyMemberToBeTested"
    * text = "Family member to be tested (name, DOB, sex, NHS number/postcode, ethnicity, life status, relationship to proband, sample type)"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"
    * item[+]
      * linkId = "NOS/FamilyMemberToBeTested-designNote"
      * type = #display
      * text = """
      Same ServiceRequest.supportingInfo -> RelatedPerson pattern as Genetic
      Clinical Referral - Consultand (RelatedPerson), but repeating inline on
      this Questionnaire rather than via a separate derivedFrom/extends
      Questionnaire per relative - this form's own table asks for every
      family member's fields (name, DOB, sex, NHS number or postcode,
      ethnicity, life status, relationship, sample type) directly, all in
      one row. Not required for proband-only referrals.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Samples being sent to GMS DNA extraction lab (optional collection section)

  * item[+]
    * type = #group
    * linkId = "GMSSpecimen"
    * text = "Samples being sent to GMS DNA extraction lab (only if also using this form for sample collection)"
    * item[+]
      * linkId = "GMSSpecimen-designNote"
      * type = #display
      * text = "Sample ID, Collection date/time, Sample volume and Comments here map directly onto the common core's own Specimen group (Specimen ID Number, Specimen Collection Date, Specimen Volume) - not re-declared as new items."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// HPO Terms (page 2)

  * item[+]
    * type = #group
    * linkId = "HPOTerms"
    * text = "HPO (Human Phenotype Ontology) Terms"
    * required = true

    * item[+]
      * linkId = "HPOTerms-designNote"
      * type = #display
      * text = """
      Mandatory - at least one HPO term is required, and WGS analysis and
      interpretation cannot commence without them. No confirmed FHIR
      CodeSystem binding exists in this IG for HPO (https://hpo.jax.org) yet
      - DiagnosticImplication.fsh's own predicted-phenotype component
      mentions HPO only as one of several acceptable free-text-bound
      terminologies, not a formal binding. Modelled below as free text
      pending that decision.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "NOS/HPOTerm"
      * code[+] = $nwgmsa#HPOTerm
      * text = "HPO Term"
      * required = true
      * repeats = true
      * definition = "http://hl7.org/fhir/StructureDefinition/Condition#Condition.code"

    * item[+]
      * type = #choice
      * linkId = "NOS/HPOTermStatus"
      * text = "Present / Absent / Unknown"
      * required = true
      * repeats = true
      * answerOption[+].valueCoding = $loinc#LA33-6 "Present"
      * answerOption[+].valueCoding = $loinc#LA32-8 "Absent"
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
      * definition = "http://hl7.org/fhir/StructureDefinition/Condition#Condition.verificationStatus"

// Main contact (if different from responsible clinician/consultant)

  * item[+]
    * type = #group
    * linkId = "MainContact"
    * code[+] = $nwgmsa#MainContact
    * text = "Main contact (if different from responsible clinician/consultant)"
    * item[+]
      * linkId = "MainContact-designNote"
      * type = #display
      * text = "Responsible clinician/consultant maps directly onto the common core's own Healthcare Professional group and is not re-declared here. Main Contact is a genuinely additional, distinct person (used when the requester of a report copy isn't the responsible clinician) - see Genomic Test Order - Common Fields We May Have Missed (Copy Report To) for the same gap identified independently from the NW GLH paper forms."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactName"
      * text = "Name"
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactDepartmentAddress"
      * text = "Department address"
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactPhone"
      * text = "Phone"
    * item[+]
      * type = #string
      * linkId = "NOS/MainContactEmail"
      * text = "Email"
