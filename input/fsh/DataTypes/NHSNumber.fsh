Profile:        NHSNumber
Parent:         http://hl7.org/fhir/StructureDefinition/Identifier
Id:             NHSNumber
Title:          "NHS Number"
Description:     """
Only traced NHS Number **SHOULD** be used, un-traced NHS Numbers **MUST** be clearly indicated.
"""

* ^purpose = """
"""

* system 1..1
* system = "https://fhir.nhs.uk/Id/nhs-number"
* value 1..1
* type = $v2-0203#NH (exactly)
