Profile:        NHSIdentifier
Parent:         CorrelationIdentifier
Id:             NHSIdentifier
Title:          "NHS Identifier"
Description:     """
Only traced NHS Number **SHOULD** be used, un-traced NHS Numbers **MUST** be clearly indicated.
"""

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* extension contains https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus named nhsNumberVerificationStatus 0..1
* extension[nhsNumberVerificationStatus] ^mustSupport = false
* system 1..1
* system from UKNationalHealthIdentifiers
* value 1..1
* type = $v2-0203#NH (exactly)
* obeys nw-nhs-number-1

Invariant: nw-nhs-number-1
Description: "The value SHALL be 10 digits with a valid Modulus 11 check digit (NHS Number, CHI Number and Health and Care Number all use this algorithm)"
Expression: "value.matches('^[0-9]{10}$') and ((11 - ((value.substring(0,1).toInteger() * 10 + value.substring(1,1).toInteger() * 9 + value.substring(2,1).toInteger() * 8 + value.substring(3,1).toInteger() * 7 + value.substring(4,1).toInteger() * 6 + value.substring(5,1).toInteger() * 5 + value.substring(6,1).toInteger() * 4 + value.substring(7,1).toInteger() * 3 + value.substring(8,1).toInteger() * 2) mod 11)) mod 11) = value.substring(9,1).toInteger()"
Severity: #error
