Profile:        ServiceRequest
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-ServiceRequest
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/ServiceRequest-eu-lab
Id:             ServiceRequest
Title:          "ServiceRequest"
Description:    """
Includes constraints from:
- [NHS England Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-ServiceRequest) use text descriptions only, not the rendered profile.

See also [HL7 Europe Laboratory Report - ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
"""

//* extension[additionalContact] ^short = "Do not use, not supported. Use PractitionerRole instead."

* identifier 1..* MS
* identifier only CorrelationIdentifier

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  placerOrderNumber 0..1 MS and fillerOrderNumber 0..1 MS

* identifier[placerOrderNumber] only PlacerOrderNumber
* identifier[placerOrderNumber] ^short = "Identifier assigned by the Order Placer. (HL7 v2 ORC-2/OBR-2 Placer Order Number)"
* identifier[placerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* identifier[placerOrderNumber] insert Obligation(#SHALL:populate, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* identifier[placerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)
* identifier[fillerOrderNumber] only FillerOrderNumber
* identifier[fillerOrderNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[fillerOrderNumber] insert Obligation(#SHALL:populate, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* identifier[fillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* identifier[fillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* requisition only PlacerGroupNumber
* requisition ^short = "G Number (Pedigree Number) used to identify a family across a series of orders. Identifier assigned by the Order Placer. (HL7 v2 ORC-4 Placer Group Number)"
* requisition insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* requisition insert Obligation(#SHALL:populate, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* requisition insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

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
  // and PathologyAndLaboratoryMedicine 0..1 and NICIP 0..1

* code.coding[GenomicTestDirectory] ^short = "Genomic Cancer Test Directory"
* code.coding[GenomicTestDirectory].system = $GTD

* orderDetail ^short = "Additional order codes"

* orderDetail 0..* MS

* orderDetail.coding 1..* MS
* orderDetail.coding ^slicing.discriminator.type = #value
* orderDetail.coding ^slicing.discriminator.path = "system"
* orderDetail.coding ^slicing.rules = #open
* orderDetail.coding ^slicing.description = "Slice based on the system"
* orderDetail.coding ^slicing.ordered = false
* orderDetail.coding contains
  GenomicTestDirectory 1..1 MS

* orderDetail.coding[GenomicTestDirectory] ^short = "Genomic Test Directory"
* orderDetail.coding[GenomicTestDirectory].system = $GTD


* category 1..* MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the coding.system"
* category ^slicing.ordered = false
* category contains
  GenomicProcedure 1..1 MS and GenomicsWholeCaseSequencing 0..1 MS


* category[GenomicProcedure].coding.code = #116148004
* category[GenomicProcedure].coding.system = $sct

* category[GenomicsWholeCaseSequencing] 0..1 MS
* category[GenomicsWholeCaseSequencing].coding.system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory"

* encounter 0..1 MS
* encounter ^short = "A reference identifier to the episode/stay/visit number in which the request was created. (HL7 v2 PV1-19)"
* encounter only Reference(Encounter)
* encounter.identifier only EpisodeNumber
* encounter.identifier 0..1 MS
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* requester 1..1 MS
* requester only Reference(PractitionerRole)

* performer only Reference(Organization)
* performer.identifier only OrganisationCode

* authoredOn 1..1 MS

* occurrence[x] 0..1 MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* basedOn 0..* MS
* basedOn ^short = "SHALL reference a parent request where this ServiceRequest is based on a previous request, e.g. in the case of reanalysis and cascade testing, or Germline Late tests in the Tumour First/Germline Late scenario"
* basedOn only Reference(ServiceRequest)
* basedOn.identifier only CorrelationIdentifier

* priority from RequestPriority (required)

* note MS


* reasonCode MS
* reasonCode from GenomicConditionCode (preferred)

* supportingInfo 0..* MS
* supportingInfo only Reference(ObservationPanel or Observation or DiagnosticReport or QuestionnaireResponse or DocumentReference)

* supportingInfo ^slicing.discriminator.type = #value
* supportingInfo ^slicing.discriminator.path = "type"
* supportingInfo ^slicing.rules = #open
* supportingInfo ^slicing.description = "Slice based on the coding.system"
* supportingInfo ^slicing.ordered = false
* supportingInfo contains
  PriorResult 0..1 MS and PatientSummary 0..1 MS

* supportingInfo[PriorResult] ^short = "Equivalent of HL7 v2 OML_O21 PRIOR RESULT (as PDF)"
* supportingInfo[PriorResult] only Reference(DiagnosticReport)
* supportingInfo[PriorResult].type = #DiagnosticReport
* supportingInfo[PriorResult].identifier 1..1 MS
* supportingInfo[PriorResult].identifier only CorrelationIdentifier

* supportingInfo[PatientSummary] only Reference(DocumentReference)
* supportingInfo[PatientSummary].type = #DocumentReference
