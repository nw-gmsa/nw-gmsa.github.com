Profile:        CorrelationIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             correlation-identifier
Title:          "Correlation Identifier"
Description:     """
See [Enterprise Integration Patterns - Correlation Identifier](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CorrelationIdentifier.html) and  [Rule 3: Reference Other Aggregates by Identity (Implementing Domain Driven Design)](https://www.archi-lab.io/infopages/ddd/aggregate-design-rules-vernon.html#rule-3-reference-other-aggregates-by-identity)
"""

* type 0..1 MS
* system ^short = "uri is defined by supplying organisation."
* value 1..1 MS

* assigner 1..1 MS
* assigner.identifier 1..1 MS
* assigner.identifier.value 1..1 MS
* assigner.identifier.system 1..1 MS
* assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
