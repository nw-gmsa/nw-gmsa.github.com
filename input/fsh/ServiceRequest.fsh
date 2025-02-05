Profile:        ServiceRequest
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-ServiceRequest
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    """
DRAFT Extension of UKCore-ServiceRequest which includes constraints from:
- [NHS England Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-ServiceRequest) use text descriptions only, not the rendered profile.

"""

* code ^short = "ISSUE. See [National Genomic Test Directory](https://www.england.nhs.uk/wp-content/uploads/2018/08/rare-and-inherited-disease-eligibility-criteria-v2.pdf)."
* code 1..1 MS

* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Slice based on the system"
* code.coding ^slicing.ordered = false
* code.coding contains
  GenomicTestDirectory 1..1 MS

* code.coding[GenomicTestDirectory] from GenomicTestDirectory (required)
* code.coding[GenomicTestDirectory].system = "https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory"

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 0..1 MS and placerOrderNumber 0..1

* identifier[placerOrderNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[placerOrderNumber] ^short = "Identifier assigned by the Order Filler, HL7 v2 ORC-2 Order Placer Number. Mandatory for Order Placer"
* identifier[accessionNumber] only AccessionNumber
* identifier[accessionNumber] ^short = "Identifier assigned by the lab, HL7 v2 ORC-3 Order Filler Number. Mandatory for Order Placer"

* category ^short = "ISSUE. Additionally should include high level category either SCT 108252007 Laboratory procedure or child code 116148004 Molecular genetics procedure"

* encounter only Reference(Encounter)

* requester 1..1 MS
* requester ^short = "ISSUE: If using national identifier, the reference could be omitted (see comments in Practitioner. \nISSUE: NHS England GOMS is requiring a PractitionerRole (combination of ORC-12 and ORC-21, HL7 v2 mapping is saying Practitioner"
* requester only Reference(PractitionerRole)

* performer only Reference(Organization)
* performer.identifier only OrganisationCode

* authoredOn 1..1 MS

* occurrenceDateTime 0..1 MS

* subject only Reference(Patient)

* basedOn 0..* MS
* basedOn ^short = "SHALL reference a parent request where this ServiceRequest is based on a previous request, e.g. in the case of reanalysis and cascade testing, or Germline Late tests in the Tumour First/Germline Late scenario"
* note MS

* supportingInfo ^short = "ISSUE. National programme is not suporting panels, this may result in transformation issues."
* supportingInfo 1..* MS
* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the type"
* supportingInfo ^slicing.ordered = false
* supportingInfo contains
  TestOrderForm 1..1 MS

* supportingInfo[TestOrderForm] only Reference(ObservationPanel)
  * type = "QuestionnaireResponse"
