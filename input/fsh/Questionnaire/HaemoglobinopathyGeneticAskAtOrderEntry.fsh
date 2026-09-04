Instance: HaemoglobinopathyGeneticAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Haemoglobinopathy Genetic Testing Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **Request for Genetic
Testing for Haemoglobinopathies** form (DOC4544), used alongside the [common
core order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). Two
things are distinctive here: prior full blood count/HPLC laboratory results
are submitted *with* the request (used to interpret the genetic result, not
produced by it), and a relative/partner's own affected/carrier status can be
referenced to give a couple-specific pregnancy risk.
"""
Usage:  #definition

* title = "Haemoglobinopathy Genetic Testing Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HaemoglobinopathyGeneticAskAtOrderEntry"
* derivedFrom = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"
* derivedFrom.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
  * valueCoding = http://hl7.org/fhir/questionnaire-derivationType#extends

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #choice
  * linkId = "HL7/OBR-4-h-genetic"
  * code[+] = $loinc#29300-1
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
  * text = "Test Code (Haemoglobinopathy)"
  * required = true
  * repeats = true
  * answerOption[+].valueCoding = $GTD#R361.1
  * answerOption[+].valueCoding = $GTD#R361.2
  * answerOption[+].valueCoding = $GTD#R372.1
  * answerOption[+].valueCoding = $GTD#R93.1
  * answerOption[+].valueCoding = $GTD#R93.2

* item[+]
  * type = #boolean
  * linkId = "NOS/AntenatalPatient"
  * text = "Antenatal patient?"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"

* item[+]
  * type = #integer
  * linkId = "SNM/598151000005105-genetic-haem"
  * code[+] = $sct#57036006 "Fetal gestational age"
  * extension[unit].valueCoding = $ucum#wk "Wk"
  * text = "Gestation of pregnancy"
  * enableWhen[+]
    * question = "NOS/AntenatalPatient"
    * operator = #=
    * answerBoolean = true
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

* item[+]
  * type = #group
  * linkId = "LaboratoryResults"
  * text = "Laboratory Results"

  * item[+]
    * type = #quantity
    * linkId = "LN/718-7"
    * code[+] = $loinc#718-7 "Hemoglobin [Mass/volume] in Blood"
    * text = "Hb (g/L)"
    * extension[unit].valueCoding = $ucum#g/L "g/L"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "LN/789-8"
    * code[+] = $loinc#789-8 "Erythrocytes [#/volume] in Blood by Automated count"
    * text = "RBC (x10^12/L)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "LN/787-2"
    * code[+] = $loinc#787-2 "MCV [Entitic volume] by Automated count"
    * text = "MCV (fL)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "LN/785-6"
    * code[+] = $loinc#785-6 "MCH [Entitic mass] by Automated count"
    * text = "MCH (pg)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "LN/2276-4"
    * code[+] = $loinc#2276-4 "Ferritin [Mass/volume] in Serum or Plasma"
    * text = "Ferritin (µg/L)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "NOS/HbA2Percent"
    * code[+] = $nwgmsa#HbA2Percent
    * text = "Hb A2 (%)"
    * extension[unit].valueCoding = $ucum#% "%"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "NOS/HbFPercent"
    * code[+] = $nwgmsa#HbFPercent
    * text = "Hb F (%)"
    * extension[unit].valueCoding = $ucum#% "%"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
  * item[+]
    * type = #quantity
    * linkId = "NOS/OtherHbPercent"
    * code[+] = $nwgmsa#OtherHbPercent
    * text = "Other Hb (%)"
    * extension[unit].valueCoding = $ucum#% "%"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

* item[+]
  * type = #group
  * linkId = "RelativeOrPartner"
  * text = "Relative/Partner of a patient who is affected with, or a carrier of, a haemoglobinopathy"

  * item[+]
    * type = #reference
    * linkId = "NOS/RelativeOrPartnerReference"
    * text = "Name and DOB of relative/partner"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/RelatedPerson"
  * item[+]
    * type = #choice
    * linkId = "NOS/RelativeOrPartnerStatus"
    * code[+] = $nwgmsa#RelativeOrPartnerStatus
    * text = "Status of relative/partner"
    * answerOption[+].valueCoding = $nwgmsa#GeneticStatusAffected
    * answerOption[+].valueCoding = $nwgmsa#GeneticStatusCarrier
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #string
    * linkId = "NOS/RelativeOrPartnerVariant"
    * code[+] = $nwgmsa#RelativeOrPartnerVariant
    * text = "Details of the relative/partner's variant, if known"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
