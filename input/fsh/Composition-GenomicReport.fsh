Profile:        CompositionGenomicReport
//Parent:         http://hl7.org/fhir/StructureDefinition/Composition
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Composition-eu-lab
Id:             Composition-GenomicReport
Title:          "Composition Genomic Report"
Description:    """
`Diagnostic - Laboratory`
"""

* extension[diagnosticReport]
  * valueReference.reference = "urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3"

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


* section contains
    Referral 0..1 MS
    and Specimen 0..1 MS
    and ResultSummary 0..1 MS
    and Results 0..* MS
    and Interpretation 0..1 MS
    and Recommendations 0..1 MS
    and Methodology 0..1 MS
    and PresentedForm 0..* MS

// Inferred layout - see Document Layout on the profile page. Section titles are not fixed, so a laboratory can use its own headings.

* section[Referral] ^short = "Referral"
* section[Referral] ^definition = "Reason for referral (clinical indication) and the National Genomic Test Directory test requested"
* section[Referral].code = $loinc#42349-1 "Reason for referral (narrative)"
* section[Referral].entry only Reference(http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://hl7.org/fhir/StructureDefinition/Condition or http://hl7.org/fhir/StructureDefinition/Observation)

* section[Specimen] ^short = "Specimen"
* section[Specimen] ^definition = "Sample type, collection and receipt dates"
* section[Specimen].code = $sct#123038009 "Specimen"
* section[Specimen].entry only Reference(http://hl7.org/fhir/StructureDefinition/Specimen)

* section[ResultSummary] ^short = "Result summary"
* section[ResultSummary] ^definition = "The headline result, shown first on the report"
* section[ResultSummary].code = $loinc#51968-6 "Discrete variation analysis overall interpretation"
* section[ResultSummary].entry only Reference(http://hl7.org/fhir/StructureDefinition/DiagnosticReport or http://hl7.org/fhir/StructureDefinition/Observation)

* section[Results] ^short = "Results"
* section[Results] ^definition = "The reported variants, genotypes, haplotypes and biomarkers (the variant table)"
* section[Results].code = $loinc#69548-6 "Genetic variant assessment"
* section[Results].entry only Reference(http://hl7.org/fhir/StructureDefinition/Observation)

* section[Interpretation] ^short = "Interpretation"
* section[Interpretation] ^definition = "Interpretation of the results, including diagnostic and therapeutic implications"
* section[Interpretation].code = GenomicReportSection#interpretation
* section[Interpretation].entry only Reference(http://hl7.org/fhir/StructureDefinition/Observation or http://hl7.org/fhir/StructureDefinition/Condition)

* section[Recommendations] ^short = "Recommendations"
* section[Recommendations] ^definition = "Recommended actions, for example testing of relatives or further tests"
* section[Recommendations].code = $loinc#62385-0 "Recommendation [Interpretation] Document"
* section[Recommendations].entry only Reference(http://hl7.org/fhir/StructureDefinition/Task or http://hl7.org/fhir/StructureDefinition/ServiceRequest or http://hl7.org/fhir/StructureDefinition/Observation)

* section[Methodology] ^short = "Methodology and limitations"
* section[Methodology] ^definition = "Genes or regions studied, technology, coverage and limitations"
* section[Methodology].code = GenomicReportSection#methodology
* section[Methodology].entry only Reference(http://hl7.org/fhir/StructureDefinition/Observation or http://hl7.org/fhir/StructureDefinition/Procedure)

* section[PresentedForm] ^short = "Presented form"
* section[PresentedForm] ^definition = "The authorised report as a PDF, while the PDF remains the authorised report"
* section[PresentedForm].code = $loinc#77599-9 "Additional documentation"
* section[PresentedForm].entry 1..*
* section[PresentedForm].entry only Reference(http://hl7.org/fhir/StructureDefinition/DocumentReference or http://hl7.org/fhir/StructureDefinition/Binary)
