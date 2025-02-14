Instance:  AutomationManager
InstanceOf: ActorDefinition
Title:   "Automation Manager"
Usage:  #definition

* name = "AutomationManager"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
Manages the Order. This is the function of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) and/or GLH LIMS
"""
* documentation = """
Receives work orders from the order filler and organizes their fulfillment.
Receives replacement and cancellation requests for work orders and applies then when possible.
"""
