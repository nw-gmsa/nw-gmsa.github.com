Profile:        Variant
Parent:         GenomicObservation
Id:             Variant
Title:          "Variant (Observation)"
Description:    """
`Diagnostic - Genomics Reporting Finding`
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGFindings.fsh

//* ^keyword[+] = #archetype "Domain Analysis Model"
//* ^keyword[+] = #genomics "Genomics"
//* ^keyword[+] = #diagnostics "Diagnostics"

* code = $loinc#69548-6

* method 1..1 MS
* valueCodeableConcept MS

* component contains variant-category 0..1
  and gene-studied 0..*
  and representative-transcript-ref-seq 0..*

* component[variant-category] ^short = "Variant Category (iGene)"
* component[variant-category] ^definition = "Which of iGene's five variant-type categories (Sequence Variant, Intragenic CNV, Multigenic CNV, Structural Variant, Loss of Heterozygosity) this discrete variant belongs to - an IG-specific extension of LRI's own 'Variant category' (LOINC 83005-9), whose answer list only distinguishes Simple Variant vs Structural Variant. See https://fhir.nwgenomics.nhs.uk/reportable-variants.html#outstanding-issues."
* component[variant-category].code = $loinc#83005-9
* component[variant-category].code ^short = "83005-9"
* component[variant-category].valueCodeableConcept from IGeneVariantCategoryVS (extensible)

* component[gene-studied] ^short = "Gene Studied"
* component[gene-studied] ^definition = "The gene(s) on which the variant is located."
* component[gene-studied].code = $loinc#48018-6
* component[gene-studied].code ^short = "48018-6"
//* component[gene-studied].value[x] only CodeableConcept or Quantity
//* component[gene-studied].value[x] ^short = "The HGNC gene symbol is to be used as display text and the HGNC gene ID used as the code. If no HGNC code issued for this gene yet, NCBI gene IDs SHALL be used."
//* component[gene-studied].value[x] 1..1
//* component[gene-studied].value[x] from HGNCVS (extensible)

* component[representative-transcript-ref-seq].code = $loinc#51958-7
* component[representative-transcript-ref-seq].code ^short = "51958-7"
* component[representative-transcript-ref-seq] ^short = "Reference Transcript"
* component[representative-transcript-ref-seq] ^definition = "NCBI's RefSeq ('NM_...'), Ensembl ('ENST...'), and LRG ('LRG...' plus 't1' to indicate transcript)"


