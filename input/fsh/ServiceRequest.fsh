Profile:        ServiceRequest
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-ServiceRequest
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    """
DRAFT Extension of UKCore-ServiceRequest which includes constraints from:
- [NHS England Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-ServiceRequest) use text descriptions only, not the rendered profile.

"""


* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  accessionNumber 0..1 MS and placerOrderNumber 0..1 MS

* identifier[placerOrderNumber] only OrderPlacerNumber
* identifier[placerOrderNumber] ^short = "Identifier assigned by the Order Filler, HL7 v2 ORC-2 Order Placer Number. Mandatory for Order Placer"
* identifier[placerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://hl7.mft.nhs.uk/ActorDefinition/OrderFiller)
* identifier[placerOrderNumber] insert Obligation(#SHALL:populate, https://hl7.mft.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[placerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://hl7.mft.nhs.uk/ActorDefinition/AutomationManager)
* identifier[accessionNumber] only AccessionNumber
* identifier[accessionNumber] ^short = "Identifier assigned by the lab, HL7 v2 ORC-3 Order Filler Number. Mandatory for Order Placer"
* identifier[accessionNumber] insert Obligation(#SHALL:populate, https://hl7.mft.nhs.uk/ActorDefinition/OrderFiller)
* identifier[accessionNumber] insert Obligation(#SHOULD:populate-if-known, https://hl7.mft.nhs.uk/ActorDefinition/OrderPlacer)
* identifier[accessionNumber] insert Obligation(#SHOULD:populate-if-known, https://hl7.mft.nhs.uk/ActorDefinition/AutomationManager)


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


* category 1..* MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the coding.system"
* category ^slicing.ordered = false
* category contains
  GenomicProcedure 1..1 MS

* category[GenomicProcedure].coding.code = #116148004
* category[GenomicProcedure].coding.system = $sct

* category[genomicsWholeCaseSequencing] MS

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
* basedOn only Reference(ServiceRequest)
* basedOn.identifier only CorrelationIdentifier

* note MS

* supportingInfo 0..* MS
* supportingInfo only Reference(ObservationPanel or Observation or Condition or FamilyMemberHistory or Procedure)
