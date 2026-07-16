Profile:        OrderIdentifier
Parent:         CorrelationIdentifier
Id:             OrderIdentifier
Title:          "Order Identifier"
Description:     """
`Diagnostic Workflow` HL7 IdentifierType: Placer/Filler Identifier
"""

* ^purpose = """
## Mapping

`NHS Data Model and Dictionary` nil
- **HL7 FHIR** ServiceRequest.identifier (type = PLAC/FILL/PGN)
- **HL7 v2** Placer Order Number (ORC-2).
"""

* type 1..1
* value 1..1
* assigner 1..1
