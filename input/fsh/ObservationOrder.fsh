Profile:        ObservationOrder
Parent:         http://hl7.org/fhir/StructureDefinition/Observation
Id:             ObservationOrder
Title:          "Observation Order"
Description:    """
`Diagnostic - Core` for use with test orders. Does not define categories
"""

//* ^keyword[+] = #core "Core"
//* ^keyword[+] = #patientcare "Patient Care"
//* ^keyword[+] = #diagnostics "Diagnostics"


* identifier 1..* MS

* performer only Reference(PractitionerRole)

* status ^short = "Observation Status  (HL7 v2 OBX-11)"

* subject only Reference(Patient)
* subject 1..1 MS
* subject.reference 1..1 MS
* subject.identifier only NHSIdentifier

* encounter 0..1 MS
//* encounter only Reference(Encounter)
* encounter.identifier only CorrelationIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* code ^short = "The type of observation (code / type). (HL7 v2 OBX-3)"

* value[x] ^short = "Actual result (HL7 v2 OBX-5)"

* effective[x] ^short = "Clinically relevant time/time-period for observation (HL7 v2 OBX-14)"
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* valueCodeableConcept MS
* valueQuantity MS
* valueDateTime MS
* valueString MS

//* valueString.extension contains http://hl7.org/fhir/StructureDefinition/rendering-markdown named valueMarkdown 0..*


* derivedFrom ^slicing.discriminator.type = #profile
* derivedFrom ^slicing.discriminator.path = "resolve()"
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Slice based on the reference profile pattern"
