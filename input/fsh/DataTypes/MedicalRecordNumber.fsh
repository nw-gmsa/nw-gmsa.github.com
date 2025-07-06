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
* system ^short = "Generic system to represent MRN in NHS Trusts. Can be replaced with a system specified by NHS Trust, e.g. https://fhir.alderhey.nhs.uk/Id/medical-record-number"
* assigner ^short = "Assigning Facility"
* assigner.identifier.system = $ods-code



