Profile:        OrganisationCode
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             OrganisationCode
Title:          "Organisation Code"
Description:     """
NHS Data Dictionary [ORGANISATION_CODE](https://www.datadictionary.nhs.uk/attributes/organisation_code.html)
"""

* system 1..1
* system = $ods-code (exactly)
* value 1..1
