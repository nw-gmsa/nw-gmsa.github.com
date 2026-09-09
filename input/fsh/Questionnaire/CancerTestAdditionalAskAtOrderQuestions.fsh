Instance: CancerTestAdditionalAskAtOrderQuestions
InstanceOf: NWQuestionnaire
Title: "Cancer Test Additional Ask At Order Entry Questions"
Description: """
**This Questionnaire is a proposal, not an active or planned project.**

**Test Specific Additional Ask At Order Entry Questions** for Cancer
orders - used *alongside* the [common core order
form](Questionnaire-GenomicTestOrder.html) **and** [Ask At Order Entry
Questions Common](Questionnaire-GenomicGeneralAskAtOrderEntry.html), the
same "Test Specific" tier pattern [WGS Test Additional Ask At Order Entry
Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) already
follows for WGS orders - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).

Its content is **inferred**, not yet confirmed against a live order-entry
screen the way `WGSTestAdditionalAskAtOrderQuestions` was: each item below
is a concept that recurs independently across the two Cancer-category NW
GLH paper forms - [HRD and Tumour
BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html) (GB-27189) and [GMS
WGS Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) (the national
form) - see [NW GLH Paper Test Request
Forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms).
Neither of those two Questionnaires has been changed to actually use this
one yet - both remain independent, standalone Questionnaires, each already
carrying its own copy of the fields proposed here.
"""
Usage:  #definition

* title = "Cancer Test Additional Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/CancerTestAdditionalAskAtOrderQuestions"
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

// Presentation status (newly diagnosed / recurrence-relapse)

  * item[+]
    * type = #choice
    * linkId = "NOS/PresentationStatus"
    * text = "Presentation status"
    * answerOption[+].valueCoding = $nwgmsa#PresentationFirstDiagnosis
    * answerOption[+].valueCoding = $nwgmsa#PresentationRecurrenceRelapse
    * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "NOS/PresentationStatus-designNote"
      * type = #display
      * text = """
      Inferred from [GMS WGS
      Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html)'s own
      `NOS/PresentationStatus` item. Generalises the same distinction [HRD
      and Tumour BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html)
      makes via its own `Pathway` choice (HRD test = newly diagnosed,
      Tumour BRCA-only = relapsed) plus separate
      `NewlyDiagnosedAdvancedDiseaseConfirmation`/`RelapsedDiseaseConfirmation`
      booleans - that form conflates presentation status with test
      selection itself, since the pathway and the presentation are the same
      choice on that specific form; here they are kept separate, as GMS WGS
      Cancer already does.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Neoplastic/malignant cell content (%)

  * item[+]
    * type = #quantity
    * linkId = "NOS/NeoplasticCellContent"
    * code[+] = $nwgmsa#NeoplasticCellContent
    * text = "Neoplastic/malignant cell content (%)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * extension[unit].valueCoding = $ucum#% "%"
    * item[+]
      * linkId = "NOS/NeoplasticCellContent-designNote"
      * type = #display
      * text = """
      The same underlying concept is independently modelled three times
      today, each under its own linkId despite sharing this same
      `NWGMSA` code: [HRD and Tumour
      BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html)'s
      `NOS/NeoplasticCellContent` ("Approximate % neoplastic nuclei in
      tumour area highlighted"), [GMS WGS
      Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html)'s
      `NOS/NeoplasticCellContent-gms` ("% Malignant nuclei / blasts (or
      equivalent)"), and [WGS Local Test
      Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s own
      `NOS/NeoplasticCellContent-wgs`. Proposed here as the single shared
      field this tier is for, rather than each Cancer-adjacent form
      continuing to reinvent its own suffixed linkId for the same value.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Pathologist

  * item[+]
    * type = #string
    * linkId = "NOS/PathologistName"
    * code[+] = $nwgmsa#PathologistName
    * text = "Pathologist"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * item[+]
      * linkId = "NOS/PathologistName-designNote"
      * type = #display
      * text = """
      Present as its own named field on [HRD and Tumour
      BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html). [GMS WGS
      Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) doesn't ask
      for the pathologist by name, only a Histopathology Lab ID (see
      `Pathology hospital / laboratory` below) - proposed here as a
      genuinely Cancer-wide concept even though only one of the two source
      forms currently asks for it.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Pathology hospital / laboratory

  * item[+]
    * type = #string
    * linkId = "NOS/PathologyHospital"
    * code[+] = $nwgmsa#PathologyHospital
    * text = "Pathology hospital / laboratory"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * item[+]
      * linkId = "NOS/PathologyHospital-designNote"
      * type = #display
      * text = """
      Generalises [HRD and Tumour
      BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html)'s own
      `NOS/PathologyHospital` and [GMS WGS
      Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html)'s
      `NOS/HistopathologyLabID` ("Histopathology Lab ID", under that form's
      own Solid tumour sub-group) - both identify where the pathology
      specimen/report the order relies on came from, just at different
      granularity (a named hospital vs. a lab identifier). Kept as free
      text pending a decision on whether an
      [Organisation Code](StructureDefinition-OrganisationCode.html)
      reference would be more appropriate.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
