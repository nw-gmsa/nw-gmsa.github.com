Instance: CYP2C19MavacamtenAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "CYP2C19 Mavacamten (R454) Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the **R454 Mavacamten CYP2C19 Test
Request Form** (DOC6602), used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
is one of the leanest of the paper forms - the test itself (R454) is fixed
by the choice of form, and there is no specimen-specific content beyond the
common core's own Specimen group. Like several of the newer DOC-numbered
forms, it captures **Gender Identity** separately from Biological Sex - see
[Genomic Test Order - Common Fields We May Have
Missed](Questionnaire-GenomicTestOrder.html#common-fields-we-may-have-missed)
for why that item is proposed as a common-core addition rather than repeated
per Ask At Order Entry Questionnaire.
"""
Usage:  #definition

* title = "CYP2C19 Mavacamten (R454) Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/CYP2C19MavacamtenAskAtOrderEntry"
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
    * type = #boolean
    * linkId = "NOS/R454TestingRequired"
    * text = "R454 Mavacamten CYP2C19 testing required"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "NOS/R454TestingRequired-designNote"
      * type = #display
      * text = "The paper form has a single tick-box rather than a choice of test codes - R454.1 is implied by using this form at all."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
