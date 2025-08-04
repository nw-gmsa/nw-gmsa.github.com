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
    OverallStudy  0..* MS
    and DiscreteGeneticVariant 0..* MS
    and StructuralVariant 0..* MS
    and ComprehensiveVariant 0..* MS
    and PharmacogenomicsResult 0..* MS
    and HaplotypeDefinition 0..* MS


* section[Report].section[OverallStudy] ^short = "Overall study"
* section[Report].section[OverallStudy].title = "Overall study"
* section[Report].section[OverallStudy].code = $loinc#81306-1
* section[Report].section[OverallStudy].entry only Reference(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication)

* section[Report].section[DiscreteGeneticVariant] ^short = "Discrete genetic variant"
* section[Report].section[DiscreteGeneticVariant].title = "Discrete genetic variant"
* section[Report].section[DiscreteGeneticVariant].code = $loinc#81250-3
* section[Report].section[DiscreteGeneticVariant].entry only Reference(ObservationVariant or Observation-DiagnosticImplication or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication)

* section[Report].section[StructuralVariant] ^short = "Structural Variant"
* section[Report].section[StructuralVariant].title = "Structural Variant"
* section[Report].section[StructuralVariant].code = $loinc#81297-4

* section[Report].section[ComprehensiveVariant] ^short = "Comprehensive Variant"
* section[Report].section[ComprehensiveVariant].title = "Comprehensive Variant"
* section[Report].section[ComprehensiveVariant].code = $loinc#81251-1
* section[Report].section[ComprehensiveVariant].entry only Reference(Observation-DiagnosticImplication or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication)

* section[Report].section[PharmacogenomicsResult] ^short = "Pharmacogenomics Result"
* section[Report].section[PharmacogenomicsResult].title = "Pharmacogenomics Result"
* section[Report].section[PharmacogenomicsResult].code = $loinc#82118-1
* section[Report].section[PharmacogenomicsResult].entry only Reference(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genotype or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/therapeutic-implication)

* section[Report].section[HaplotypeDefinition] ^short = "Haplotype Definition"
* section[Report].section[HaplotypeDefinition].title = "Haplotype Definition"
* section[Report].section[HaplotypeDefinition].code = $loinc#83011-7
* section[Report].section[HaplotypeDefinition].entry only Reference(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/haplotype)
