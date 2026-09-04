Instance: VariantReviewAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Genomic Variant Review Ask At Order Entry Questions"
Description: """
**Ask At Order Entry Questions** for the NW GLH paper **Genomic Variant
Review Request Form (R442.1) - Rare Disease** (DOC6004), used alongside the
[common core order form](Questionnaire-GenomicTestOrder.html) - see [Order
Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions).
This form does not request a new test on a new specimen - it asks the
laboratory to **re-review a variant already reported**, so its distinctive
content is a reference back to that prior report rather than specimen
detail.
"""
Usage:  #definition

* title = "Genomic Variant Review Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/VariantReviewAskAtOrderEntry"
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
    * linkId = "NOS/VariantReviewReason"
    * text = "Reason for review"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"
    * answerOption[+].valueCoding = $nwgmsa#VariantReviewReasonNewInformation
    * answerOption[+].valueCoding = $nwgmsa#VariantReviewReasonTimeElapsed
    * answerOption[+].valueCoding = $nwgmsa#VariantReviewReasonUrgent
    * answerOption[+].valueCoding = $nwgmsa#VariantReviewReasonFormalClassification
    * item[+]
      * linkId = "NOS/VariantReviewReason-designNote"
      * type = #display
      * text = "Covers similar ground to Reason For Variant Re-Interpretation Request in NW Genomic General Ask At Order Questions (NOS/VariantReinterpretationReason), which is a single free-text field - this form's four named reasons are kept as their own coded item rather than reused, since they are specific eligibility criteria for requesting a review, not a general free-text reason."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "NOS/VariantsUnderReview"
    * text = "Variant(s) under review"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"

  * item[+]
    * type = #reference
    * linkId = "NOS/ReportReference"
    * code[+] = $nwgmsa#ReportReference
    * text = "Prior report reference"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.basedOn"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport"
    * item[+]
      * linkId = "NOS/ReportReference-designNote"
      * type = #display
      * text = "If this variant was reported by an external GLH, please attach a copy of the report - ServiceRequest.supportingInfo -> DocumentReference -> Binary, the same pattern used for the family letter on Genetic Clinical Referral."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "NOS/ReviewSpecialty"
    * text = "Specialty (e.g. Core, Cardiology)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"

  * item[+]
    * type = #string
    * linkId = "NOS/AdditionalEvidence"
    * text = "Additional evidence (new clinical or scientific information)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"
