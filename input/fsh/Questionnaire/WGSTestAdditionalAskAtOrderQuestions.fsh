Instance: WGSTestAdditionalAskAtOrderQuestions
InstanceOf: NWQuestionnaire
Title: "WGS Test Additional Ask At Order Entry Questions"
Description: """
**Test Specific Additional Ask At Order Entry Questions** for Whole Genome
Sequencing (WGS) orders - used *alongside* the [common core order
form](Questionnaire-GenomicTestOrder.html) **and** [Ask At Order Entry
Questions Common](Questionnaire-GenomicGeneralAskAtOrderEntry.html), rather
than instead of it - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). A WGS
order therefore combines **three** Questionnaires, not the usual two.

Split out of [Genomic General Ask At Order
Entry](Questionnaire-GenomicGeneralAskAtOrderEntry.html): `Related Individual
(NK1)` and `Record of Discussion attached or to follow` are only genuinely
relevant to WGS orders, not every order/test type that Questionnaire covers
(Cancer, WGS and Rare and Inherited Disease generally) - see that
Questionnaire's own Guidance by Order Type section. `WGS participant type`
is new here, surfaced by a real NHS Trust WGS order-entry screen with no
prior equivalent anywhere in this IG.
"""
Usage:  #definition

* title = "WGS Test Additional Ask At Order Entry Questions"
* status = #active
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/WGSTestAdditionalAskAtOrderQuestions"
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

// WGS participant type (Proband or Family Member)

  * item[+]
    * type = #choice
    * linkId = "NOS/WGSParticipantType"
    * text = "WGS participant type?"
    * required = true
    * answerOption[+].valueCoding = $nwgmsa#WGSParticipantTypeProband
    * answerOption[+].valueCoding = $nwgmsa#WGSParticipantTypeFamilyMember
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "NOS/WGSParticipantType-designNote"
      * type = #display
      * text = """
      States which role *this order's own Patient* plays in the family
      study - distinct from, and complementary to, `Related Individual`'s
      own **Role** item below: that item describes the *named relative's*
      role (Consultand or Proband) relative to this order's Patient, not a
      direct statement about the Patient's own role. Also distinct from
      [WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s
      own `NOS/WGSPathway` item, which conflates this same Proband/Family
      Member distinction with the WGS pathway (Rare Disease vs Cancer) into
      a single four-value field for that specific local paper form - this
      item is deliberately just the participant-type half of that, for use
      alongside the generic order path. Surfaced by a real NHS Trust WGS
      order-entry screen as a required field, with no prior equivalent
      anywhere in this IG.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Record of discussion attached or to follow

  * item[+]
    * type = #choice
    * linkId = "NOS/RODToFollow"
    * code[+] = $nwgmsa#RODToFollow
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * text = "ROD attached or to follow"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * item[+]
      * linkId = "NOS/RODToFollow-designNote"
      * type = #display
      * text = """
      Moved here from [Genomic General Ask At Order
      Entry](Questionnaire-GenomicGeneralAskAtOrderEntry.html): a real NHS
      Trust WGS order-entry screen requires this specifically "if requesting
      whole genome sequencing or rapid whole genome sequencing (R14)",
      confirming it as a WGS-specific requirement in practice rather than a
      generic one.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Related Individual (NK1) - Consultand or Proband

  * item[+]
    * type = #group
    * linkId = "NOS/RelatedIndividual"
    * text = "Related Individual (NK1)"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson"
    * item[+]
      * linkId = "NOS/RelatedIndividual-designNote"
      * type = #display
      * text = """
      Moved here from [Genomic General Ask At Order
      Entry](Questionnaire-GenomicGeneralAskAtOrderEntry.html), where it was
      originally generalised from Genetic Clinical Referral - Consultand
      (RelatedPerson): the same NK1-shaped RelatedPerson group, but not
      always a consultand. Role below states which - a **Consultand** is a
      relative referenced from this order's own Patient (who is the
      proband), the usual case; a **Proband** is the opposite direction -
      used when this order's own Patient is actually a family member (e.g.
      WGS Local Test Order's Family Member pathway), and this group instead
      names the original proband the family member is being tested
      alongside. Repeats, since an order can name more than one related
      individual (e.g. several consultands, or occasionally both a proband
      reference and a consultand on the same order).
      """
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

// Related Individual	Relationship to the order's own Patient

    * item[+]
      * type = #choice
      * linkId = "HL7/NK1-3"
      * text = "Relationship"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
      * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType"
      * item[+]
        * linkId = "HL7/NK1-3-designNote"
        * type = #display
        * text = "Real examples in this IG currently code this with HL7 v3 RoleCode (e.g. MTH \"mother\") rather than UKCore-PersonRelationshipType - see RelatedPerson-MotherCerseiLondon. When Role = Proband, this is the family member's relationship to the proband (e.g. the family member is the proband's MTH \"mother\"), the same direction as when Role = Consultand."
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

// Related Individual	Link back to this order's own Patient

    * item[+]
      * type = #reference
      * linkId = "NOS/RelatedIndividual-patient"
      * text = "This order's own Patient"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient"
      * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"
      * item[+]
        * linkId = "NOS/RelatedIndividual-patient-designNote"
        * type = #display
        * text = "The same Patient as this order's own common-core Patient group. When Role = Consultand, that Patient is the proband and this group names a relative of theirs. When Role = Proband, that Patient is instead a family member whose specimen this particular order carries, and this group names the original proband instead - see WGS Local Test Order Ask At Order Entry's Family Member pathway."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
