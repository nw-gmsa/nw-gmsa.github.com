Instance: CYP2C19MavacamtenAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "CYP2C19 Mavacamten (R454) Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

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
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/CYP2C19MavacamtenAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Order metadata - the Patient Details/Referring Clinician fields the real
// source DOC6602 form actually asks for, restored here since this
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

// Patient	NHS No

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"

// Patient	Hospital Number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

// Patient	NHS/Private

  * item[+]
    * type = #choice
    * linkId = "NOS/NHSOrPrivate"
    * text = "NHS/Private"
    * answerOption[+].valueCoding = $nwgmsa#NHSPatient
    * answerOption[+].valueCoding = $nwgmsa#PrivatePatient
    * item[+]
      * linkId = "NOS/NHSOrPrivate-designNote"
      * type = #display
      * text = "No clean FHIR field identified - this form's own distinction between an NHS-funded and privately-funded request."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Patient's Address

  * item[+]
    * type = #string
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * text = "Patient's Address"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.line"

// Patient	Biological Sex

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Biological Sex"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient	Postcode

  * item[+]
    * type = #string
    * linkId = "LN/45401-7"
    * code[+] = $loinc#45401-7
    * text = "Postcode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"

// Patient	Gender Identity

  * item[+]
    * type = #string
    * linkId = "NOS/GenderIdentity"
    * text = "Gender Identity"
    * item[+]
      * linkId = "NOS/GenderIdentity-designNote"
      * type = #display
      * text = "No clean FHIR field identified - distinct from Biological Sex on this form's own layout, same pattern as Genomic Variant Review's own Gender Identity item."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Ethnicity

  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnicity"
    * answerValueSet = Canonical(Ethnicity)
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.extension:ethnicCategory"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Referring Clinician/Healthcare Professional"

// Healthcare professional	Consultant/GP (in full)

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "Consultant/GP (in full)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Hospital/Surgery (in full)

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * text = "Hospital/Surgery (in full)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"

// Healthcare professional	Department

  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * text = "Department"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"

// Healthcare professional	Contact E-mail

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * text = "Contact E-mail"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Requested by/Cc. Report to

  * item[+]
    * type = #string
    * linkId = "NOS/RequestedByCcReportTo"
    * text = "Requested by/Cc. Report to"
    * item[+]
      * linkId = "NOS/RequestedByCcReportTo-designNote"
      * type = #display
      * text = "Same genuinely-additional-person gap identified on Genomic Variant Review and the GMS WGS national forms' own Main Contact group - see Genomic Test Order - Common Fields We May Have Missed (Copy Report To)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
