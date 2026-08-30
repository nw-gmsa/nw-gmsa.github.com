Instance:  ResourceAccessProvider
InstanceOf: ActorDefinition
Title:   "Resource Access Provider"
Usage:  #definition

* name = "ResourceAccessProvider"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
Stores FHIR resources populated by a Resource Publisher and serves them to Resource/Data Consumers. See [Health Data API (HIE/EURDICE) - Actors](HIE.html#actors).
"""
* documentation = """
In this IG this is the FHIR Repository populated by the Regional Integration Engine's wire-tap (see [Regional Integration Engine (RIE)](overview.html#fhir-repository)) - other examples include the Genomic Data Platform, Shared Care Records and NHS England Patient Data Manager.
"""
