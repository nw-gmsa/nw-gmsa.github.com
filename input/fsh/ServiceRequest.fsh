Profile:        ServiceRequest
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-ServiceRequest
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    "Initial elaboration"

* code ^short = "ISSUE. See [National Genomic Test Directory](https://www.england.nhs.uk/wp-content/uploads/2018/08/rare-and-inherited-disease-eligibility-criteria-v2.pdf)."
* code 1..1 MS

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 1..1 MS

* identifier[accessionNumber] only AccessionNumber

* category ^short = "ISSUE. Additionally should include high level category either SCT 108252007 Laboratory procedure or child code 116148004 Molecular genetics procedure"

