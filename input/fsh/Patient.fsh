Profile: Patient
Parent: https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient
Id: Patient
Description: "Extension of UKCore-Patient"

* identifier 1..* MS

* identifier contains
  MedicalRecordNumber 0..*

* identifier[nhsNumber] only NHSNumber
* identifier[nhsNumber] ^short = "UK National Health Identifiers"
* identifier[MedicalRecordNumber] only MedicalRecordNumber
* identifier[MedicalRecordNumber] ^short = "Medical Record Number"

* name 1..*
