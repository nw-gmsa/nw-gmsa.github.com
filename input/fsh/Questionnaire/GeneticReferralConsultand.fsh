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
  * linkId = "Consultand"
  * text = "Consultand (NK1)"
  * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson"

// Consultand	Name

  * item[+]
    * type = #string
    * linkId = "HL7/NK1-2"
    * text = "Consultand Name"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.name"

// Consultand	Relationship to proband

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
      * text = "Real examples in this IG currently code this with HL7 v3 RoleCode (e.g. MTH \"mother\") rather than UKCore-PersonRelationshipType - see RelatedPerson-MotherCerseiLondon."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Consultand	Administrative sex

  * item[+]
    * type = #choice
    * linkId = "HL7/NK1.15"
    * text = "Administrative Sex"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.gender"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"

// Consultand	Date of birth

  * item[+]
    * type = #date
    * linkId = "HL7/NK1-16"
    * text = "Date of Birth"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.birthDate"

// Consultand	Own NHS Number, if known/already a patient

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS Number (if known)"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:nhsNumber"

// Consultand	Own Hospital/Medical Record Number, if known/already a patient

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number), if known"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:MedicalRecordNumber"

// Consultand	Link back to proband

  * item[+]
    * type = #reference
    * linkId = "Consultand/patient"
    * text = "Proband (the referral's own Patient)"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"
    * item[+]
      * linkId = "Consultand/patient-designNote"
      * type = #display
      * text = "The same Patient as Genetic Clinical Referral's own Patient group - this Questionnaire always names a consultand relative to that proband, never a standalone individual."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
