Profile:        OrganisationCode
Parent:         CorrelationIdentifier
Id:             OrganisationCode
Title:          "Organisation Code"

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system = $ods-code (exactly)
* value 1..1
//* type from http://hl7.org/fhir/ValueSet/organization-type
* obeys nw-ods-code-1

Invariant: nw-ods-code-1
Description: "An ODS organisation code SHALL be 3 to 6 upper-case letters or digits, with no whitespace"
Expression: "system = 'https://fhir.nhs.uk/Id/ods-organization-code' implies value.matches('^[A-Z0-9]{3,6}$')"
Severity: #error
