Profile:        OrganisationCode
Parent:         CorrelationIdentifier
Id:             OrganisationCode
Title:          "Organisation Code"

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system = $ods-code (exactly)
* value 1..1
//* type from http://hl7.org/fhir/ValueSet/organization-type
