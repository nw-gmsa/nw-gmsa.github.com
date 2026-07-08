<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Genomic Reporting:</b> <a href="https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html" _target="_blank">Variant</a>
</div>

## Reference

- HL7 FHIR Genomic Reporting [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html)
- HL7 v2 [Lab Result Interface (LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) Section 2 Discrete genetic variant panel

## Overview

The process of producing reportable genomic variants using decision support involves filtering massive raw sequencing datasets into actionable, clinically significant mutations. It relies on computational pipelines and clinical knowledge bases to classify variants based on pathogenicity and relevance to a patient's condition.

The step-by-step process operates as follows:

```mermaid
graph

subgraph CDS[Decision Support]
analysis[Primary and Secondary Analysis]
filtering["Annotation and Prioritisation (Filtering)"]
classification[Variant Classification & Interpretation]
end

action[Actionability and Clinical Matching]
report[Final Clinical Review and Reporting]
placer[Order Placer]

analysis --> filtering
filtering --> classification
classification -.-> |for background info.| action
CDS --> |Reportable Variants| report
action -.->  report
report --> |Genomic Report| placer  

  classDef green fill:#D5E8D4;
  class placer green
```

### Primary and Secondary Analysis

Raw sequencing data generated from samples undergoes bioinformatic processing where reads are aligned to a reference genome. This phase performs **variant calling**, identifying the genetic variations present (such as single nucleotide variants or insertions/deletions) when compared to a standard baseline.

### Annotation and Prioritisation (Filtering)

A single genome can contain millions of variants. The Clinical Decision Support System (CDSS) automatically annotates these by appending biological and population context to the variants. It systematically filters out benign background polymorphisms and prioritizes variants based on factors like:

- **Population allele frequency**: Checking databases to see how common a variant is in healthy populations.
- **In silico predictions**: Utilizing computational models to determine if an amino acid change is likely to be functionally damaging.

### Variant Classification & Interpretation

The CDSS evaluates the remaining variants against established clinical guidelines, such as the ACMG/AMP Guidelines for rare diseases or the AMP/ASCO Guidelines for oncology.

Output [Reportable Variant](#reportable-variant)

### Actionability and Clinical Matching

For pathogenic or likely pathogenic variants, the decision support system queries updated clinical trial databases and regulatory-approved biomarker lists (like those from ClinGen). The system matches the variant to specific targeted therapies, identifying if a drug is indicated, contraindicated, or if the patient is eligible for a clinical trial.

### Final Clinical Review and Reporting

Output [Genomic Test Report](Questionnaire-GenomicTestReport.html)

The computational outputs are reviewed by Genomic Clinical Scientists or laboratory scientists who confirm the findings, often utilizing tools such as VarSome to adhere to best practices. The finalized, reportable variants are then populated into a structured, evidence-based report. This report is delivered to the treating physician to guide the patient's personalized treatment or diagnostic journey.

## Reportable Variant

TODO

| Name                       | LOINC   | Value Set / Data Type | Example | Cardinality | FHIR [Variant (Observation)](StructureDefinition-Variant.html)] Profile |
|----------------------------|---------|-----------------------|---------|-------------|-------------------------------------------------------------------------|
| Genetic variant assessment | 69548-6 |                       |         |             | Observation.code                                                        |
|                            |         |                       |         |             |                                                                         |
|                            |         |                       |         |             |                                                                         |
{:grid}

MOCKUP

| Name                                       | LOINC   | Value Set / Data Type                                                                                                                                      | Example                     | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                                                  |
|--------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|-------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Gene studied [ID]                          | 48018-6 |                                                                                                                                                            | ACAD9                       | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[gene-studied]                      |
| Genomic DNA change g.HGVS                  | 81290-9 |                                                                                                                                                            | NC_000003.11:g.128625063C>T | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[genomic-hgvs]                      |
| Transcript reference sequence [Identifier] | 51958-7 |                                                                                                                                                            | NM_014049.4                 | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[representative-transcript-ref-seq] |
| Genetic variant Assessment                 | 69548-6 | [Variant Assess](https://loinc.org/LL1971-2)                                                                                                               | Present                     | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).valueCodeableConcept                         |
| Variant analysis method [Type]             | 81304-8 | [Structural variant analysis method](https://loinc.org/LL4048-6)                                                                                           | SNP Array                   | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).method                                       |
| Genomic source class [Type]                | 48002-0 | [Genetic variant source](https://loinc.org/LL378-1)                                                                                                        | Somatic                     | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[genomic-source-class]              |
| DNA change type                            | 48019-4 | [LOINC DNA change type](https://loinc.org/48019-4) or [DNA Change Type](https://build.fhir.org/ig/HL7/genomics-reporting/ValueSet-dna-change-type-vs.html) | Substitution                | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[coding-change-type]                |
| Allelic state                              | 53034-5 | [Genetic variant allelic state](https://loinc.org/LL381-5)                                                                                                 | Heterozygous                | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[allelic-state]                     |
| Genomic ref allele [ID]                    | 69547-8 |                                                                                                                                                            | C                           | 0..1        | 2a           | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[ref-allele]                        | 
| Allelic phase                              | 82120-7 | [Allelic phase](https://loinc.org/LL4025-4)                                                                                                                | Maternal                    | 0..1        | 2a           | See 94186-4 below?                                                                                                                        |
| Origin of germline genetic variant [Type]  | 94186-4 | [Origin of Genetic Variance](https://loinc.org/LL5489-1)                                                                                                   | Maternal                    | 0..1        | - n/a        | [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component[variant-inheritance]               |
{:.grid}



