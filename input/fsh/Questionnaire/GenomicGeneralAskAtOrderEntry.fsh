Instance: GenomicGeneralAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "NW Genomic General Ask At Order Questions"
Description: """
The default **Ask At Order Entry Questions** used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) for order/test types that do not have their
own dedicated Ask At Order Entry Questionnaire - see
[Order Entry Questions](ServiceRequest.html#order-entry-questions). These questions
were originally part of [GenomicTestOrder](Questionnaire-GenomicTestOrder.html) and
have been extracted here so the core form stays generic to every order/test type.
"""
Usage:  #definition

* title = "NW Genomic General Ask At Order Questions"
* status = #draft
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
