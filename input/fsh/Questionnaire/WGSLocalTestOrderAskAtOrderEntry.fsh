Instance: WGSLocalTestOrderAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "WGS Local Test Order Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the NW GLH paper **Genetic Testing
Request Form - Whole Genome Sequencing (WGS)** form, which accompanies
samples sent directly to a NW GLH site, used alongside the [common core
order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).

**Not to be confused with** [dWGS Sub-Order Manifest](Questionnaire-dWGSSubOrder.html) -
that Questionnaire is the digital manifest for a **distributed WGS
sub-contracted order** between GLHs (see [dWGS](dWGS.html)); this one is the
plain paper form used for a **local** WGS request, and does not by itself
imply any sub-contracting.
"""
Usage:  #definition

* title = "WGS Local Test Order Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/WGSLocalTestOrderAskAtOrderEntry"
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
    * linkId = "NOS/WGSPathway"
    * text = "WGS test type requested"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.category"
    * answerOption[+].valueCoding = $nwgmsa#WGSPathwayRareDiseaseProband
    * answerOption[+].valueCoding = $nwgmsa#WGSPathwayRareDiseaseFamilyMember
    * answerOption[+].valueCoding = $nwgmsa#WGSPathwayCancerTumour
    * answerOption[+].valueCoding = $nwgmsa#WGSPathwayCancerGermline

  * item[+]
    * type = #group
    * linkId = "NOS/Proband"
    * text = "Proband (Family Member pathway only)"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson"
    * enableWhen[+]
      * question = "NOS/WGSPathway"
      * operator = #=
      * answerCoding = $nwgmsa#WGSPathwayRareDiseaseFamilyMember
    * item[+]
      * linkId = "NOS/Proband-designNote"
      * type = #display
      * text = """
      Same NK1-shaped RelatedPerson group as NW Genomic General Ask At
      Order Questions' own Related Individual (NK1) group
      (NOS/RelatedIndividual), used here under its Proband role rather than
      Consultand: the roles are reversed from Genetic Clinical Referral -
      Consultand, where the base ServiceRequest's own Patient is always the
      proband and the relative is the supportingInfo reference. Here, when
      the Family Member pathway is selected, this ServiceRequest's own
      common-core Patient group is completed for the FAMILY MEMBER whose
      specimen this particular order carries - it is this group, not the
      base Patient group, that names the proband. NHS/hospital number (if
      known) are enough to resolve this RelatedPerson to the proband's own,
      already-existing Patient record from their own separate WGS referral,
      without needing to duplicate it as a new Patient.

      This Family Member pathway is effectively a **consultand test**: the
      same real-world scenario as one repetition of GMS WGS Rare Disease's
      own repeating Family Members group (a relative tested alongside a
      proband for interpretation), just modelled the other way round because
      this form produces one order per specimen rather than a single
      composite family submission - see GMS WGS Rare Disease - Practical
      Issues: One Form, Multiple Orders. This Questionnaire may represent a
      ready-made way of resolving that composite-form problem, not just an
      analogy to it: decomposing a GMS WGS Rare Disease Family Members entry
      into an individual order could reuse this Family Member pathway's own
      shape directly - proband referenced back via NOS/Proband, the same way
      each Family Members repetition there references the proband via
      RelatedPerson - rather than needing a new decomposition pattern
      designed from scratch.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Proband	Role (always Proband on this pathway)

    * item[+]
      * type = #choice
      * linkId = "NOS/RelatedIndividualRole"
      * code[+] = $nwgmsa#RelatedIndividualRole
      * text = "Role"
      * required = true
      * answerOption[+].valueCoding = $nwgmsa#RoleProband

// Proband	Name

    * item[+]
      * type = #string
      * linkId = "HL7/NK1-2"
      * text = "Name"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.name"

// Proband	Relationship to the family member (this order's own Patient)

    * item[+]
      * type = #choice
      * linkId = "HL7/NK1-3"
      * text = "Relationship"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
      * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType"

// Proband	Administrative sex

    * item[+]
      * type = #choice
      * linkId = "HL7/NK1.15"
      * text = "Administrative Sex"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.gender"
      * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"

// Proband	Date of birth

    * item[+]
      * type = #date
      * linkId = "HL7/NK1-16"
      * text = "Date of Birth"
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.birthDate"

// Proband	NHS Number, if known

    * item[+]
      * type = #string
      * linkId = "LN/89061-6"
      * code[+] = $loinc#89061-6
      * text = "NHS Number (if known)"
      * required = false
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:nhsNumber"

// Proband	Hospital/Medical Record Number, if known

    * item[+]
      * type = #string
      * linkId = "LN/76435-7"
      * code[+] = $loinc#76435-7
      * text = "Hospital Number (Medical Record Number), if known"
      * required = false
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.identifier:MedicalRecordNumber"

// Proband	Link back to this order's own Patient (the family member)

    * item[+]
      * type = #reference
      * linkId = "NOS/RelatedIndividual-patient"
      * text = "This order's own Patient (the family member)"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient"
      * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"

  * item[+]
    * type = #choice
    * linkId = "NOS/NGISTestCode"
    * text = "National Genomic Informatics System (NGIS) Test Code"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * answerValueSet = Canonical(NGISTestCodeVS)
    * item[+]
      * linkId = "NOS/NGISTestCode-designNote"
      * type = #display
      * text = "The paper form's own 'NGIS/Barcode (Until NGIS Referral Received)' box is a placeholder used before the digital NGIS referral exists, rather than a distinct order identifier - it converges on the same ServiceRequest.code as the common core's Test Request group once the NGIS referral is created."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
