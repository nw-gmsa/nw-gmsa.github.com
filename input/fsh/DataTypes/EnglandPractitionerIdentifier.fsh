Profile:        EnglandPractitionerIdentifier
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             EnglandPractitionerIdentifier
Title:          "England Practitioner Identifier"
Description:     """
"""

* ^purpose = """
"""


* system 1..1
* system from PractitionerIdentifiers
* value 1..1
* type.coding = $v2-0203#LN (exactly)

