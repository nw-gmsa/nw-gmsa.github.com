CodeSystem: IGeneVariantCategory
Id: IGeneVariantCategory
Title: "iGene Variant Category"
Description: """
iGene's five variant-type categories, each with its own repeating set of custom
fields in iGene's "Variant Level Data" spec (`SEQV1`-`SEQV10`, `ICNV1`-`ICNV3`,
`MCNV1`-`MCNV3`, `SV1`-`SV3`, `LOH1`-`LOH2`) - see [OMICS DSS Result
Integration](reportable-variants.html#outstanding-issues) for the decision this
codifies: making "which iGene slot type is this" an explicit, coded
`Variant.component:variant-category` value instead of an inferred classification.

This extends LRI's own "Variant category" (LOINC `83005-9`), whose answer list
(`LL4165-8`) only distinguishes Simple Variant vs Structural Variant - not granular
enough to route a reported variant to the correct iGene slot type.
"""

* ^content = #complete
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^version = "0.1.0"
* ^date = "2026-09-02"

* #SEQV "Sequence Variant" "A small-scale change in the DNA sequence at a specific gene/transcript location - substitution, insertion, deletion or indel."
* #ICNV "Intragenic Copy Number Variant" "A copy-number change (gain or loss) contained within a single gene, e.g. loss of one or more exons."
* #MCNV "Multigenic Copy Number Variant" "A copy-number change spanning a larger region covering multiple genes or a chromosome band."
* #SV "Structural Variant" "A large-scale rearrangement (translocation, inversion, complex event) that is not necessarily a simple copy-number gain or loss."
* #LOH "Loss of Heterozygosity" "One parental copy of a region is lost or indistinguishable from the other - modelled as a separate Molecular Consequence Observation, not on Variant itself (see MolecularConsequence.fsh)."
