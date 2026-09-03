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
