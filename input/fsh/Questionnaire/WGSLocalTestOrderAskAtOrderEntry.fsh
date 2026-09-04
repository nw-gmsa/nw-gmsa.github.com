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
    * type = #reference
    * linkId = "NOS/ProbandReference"
    * text = "Name and DOB of proband (Family Member pathway only)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Patient"
    * enableWhen[+]
      * question = "NOS/WGSPathway"
      * operator = #=
      * answerCoding = $nwgmsa#WGSPathwayRareDiseaseFamilyMember
    * item[+]
      * linkId = "NOS/ProbandReference-designNote"
      * type = #display
      * text = """
      Same ServiceRequest.supportingInfo pattern used by Genetic Clinical
      Referral - Consultand (RelatedPerson) to reference a second individual,
      but the roles are reversed from that Questionnaire: there, the base
      ServiceRequest's own Patient is always the proband, and the relative is
      the supportingInfo reference. Here, when the Family Member pathway is
      selected, this ServiceRequest's own common-core Patient group is
      completed for the FAMILY MEMBER whose specimen this particular order
      carries - it is this item, not the base Patient group, that names the
      proband. A Patient reference is used rather than RelatedPerson because
      the proband already exists as an independently registered patient with
      their own separate WGS referral (this item only links the two), not a
      person known solely through this family member's record.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #quantity
    * linkId = "NOS/NeoplasticCellContent-wgs"
    * code[+] = $nwgmsa#NeoplasticCellContent
    * text = "Neoplastic cell content (%)"
    * extension[unit].valueCoding = $ucum#% "%"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * enableWhen[+]
      * question = "NOS/WGSPathway"
      * operator = #=
      * answerCoding = $nwgmsa#WGSPathwayCancerTumour

  * item[+]
    * type = #string
    * linkId = "NOS/NGISTestCode"
    * text = "National Genomic Informatics System (NGIS) Test Code"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "NOS/NGISTestCode-designNote"
      * type = #display
      * text = "The paper form's own 'NGIS/Barcode (Until NGIS Referral Received)' box is a placeholder used before the digital NGIS referral exists, rather than a distinct order identifier - it converges on the same ServiceRequest.code as the common core's Test Request group once the NGIS referral is created."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
