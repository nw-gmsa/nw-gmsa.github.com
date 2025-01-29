Profile:        ServiceRequest
Parent:         https://fhir.nhs.uk/StructureDefinition/NHSDigital-ServiceRequest-Genomics
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    "TODO just a collection of notes."

* code ^short = "TODO"

* identifier 1..1 MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 1..1 MS

* identifier[accessionNumber] only AccessionNumber
