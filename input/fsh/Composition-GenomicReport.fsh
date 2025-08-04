Profile:        Composition-GenomicReport
Parent:         http://hl7.org/fhir/StructureDefinition/Composition
Id:             Composition-GenomicReport
Title:          "Composition Genomic Report"
Description:    """
"""

* identifier 1..1 MS
* identifier only CorrelationIdentifier

* subject 1..1
* subject.reference 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber
* relatesTo.target[x] only Identifier or Reference(Composition)
* custodian.identifier only OrganisationCode

* type.coding ^slicing.discriminator[0].type = #value
* type.coding ^slicing.discriminator[=].path = "system"
* type.coding ^slicing.ordered = false
* type.coding ^slicing.rules = #closed
* type.coding contains
    SNOMED 0..* MS and
    LOINC 0..*

* type.coding[SNOMED].system = $sct
* type.coding[SNOMED].code = #1054161000000101
* type.coding[LOINC].system = $loinc
* type.coding[LOINC].code = #51969-4

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter.identifier only EpisodeNumber
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://nw-gmsa.github.io/ActorDefinition/AutomationManager)

* author only Reference(Practitioner or PractitionerRole)
* author.identifier only EnglandPractitionerIdentifier

* attester.party only Reference(Practitioner or PractitionerRole)
* attester.party.identifier only EnglandPractitionerIdentifier

* custodian only Reference(Organization)
* custodian.identifier only OrganisationCode

* section 1..* MS
* section.text 1..1 MS
* section.title 1..1
* section.code 1..1
* section.code from http://hl7.org/fhir/ValueSet/doc-section-codes
* section.code.coding 1..*
* section.code.coding.system 1..1
* section.code.coding.code 1..1


* section ^slicing.discriminator[0].type = #value
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.ordered = false
* section ^slicing.rules = #open
* section ^short = "Sections composing the report"
* section ^definition = "The root of the sections that make up the report."
* section.text 1.. MS
* section contains
    Order 0..* MS
    and Specimen 0..* MS
    and Report 0..* MS


* section[Order] ^short = "Laboratory Order"
* section[Order].title = "Laboratory Order"
* section[Order].code = $loinc#59772-4 	"Planned procedure Narrative"
* section[Order].entry ^short = "Order"
* section[Order].entry only Reference(ServiceRequest)

* section[Specimen] ^short = "Specimen"
* section[Specimen].title = "Specimen"
* section[Specimen].code = $loinc#59773-2 "Procedure specimens taken Narrative"
* section[Specimen].entry ^short = "Specimen"
* section[Specimen].entry only Reference(Specimen)

* section[Report] ^short = "Laboratory Report"
* section[Report].title = "Laboratory Report"
* section[Report].code = $loinc#81247-9
* section[Report].entry ^short = "Report"
* section[Report].entry only Reference(DiagnosticReport or DocumentReference)


* section[Report].section ^slicing.discriminator[0].type = #value
* section[Report].section ^slicing.discriminator[=].path = "code"
* section[Report].section ^slicing.ordered = false
* section[Report].section ^slicing.rules = #open
* section[Report].section ^short = "Sections composing the report"
* section[Report].section ^definition = "The root of the sections that make up the report."
* section[Report].section.text 1.. MS
* section[Report].section contains
    Overview 0..* MS

* section[Report].section[Overview] ^short = "Overview"
* section[Report].section[Overview].title = "Overview"
* section[Report].section[Overview].code = $loinc#81306-1
* section[Report].section[Overview].entry ^short = "Overview"
* section[Report].section[Overview].entry only Reference(Observation)
