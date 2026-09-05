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
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/DeafnessR67AskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Order metadata - the Patient Details/Referring Clinician fields the real
// source proforma actually asks for, restored here since this Questionnaire
// does not (yet) derivedFrom/extend Genomic Test Order, so these are not
// otherwise available. Only fields confirmed present on this specific form -
// not a copy of Genomic Test Order's own (larger) Patient/Healthcare
// Professional groups. See
// Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms.
// ---------------------------------------------------------------------------

* item[+]
  * linkId = "Patient"
  * text = "Patient Details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient	Name

  * item[+]
    * type = #string
    * linkId = "NOS/PatientName"
    * text = "Name"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name"
    * item[+]
      * linkId = "NOS/PatientName-designNote"
      * type = #display
      * text = "Single free-text Name field on this form, unlike the Surname/Forename split most other paper forms use."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Date of birth

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * text = "Date of birth"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"

// Patient	Gender

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Gender"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient	Address

  * item[+]
    * type = #string
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * text = "Address"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.line"

// Patient	Postcode

  * item[+]
    * type = #string
    * linkId = "LN/45401-7"
    * code[+] = $loinc#45401-7
    * text = "Postcode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"

// Patient	Hospital Number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

// Patient	NHS no

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS no"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Referring Clinician"

// Healthcare professional	Referring clinician

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "Referring clinician"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Address

  * item[+]
    * type = #string
    * linkId = "NOS/DepartmentAddress"
    * text = "Address"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.display"

// Healthcare professional	Email

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * text = "Email"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

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
