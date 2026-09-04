Instance: GeneticReferralConsultand
InstanceOf: NWQuestionnaire
Title: "Genetic Clinical Referral - Consultand (RelatedPerson)"
Description: """
**For analysis purposes only - not an active or planned project.** See
[Genetic Clinical Referral](Questionnaire-GeneticClinicalReferral.html) for
the common core this extends.

Structured detail for a named **consultand** - an at-risk relative of the
proband (the patient on the referral itself) being referred for genetic
counselling and/or cascade testing - see [Genetic
Referrals](GeneticReferrals.html) for the Proband/Consultand distinction.
This represents HL7 v2 `NK1` (Next of Kin/Associated Parties), converted to
FHIR `RelatedPerson`.

This is the same NK1-shaped `RelatedPerson` group as [NW Genomic General
Ask At Order Questions - Related Individual
(NK1)](Questionnaire-GenomicGeneralAskAtOrderEntry.html)
(`NOS/RelatedIndividual`), generalised from this Questionnaire's own
original Consultand-only shape - a **Role** item now states whether this
entry is a **Consultand** (the usual case here) or a **Proband** (the
reverse direction, used when the referral's own Patient is itself a family
member rather than the proband - see [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s `NOS/Proband`
for the same pattern applied to a lab order rather than a referral).

**Scope note:** general family history (who else is affected, the wider
pedigree) remains in the unstructured family letter referenced from [Genetic
Clinical Referral](Questionnaire-GeneticClinicalReferral.html#family-history)
- this Questionnaire only structures the part of that information that
identifies a *named* consultand who is themselves being referred, following
the same shape as an `NK1` segment.
"""
Usage:  #definition

* title = "Genetic Clinical Referral - Consultand (RelatedPerson)"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GeneticReferralConsultand"
* derivedFrom = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GeneticClinicalReferral"
* derivedFrom.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
  * valueCoding = http://hl7.org/fhir/questionnaire-derivationType#extends

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "NOS/RelatedIndividual"
  * text = "Related Individual (NK1)"
  * repeats = true
  * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson"
  * item[+]
    * linkId = "NOS/RelatedIndividual-designNote"
    * type = #display
    * text = "Generalised from this Questionnaire's original Consultand-only shape to match NW Genomic General Ask At Order Questions' own Related Individual (NK1) group - see Role below for what distinguishes a Consultand from a Proband here."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Related Individual	Role (Consultand or Proband)

  * item[+]
    * type = #choice
    * linkId = "NOS/RelatedIndividualRole"
    * code[+] = $nwgmsa#RelatedIndividualRole
    * text = "Role"
    * required = true
    * answerOption[+].valueCoding = $nwgmsa#RoleConsultand
    * answerOption[+].valueCoding = $nwgmsa#RoleProband

// Related Individual	Name

  * item[+]
    * type = #string
    * linkId = "HL7/NK1-2"
    * text = "Name"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.name"

// Related Individual	Relationship to proband

  * item[+]
    * type = #choice
    * linkId = "HL7/NK1-3"
    * text = "Relationship to Proband"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType"
    * item[+]
      * linkId = "HL7/NK1-3-designNote"
      * type = #display
      * text = "Real examples in this IG currently code this with HL7 v3 RoleCode (e.g. MTH \"mother\") rather than UKCore-PersonRelationshipType - see RelatedPerson-MotherCerseiLondon. When Role = Proband, this is still the family member's relationship to the proband (e.g. the family member is the proband's MTH \"mother\"), the same direction as when Role = Consultand."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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

// Related Individual	Own NHS Number, if known/already a patient

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS Number (if known)"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:nhsNumber"

// Related Individual	Own Hospital/Medical Record Number, if known/already a patient

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number), if known"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:MedicalRecordNumber"

// Related Individual	Link back to this referral's own Patient

  * item[+]
    * type = #reference
    * linkId = "NOS/RelatedIndividual-patient"
    * text = "This referral's own Patient"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"
    * item[+]
      * linkId = "NOS/RelatedIndividual-patient-designNote"
      * type = #display
      * text = "The same Patient as Genetic Clinical Referral's own Patient group. When Role = Consultand, that Patient is the proband and this group names a relative of theirs - the usual case for this Questionnaire. When Role = Proband, that Patient is instead a family member, and this group names the original proband - the same reversal WGS Local Test Order's NOS/Proband uses on a lab order."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
