Profile: Patient
Parent: https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient
Id: Patient
Description: """
DRAFT Extension of UKCore-Patient which includes constraints from:
- [NHS England Genomics Patient](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-Patient) use text descriptions only, not the rendered profile.
- HL7 PID segment definitions from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
"""

* identifier 1..* MS
* identifier.assigner ^short = "Assigning Facility"
* identifier.assigner 1..1 MS
* identifier.assigner.identifier 1..1 MS
* identifier.assigner.identifier.value 1..1 MS
* identifier.assigner.identifier.system = $ods-code

* identifier contains
  MedicalRecordNumber 0..*

* identifier[nhsNumber] only NHSNumber
* identifier[nhsNumber] ^short = "UK National Health Identifiers"
* identifier[nhsNumber].extension[nhsNumberVerificationStatus] ^short = "NOT REQUIRED. As all NHS Numbers **MUST** be *01 Number present and verified*, this status will be assumed."
* identifier[MedicalRecordNumber] only MedicalRecordNumber
* identifier[MedicalRecordNumber] ^short = "Medical Record Number"

* name 1..* MS
* gender 0..1 MS
* birthDate 0..1 MS
