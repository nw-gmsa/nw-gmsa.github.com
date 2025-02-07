Instance:  AutomationManager
InstanceOf: ActorDefinition
Title:   "Automation Manager"
Usage:  #definition

* name = "AutomationManager"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
Manages the Order.
"""
* documentation = """
Receives work orders from the order filler and organizes their fulfillment.
Receives replacement and cancellation requests for work orders and applies then when possible.
"""
