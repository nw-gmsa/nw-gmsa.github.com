Profile:        Practitioner
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Practitioner
Id:             Practitioner
Title:          "Practitioner"
Description:    "Extension of UKCore Practitioner and includes elements from [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/volume-1.html)"

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
