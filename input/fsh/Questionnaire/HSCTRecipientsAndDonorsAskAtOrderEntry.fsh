Instance: HSCTRecipientsAndDonorsAskAtOrderEntry

InstanceOf: NWQuestionnaire
Title: "H&I Haematopoietic Stem Cell Transplantation (Recipients & Donors) Ask At Order Entry"
Description: """
**Ask At Order Entry Questions** for NHS Blood and Transplant's (NHSBT) national
**H&I Haematopoietic Stem Cell Transplantation (Recipients & Donors)** request form
(`FRM1010`, form "3C" in NHSBT's own numbering) - see [NHSBT's published
form](https://nhsbtdbe.blob.core.windows.net/umbraco-assets-corp/31364/3c-haematopoietic-stem-cell-transplantation-recipients-donors.pdf)
and [Histocompatibility and
Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions).

Unlike the sibling [HLA Tests -
Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) and [Chimerism
Testing Blood (PB)](Questionnaire-ChimerismTestingAskAtOrderEntry.html) Ask At Order
Entry Questionnaires - both extracted from a live Hive/Histotrac `ORM^O01` order -
this Questionnaire is modelled directly from NHSBT's own **paper request form**, since
no live system message for it has been sourced. It is **not** `derivedFrom`/`extends`
[Genomic Test Order](Questionnaire-GenomicTestOrder.html): this form is submitted
directly to NHSBT (a national body, not NW GLH/MFT), so its own Patient/Requester
fields are restored here rather than assumed available from the common core order
form - the same reason [HRD and Tumour
BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html) restores its own Patient/
Healthcare Professional groups.

**A separate form must be completed for each individual** - the same physical form is
used both for the patient being transplanted and for each family member/potential
donor being tested, distinguished only by which "Complete for..." section is filled
in. This is modelled below as a `Role` choice with `enableWhen`-conditioned items,
since FHIR Questionnaire has no native "delete as applicable" concept.

The **HLA Typing**, **Chimerism Analysis** and **HLA Specific Antibody Testing**
checkboxes on this form overlap with (but are not identical to) the test-selection
lists already modelled as `Patient Test(s)` on the sibling HLA/Chimerism
Questionnaires above - this form uses NHSBT's own coarser Class I/Class I+II and
Total/Lineage-specific categories rather than Hive's finer-grained checklist, so they
are modelled here as their own items rather than reusing those `answerOption` lists.

**No NHSBT-published FHIR/LOINC/SNOMED binding was found** for any of this form's own
fields (Role, CMV Status, Time to transplant, HLA Typing scope, Chimerism Analysis
type) - all coded locally against the `NWGMSA` CodeSystem, the same approach taken for
the sibling H&I Questionnaires above. Field mappings below are this IG's own
best-effort candidates, not confirmed against a live order message.
"""
Usage:  #definition

* title = "H&I Haematopoietic Stem Cell Transplantation (Recipients & Donors) Ask At Order Entry"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HSCTRecipientsAndDonorsAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Patient/Donor details - the form's own "Patient/Donor Details (delete as
// applicable)" box. Whichever individual this specific form instance is
// about (patient or family member/potential donor) - see Role below.
// ---------------------------------------------------------------------------

* item[+]
  * linkId = "PatientOrDonor"
  * text = "Patient/Donor details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient/Donor	Forename

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * text = "Forename"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"

// Patient/Donor	Surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * text = "Surname"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"

// Patient/Donor	DOB (DD/MM/YY)

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * text = "DOB (DD/MM/YY)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"

// Patient/Donor	Sex

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Sex"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient/Donor	NHS/CHI number

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS/CHI number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"

// Patient/Donor	Hospital number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

// Patient/Donor	Ethnicity

  * item[+]
    * type = #string
    * linkId = "NOS/Ethnicity"
    * text = "Ethnicity"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.extension:ethnicCategory"

// ---------------------------------------------------------------------------
// Requester details
// ---------------------------------------------------------------------------

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Requester details"

// Healthcare professional	Name of Requester

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "Name of Requester"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Name of Consultant

  * item[+]
    * type = #string
    * linkId = "NOS/ConsultantName"
    * text = "Name of Consultant"
    * item[+]
      * linkId = "NOS/ConsultantName-designNote"
      * type = #display
      * text = "No clean FHIR field identified that's distinct from Name of Requester above, since PractitionerRole only carries one practitioner - candidate second PractitionerRole if the requester and responsible consultant need to be distinguished."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Healthcare professional	Department

  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * text = "Department"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"

// Healthcare professional	Hospital Name, Full Address and ODS code

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * text = "Hospital Name, Full Address and ODS code"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"

// Healthcare professional	Contact No.

  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * text = "Contact No."
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Purchase Order No.

  * item[+]
    * type = #string
    * linkId = "NOS/PurchaseOrderNumber"
    * text = "Purchase Order No. (if applicable)"

// ---------------------------------------------------------------------------
// Ask At Order Entry Questions
// ---------------------------------------------------------------------------

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

// Role - which "Complete for..." section this form instance is

  * item[+]
    * type = #choice
    * linkId = "HSCT/role"
    * text = "This form is for"
    * required = true
    * answerOption[+].valueCoding = $nwgmsa#Patient "Patient"
    * answerOption[+].valueCoding = $nwgmsa#FamilyMemberPotentialDonor "Family Member / Potential Donor"
    * item[+]
      * linkId = "HSCT/role-designNote"
      * type = #display
      * text = """
      The form itself is not a `Role` field - it is inferred from which of the form's
      two boxed sections ("Complete for Patient only" vs "Complete for Family Member /
      Potential Donor") is filled in. Modelled explicitly here as a single choice so the
      conditional items below can be driven by `enableWhen`, since a "separate form must
      be completed for each individual" per the form's own instruction.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for Patient only: CMV Status

  * item[+]
    * type = #choice
    * linkId = "HSCT/cmv_status"
    * text = "CMV Status"
    * answerOption[+].valueCoding = $nwgmsa#CMVPositive "Positive"
    * answerOption[+].valueCoding = $nwgmsa#CMVNegative "Negative"
    * answerOption[+].valueCoding = $nwgmsa#CMVDontKnow "Don't know"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient
    * item[+]
      * linkId = "HSCT/cmv_status-designNote"
      * type = #display
      * text = "Carried as an Observation referenced from ServiceRequest.supportingInfo, coded locally against `NWGMSA` since NHSBT does not publish a binding for this field's own answer list (a 3-value Positive/Negative/Don't know list, distinct from a plain boolean). LOINC has CMV serology panels (e.g. IgG antibody presence) that are candidate `code` bindings for the Observation itself, not yet confirmed against a live message."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for Patient only: CMV Status Date tested

  * item[+]
    * type = #date
    * linkId = "HSCT/cmv_status_date"
    * text = "CMV Status: Date tested"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient

// Complete for Patient only: Time to transplant

  * item[+]
    * type = #string
    * linkId = "HSCT/time_to_transplant"
    * text = "Time to transplant"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient
    * item[+]
      * linkId = "HSCT/time_to_transplant-designNote"
      * type = #display
      * text = "Free text on the form (no defined unit/format) - modelled as a plain string rather than a Quantity/duration."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for Patient only: The total number of siblings available to be tested

  * item[+]
    * type = #integer
    * linkId = "HSCT/sibling_count"
    * text = "The total number of siblings available to be tested"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient

// Complete for Family Member/Potential Donor only: Relationship to patient

  * item[+]
    * type = #string
    * linkId = "HSCT/relationship_to_patient"
    * text = "Relationship to patient"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor
    * item[+]
      * linkId = "HSCT/relationship_to_patient-designNote"
      * type = #display
      * text = "Free text on the form (e.g. Sibling, Parent) - the FHIR v3 RoleCode family-member value set (http://terminology.hl7.org/ValueSet/v3-FamilyMember) is a candidate coded binding, not yet confirmed against a live message."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for Family Member/Potential Donor only: Patient's Name/DOB/NHS No/Hospital No

  * item[+]
    * type = #string
    * linkId = "HSCT/linked_patient_name"
    * text = "Patient's Name"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient.display"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor

  * item[+]
    * type = #date
    * linkId = "HSCT/linked_patient_dob"
    * text = "Patient's DOB"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor

  * item[+]
    * type = #string
    * linkId = "HSCT/linked_patient_nhs_number"
    * text = "Patient's NHS No."
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient.identifier"
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor
    * item[+]
      * linkId = "HSCT/linked_patient_nhs_number-designNote"
      * type = #display
      * text = "Links this Family Member/Potential Donor's own RelatedPerson resource back to the actual Patient this form is testing in relation to - the same NHS Number reused, not re-declared as a separate Patient."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "HSCT/linked_patient_hospital_number"
    * text = "Patient's Hospital No."
    * enableWhen[+]
      * question = "HSCT/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor

// Diagnosis / Treatment / Test Reason / Relevant Clinical Information

  * item[+]
    * type = #text
    * linkId = "NOS/ClinicalInformation"
    * text = "Diagnosis / Treatment / Test Reason / Relevant Clinical Information"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"

// HLA Typing (6ml EDTA)

  * item[+]
    * type = #choice
    * linkId = "HSCT/hla_typing"
    * text = "HLA Typing"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * answerOption[+].valueCoding = $nwgmsa#HLAClassITyping "HLA Class I type"
    * answerOption[+].valueCoding = $nwgmsa#HLAClassIAndIITyping "HLA Class I and Class II type"
    * item[+]
      * linkId = "HSCT/hla_typing-designNote"
      * type = #display
      * text = """
      A coarser scope choice than the 5-value `Patient Test(s)` checklist on [HLA Tests
      - Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html#HistoIG/patient_test)
      (HLA Typing + Antibody Screening, HLA Antibody Screening, HLA Type Recipient, DSA,
      HLA Auto XM) - this form only distinguishes Class I vs Class I+II, not that finer
      test breakdown. Coded locally against `NWGMSA`, same rationale as that item.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Chimerism Analysis

  * item[+]
    * type = #choice
    * linkId = "HSCT/chimerism_analysis"
    * text = "Chimerism Analysis"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismTotalWholeBlood "Total / Whole Blood"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismLineageSpecificHSCT "Lineage specific"
    * item[+]
      * linkId = "HSCT/chimerism_analysis-designNote"
      * type = #display
      * text = """
      A coarser scope choice than the 5-value `Patient Test(s)` checklist on
      [Chimerism Testing Blood
      (PB)](Questionnaire-ChimerismTestingAskAtOrderEntry.html#ChimIG/patient_test)
      (Chimerism Peripheral Blood, CD3, CD15, CD19, Lineage Other) - this form only
      distinguishes Total/Whole Blood vs Lineage specific, not that finer lineage
      breakdown. Coded locally against `NWGMSA`, same rationale as that item.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "HSCT/chimerism_lineage_specify"
    * text = "Lineage specific: please specify"
    * enableWhen[+]
      * question = "HSCT/chimerism_analysis"
      * operator = #=
      * answerCoding = $nwgmsa#ChimerismLineageSpecificHSCT

// HLA Specific Antibody Testing

  * item[+]
    * type = #boolean
    * linkId = "HSCT/hla_specific_antibody_testing"
    * text = "HLA specific antibody testing (6ml clotted (serum))"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"

// Volunteer Donor Search

  * item[+]
    * type = #boolean
    * linkId = "HSCT/volunteer_donor_search"
    * text = "Do you require a volunteer donor search if no family match?"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "HSCT/volunteer_donor_search-designNote"
      * type = #display
      * text = "Triggers a separate national volunteer stem cell donor registry search - out of scope for this IG's own data model, captured here as the order-entry request flag only."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
