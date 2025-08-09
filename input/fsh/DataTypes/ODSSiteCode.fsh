Profile:        OrganisationSiteCode
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             OrganisationSiteCode
Title:          "Organisation Site Code"
Description:     """
**NHS Data Model and Dictionary** [ORGANISATION SITE IDENTIFIER](https://www.datadictionary.nhs.uk/attributes/organisation_site_identifier.html)
**Type** [CorrelationIdentifier](StructureDefinition-CorrelationIdentifier.html)
**HL7 v2** Facility (PL.5)
"""

* system 1..1
* system = "https://fhir.nhs.uk/Id/ods-site-code" (exactly)
* value 1..1
