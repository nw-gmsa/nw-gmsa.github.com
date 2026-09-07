Instance: OrganTransplantPatientsAndDonorsAskAtOrderEntry

InstanceOf: NWQuestionnaire
Title: "H&I Organ Transplant (Patients and Donors) Ask At Order Entry"
Description: """
**Ask At Order Entry Questions** for NHS Blood and Transplant's (NHSBT) national
**H&I Organ Transplant (Patients and Donors)** request form (`FRM1008`, form "3B" in
NHSBT's own numbering) - see [NHSBT's published
form](https://nhsbtdbe.blob.core.windows.net/umbraco-assets-corp/31363/3b-organ-transplant-patients-and-donors.pdf)
and [Histocompatibility and
Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions).

This is the national form the existing [HLA Tests -
Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) Ask At Order Entry
Questionnaire's own design notes already identify as `FRM1008` - but that Questionnaire
was extracted from Hive/Histotrac's own order-entry UI, which offers a narrower
Patient Type (Stem cell/Renal/Thoracic) and Organ (Kidney/Pancreas/Islets/Simultaneous
Pancreas-Kidney/Simultaneous Islet-Kidney) picker than this form's own **Category**
(Patient - Renal/Patient - Non-Renal/Donor) and **Request details** checkboxes. As
with [HSCT Recipients and
Donors](Questionnaire-HSCTRecipientsAndDonorsAskAtOrderEntry.html), this Questionnaire
is modelled directly from NHSBT's own **paper request form** rather than the live Hive
UI, and is **not** `derivedFrom`/`extends` [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) for the same reason - this form is
submitted directly to NHSBT, so its own Patient/Requester fields are restored here.

**A separate form must be completed for each individual** - the same physical form is
used both for the patient and for each family member/potential donor being tested,
distinguished by which "Complete for..." section is filled in. Modelled below as a
`Role` choice with `enableWhen`-conditioned items, the same pattern used on [HSCT
Recipients and Donors](Questionnaire-HSCTRecipientsAndDonorsAskAtOrderEntry.html) (and
reusing its `Patient`/`Family Member - Potential Donor` `NWGMSA` codes).

The form's **Category** section (a further three-way choice - Patient - Renal,
Patient - Non-Renal, or Donor, each with its own sub-checklist) is a related but
separate concept from `Role` above: a person whose `Role` is Patient will pick a
Patient - Renal or Patient - Non-Renal Category, while a person whose `Role` is Family
Member/Potential Donor will pick the Donor Category - the form itself does not state
this relationship explicitly, so it is not enforced here with `enableWhen`.

**No NHSBT-published FHIR/LOINC/SNOMED binding was found** for any of this form's own
fields (Category, Request details, Previous transfusion(s)/Pregnancies/Previous
transplant(s)) - all coded locally against the `NWGMSA` CodeSystem, the same approach
taken for the sibling H&I Questionnaires above. Field mappings below are this IG's own
best-effort candidates, not confirmed against a live order message.
"""
Usage:  #definition

* title = "H&I Organ Transplant (Patients and Donors) Ask At Order Entry"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/OrganTransplantPatientsAndDonorsAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Patient/Donor details - the form's own "Patient/Donor Details (delete as
// applicable)" box.
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
    * linkId = "OrganTx/role"
    * text = "This form is for"
    * required = true
    * answerOption[+].valueCoding = $nwgmsa#Patient "Patient"
    * answerOption[+].valueCoding = $nwgmsa#FamilyMemberPotentialDonor "Family Member / Potential Donor"
    * item[+]
      * linkId = "OrganTx/role-designNote"
      * type = #display
      * text = """
      The same pattern as `HSCT/role` on [HSCT Recipients and
      Donors](Questionnaire-HSCTRecipientsAndDonorsAskAtOrderEntry.html#HSCT/role) -
      inferred from which of the form's two boxed sections ("Complete for new patients
      only" vs "Complete for Family Member / Potential Donor") is filled in, not itself
      a field on the form. Reuses the same `NWGMSA` codes as that Questionnaire.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for new patients only: Blood group

  * item[+]
    * type = #string
    * linkId = "OrganTx/blood_group"
    * text = "Blood group (if known)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient
    * item[+]
      * linkId = "OrganTx/blood_group-designNote"
      * type = #display
      * text = "Free text on the form. LOINC has an ABO group typing panel that is a candidate binding for the resulting Observation, not yet confirmed against a live message."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for new patients only: Previous transfusion(s)?

  * item[+]
    * type = #boolean
    * linkId = "OrganTx/previous_transfusions"
    * text = "Previous transfusion(s)?"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient

// Complete for new patients only: Pregnancies?

  * item[+]
    * type = #boolean
    * linkId = "OrganTx/pregnancies"
    * text = "Pregnancies?"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient

// Complete for new patients only: Previous transplant(s)?

  * item[+]
    * type = #boolean
    * linkId = "OrganTx/previous_transplants"
    * text = "Previous transplant(s)?"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#Patient

// Complete for Family Member/Potential Donor: Relationship to patient

  * item[+]
    * type = #string
    * linkId = "OrganTx/relationship_to_patient"
    * text = "Relationship to patient"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor
    * item[+]
      * linkId = "OrganTx/relationship_to_patient-designNote"
      * type = #display
      * text = "Free text on the form. The FHIR v3 RoleCode family-member value set (http://terminology.hl7.org/ValueSet/v3-FamilyMember) is a candidate coded binding, not yet confirmed against a live message."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Complete for Family Member/Potential Donor: Patient's Name/DOB/NHS No/Hospital No

  * item[+]
    * type = #string
    * linkId = "OrganTx/linked_patient_name"
    * text = "Patient's Name"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient.display"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor

  * item[+]
    * type = #date
    * linkId = "OrganTx/linked_patient_dob"
    * text = "Patient's DOB"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor

  * item[+]
    * type = #string
    * linkId = "OrganTx/linked_patient_nhs_number"
    * text = "Patient's NHS No."
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient.identifier"
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor
    * item[+]
      * linkId = "OrganTx/linked_patient_nhs_number-designNote"
      * type = #display
      * text = "Links this Family Member/Potential Donor's own RelatedPerson resource back to the actual Patient this form is testing in relation to - the same NHS Number reused, not re-declared as a separate Patient. The same pattern as HSCT Recipients and Donors."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "OrganTx/linked_patient_hospital_number"
    * text = "Patient's Hospital No."
    * enableWhen[+]
      * question = "OrganTx/role"
      * operator = #=
      * answerCoding = $nwgmsa#FamilyMemberPotentialDonor

// Relevant Clinical Information

  * item[+]
    * type = #text
    * linkId = "NOS/ClinicalInformation"
    * text = "Relevant Clinical Information"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"

// Category - Patient (Renal) / Patient (Non-Renal) / Donor

  * item[+]
    * type = #choice
    * linkId = "OrganTx/category"
    * text = "Category"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#CategoryPatientRenal "Patient - Renal"
    * answerOption[+].valueCoding = $nwgmsa#CategoryPatientNonRenal "Patient - Non-Renal"
    * answerOption[+].valueCoding = $nwgmsa#CategoryDonor "Donor"
    * item[+]
      * linkId = "OrganTx/category-designNote"
      * type = #display
      * text = """
      Carried as an Observation referenced from ServiceRequest.supportingInfo - the
      same Ask At Order Entry pattern as `HistoIG/patient_type` on [HLA Tests -
      Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html#HistoIG/patient_type),
      but this form's own 3-value Category list (Patient - Renal/Patient -
      Non-Renal/Donor), not that Questionnaire's Hive-specific Stem cell/Renal/Thoracic
      list. A person whose `Role` above is Patient would be expected to pick Patient -
      Renal or Patient - Non-Renal here, and a Family Member/Potential Donor would pick
      Donor - not enforced with `enableWhen` since the form itself does not state this
      relationship explicitly.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "OrganTx/category_renal_status"
    * text = "Patient - Renal: status"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#RenalPreDialysis "Pre-dialysis"
    * answerOption[+].valueCoding = $nwgmsa#RenalCAPD "CAPD"
    * answerOption[+].valueCoding = $nwgmsa#RenalHaemodialysis "Haemodialysis"
    * answerOption[+].valueCoding = $nwgmsa#RenalPostTransplant "Post transplant"
    * enableWhen[+]
      * question = "OrganTx/category"
      * operator = #=
      * answerCoding = $nwgmsa#CategoryPatientRenal

  * item[+]
    * type = #choice
    * linkId = "OrganTx/category_non_renal_type"
    * text = "Patient - Non-Renal: type"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#NonRenalCardiothoracic "Cardiothoracic"
    * answerOption[+].valueCoding = $nwgmsa#NonRenalLiverSmallBowel "Liver/small bowel"
    * answerOption[+].valueCoding = $nwgmsa#NonRenalCornea "Cornea"
    * answerOption[+].valueCoding = $nwgmsa#NonRenalOther "Other"
    * enableWhen[+]
      * question = "OrganTx/category"
      * operator = #=
      * answerCoding = $nwgmsa#CategoryPatientNonRenal

  * item[+]
    * type = #string
    * linkId = "OrganTx/category_non_renal_other_specify"
    * text = "Non-Renal Other: please state"
    * enableWhen[+]
      * question = "OrganTx/category_non_renal_type"
      * operator = #=
      * answerCoding = $nwgmsa#NonRenalOther

  * item[+]
    * type = #choice
    * linkId = "OrganTx/category_donor_status"
    * text = "Donor: status"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * repeats = true
    * answerOption[+].valueCoding = $nwgmsa#DonorPreTransplant "Pre transplant"
    * answerOption[+].valueCoding = $nwgmsa#DonorPostTransplant "Post transplant"
    * answerOption[+].valueCoding = $nwgmsa#DonorLiveDonor "Live donor"
    * answerOption[+].valueCoding = $nwgmsa#DonorAltruisticDonor "Altruistic donor"
    * enableWhen[+]
      * question = "OrganTx/category"
      * operator = #=
      * answerCoding = $nwgmsa#CategoryDonor
    * item[+]
      * linkId = "OrganTx/category_donor_status-designNote"
      * type = #display
      * text = "Modelled as repeats = true - the form's own layout shows Pre/Post transplant/Live donor grouped together on one row, suggesting more than one may apply (e.g. a Live donor who is Pre transplant), unlike the single-select Renal/Non-Renal sub-lists."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Request details - test checkboxes

  * item[+]
    * type = #choice
    * linkId = "OrganTx/request_details"
    * text = "Request details"
    * repeats = true
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * answerOption[+].valueCoding = $nwgmsa#OrganHLAType "HLA type (6ml EDTA)"
    * answerOption[+].valueCoding = $nwgmsa#OrganHLASpecificAntibodies "HLA specific antibodies (6ml clotted)"
    * answerOption[+].valueCoding = $nwgmsa#OrganLiveDonorCrossmatch "Live donor crossmatch"
    * answerOption[+].valueCoding = $nwgmsa#OrganAutoCrossmatch "Auto crossmatch"
    * item[+]
      * linkId = "OrganTx/request_details-designNote"
      * type = #display
      * text = """
      This form's own 4-value test checklist (`repeats = true`, since more than one may
      be ticked per order) - a different, coarser list from [HLA Tests -
      Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html#HistoIG/patient_test)'s
      5-value Hive checklist (HLA Typing + Antibody Screening, HLA Antibody Screening,
      HLA Type Recipient, DSA, HLA Auto XM), though conceptually related (Live donor
      crossmatch/Auto crossmatch here are close to DSA/HLA Auto XM there). Coded locally
      against `NWGMSA` rather than attempting a direct 1:1 mapping between the two lists,
      since neither this IG nor NHSBT publishes one.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
