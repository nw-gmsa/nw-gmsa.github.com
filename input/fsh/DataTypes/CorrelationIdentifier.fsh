Profile:        CorrelationIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             correlation-identifier
Title:          "Correlation Identifier"
Description:     """
DRAFT: Additional conformance on FHIR Identifier data type
"""

* system ^short = "uri is defined by supplying organisation."
* value 1..1 MS

* assigner 1..1 MS
* assigner.identifier 1..1 MS
* assigner.identifier.value 1..1 MS
* assigner.identifier.system 1..1 MS
* assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
