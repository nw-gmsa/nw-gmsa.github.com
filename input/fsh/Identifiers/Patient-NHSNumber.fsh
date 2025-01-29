Profile:        NHSNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             nhs-number
Title:          "NHS Number"
Description:     """
Only traced NHS Number **SHOULD** be used, un-traced NHS Numbers **MUST** be clearly indicated.

Format: NNNNNNNNNN (400 000 000 to 499 999 999, and 600 000 000 to 799 999)

| Standard | Data Type | Value |
|----------|-------|-------|
| NHS Data Dictionary | | [NHS NUMBER](https://www.datadictionary.nhs.uk/data_elements/nhs_number.html) |
| OID/HL7 v3 | | 2.16.840.1.113883.2.1.4.1 |
| HL7 v2 | CX.4| NHS |
| HL7 FHIR | Identifier.system | https://fhir.nhs.uk/Id/nhs-number |
| HL7 v2 | CX.5 | NH |
| HL7 FHIR | Identifier.type | http://terminology.hl7.org/CodeSystem/v2-0203#NH |

"""

* system 1..1
* system = "https://fhir.nhs.uk/Id/nhs-number"
* value 1..1
* type = http://terminology.hl7.org/CodeSystem/v2-0203#NH
