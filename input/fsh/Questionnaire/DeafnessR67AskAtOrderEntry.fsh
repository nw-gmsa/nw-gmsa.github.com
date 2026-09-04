Instance: DeafnessR67AskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Deafness (R67) Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the **Deafness Testing Proforma
(R67 Non-Syndromic Hearing Loss)**, used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). The
test code (R67) is fixed by the choice of form rather than entered - the
proforma instead exists to capture the clinical detail (audiogram, syndromic
features, risk factors) that supports the R67 eligibility criteria.
"""
Usage:  #definition

* title = "Deafness (R67) Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/DeafnessR67AskAtOrderEntry"
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
    * type = #string
    * linkId = "NOS/FamilyHistoryPedigree"
    * text = "Family history/pedigree: other affected individuals, parental consanguinity, ethnicity"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"

  * item[+]
    * type = #group
    * linkId = "Audiogram"
    * text = "Audiogram"

    * item[+]
      * type = #string
      * linkId = "NOS/AudiogramFindings"
      * text = "Audiogram findings (serial if relevant)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * item[+]
      * type = #integer
      * linkId = "NOS/AudiogramSeverityRight"
      * code[+] = $nwgmsa#AudiogramSeverityRight
      * text = "Severity - right ear"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * item[+]
      * type = #integer
      * linkId = "NOS/AudiogramSeverityLeft"
      * code[+] = $nwgmsa#AudiogramSeverityLeft
      * text = "Severity - left ear"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * item[+]
      * type = #string
      * linkId = "NOS/AudiogramProgression"
      * code[+] = $nwgmsa#AudiogramProgression
      * text = "Progression"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"

  * item[+]
    * type = #choice
    * linkId = "NOS/SuspectedSyndromicDiagnosis"
    * text = "Clinically suspected syndromic diagnosis"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"
    * answerOption[+].valueCoding = $nwgmsa#DeafnessSyndromePendred
    * answerOption[+].valueCoding = $nwgmsa#DeafnessSyndromeUsher
    * answerOption[+].valueCoding = $nwgmsa#DeafnessSyndromeJervellLangeNielsen
    * answerOption[+].valueCoding = $nwgmsa#DeafnessSyndromeWaardenburg
    * answerOption[+].valueCoding = $nwgmsa#DeafnessSyndromeBranchioOtoRenal
    * answerOption[+].valueCoding = $nwgmsa#DeafnessSyndromeWolfram

  * item[+]
    * type = #choice
    * linkId = "NOS/DeafnessRiskFactors"
    * text = "Risk factors"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#DeafnessRiskFactorPrematurity
    * answerOption[+].valueCoding = $nwgmsa#DeafnessRiskFactorHyperbilirubinemia
    * answerOption[+].valueCoding = $nwgmsa#DeafnessRiskFactorProlongedNNUStay
    * answerOption[+].valueCoding = $nwgmsa#DeafnessRiskFactorOtotoxicMedication

  * item[+]
    * type = #boolean
    * linkId = "SNM/113091000-mri"
    * code[+] = $sct#113091000 "Magnetic resonance imaging (procedure)"
    * text = "MRI performed?"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
  * item[+]
    * type = #string
    * linkId = "NOS/MRIFindings"
    * text = "MRI findings"
    * enableWhen[+]
      * question = "SNM/113091000-mri"
      * operator = #=
      * answerBoolean = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
