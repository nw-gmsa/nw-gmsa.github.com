Instance: HRDTumourBRCAAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "HRD and Tumour BRCA Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for the NW GLH paper **HRD and Tumour BRCA Test
Request Form** (GB-27189), used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
form is specific to newly-diagnosed advanced high-grade epithelial ovarian,
fallopian tube or primary peritoneal cancer (HRD test, performed by Myriad
Genetics Inc. in the United States) and its relapsed-disease tumour BRCA-only
pathway.
"""
Usage:  #definition

* title = "HRD and Tumour BRCA Ask At Order Entry Questions"
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HRDTumourBRCAAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// ---------------------------------------------------------------------------
// Order metadata - the Patient Details/Referring Clinician fields the real
// source GB-27189 form actually asks for, restored here since this
// Questionnaire does not (yet) derivedFrom/extend Genomic Test Order, so
// these are not otherwise available. Only fields confirmed present on this
// specific form - not a copy of Genomic Test Order's own (larger) Patient/
// Healthcare Professional groups. See
// Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms.
// ---------------------------------------------------------------------------

* item[+]
  * linkId = "Patient"
  * text = "Patient details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient	Forename

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * text = "Forename"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"

// Patient	Surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * text = "Surname"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"

// Patient	DoB (DD/MM/YY)

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * text = "DoB (DD/MM/YY)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"

// Patient	Sex

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * text = "Sex"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"

// Patient	NHS number

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"

// Patient	Hospital number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Referrers details"

// Healthcare professional	Name

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * text = "Name"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

// Healthcare professional	Position

  * item[+]
    * type = #string
    * linkId = "NOS/ReferrerPosition"
    * text = "Position"
    * item[+]
      * linkId = "NOS/ReferrerPosition-designNote"
      * type = #display
      * text = "No clean FHIR field identified for the referrer's job title, as distinct from their clinical specialty/department below."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Healthcare professional	NHS hospital

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * text = "NHS hospital"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"

// Healthcare professional	Department

  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * text = "Department"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"

// Healthcare professional	Telephone number

  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * text = "Telephone number"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Preferred method of report

  * item[+]
    * type = #choice
    * linkId = "NOS/PreferredReportMethod"
    * text = "Preferred method of report"
    * answerOption[+].valueCoding = $nwgmsa#ReportMethodEmail
    * answerOption[+].valueCoding = $nwgmsa#ReportMethodFax
    * item[+]
      * linkId = "NOS/PreferredReportMethod-designNote"
      * type = #display
      * text = "Email requires a secure account per the paper form's own footnote - no clean FHIR field identified for this preference."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Healthcare professional	Email/ fax (1)

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * text = "Email/ fax (1)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"

// Healthcare professional	Email/ fax (2)

  * item[+]
    * type = #string
    * linkId = "NOS/EmailFax2"
    * text = "Email/ fax (2)"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * item[+]
      * linkId = "NOS/EmailFax2-designNote"
      * type = #display
      * text = "This form's own second, alternative contact method - maps to a second repeat of PractitionerRole.telecom, distinct from Email/ fax (1) above."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Healthcare professional	Reporting address

  * item[+]
    * type = #string
    * linkId = "NOS/ReportingAddress"
    * text = "Reporting address"

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

  * item[+]
    * type = #choice
    * linkId = "NOS/HRDPathway"
    * text = "Pathway"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * answerOption[+].valueCoding = $GTD#M2.5 "HRD status (includes tumour BRCA results)"
    * answerOption[+].valueCoding = $GTD#M2.1 "Tumour BRCA test only"

  * item[+]
    * type = #boolean
    * linkId = "NOS/NewlyDiagnosedAdvancedDiseaseConfirmation"
    * code[+] = $nwgmsa#NewlyDiagnosedAdvancedDiseaseConfirmation
    * text = "Confirm the patient has newly diagnosed, advanced (FIGO stages III and IV) high-grade epithelial ovarian, fallopian tube or primary peritoneal cancer"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "NOS/HRDPathway"
      * operator = #=
      * answerCoding = $GTD#M2.5

  * item[+]
    * type = #boolean
    * linkId = "NOS/RelapsedDiseaseConfirmation"
    * code[+] = $nwgmsa#RelapsedDiseaseConfirmation
    * text = "Confirm the patient has relapsed high-grade epithelial ovarian, fallopian tube or primary peritoneal cancer and has already received one or more treatment for their disease (second line or beyond)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "NOS/HRDPathway"
      * operator = #=
      * answerCoding = $GTD#M2.1

  * item[+]
    * type = #boolean
    * linkId = "NOS/MyriadInternationalTransferConsent"
    * code[+] = $nwgmsa#MyriadInternationalTransferConsent
    * text = "Consent obtained for tissue, pathology report and personal details (name, NHS number, date of birth) to be sent to Myriad laboratory in the United States for analysis"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueBoolean"
    * enableWhen[+]
      * question = "NOS/HRDPathway"
      * operator = #=
      * answerCoding = $GTD#M2.5

  * item[+]
    * type = #string
    * linkId = "NOS/PathologistName"
    * code[+] = $nwgmsa#PathologistName
    * text = "Pathologist"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"

  * item[+]
    * type = #string
    * linkId = "NOS/PathologyHospital"
    * code[+] = $nwgmsa#PathologyHospital
    * text = "Pathology hospital"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"

  * item[+]
    * type = #quantity
    * linkId = "NOS/NeoplasticCellContent"
    * code[+] = $nwgmsa#NeoplasticCellContent
    * text = "Approximate % neoplastic nuclei in tumour area highlighted"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
    * extension[unit].valueCoding = $ucum#% "%"
    * item[+]
      * linkId = "NOS/NeoplasticCellContent-designNote"
      * type = #display
      * text = "Specimen.accessionIdentifier (pathology block/sample number) is already captured by the common core order form's Specimen group - not repeated here."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
