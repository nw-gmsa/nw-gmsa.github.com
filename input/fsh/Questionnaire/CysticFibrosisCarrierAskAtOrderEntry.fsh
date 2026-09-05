Instance: CysticFibrosisCarrierAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Cystic Fibrosis Carrier Testing Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the NW GLH paper **Request for Genetic
Cystic Fibrosis (CF) Carrier Testing (CFTR Gene)** form, used alongside the
[common core order form](Questionnaire-GenomicTestOrder.html) - see [Order
Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).
Unlike the other paper forms, this one is specifically for use by **General
Practitioners** rather than hospital clinicians, and structures one of two
mutually exclusive referral scenarios: a family history of CF, or a partner
who is affected/a carrier.
"""
Usage:  #definition

* title = "Cystic Fibrosis Carrier Testing Ask At Order Entry Questions"
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/CysticFibrosisCarrierAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Order metadata - the Patient Details/Referring Clinician fields the real
// source DOC4356 form actually asks for, restored here since this
// Questionnaire does not (yet) derivedFrom/extend Genomic Test Order, so
// these are not otherwise available. Only fields confirmed present on this
// specific form - not a copy of Genomic Test Order's own (larger) Patient/
// Healthcare Professional groups. See
// Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms.
// ---------------------------------------------------------------------------

* item[+]
  * linkId = "Patient"
  * text = "Patient Details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient	Surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * text = "Surname"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"

// Patient	Forename

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * text = "Forename"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"

// Patient	DoB

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * text = "DoB"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"

// Patient	NHS No

  * item[+]
    * type = #string
    * linkId = "LN/89061-6-patient"
    * code[+] = $loinc#89061-6
    * text = "NHS No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * item[+]
      * linkId = "LN/89061-6-patient-designNote"
      * type = #display
      * text = "Distinct linkId from NOS/RelatedIndividual's own NHS Number (if known) item below (LN/89061-6) - that one is the relative/partner's, this is this order's own Patient."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Sex

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Sex"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient	Hospital No

  * item[+]
    * type = #string
    * linkId = "LN/76435-7-patient"
    * code[+] = $loinc#76435-7
    * text = "Hospital No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

// Patient	Address

  * item[+]
    * type = #string
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * text = "Address"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.line"

// Patient	Postcode

  * item[+]
    * type = #string
    * linkId = "LN/45401-7"
    * code[+] = $loinc#45401-7
    * text = "Postcode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"

// Patient	Patient's ethnicity/country of origin

  * item[+]
    * type = #string
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnicity/country of origin"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * item[+]
      * linkId = "LN/32624-9-designNote"
      * type = #display
      * text = "Free text on this form ('please be specific, i.e. white British rather than Caucasian') rather than the coded Ethnicity ValueSet used elsewhere in this IG."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Referring Clinician"

// Healthcare professional	GP Name

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "GP Name"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Surgery Address

  * item[+]
    * type = #string
    * linkId = "NOS/DepartmentAddress"
    * text = "Surgery Address"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.display"

// Healthcare professional	Telephone No

  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * text = "Telephone No"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Email

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * text = "Email"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

  * item[+]
    * type = #choice
    * linkId = "NOS/CFReferralScenario"
    * code[+] = $nwgmsa#CFReferralScenario
    * text = "Referral scenario"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#CFReferralFamilyHistory
    * answerOption[+].valueCoding = $nwgmsa#CFReferralPartner
    * item[+]
      * linkId = "NOS/CFReferralScenario-designNote"
      * type = #display
      * text = "Carrier testing cannot be requested for individuals under 16 years of age, as they cannot give informed consent."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "NOS/RelatedIndividual"
    * text = "Relative/Partner (Related Individual, NK1)"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson"
    * item[+]
      * linkId = "NOS/RelatedIndividual-designNote"
      * type = #display
      * text = """
      Same NK1-shaped RelatedPerson group as NW Genomic General Ask At
      Order Questions' own Related Individual (NK1) group
      (NOS/RelatedIndividual), used here under its Consultand role - the
      patient remains this ServiceRequest's own subject throughout,
      whether the Family History or Partner referral scenario applies.
      Status and Variant below are Cystic Fibrosis-specific additions
      nested alongside the shared fields, not part of the general shape.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Related Individual	Role (always Consultand on this form)

    * item[+]
      * type = #choice
      * linkId = "NOS/RelatedIndividualRole"
      * code[+] = $nwgmsa#RelatedIndividualRole
      * text = "Role"
      * required = true
      * answerOption[+].valueCoding = $nwgmsa#RoleConsultand

// Related Individual	Name

    * item[+]
      * type = #string
      * linkId = "HL7/NK1-2"
      * text = "Name"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.name"

// Related Individual	Relationship to patient (relative scenario only)

    * item[+]
      * type = #choice
      * linkId = "HL7/NK1-3"
      * text = "Relationship to patient (relative scenario only)"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
      * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType"

// Related Individual	Administrative sex

    * item[+]
      * type = #choice
      * linkId = "HL7/NK1.15"
      * text = "Administrative Sex"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.gender"
      * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"

// Related Individual	Date of birth

    * item[+]
      * type = #date
      * linkId = "HL7/NK1-16"
      * text = "Date of Birth"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.birthDate"

// Related Individual	NHS Number, if known

    * item[+]
      * type = #string
      * linkId = "LN/89061-6"
      * code[+] = $loinc#89061-6
      * text = "NHS Number (if known)"
      * required = false
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:nhsNumber"

// Related Individual	Hospital/Medical Record Number, if known

    * item[+]
      * type = #string
      * linkId = "LN/76435-7"
      * code[+] = $loinc#76435-7
      * text = "Hospital Number (Medical Record Number), if known"
      * required = false
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:MedicalRecordNumber"

// Related Individual	Link back to this order's own Patient

    * item[+]
      * type = #reference
      * linkId = "NOS/RelatedIndividual-patient"
      * text = "This order's own Patient"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient"
      * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"

// Related Individual	Status of relative/partner (Cystic Fibrosis-specific)

    * item[+]
      * type = #choice
      * linkId = "NOS/RelativeOrPartnerStatus"
      * code[+] = $nwgmsa#RelativeOrPartnerStatus
      * text = "Status of relative/partner"
      * answerOption[+].valueCoding = $nwgmsa#GeneticStatusAffected
      * answerOption[+].valueCoding = $nwgmsa#GeneticStatusCarrier
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Related Individual	Known familial CFTR variant (Cystic Fibrosis-specific)

    * item[+]
      * type = #string
      * linkId = "NOS/RelativeOrPartnerVariant"
      * code[+] = $nwgmsa#RelativeOrPartnerVariant
      * text = "Details of the familial CFTR pathogenic variant, if known"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
