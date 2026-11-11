Profile:        CompositionGenomicReport
//Parent:         http://hl7.org/fhir/StructureDefinition/Composition
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Composition-eu-lab
Id:             Composition-GenomicReport
Title:          "Composition Genomic Report"
Description:    """
`Diagnostic - Laboratory`
"""


* identifier 1..1 MS
* identifier only CorrelationIdentifier

* subject 1..1
* subject.reference 1..1
//* subject only Reference(http://hl7.eu/fhir/laboratory/StructureDefinition/Patient-eu-lab)
* subject.identifier only NHSIdentifier
* relatesTo.target[x] only Identifier or Reference(Composition)
* custodian.identifier only OrganisationCode

* type.coding ^slicing.discriminator[0].type = #value
* type.coding ^slicing.discriminator[=].path = "system"
* type.coding ^slicing.ordered = false
* type.coding ^slicing.rules = #open
* type.coding contains
    UKCoreReportCode 0..* MS and
    LOINC 0..*

* type.coding[UKCoreReportCode].system = $sct
* type.coding[UKCoreReportCode] from ReportType (required)

* type.coding[LOINC].system = $loinc
* type.coding[LOINC].code = #51969-4

* encounter 0..1 MS
* encounter only Reference(HospitalSpell or Visit)
* encounter.identifier only CorrelationIdentifier
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/OrderFiller)
* encounter.identifier insert Obligation(#SHALL:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/AutomationManager)

* author only Reference(Practitioner or Organization or PractitionerRole)
//* author.identifier only PractitionerIdentifier

// ACGS 3: the report must indicate that it has been authorised
* attester 1..* MS
* attester ^short = "Authorisation of the report (ACGS 3)"
* attester.party only Reference(Practitioner or PractitionerRole)
* attester.party.identifier only PractitionerIdentifier

* custodian only Reference(Organization)
//* custodian.identifier only OrganisationCode

* section 1..*
//* section.text MS
* section.title 1..1
* section.code 1..1
//* section.code from http://hl7.org/fhir/ValueSet/doc-section-codes
* section.code.coding 1..*
* section.code.coding.system 1..1
* section.code.coding.code 1..1


// Required sections carry ACGS General Genetic Laboratory Reporting Recommendations 'must' requirements:
// Referral 2.5.2, Specimen 2.4, ResultSummary 2.1, Results 2.5.3, Interpretation 2.5.6, Methodology 2.5.5.
// Recommendations carries 'should' requirements (2.5.8, 2.5.11, 2.5.12) only.
* section contains
    Referral 1..1 MS
    and Specimen 1..1 MS
    and ResultSummary 1..1 MS
    and Results 1..* MS
    and Interpretation 1..1 MS
    and Recommendations 0..1 MS
    and Methodology 1..1 MS
    and PresentedForm 0..* MS

// Inferred layout - see Document Layout on the profile page. Section titles are not fixed, so a laboratory can use its own headings.

* section[Referral] ^short = "Referral"
* section[Referral] ^definition = "Reason for referral (clinical indication) and the National Genomic Test Directory test requested"
* section[Referral].code = $loinc#42349-1 "Reason for referral (narrative)"
* section[Referral].entry only Reference(ServiceRequest or Condition)

* section[Specimen] ^short = "Specimen"
* section[Specimen] ^definition = "Sample type, collection and receipt dates"
* section[Specimen].code = $sct#123038009 "Specimen"
* section[Specimen].entry only Reference(Specimen)

* section[ResultSummary] ^short = "Result summary"
* section[ResultSummary] ^definition = "The headline result, shown first on the report"
* section[ResultSummary].code = $loinc#51968-6 "Discrete variation analysis overall interpretation"
* section[ResultSummary].entry only Reference(DiagnosticReport)

* section[Results] ^short = "Results"
* section[Results] ^definition = "The reported variants, genotypes, haplotypes and biomarkers (the variant table)"
* section[Results].code = $loinc#69548-6 "Genetic variant assessment"
* section[Results].entry only Reference(Variant or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis or MolecularConsequence)

// Optional sub-sections following the groups of the Master HL7 genetic variant reporting panel (LOINC 81247-9). Only the groups that apply to the test are included.

* section[Results].section ^slicing.discriminator[0].type = #pattern
* section[Results].section ^slicing.discriminator[=].path = "$this.code"
* section[Results].section ^slicing.ordered = false
* section[Results].section ^slicing.rules = #open
// Constraining the sub-section's own elements unfolds Composition.section.section (a contentReference), so sub-sections validate before slice matching
* section[Results].section.title 1..1
* section[Results].section.code 1..1
* section[Results].section contains
    SimpleVariants 0..1 MS
    and StructuralVariants 0..1 MS
    and ComplexVariants 0..1 MS
    and Pharmacogenomics 0..1 MS
    and HaplotypeDefinitions 0..1 MS

* section[Results].section[SimpleVariants] ^short = "Simple variants"
* section[Results].section[SimpleVariants] ^definition = "Simple variants, such as single nucleotide changes and small insertions or deletions"
* section[Results].section[SimpleVariants].code = $loinc#81250-3
* section[Results].section[SimpleVariants].entry only Reference(Variant)

* section[Results].section[StructuralVariants] ^short = "Structural variants"
* section[Results].section[StructuralVariants] ^definition = "Structural variants, such as copy number changes, with their ISCN or HGVS name"
* section[Results].section[StructuralVariants].code = $loinc#81297-4
* section[Results].section[StructuralVariants].entry only Reference(Variant)

* section[Results].section[ComplexVariants] ^short = "Complex variants"
* section[Results].section[ComplexVariants] ^definition = "Complex variants, such as compound heterozygous variants or haplotypes, with the simple variants that make them up"
* section[Results].section[ComplexVariants].code = $loinc#81251-1
* section[Results].section[ComplexVariants].entry only Reference(Variant)

* section[Results].section[Pharmacogenomics] ^short = "Pharmacogenomics"
* section[Results].section[Pharmacogenomics] ^definition = "Pharmacogenomic genotypes. The medication implications belong in the Interpretation section"
* section[Results].section[Pharmacogenomics].code = $loinc#82118-1
* section[Results].section[Pharmacogenomics].entry only Reference(Genotype)

* section[Results].section[HaplotypeDefinitions] ^short = "Haplotype definitions"
* section[Results].section[HaplotypeDefinitions] ^definition = "Haplotypes and the variants that define them"
* section[Results].section[HaplotypeDefinitions].code = $loinc#83011-7
* section[Results].section[HaplotypeDefinitions].entry only Reference(Haplotype)

* section[Interpretation] ^short = "Interpretation"
* section[Interpretation] ^definition = "Interpretation of the results, including diagnostic and therapeutic implications"
* section[Interpretation].code = GenomicReportSection#interpretation
* section[Interpretation].entry only Reference(DiagnosticImplication or TherapeuticImplication)

* section[Recommendations] ^short = "Recommendations"
* section[Recommendations] ^definition = "Recommended actions, for example testing of relatives or further tests"
* section[Recommendations].code = $loinc#62385-0 "Recommendation [Interpretation] Document"
* section[Recommendations].entry only Reference(http://hl7.org/fhir/StructureDefinition/Task or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://hl7.org/fhir/StructureDefinition/Observation)

* section[Methodology] ^short = "Methodology and limitations"
* section[Methodology] ^definition = "Genes or regions studied, technology, coverage and limitations"
* section[Methodology].code = GenomicReportSection#methodology
* section[Methodology].entry only Reference(GenomicStudyPanel or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study or http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis)

* section[PresentedForm] ^short = "Presented form"
* section[PresentedForm] ^definition = "The authorised report as a PDF, while the PDF remains the authorised report"
* section[PresentedForm].code = $loinc#77599-9 "Additional documentation"
* section[PresentedForm].entry 1..*
* section[PresentedForm].entry only Reference(http://hl7.org/fhir/StructureDefinition/DocumentReference or http://hl7.org/fhir/StructureDefinition/Binary)
