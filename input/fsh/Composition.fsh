Profile:        Composition
Parent:         http://hl7.org/fhir/StructureDefinition/Composition
Id:             Composition
Title:          "Composition"
Description:    "Placeholder for EU Lab Composition (and so IPS Composition)"

* subject 1..1
* subject.reference 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber
* relatesTo.target[x] only Identifier or Reference(Composition)
* custodian.identifier only OrganisationCode

* section 1.. MS
* section.text 1.. MS
* section.section ..0
* section.title 1..1
* section.code 1..1
* section.code from http://hl7.org/fhir/ValueSet/doc-section-codes
* section.code.coding 1..*
* section.code.coding.system 1..1
* section.code.coding.code 1..1

* section ^slicing.discriminator[0].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.ordered = false
* section ^slicing.rules = #open
* section ^short = "Sections composing the report"
* section ^definition = "The root of the sections that make up the composition."
* section.text 1.. MS
* section.section ..0
