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


