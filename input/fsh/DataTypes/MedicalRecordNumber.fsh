Profile:        MedicalRecordNumber
Parent:         CorrelationIdentifier
Id:             MedicalRecordNumber
Title:          "Medical Record Number"
Description:     """
Only use in References Data Type if the NHS Number is not known or unverified.
"""

* ^purpose = """
"""

* type = $v2-0203#MR (exactly)
//* system = "https://fhir.nhs.uk/Id/medical-record-number"
* system ^short = "Generic system to represent MRN in NHS Trusts. Can be replaced with a system specified by NHS Trust. For trusts with a PAS/EPR with a FHIR API (e.g. EPIC, Meditech, Cerner, etc), this value will be defined in that API."
* system ^example.valueString = "1.2.840.114350.1.13.0.1.7.5.737384.0"
* system ^example.label = "EPIC EPI OID"

* assigner ^short = "Assigning Facility"
* assigner.identifier.system = $ods-code
* assigner.identifier.value ^example.valueCoding = #R0A
* assigner.identifier.value ^example.label = "Manchester University NHS Foundation Trust"


