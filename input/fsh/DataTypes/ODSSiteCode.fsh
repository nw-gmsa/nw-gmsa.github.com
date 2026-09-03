Profile:        OrganisationSiteIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             OrganisationSiteIdentifier
Title:          "Organisation Site Identifier"

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system = "https://fhir.nhs.uk/Id/ods-site-code" (exactly)
* value 1..1
