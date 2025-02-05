Profile:        DiagnosticReport
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DiagnosticReport
Id:             DiagnosticReport
Title:          "Diagnostic Report"
Description:    """
DRAFT Extension of [UK Core DiagnosticReport](https://simplifier.net/hl7fhirukcorer4/ukcore-diagnosticreport) which includes constraints from:
- [NHS England Genomics DiagnosticReport](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-DiagnosticReport) use text descriptions only, not the rendered profile.
"""

* extension[supportingInfoR5] 0..0
* extension[compositionReferenceR5] 0..0

* identifier 1..* MS

* basedOn ^slicing.discriminator.type = #value
* basedOn ^slicing.discriminator.path = "type"
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the type"
* basedOn ^slicing.ordered = false
* basedOn contains
  accessionNumber 0..1 MS

* basedOn[accessionNumber] ^short = "Identifier assigned by the lab, HL7 v2 ORC-3 Order Filler Number"
* basedOn[accessionNumber].type 1..1 MS
* basedOn[accessionNumber].type = "ServiceRequest"
* basedOn[accessionNumber].identifier 1..1
* basedOn[accessionNumber].identifier only AccessionNumber

* subject 1..1
* subject.identifier 1..1
* subject only Reference(Patient)

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
* resultsInterpreter only Reference(Practitioner)

* resultsInterpreter ^slicing.discriminator.type = #value
* resultsInterpreter ^slicing.discriminator.path = "type"
* resultsInterpreter ^slicing.rules = #open
* resultsInterpreter ^slicing.description = "Slice based on the type"
* resultsInterpreter ^slicing.ordered = false
* resultsInterpreter contains
  primaryReporter 0..*

* resultsInterpreter[primaryReporter].identifier only EnglandPractitionerIdentifier
* resultsInterpreter[primaryReporter].type = #Practitioner
