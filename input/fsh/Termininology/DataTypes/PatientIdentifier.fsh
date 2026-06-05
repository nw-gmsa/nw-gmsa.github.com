Profile:        PatientIdentifier
Parent:         CorrelationIdentifier
Id:             PatientIdentifier
Title:          "Medical Record Number"
Description:     """
`Patient Administration` HL7 IdentifierType: **PI** Patient Identifier
`NHS Data Model and Dictionary`  [LOCAL PATIENT IDENTIFIER](https://www.datadictionary.nhs.uk/data_elements/local_patient_identifier__extended_.html)
[NHS England Canonical Data Model](https://future.nhs.uk/DataArchitecture/groupHome) Not applicable, use MedicalRecordNumber only.
"""

* ^purpose = """
## Mapping

- **HL7 FHIR** Patient.identifier (type = PI)
- **HL7 v2** Patient Identifier List (PID-3)
- **IHE XDS** sourcePatientId and patientId
"""

* type = $v2-0203#PI (exactly)



