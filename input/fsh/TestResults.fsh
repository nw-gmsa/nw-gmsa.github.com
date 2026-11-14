Profile:        TestResults
Parent:         DiagnosticReport
Id:             TestResults
Title:          "Test Results"
Description:    """
`Diagnostic - Test Results (LAB-5)`

Test results returned by an Automation Manager to the Order Filler for a work order (IHE LTW LAB-5). The results have not been clinically validated: the Order Filler does that and writes the [Laboratory Report](StructureDefinition-LaboratoryReport.html) (LAB-3).

Aimed at the reportable variants use case: `result` is sliced by genomic result profile (Variant, Genotype, Haplotype, implications, molecular consequence, biomarker), following the NHS England [DiagnosticReport-GenomicReport](https://simplifier.net/nhs-digital-fhir-genomics-implementation-guide/nhsengland-diagnosticreport-genomicreport) profile.
"""

* basedOn 1..*
* basedOn ^short = "The work order (`ServiceRequest.intent` = `instance-order`) these results are for"

* status ^short = "SHOULD be `preliminary`: the results have not yet been clinically validated by the Order Filler"

* result 1..* MS
* result ^short = "The test results (Observations). Each SHOULD identify the system that produced it in `Observation.device`"

// Result slicing follows NHS England DiagnosticReport-GenomicReport (inherited from HL7 Genomics Reporting genomic-report)
* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "resolve()"
* result ^slicing.rules = #open
* result ^slicing.description = "Slice based on the reference profile"
* result contains
    diagnostic-implication 0..* and
    therapeutic-implication 0..* and
    molecular-consequence 0..* and
    variant 0..* and
    sequence-phase-relation 0..* and
    genotype 0..* and
    haplotype 0..* and
    biomarker 0..*
* result[diagnostic-implication] only Reference(DiagnosticImplication)
* result[diagnostic-implication] ^short = "Diagnostic Implication"
* result[therapeutic-implication] only Reference(TherapeuticImplication)
* result[therapeutic-implication] ^short = "Therapeutic Implication"
* result[molecular-consequence] only Reference(MolecularConsequence)
* result[molecular-consequence] ^short = "Molecular Consequence"
* result[variant] only Reference(Variant)
* result[variant] ^short = "Variant"
* result[sequence-phase-relation] only Reference(http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/sequence-phase-relationship)
* result[sequence-phase-relation] ^short = "Sequence Phase Relationship"
* result[genotype] only Reference(Genotype)
* result[genotype] ^short = "Genotype"
* result[haplotype] only Reference(Haplotype)
* result[haplotype] ^short = "Haplotype"
* result[biomarker] only Reference(MolecularBiomarker)
* result[biomarker] ^short = "Molecular Biomarker"

* resultsInterpreter 0..0
* resultsInterpreter ^short = "Not used: test results are not clinically interpreted. See Laboratory Report"
* conclusion 0..0
* conclusion ^short = "Not used: test results are not clinically interpreted. See Laboratory Report"
* conclusionCode 0..0
* conclusionCode ^short = "Not used: test results are not clinically interpreted. See Laboratory Report"
