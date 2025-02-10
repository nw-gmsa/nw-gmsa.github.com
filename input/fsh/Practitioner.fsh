Profile:        Practitioner
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Practitioner
Id:             Practitioner
Title:          "Practitioner"
Description:    """
DRAFT Extension of UKCore Practitioner which includes elements from:
- [HL7 v2 XCN Extended Composite ID Number and Name for Persons](https://hl7-definition.caristix.com/v2/HL7v2.5.1/DataTypes/XCN)
- XCN definition from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
- [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/volume-1.html)

"""
Usage: #definition

* identifier 1..* MS
* identifier.system 1..1
* identifier.value 1..1

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  EnglandPractitionerIdentifier 1..1 MS

* identifier[EnglandPractitionerIdentifier] only EnglandPractitionerIdentifier

* name 0..1 MS
