Instance: HaemoglobinopathyPrenatalAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Prenatal Haemoglobinopathy Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the NW GLH paper **Request for Prenatal
Diagnosis of Haemoglobinopathies** form (DOC4544), used alongside the [common
core order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
form is unusual among the paper forms in naming **two** patients (maternal
and paternal) rather than one - the common core's own Patient group is
completed for the mother (the referral's own registered patient - not a
"proband" in the classical sense, since prenatal carrier testing doesn't
imply an already-affected index case), and this Questionnaire adds a
reference to the father via the same NK1-shaped `RelatedPerson` group as
[NW Genomic General Ask At Order Questions - Related Individual
(NK1)](Questionnaire-GenomicGeneralAskAtOrderEntry.html).
"""
Usage:  #definition

* title = "Prenatal Haemoglobinopathy Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HaemoglobinopathyPrenatalAskAtOrderEntry"
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
    * type = #group
    * linkId = "NOS/RelatedIndividual"
    * text = "Paternal details (Related Individual, NK1)"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson"
    * item[+]
      * linkId = "NOS/RelatedIndividual-designNote"
      * type = #display
      * text = """
      Same NK1-shaped RelatedPerson group as NW Genomic General Ask At
      Order Questions' own Related Individual (NK1) group
      (NOS/RelatedIndividual) and Genetic Clinical Referral - Consultand,
      used here under its Consultand role - the mother remains this
      ServiceRequest's own subject throughout, unlike WGS Local Test
      Order's NOS/Proband, so there is no pathway where the roles swap.
      RelatedPerson.identifier already accommodates the father's own
      NHS/hospital number when known, the same paper-form fields
      previously modelled as a full Patient reference - no detail is lost
      by using the shared shape instead.
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

// Related Individual	Relationship to mother

    * item[+]
      * type = #choice
      * linkId = "HL7/NK1-3"
      * text = "Relationship"
      * required = true
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

// Related Individual	Link back to this order's own Patient (the mother)

    * item[+]
      * type = #reference
      * linkId = "NOS/RelatedIndividual-patient"
      * text = "This order's own Patient (the mother)"
      * required = true
      * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.patient"
      * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"

  * item[+]
    * type = #string
    * linkId = "NOS/ParentalGenotypesReason"
    * text = "Parental genotypes/reason for referral"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode.text"

  * item[+]
    * type = #integer
    * linkId = "SNM/598151000005105-prenatal-haem"
    * code[+] = $sct#57036006 "Fetal gestational age"
    * extension[unit].valueCoding = $ucum#wk "Wk"
    * text = "Gestation of pregnancy"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * item[+]
      * linkId = "SNM/598151000005105-prenatal-haem-designNote"
      * type = #display
      * text = "Same question (and code) as Patient gestation in NW Genomic General Ask At Order Questions (SNM/598151000005105) - repeated here because exactly one Ask At Order Entry Questionnaire applies per order, not because this is new content."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #date
    * linkId = "SNM/161714006-prenatal-haem"
    * code[+] = $sct#161714006 "Estimated date of delivery"
    * text = "Estimated date of delivery (EDD)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueDateTime"
    * item[+]
      * linkId = "SNM/161714006-prenatal-haem-designNote"
      * type = #display
      * text = "Same question (and code) as Patient expected delivery date in NW Genomic General Ask At Order Questions (SNM/161714006) - repeated here because exactly one Ask At Order Entry Questionnaire applies per order, not because this is new content."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #dateTime
    * linkId = "NOS/FetalSampleTaken"
    * text = "Date fetal sample taken and sample type"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
