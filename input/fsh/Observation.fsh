Profile:        Observation
Parent:         http://hl7.eu/fhir/base/StructureDefinition/medicalTestResult-eu-core
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab
Id:             Observation
Title:          "Observation"
Description:    """
`Diagnostic - Core`
"""

//* ^keyword[+] = #core "Core"
//* ^keyword[+] = #patientcare "Patient Care"
//* ^keyword[+] = #diagnostics "Diagnostics"

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category code pattern"
* category ^slicing.ordered = false

* category contains labCategory 0..1
                and geCategory 0..1
* category[labCategory].coding 1..1
* category[labCategory].coding = $OBSCAT#laboratory
* category[geCategory].coding 1..1
* category[geCategory].coding = $DIAGNOSTICSERVICE#GE

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

//* value[x].extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.value named value-r5 0..1
//* value[x].extension[value-r5]
//  * value[x] only Attachment
//  * ^short = "only for result of type Attachment"

* effective[x] ^short = "Clinically relevant time/time-period for observation (HL7 v2 OBX-14)"
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* valueCodeableConcept MS
* valueQuantity MS
* valueDateTime MS
* valueString MS

// This is not used at present
// * valueString.extension contains http://hl7.org/fhir/StructureDefinition/rendering-markdown named valueMarkdown 0..*

* referenceRange MS

* derivedFrom ^slicing.discriminator.type = #profile
* derivedFrom ^slicing.discriminator.path = "resolve()"
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Slice based on the reference profile pattern"


