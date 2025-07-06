Profile:        DiagnosticReport
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DiagnosticReport
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/DiagnosticReport-eu-lab
//Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-report
Id:             DiagnosticReport
Title:          "Diagnostic Report"
Description:    """
Includes constraints from:
- [NHS England Genomics DiagnosticReport](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-DiagnosticReport) use text descriptions only, not the rendered profile.

See also [HL7 Europe Laboratory Report - DiagnosticReport: Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-DiagnosticReport-eu-lab.html)
"""

// https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGGeneral.fsh

//* extension contains http://hl7.org/fhir/StructureDefinition/workflow-supportingInfo named supporting-info 0..1

* identifier 1..* MS
* identifier only CorrelationIdentifier

* basedOn only CodeableReference
* basedOn.identifier 1..1 MS
* basedOn.identifier only CorrelationIdentifier

* basedOn ^slicing.discriminator.type = #value
* basedOn ^slicing.discriminator.path = "identifier.type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  fillerOrderNumber 0..1 MS and accessionNumber 0..1 MS

* basedOn[accessionNumber] ^short = "Identifier assigned by the lab"
* basedOn[accessionNumber].type 1..1 MS
* basedOn[accessionNumber].type = "ServiceRequest"
* basedOn[accessionNumber].identifier 1..1
* basedOn[accessionNumber].identifier only AccessionNumber

* basedOn[fillerOrderNumber] ^short = "Identifier assigned by the lab (ORC-3)"
* basedOn[fillerOrderNumber].type 1..1 MS
* basedOn[fillerOrderNumber].type = "ServiceRequest"
* basedOn[fillerOrderNumber].identifier 1..1
* basedOn[fillerOrderNumber].identifier only FillerOrderNumber
* basedOn[fillerOrderNumber] insert Obligation(#SHALL:populate, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* basedOn[fillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* basedOn[fillerOrderNumber] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)


* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category code pattern"
* category ^slicing.ordered = false
* category contains Genetics 1..1

* category[Genetics].coding 1..1 MS

* subject 1..1
* subject.identifier 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* effectiveDateTime 0..1 MS
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* effective[x] insert Obligation(#SHOULD:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* issued 0..1

* encounter 0..1 MS
* encounter ^short = "A reference identifier to the episode/stay/visit number in which the report was created. (HL7 v2 PV1-19)"
* encounter only Reference(Encounter)
* encounter.identifier only EpisodeNumber
* encounter.identifier ^short = "(HL7v2 PV1-19 Visit Number from OML_O21)"
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderPlacer)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

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

* code.coding[GenomicTestDirectory] ^short = "Genomic Test Directory"
* code.coding[GenomicTestDirectory].system = $GTD

* performer.identifier 1..1
* performer.identifier.system 1..1
* performer.identifier.value 1..1
* performer.type 1..1
* performer.extension contains
      http://hl7.org/fhir/StructureDefinition/event-performerFunction named performerFunction 0..1
* performer only Reference(Practitioner or Organization)

* performer ^slicing.discriminator.type = #pattern
* performer ^slicing.discriminator.path = "type"
* performer ^slicing.rules = #open
* performer ^slicing.description = "Slice based on the type"
* performer ^slicing.ordered = false
* performer contains
  organisation 1..1 and operator 0..*

* performer[organisation].identifier only OrganisationCode
* performer[organisation].type = #Organization

* performer[operator].identifier only EnglandPractitionerIdentifier
* performer[operator].extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF
* performer[operator].type = #Practitioner

* resultsInterpreter.identifier 1..1
* resultsInterpreter.identifier.system 1..1
* resultsInterpreter.identifier.value 1..1
* resultsInterpreter.type 1..1
* resultsInterpreter only Reference(Practitioner or PractitionerRole)

* resultsInterpreter ^slicing.discriminator.type = #value
* resultsInterpreter ^slicing.discriminator.path = "type"
* resultsInterpreter ^slicing.rules = #open
* resultsInterpreter ^slicing.description = "Slice based on the type"
* resultsInterpreter ^slicing.ordered = false
* resultsInterpreter contains
  primaryReporter 0..*

* resultsInterpreter[primaryReporter].identifier only EnglandPractitionerIdentifier
* resultsInterpreter[primaryReporter].type = #Practitioner

* specimen 0..* MS


* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "resolve()"
* result ^slicing.rules = #open
* result ^slicing.description = "Slice based on the reference profile and code pattern"
* result contains
    diagnostic-implication 0..* and
    variant 0..*

* result[variant] MS
* result[variant] only Reference(ObservationVariant)
* result[diagnostic-implication] MS
* result[diagnostic-implication] only Reference(ObservationDiagnosticImplication)

* presentedForm 1..* MS
* presentedForm ^short = "a reference to the full report (presentedForm)"
* presentedForm only NWAttachment
