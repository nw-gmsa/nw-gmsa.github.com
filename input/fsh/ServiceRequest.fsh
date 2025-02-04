Profile:        ServiceRequest
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-ServiceRequest
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    "Initial elaboration"

* code ^short = "ISSUE. See [National Genomic Test Directory](https://www.england.nhs.uk/wp-content/uploads/2018/08/rare-and-inherited-disease-eligibility-criteria-v2.pdf)."
* code 1..1 MS

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 1..1 MS

* identifier[accessionNumber] only AccessionNumber

* category ^short = "ISSUE. Additionally should include high level category either SCT 108252007 Laboratory procedure or child code 116148004 Molecular genetics procedure"

* requester 1..1 MS
* requester ^short = "ISSUE. If using national identifier, the reference could be omitted."
* requester only Reference(Practitioner)
* requester.identifier only EnglandPractitionerIdentifier

* authoredOn 1..1 MS

* subject only Reference(Patient)

* basedOn 0..* MS
* basedOn ^short = "SHALL reference a parent request where this ServiceRequest is based on a previous request, e.g. in the case of reanalysis and cascade testing, or Germline Late tests in the Tumour First/Germline Late scenario"
* note MS

* supportingInfo ^short = "ISSUE. National programme is not suporting panels, this may result in transformation issues."
* supportingInfo 1..* MS
* supportingInfo ^slicing.discriminator.type = #pattern
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the type"
* supportingInfo ^slicing.ordered = false
* supportingInfo contains
  TestOrderForm 1..1 MS

* supportingInfo[TestOrderForm] only Reference(ObservationPanel)
