Instance:  DocumentConsumer
InstanceOf: ActorDefinition
Title:   "Document Consumer"
Usage:  #definition

* name = "DocumentConsumer"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
Queries the Document Registry to find documents and retrieves them from the Document Repository. See [Health Data API (HIE/EURDICE) - Actors](HIE.html#actors).
"""
* documentation = """
Examples in this IG include Shared Care Record providers receiving a laboratory report document (e.g. Greater Manchester Care Record, Lancashire & South Cumbria, NHS England Unified Genomic Care Record), pushed to via IHE ITI-105 Simplified Publish or HL7 v2 MDM_T02 from a Document Publisher.
"""
