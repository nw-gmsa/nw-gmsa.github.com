Profile:        Variant
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/variant
Id:             Variant
Title:          "Variant (Observation)"
Description:    """
`Diagnostic - Genomics Reporting Finding`
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGFindings.fsh

//* ^keyword[+] = #archetype "Domain Analysis Model"
//* ^keyword[+] = #genomics "Genomics"
//* ^keyword[+] = #diagnostics "Diagnostics"

* insert GenomicObservation

* method 1..1 MS
* valueCodeableConcept MS

// gene-studied and representative-transcript-ref-seq are inherited from GR; variant-category is an NW addition
* component contains variant-category 0..1

* component[variant-category] ^short = "Variant Category (iGene)"
* component[variant-category] ^definition = "Which of iGene's five variant-type categories (Sequence Variant, Intragenic CNV, Multigenic CNV, Structural Variant, Loss of Heterozygosity) this discrete variant belongs to - an IG-specific extension of LRI's own 'Variant category' (LOINC 83005-9), whose answer list only distinguishes Simple Variant vs Structural Variant. See https://fhir.nwgenomics.nhs.uk/reportable-variants.html#outstanding-issues."
* component[variant-category].code = $loinc#83005-9
* component[variant-category].code ^short = "83005-9"
* component[variant-category].valueCodeableConcept from IGeneVariantCategoryVS (extensible)

* component[gene-studied] ^short = "Gene Studied"
* component[gene-studied] ^definition = "The gene(s) on which the variant is located."

* component[representative-transcript-ref-seq] ^short = "Reference Transcript"
* component[representative-transcript-ref-seq] ^definition = "NCBI's RefSeq ('NM_...'), Ensembl ('ENST...'), and LRG ('LRG...' plus 't1' to indicate transcript)"
