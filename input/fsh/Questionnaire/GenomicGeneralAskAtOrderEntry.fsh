Instance: GenomicGeneralAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "NW Genomic General Ask At Order Questions"
Description: """
The default **Ask At Order Entry Questions** used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) for order/test types that do not have their
own dedicated Ask At Order Entry Questionnaire - see
[Order Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). These questions
were originally part of [GenomicTestOrder](Questionnaire-GenomicTestOrder.html) and
have been extracted here so the core form stays generic to every order/test type.
"""
Usage:  #definition

* title = "NW Genomic General Ask At Order Questions"
* status = #active
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicGeneralAskAtOrderEntry"
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

// Patient	G number (pedigree number)

  * item[+]
    * type = #string
    * linkId = "pedigreeNumber"
    * code[+] = $loinc#74027-4 "Family pedigree identifier"
    * text = "G Number (Pedigree Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * item[+]
      * linkId = "pedigreeNumber-designNote"
      * type = #display
      * text = """
      Useful for Duo/Trio orders, to record the shared pedigree/family group these
      related orders belong to. Moved here from Genomic Test Order (where it was
      wrongly mapped to Patient.identifier:PedigreeNumber, implying it was a formal
      Patient identifier) - NHS England's own Genomics Pedigree Number naming system
      (https://fhir.nhs.uk/Id/genomics-pedigree-number) describes this as a patient's
      genetic/pedigree number which links their family, and their own FHIR Genomics
      Implementation Guide has since moved its own equivalent mapping to a Group
      resource. Not an Order Group Number (ServiceRequest.requisition) - see
      WholeGenomicSequence.html for that distinction. Modelled here simply as an
      Observation.valueString pending a decision on whether a more structured
      representation (e.g. Group) is needed.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Patient is from consanguinous union?

  * item[+]
    * type = #choice
    * code[+] = $sct#842009 "Consanguinity"
    * linkId = "SNM/842009"
    * text = "Patient is from consanguineous union?"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "SNM/74996004-pathology-report"
    * text = "Confirm that a pathology report will be provided alongside the sample."
    * code[+] = $sct#74996004 "Confirmation of"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Patient	Does this test relate to an ongoing pregnancy?


//  * item[+]
//    * type = #choice
//    * linkId = "SNM/77386006"
//    * text = "Does this test relate to an ongoing pregnancy?"
//    * code[+] = $sct#77386006 "Pregnancy"
//    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
//    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
//    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
//    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"


// Patient	Neonatal/Prenatal/Neither

  * item[+]
    * type = #choice
    * linkId = "SNM/118185001"
    * text = "Neonatal/Prenatal/Neither?"
    * code[+] = $sct#118185001 "Finding related to pregnancy"
    * answerOption[+].valueCoding = $sct#77386006 "Pregnancy"
    * answerOption[+].valueCoding = $sct#255407002 "Neonatal"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #group
      * linkId = "pregnant"
      * text = "Pregnant"
      * enableWhen[+]
        * question = "SNM/118185001"
        * operator = #=
        * answerCoding = $sct#77386006

//Patient	Does this test relate to a pregnancy with > 1 fetus?

      * item[+]
        * type = #string
        * linkId = "SNM/370386005"
        * code[+] = $sct#370386005 "Ultrasound scan - multiple fetus"
        * text = "Does this test relate to a pregnancy with > 1 fetus?"
        * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
        * answerOption[+].valueCoding = $loinc#LA32-8 "No"
        * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
        * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Patient	Patient expected delivery date

      * item[+]
        * type = #date
        * linkId = "SNM/161714006"
        * code[+] = $sct#161714006 "Estimated date of delivery"
        * text = "Patient expected delivery date"
        * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueDateTime"

// Patient	Patient gestation

      * item[+]
        * type = #integer
        * linkId = "SNM/598151000005105"
        // * code[+] = $sct#598151000005105 "Gestational age"
        * code[+] = $sct#57036006 "Fetal gestational age"
        * extension[unit].valueCoding = $ucum#wk "Wk"
        * text = "Patient gestation"
        * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

// Patient	Is this test for a deceased infant or pregnancy loss

  * item[+]
    * type = #choice
    * linkId = "SNM/17369002"
    * text = "Is this test for a pregnancy loss?"
    * code[+] = $sct#17369002 "Miscarriage"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

  * item[+]
    * type = #choice
    * linkId = "SNM/419099009"
    * text = "Is this test for a deceased infant?"
    * code[+] = $sct#419099009 "Dead"
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Consent

  * item[+]
    * type = #group
    * linkId = "Consent"
    * text = "Consent"

// Consent	Has consent has been obtained for tests (Y/N)

    * item[+]
      * type = #choice
      * linkId = "LN/19826-7"
      * code[+] = $sct#309370004 "Consent status"
      * code[+] = $loinc#19826-7 "Informed consent obtained"
      * code[+] = $loinc#59284-0 "Consent Document"
      * text = "Has consent has been obtained for tests (Y/N)"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Consent	Has consent has been obtained for DNA storage (Y/N)

    * item[+]
      * type = #choice
      * linkId = "LN/75520-7"
      * text = "Has consent has been obtained for DNA storage (Y/N)"
      * code[+] = $loinc#75520-7 "Biobank specimens are stored and available for research"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Consent	ROD attached or to follow

    * item[+]
      * type = #choice
      * linkId = "NOS/RODToFollow"
      * code[+] = $nwgmsa#RODToFollow
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
      * text = "ROD attached or to follow"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"

// Patient clinical information	Reason For Variant Re-Interpretation Request

  * item[+]
    * type = #string
    * linkId = "NOS/VariantReinterpretationReason"
    * code[+] = $nwgmsa#VariantReinterpretationReason
    * text = "Reason For Variant Re-Interpretation Request"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"

// Raw specimen/biopsy (Directly obtained from patient)	Specimin High Infection risk?

  * item[+]
    * linkId = "SNM/281269004"
    * code[+] = $sct#281269004 "High infection risk sample"
    * text = "High Infection Risk?"
    * type = #choice
    * required = false
    * repeats = false
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

// Raw specimen/biopsy (Directly obtained from patient)	Specimin High infection Risk Details

  * item[+]
    * linkId = "NOS/InfectionRiskDetails"
    * code[+] = $nwgmsa#InfectionRiskDetails
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * text = "High infection Risk Details"
    * type = #string

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
      Generalised from Genetic Clinical Referral - Consultand
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
