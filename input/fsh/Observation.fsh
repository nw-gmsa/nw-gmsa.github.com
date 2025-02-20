Profile:        Observation
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Observation
Id:             Observation
Title:          "Observation"
Description:    "DRAFT Extension of UKCore-Observation"



* performer only Reference(PractitionerRole or Patient)

* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSNumber
