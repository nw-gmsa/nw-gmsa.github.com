Profile:        Attachment
Parent:         http://hl7.org/fhir/StructureDefinition/Attachment
Id:             attachment
Title:          "Attachment"
Description:     """
DRAFT: Additional conformance on FHIR Attachment data type
"""

* url ^short = "Uri where the data can be found. Mandatory if data not populated"
* data ^short = "Data inline, base64ed. Mandatory if url not populated"
