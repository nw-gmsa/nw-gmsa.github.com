Profile:        PatientIdentifier
Parent:         CorrelationIdentifier
Id:             PatientIdentifier
Title:          "Patient Identifier"
Description:     """
Not applicable per the NHS England Canonical Data Model - use [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) instead.
"""

* ^purpose = """
## Mapping

- **HL7 FHIR** Patient.identifier (type = PI)
- **HL7 v2** Patient Identifier List (PID-3)
- **IHE XDS** sourcePatientId and patientId
"""

* type = $v2-0203#PI (exactly)



