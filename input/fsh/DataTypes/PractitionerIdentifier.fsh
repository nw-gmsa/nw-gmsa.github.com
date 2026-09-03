Profile:        PractitionerIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             PractitionerIdentifier
Title:          "Practitioner Identifier"

* ^purpose = """
## Mapping

- **HL7 FHIR** Practitioner.identifier (type = LN)
- **HL7 v2** Extended Composite Id Number And Name For Persons (XCN)
- **IHE XDS** author
"""

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* system 1..1
* system from PractitionerIdentifiers (extensible)
* value 1..1
//* type = $v2-0203#LN (exactly)

