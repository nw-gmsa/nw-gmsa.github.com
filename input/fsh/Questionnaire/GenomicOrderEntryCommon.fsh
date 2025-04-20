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
  * text = "Order"
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
