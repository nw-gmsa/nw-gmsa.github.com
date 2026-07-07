The process of producing reportable genomic variants using decision support involves filtering massive raw sequencing datasets into actionable, clinically significant mutations. It relies on computational pipelines and clinical knowledge bases to classify variants based on pathogenicity and relevance to a patient's condition.

The step-by-step process operates as follows:

```mermaid
graph

analysis[Primary and Secondary Analysis]
filtering["Annotation and Prioritization (Filtering)"]
classification[Variant Classification & Interpretation]
action[Actionability and Clinical Matching]
report[Final Clinical Review and Reporting]
placer[Order Placer]

analysis --> filtering
filtering --> classification
classification --> action
action --> |Reportable Variants| report
report --> |Genomic Report| placer  

  classDef green fill:#D5E8D4;
  class placer green
```

## Primary and Secondary Analysis

Raw sequencing data generated from samples undergoes bioinformatic processing where reads are aligned to a reference genome. This phase performs **variant calling**, identifying the genetic variations present (such as single nucleotide variants or insertions/deletions) when compared to a standard baseline.

## Annotation and Prioritization (Filtering)

A single genome can contain millions of variants. The Clinical Decision Support System (CDSS) automatically annotates these by appending biological and population context to the variants. It systematically filters out benign background polymorphisms and prioritizes variants based on factors like:

- **Population allele frequency**: Checking databases to see how common a variant is in healthy populations.
- **In silico predictions**: Utilizing computational models to determine if an amino acid change is likely to be functionally damaging.

## Variant Classification & Interpretation

The CDSS evaluates the remaining variants against established clinical guidelines, such as the ACMG/AMP Guidelines for rare diseases or the AMP/ASCO Guidelines for oncology. The software tallies specific points of evidence (population data, functional data, segregation studies) to assign the variant to a tiered classification:

- **Pathogenic / Likely Pathogenic**
- **Variant of Uncertain Significance (VUS)**
- **Benign / Likely Benign**

## Actionability and Clinical Matching

For pathogenic or likely pathogenic variants, the decision support system queries updated clinical trial databases and regulatory-approved biomarker lists (like those from ClinGen). The system matches the variant to specific targeted therapies, identifying if a drug is indicated, contraindicated, or if the patient is eligible for a clinical trial.

## Final Clinical Review and Reporting

See [Genomic Test Report](Questionnaire-GenomicTestReport.html)

The computational outputs are reviewed by clinical pathologists or laboratory scientists who confirm the findings, often utilizing tools such as VarSome to adhere to best practices. The finalized, reportable variants are then populated into a structured, evidence-based report. This report is delivered to the treating physician to guide the patient's personalized treatment or diagnostic journey.

