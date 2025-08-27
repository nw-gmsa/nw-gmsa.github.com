Profile:        ObservationVariant
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id:             Observation-Variant
Title:          "Observation Variant"
Description:    """
Reference:
- part of [openEHR Genomic Variant Result](https://ckm.openehr.org/ckm/archetypes/1013.1.3759)
- [NHS England Genomics Education - Visual communication aid: Variants of uncertain significance (VUS)](https://www.genomicseducation.hee.nhs.uk/genotes/knowledge-hub/visual-communication-aid-variants-of-uncertain-significance-vus/)
"""

* identifier 1..* MS

* performer only Reference(PractitionerRole or Patient)

* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSNumber

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter.identifier only CorrelationIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* effective[x] ^short = "Clinically relevant time/time-period for observation (HL7 v2 OBX-14)"
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* code MS
* valueCodeableConcept MS
* method MS
* component[allelic-state] MS
* component[representative-coding-hgvs] MS
* component[genomic-ref-seq] MS

