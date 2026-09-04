Instance: HaematoOncologyAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Haemato-Oncology Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **Molecular Genomic
Testing Request Form - Haemato-Oncology** (DOC5775), used alongside the
[common core order form](Questionnaire-GenomicTestOrder.html) - see [Order
Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).
Unlike the Genomic Test Directory R-code panels used elsewhere, this form
selects a **named laboratory test panel** directly (e.g. Myeloid NGS panel,
BCR::ABL, MRD panels) rather than a coded test-directory indication.
"""
Usage:  #definition

* title = "Haemato-Oncology Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HaematoOncologyAskAtOrderEntry"
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
    * linkId = "NOS/HaemOncPanelRequested"
    * code[+] = $nwgmsa#HaemOncPanelRequested
    * text = "Test panel(s) requested"
    * required = true
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "NOS/HaemOncPanelRequested-designNote"
      * type = #display
      * text = "The paper form lists ~25 named panels (Myeloid NGS, Lymphoid NGS, MRD fusion panels, SNP array, etc.) as tick-boxes, not Genomic Test Directory R-codes. This item is left as free-choice pending a local test-panel CodeSystem rather than guessing lab-internal panel codes."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "NOS/DifferentialDiagnosis"
    * code[+] = $nwgmsa#DifferentialDiagnosis
    * text = "Differential diagnosis/clinical question (if 'Other' panel selected)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"
