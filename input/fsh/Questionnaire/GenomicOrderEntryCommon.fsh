Instance: GenomicOrderEntryCommon
InstanceOf: Questionnaire
Title: "Genomics Order Entry Common"
Description: """
Genomic Order Entry Common  - THIS IS FOR ANALYSIS, and is not to be used for implementation.
"""

* status = #draft
* url = "https://fhir.north-west.england.nhs.uk/Questionnaire/GenomicOrderEntryCommon"

* item[+]
  * linkId = "PatientDetails"
  * text = "Patient Details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

  * item[+]
    * type = #string
    * linkId = "1.1"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
    * text = "Patient last name"
  * item[+]
    * type = #string
    * linkId = "1.2"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"
  * item[+]
    * type = #date
    * linkId = "1.3"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"
  * item[+]
    * type = #string
    * linkId = "1.4"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"
    * text = "Postcode"
  * item[+]
    * type = #choice
    * linkId = "1.5"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * type = #string
    * linkId = "1.6"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber.value"
    * text = "NHS Number"
  * item[+]
    * type = #string
    * linkId = "1.7"
    * text = "Hospital Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber.value"
    * required = true

* item[+]
  * type = #group
  * linkId = "2"
  * text = "Pedigree G Number"
  * item[+]
    * type = #string
    * linkId = "2.1"
    * text = "Patient - G Number"
  * item[+]
    * type = #string
    * linkId = "2.2"
    * text = "Family - G Number"


  * item[+]
    * type = #group
    * linkId = "3"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
    * text = "Referring Clinician"

    * item[+]
      * type = #string
      * linkId = "3.1"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.name"
      * text = "Name"
    * item[+]
      * type = #choice
      * linkId = "3.2"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"
      * text = "Specialty"
      * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * item[+]
      * type = #string
      * linkId = "3.3"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
      * text = "Professional/Consultant Code"
      * required = true
    * item[+]
      * type = #string
      * linkId = "3.4"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
      * text = "Phone"
    * item[+]
      * type = #string
      * linkId = "3.5"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
      * text = "Email"
    * item[+]
      * type = #string
      * linkId = "3.6"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
      * text = "Referring Organisation ODS Code"
