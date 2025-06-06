Profile:        DiagnosticImplication
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/diagnostic-implication
Id:             DiagnosticImplication
Title:          "Diagnostic Implication"
Description:    """
Reference: 
- part of [openEHR Genomic Variant Result](https://ckm.openehr.org/ckm/archetypes/1013.1.3759)
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
* derivedFrom[variant] MS
* derivedFrom[variant] only Reference(Variant)
* component[predicted-phenotype] MS
* component[clinical-significance] MS
