Instance: RareDiseaseGenomicAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Rare Disease Genomic Testing Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

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
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/RareDiseaseGenomicAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Order metadata - the Patient Details/Referring Clinician fields the real
// source DOC4900 form actually asks for, restored here since this
// Questionnaire does not (yet) derivedFrom/extend Genomic Test Order, so
// these are not otherwise available. Only fields confirmed present on this
// specific form - not a copy of Genomic Test Order's own (larger) Patient/
// Healthcare Professional groups. See
// Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms.
// ---------------------------------------------------------------------------

* item[+]
  * linkId = "Patient"
  * text = "Patient Details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient	Surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * text = "Surname"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"

// Patient	Forename

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * text = "Forename"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"

// Patient	D.O.B.

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * text = "D.O.B."
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"

// Patient	Biological Sex

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Biological Sex"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient	Gender Identity

  * item[+]
    * type = #string
    * linkId = "NOS/GenderIdentity"
    * text = "Gender Identity"
    * item[+]
      * linkId = "NOS/GenderIdentity-designNote"
      * type = #display
      * text = "No clean FHIR field identified - distinct from Biological Sex on this form's own layout."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Address

  * item[+]
    * type = #string
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * text = "Address"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.line"

// Patient	Postcode

  * item[+]
    * type = #string
    * linkId = "LN/45401-7"
    * code[+] = $loinc#45401-7
    * text = "Postcode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"

// Patient	Ethnicity

  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnicity"
    * answerValueSet = Canonical(Ethnicity)
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.extension:ethnicCategory"

// Patient	NHS No

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"

// Patient	Hospital No

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Referring Clinician/Healthcare Professional"

// Healthcare professional	Consultant/Clinician (in full)

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "Consultant/Clinician (in full)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Hospital/Surgery (in full)

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * text = "Hospital/Surgery (in full)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"

// Healthcare professional	Clinical Specialty/Department

  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * text = "Clinical Specialty/Department"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"

// Healthcare professional	E-mail/Tel

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * text = "E-mail/Tel"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Requested by/Cc. Report to

  * item[+]
    * type = #string
    * linkId = "NOS/RequestedByCcReportTo"
    * text = "Requested by/Cc. Report to"
    * item[+]
      * linkId = "NOS/RequestedByCcReportTo-designNote"
      * type = #display
      * text = "Same genuinely-additional-person gap identified on the GMS WGS national forms' own Main Contact group and Genomic Test Order - Common Fields We May Have Missed (Copy Report To) - modelled here as free text since this form doesn't break it into separate Name/Department/Phone/Email fields."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
