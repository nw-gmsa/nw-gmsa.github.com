Instance: GMSWGSRareDisease
InstanceOf: NWQuestionnaire
Title: "GMS WGS Rare Disease"
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

* title = "GMS WGS Rare Disease"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GMSWGSRareDisease"
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
    * type = #choice
    * linkId = "NOS/FamilyTestType"
    * code[+] = $nwgmsa#FamilyTestType
    * text = "Family test"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#FamilyTestSingleton
    * answerOption[+].valueCoding = $nwgmsa#FamilyTestTrio
    * answerOption[+].valueCoding = $nwgmsa#FamilyTestOther
    * item[+]
      * linkId = "NOS/FamilyTestType-designNote"
      * type = #display
      * text = "Same underlying concept as dWGS's Family Structure (NOS/FamilyStructure) on dWGS Ask At Order Entry, but with different answer options - the form's own PDF radio buttons offer Singleton/Trio/Other (with a number), not Duo, since a Duo is presumably covered by 'Other'."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * type = #integer
      * linkId = "NOS/FamilyTestOtherNumber"
      * text = "Number of family members being tested (if 'Other')"
      * enableWhen[+]
        * question = "NOS/FamilyTestType"
        * operator = #=
        * answerCoding = $nwgmsa#FamilyTestOther

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
    * type = #group
    * linkId = "FamilyMembers"
    * text = "Family member(s) to be tested"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * item[+]
      * linkId = "FamilyMembers-designNote"
      * type = #display
      * text = """
      The source PDF hard-codes exactly two family-member slots (form
      fields FM1_* and FM2_*, each with their own forename/surname/DOB/NHS
      number/gender/deceased/status/ethnicity/relationship_to_proband
      fields, plus a matching FM1_*/FM2_* sample block further down the
      form) - modelled here as a proper repeating group instead, so it
      isn't artificially capped at two. Each repetition carries the same
      ServiceRequest.supportingInfo -> RelatedPerson pattern as Genetic
      Clinical Referral - Consultand (RelatedPerson), but inline on this
      Questionnaire rather than via a separate derivedFrom/extends
      Questionnaire per relative. Not required for proband-only referrals.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #reference
      * linkId = "NOS/FamilyMemberReference"
      * text = "Family member"
      * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
      * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"

    * item[+]
      * type = #string
      * linkId = "NOS/FamilyMemberForename"
      * text = "Forename"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.name.given"

    * item[+]
      * type = #string
      * linkId = "NOS/FamilyMemberSurname"
      * text = "Surname"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.name.family"

    * item[+]
      * type = #date
      * linkId = "NOS/FamilyMemberDOB"
      * text = "Date of birth"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.birthDate"

    * item[+]
      * type = #string
      * linkId = "NOS/FamilyMemberNHSNumber"
      * text = "NHS number (or postcode, if not known)"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier"

    * item[+]
      * type = #choice
      * linkId = "NOS/FamilyMemberGender"
      * text = "Sex"
      * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.gender"

    * item[+]
      * type = #choice
      * linkId = "NOS/FamilyMemberLifeStatus"
      * text = "Life status"
      * answerOption[+].valueCoding = $sct#438949009 "Alive"
      * answerOption[+].valueCoding = $sct#419099009 "Deceased"

    * item[+]
      * type = #string
      * linkId = "NOS/FamilyMemberStatus"
      * code[+] = $nwgmsa#FamilyMemberStatus
      * text = "Status"
      * item[+]
        * linkId = "NOS/FamilyMemberStatus-designNote"
        * type = #display
        * text = "The source PDF has a separate 'status' dropdown alongside 'deceased' for each family member (FM1_status/FM2_status), distinct from life status - its intended meaning (e.g. affected/unaffected/carrier) isn't stated on the form's own visible labels, so it is modelled here as free text pending confirmation."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "NOS/FamilyMemberEthnicity"
      * text = "Ethnicity"
      * answerValueSet = Canonical(Ethnicity)

    * item[+]
      * type = #choice
      * linkId = "NOS/FamilyMemberRelationship"
      * text = "Relationship to proband"
      * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"

// Sample (per family member, only if also using this form for sample collection)

    * item[+]
      * type = #group
      * linkId = "FamilyMembers/Specimen"
      * text = "Sample (this family member) - only if also using this form for sample collection"
      * item[+]
        * linkId = "FamilyMembers/Specimen-designNote"
        * type = #display
        * text = "Nested within each Family member repetition, mirroring the source PDF's own parallel FM1_*/FM2_* sample fields alongside its FM1_*/FM2_* demographic fields. Sample type, Sample volume and Comments follow the same shape as Genomic Test Order's own Specimen group."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
      * item[+]
        * type = #string
        * linkId = "NOS/FamilyMemberSpecimenLocalId"
        * text = "Local ID / barcode"
        * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
      * item[+]
        * type = #dateTime
        * linkId = "NOS/FamilyMemberSpecimenCollectionDateTime"
        * text = "Collection date / time"
        * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
      * item[+]
        * type = #choice
        * linkId = "NOS/FamilyMemberSpecimenSampleType"
        * text = "Sample type"
        * answerValueSet = Canonical(SpecimenType)
        * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type"
      * item[+]
        * type = #decimal
        * linkId = "NOS/FamilyMemberSpecimenVolume"
        * text = "Sample volume"
        * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.quantity"
      * item[+]
        * type = #string
        * linkId = "NOS/FamilyMemberSpecimenComments"
        * text = "Comments"

// Samples being sent to GMS DNA extraction lab (proband's own sample, optional collection section)

  * item[+]
    * type = #group
    * linkId = "GMSSpecimen"
    * text = "Samples being sent to GMS DNA extraction lab (proband - only if also using this form for sample collection)"
    * item[+]
      * linkId = "GMSSpecimen-designNote"
      * type = #display
      * text = "Sample ID, Collection date/time, Sample volume and Comments here map directly onto the common core's own Specimen group (Specimen ID Number, Specimen Collection Date, Specimen Volume) - not re-declared as new items. Not repeating, since there is exactly one proband - see the nested Sample group under Family Members above for the equivalent per-family-member sample fields, which do repeat."
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
      interpretation cannot commence without them.

      The form's own page 2 offers a "guide, not exhaustive" list of 38
      example terms grouped by specialty (Cardiology, Immunology,
      Ophthalmology, Renal, Developmental, Neurology) - rendered as an
      image on the form itself, not selectable text or coded values.
      GMSWGSGuideHPOTermsVS reproduces that same list, but as real HPO
      codes (http://purl.obolibrary.org/obo/hp.owl, release 20191108),
      confirmed term-by-term against the Genomics England terminology
      server (https://ontoserver.aws.gel.ac/fhir) via CodeSystem/$lookup
      rather than guessed - see GMSWGSGuideHPOTermsToSCT for the SNOMED CT
      mapping built from that same verification pass. Bound below as
      #open-choice, so those 38 terms are offered as quick picks without
      preventing entry of any other HPO term/code not in this guide list.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #open-choice
      * linkId = "NOS/HPOTerm"
      * code[+] = $nwgmsa#HPOTerm
      * text = "HPO Term"
      * required = true
      * repeats = true
      * answerValueSet = Canonical(GMSWGSGuideHPOTermsVS)
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
