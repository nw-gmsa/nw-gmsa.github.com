Profile:        NWAttachment
Parent:         http://hl7.org/fhir/StructureDefinition/Attachment
Id:             NWAttachment
Title:          "Attachment"
Description:     """
DRAFT: Additional conformance on FHIR Attachment data type.
"""

* url ^short = "Uri where the data can be found. Mandatory for PDF or FHIR Documents"
* data 0..0
* contentType from DocumentEntryMimeType
