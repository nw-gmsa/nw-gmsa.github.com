Instance: HaemoglobinopathyGeneticAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "Haemoglobinopathy Genetic Testing Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

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
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HaemoglobinopathyGeneticAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Order metadata - the Patient Details/Referring Clinician fields the real
// source DOC4544 form actually asks for, restored here since this
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

// Patient	DoB

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * text = "DoB"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"

// Patient	NHS No

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"

// Patient	Sex

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Sex"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient	Hospital No

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

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

// Patient	Patient's ethnicity/country of origin

  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnicity/country of origin"
    * answerValueSet = Canonical(Ethnicity)
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * item[+]
      * linkId = "LN/32624-9-designNote"
      * type = #display
      * text = "The paper form's own section 3 uses a local A-H category scheme (Mixed/White/Mediterranean/Asian/South East Asian/Black/Arabic/Don't know, several free-text 'please specify country'), distinct from - and not yet mapped to - this IG's own Ethnicity ValueSet used here. Same scheme as Prenatal Haemoglobinopathy's own equivalent field."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Referring Clinician"

// Healthcare professional	Consultant

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "Consultant"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Hospital

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * text = "Hospital"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"

// Healthcare professional	Department

  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * text = "Department"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"

// Healthcare professional	Copy report to

  * item[+]
    * type = #string
    * linkId = "NOS/CopyReportTo"
    * text = "Copy report to"
    * item[+]
      * linkId = "NOS/CopyReportTo-designNote"
      * type = #display
      * text = "Same genuinely-additional-person gap identified on the GMS WGS national forms' own Main Contact group and Genomic Test Order - Common Fields We May Have Missed (Copy Report To)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Healthcare professional	Telephone No

  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * text = "Telephone No"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Email

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * text = "Email"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

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
    * linkId = "NOS/AntenatalPatient-designNote"
    * type = #display
    * text = "Same underlying question as Neonatal/Prenatal/Neither in NW Genomic General Ask At Order Questions (SNM/118185001), simplified to yes/no here since the paper form does not distinguish a neonatal case."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
    * linkId = "SNM/598151000005105-genetic-haem-designNote"
    * type = #display
    * text = "Same question (and code) as Patient gestation in NW Genomic General Ask At Order Questions (SNM/598151000005105) - repeated here because exactly one Ask At Order Entry Questionnaire applies per order, not because this is new content."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
