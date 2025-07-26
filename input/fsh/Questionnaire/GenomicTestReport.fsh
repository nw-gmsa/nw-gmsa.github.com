Instance: GenomicTestReport
InstanceOf: NWQuestionnaire
Title: "North West Genomics Test Report"
Description: """
The aim of this is to support conversion of Genomic Report (HL7 v2 ORU) for use by several NHS Trusts (as HL7 v2 or FHIR).
"""
Usage:  #definition

* title = "North West Genomics Test Report"
* status = #draft
* url = "https://nw-gmsa.github.io/Questionnaire/GenomicTestReport"

* item[+]
  * linkId = "Patient"
  * text = "Patient"
  * type = #group
  * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient"

// Patient	Patient/proband surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"


//Patient	Patient/proband first name

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * required = true
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"

//Patient	Patient/proband DOB

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * required = true
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"

// Patient	Patient/proband date of death


  * item[+]
    * type = #date
    * linkId = "LN/81954-0"
    * code[+] = $loinc#81954-0
    * required = false
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.deceasedDateTime"
    * text = "Date of death"

 // Patient	Patient/proband address


  * item[+]
    * type = #group
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address"
    * text = "Address"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-1"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address.line"
      * repeats = true
      * text = "Address Line"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-3"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address.city"
      * text = "City"

// Patient	Patient/proband post code


    * item[+]
      * type = #string
      * linkId = "LN/45401-7"
      * code[+] = $loinc#45401-7
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address.postalCode"
      * text = "Postcode"

// Patient	Patient/proband sex registered at birth

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"

//  Patient	Patient/proband ethnicity


  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnic Category"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * answerValueSet = Canonical(Ethnicity)

// Patient	Patient/proband NHS number


  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"

// Patient	Patient/proband hospital number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"
    * required = true

// Patient	Account number (visit number)

  * item[+]
    * type = #string
    * linkId = "LN/56797-4"
    * code[+] = $loinc#56797-4
    * text = "Account Number (Episode or Stay Number)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier.value"
    * required = false
    * item[+]
      * linkId = "LN/56797-4-designNote"
      * type = #display
      * text = "PV1-19 (also known as stay number)"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #choice
    * linkId = "HL7/PD1-3"
    * text = "GP Surgery (ODS Code)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.generalPractitioner"

