Instance: CysticFibrosisCarrierAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Cystic Fibrosis Carrier Testing Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **Request for Genetic
Cystic Fibrosis (CF) Carrier Testing (CFTR Gene)** form, used alongside the
[common core order form](Questionnaire-GenomicTestOrder.html) - see [Order
Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).
Unlike the other paper forms, this one is specifically for use by **General
Practitioners** rather than hospital clinicians, and structures one of two
mutually exclusive referral scenarios: a family history of CF, or a partner
who is affected/a carrier.
"""
Usage:  #definition

* title = "Cystic Fibrosis Carrier Testing Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/CysticFibrosisCarrierAskAtOrderEntry"
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
    * linkId = "NOS/CFReferralScenario"
    * code[+] = $nwgmsa#CFReferralScenario
    * text = "Referral scenario"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * answerOption[+].valueCoding = $nwgmsa#CFReferralFamilyHistory
    * answerOption[+].valueCoding = $nwgmsa#CFReferralPartner
    * item[+]
      * linkId = "NOS/CFReferralScenario-designNote"
      * type = #display
      * text = "Carrier testing cannot be requested for individuals under 16 years of age, as they cannot give informed consent."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #reference
    * linkId = "NOS/RelativeOrPartnerReference"
    * text = "Name and DOB of relative(s)/partner"
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
    * type = #choice
    * linkId = "HL7/NK1-3-cf"
    * text = "Relationship to patient (relative scenario only)"
    * definition = "http://hl7.org/fhir/StructureDefinition/RelatedPerson#RelatedPerson.relationship"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType"

  * item[+]
    * type = #string
    * linkId = "NOS/RelativeOrPartnerVariant"
    * code[+] = $nwgmsa#RelativeOrPartnerVariant
    * text = "Details of the familial CFTR pathogenic variant, if known"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
