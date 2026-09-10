Instance:  DocumentPublisher
InstanceOf: ActorDefinition
Title:   "Document Publisher"
Usage:  #definition

* name = "DocumentPublisher"
* type = http://hl7.org/fhir/examplescenario-actor-type#system
* status = http://hl7.org/fhir/publication-status#draft
* description = """
Transforms a laboratory report and pushes it to a Document Consumer or Document Access Provider, using IHE ITI-105 Simplified Publish or HL7 v2 MDM_T02. See [Health Data API (HIE/EURIDICE) - Actors](HIE.html#actors).
"""
* documentation = """
In this IG this role is always played by the Regional Integration Engine (RIE) - the same system that plays [Intermediary](ActorDefinition-Intermediary.html) and Resource Publisher elsewhere - see [Regional Shared Care Records](RegionalSharedCareRecords.html) and [ctDNA NHS England Unified Genomic Record (UGR)](ctDNAUGR.html) for worked examples.
"""
