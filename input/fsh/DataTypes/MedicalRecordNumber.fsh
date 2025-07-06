Profile:        MedicalRecordNumber
Parent:         CorrelationIdentifier
Id:             MedicalRecordNumber
Title:          "Medical Record Number"
Description:     """
Only use in References Data Type if the NHS Number is not known or unverified.
"""

* ^purpose = """
| Field               | HL7 FHIR Identifier | OID | HL7 v2 CX                             | HL7 FHIR Example                                      | HL7 v2 Example |
|---------------------|---------------------|---------------------------------------|-------------------------------------------------------|----------------|
| Value               | value               | | CX.1                                  | ABC1234                                               | ABC1234        |
| Type                | type                | | CX.5                                  | http://terminology.hl7.org/CodeSystem/v2-0203#MR      | MR             |
| ODS Code | assigner.identifier | | CX.6 | https://fhir.nhs.uk/Id/ods-organization-code#RBS      | RBS            |
| System              | system       |       | N/a                                   | https://fhir.alderhey.nhs.uk/Id/medical-record-number | N/a            |

"""

* type = $v2-0203#MR (exactly)
//* system = "https://fhir.nhs.uk/Id/medical-record-number"
* system ^short = "Generic system to represent MRN in NHS Trusts. Can be replaced with a system specified by NHS Trust, e.g. https://fhir.alderhey.nhs.uk/Id/medical-record-number"
* assigner ^short = "Assigning Facility"
* assigner.identifier.system = $ods-code



