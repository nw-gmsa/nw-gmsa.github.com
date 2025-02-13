Profile:        RequestGroup
Parent:         http://hl7.org/fhir/StructureDefinition/RequestGroup
Id:             RequestGroup
Title:          "RequestGroup"
Description:    """
DRAFT To provide grouping of individual ServiceRequests in the Test Order"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* subject 1..1 MS
* subject only Reference(Patient)

* action 1..* MS
* action.resource 1..1 MS
* action.resource only Reference(ServiceRequest)
