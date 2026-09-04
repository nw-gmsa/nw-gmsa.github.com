Instance: RareDiseaseGenomicAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Rare Disease Genomic Testing Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **Genomic Testing
Request Form - Rare Disease** (DOC4900), the generic Rare Disease paper
order form, used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
form's own Test Request Details section (R code, clinical details) already
maps directly onto the common core's Test Request group, so this
Questionnaire only carries the additional Clinical Utility and targeted
familial testing detail the paper form asks for.
"""
Usage:  #definition

* title = "Rare Disease Genomic Testing Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/RareDiseaseGenomicAskAtOrderEntry"
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
    * linkId = "NOS/ClinicalUtility"
    * text = "Clinical utility"
    * required = true
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#ClinicalUtilityPatientManagement
    * answerOption[+].valueCoding = $nwgmsa#ClinicalUtilityReproductiveDecision
    * answerOption[+].valueCoding = $nwgmsa#ClinicalUtilityPredictiveTesting

  * item[+]
    * type = #boolean
    * linkId = "NOS/TargetedFamilialTesting"
    * text = "Targeted familial testing?"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"

  * item[+]
    * type = #string
    * linkId = "NOS/TargetedFamilialVariant"
    * code[+] = $nwgmsa#TargetedFamilialVariant
    * text = "Known familial variant and affected relative"
    * enableWhen[+]
      * question = "NOS/TargetedFamilialTesting"
      * operator = #=
      * answerBoolean = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
