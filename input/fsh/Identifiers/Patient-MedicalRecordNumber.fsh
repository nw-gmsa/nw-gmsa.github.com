Profile:        MedicalRecordNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             medical-record-number
Title:          "Medical Record Number"
Description:     """
Only use in References if the NHS Number is not known or unverified.

| Standard | Data Type | Value |
|----------|-------|-------|
| NHS Data Dictionary | | - |
| OID/HL7 v3 | |  |
| HL7 v2 | CX.4|   |
| HL7 FHIR | Identifier.system |  |
| HL7 v2 | CX.5 | MR |
| HL7 FHIR | Identifier.type | http://terminology.hl7.org/CodeSystem/v2-0203#MR |
| HL7 v2 | CX.6 | ODS Code |
| HL7 FHIR | Identifier.assigner.identifier | https://fhir.nhs.uk/Id/ods-organization-code#{ODS Code} |

"""

* type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* system 0..1
* system ^short = "Should indicate the assigning authority/provider of the MRN. This is defined by the assigning authority."
* value 1..1
* assigner ^short = "Assigning Facility"
* assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
