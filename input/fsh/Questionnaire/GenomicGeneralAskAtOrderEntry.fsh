Instance: GenomicGeneralAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "NW Genomic General Ask At Order Questions"
Description: """
**Ask At Order Entry Questions Common** - the default set used alongside the
[common core order form](Questionnaire-GenomicTestOrder.html) for order/test
types that do not have their own dedicated Ask At Order Entry Questionnaire -
see [Order Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).
These questions were originally part of [GenomicTestOrder](Questionnaire-GenomicTestOrder.html)
and have been extracted here so the core form stays generic to every order/test type.

Covers Cancer, Whole Genome Sequencing (WGS) and Rare and Inherited Disease
orders generally - see [Guidance by Order Type](#guidance-by-order-type)
below for which questions actually apply to which. Questions only relevant
to WGS specifically (`Related Individual (NK1)`, `Record of Discussion
attached or to follow`) have moved to [WGS Test Additional Ask At Order
Entry Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html),
used *alongside* this Questionnaire for WGS orders, not instead of it.
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

// Patient clinical information	Reason For Variant Re-Interpretation Request

  * item[+]
    * type = #string
    * linkId = "NOS/VariantReinterpretationReason"
    * code[+] = $nwgmsa#VariantReinterpretationReason
    * text = "Reason For Variant Re-Interpretation Request"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
