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
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/CysticFibrosisCarrierAskAtOrderEntry"
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
