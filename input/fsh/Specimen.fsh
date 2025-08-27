Profile:        Specimen
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Specimen
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Specimen-eu-lab
Id:             Specimen
Title:          "Specimen"
Description:    """
**HL7 v2** [SPM](hl7v2.html#spm) *mapping* [SPM to Specimen](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html)

Reference:
- [NHS England Genomics Specimen](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-Specimen) use text descriptions only, not the rendered profile.
- [HL7 Europe Laboratory Report - Specimen: Laboratory](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Specimen-eu-lab.html)
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier


* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the type"
* identifier ^slicing.ordered = false
* identifier contains
  PlacerSpecimenNumber 0..1 MS and FillerSpecimenNumber 0..1 MS and ShipmentTrackingNumber 0..1 MS

* identifier[PlacerSpecimenNumber].type = $v2-0203#PLAC
* identifier[PlacerSpecimenNumber] ^short = "Identifier assigned by the Order Placer."
* identifier[PlacerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* identifier[PlacerSpecimenNumber] insert Obligation(#SHALL:populate, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* identifier[PlacerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* identifier[FillerSpecimenNumber].type = $v2-0203#FILL
* identifier[FillerSpecimenNumber] ^short = "Identifier assigned by the lab (Order Filler)"
* identifier[FillerSpecimenNumber] insert Obligation(#SHALL:populate, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* identifier[FillerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* identifier[FillerSpecimenNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* identifier[ShipmentTrackingNumber] only ShipmentTrackingNumber
* identifier[ShipmentTrackingNumber] ^short = "Identifier assigned by the Order Placer"
* identifier[ShipmentTrackingNumber] insert Obligation(#SHOULD:populate, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* identifier[ShipmentTrackingNumber] insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* identifier[ShipmentTrackingNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)


* accessionIdentifier 0..1 MS
* accessionIdentifier only AccessionNumber

* subject 1..1 MS
* subject only Reference(Patient)

* collection.collected[x] only dateTime
* collection.collectedDateTime 0..1 MS

* type MS
* type from SpecimenType (required)

* collection.collector 0..1 MS
* collection.collector only Reference(PractitionerRole)

* collection.bodySite MS

* collection.quantity MS
