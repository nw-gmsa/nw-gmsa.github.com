Profile:        MolecularConsequence
Parent:         http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/molecular-consequence
Id:             MolecularConsequence
Title:          "Molecular Consequence (Observation)"
Description:    """
`Diagnostic - Genomics Reporting Molecular Consequence`

Communicates the calculated or observed effect of a DNA variant, generally on its
downstream transcript/protein, or a broader functional effect such as loss of
heterozygosity. Follows the HL7 Genomics Reporting IG's
[Molecular Consequence](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-molecular-consequence.html)
profile: a separate `Observation` from the `Variant` it describes the consequence
of, referenced via `derivedFrom` - not a component on the `Variant` itself.

This is this IG's preferred pattern for representing Loss of Heterozygosity (LOH) -
see [OMICS DSS Result Integration](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/reportable-variants.md#outstanding-issues) for
the decision and the tradeoff against modelling LOH as a bare component/extension on
`Variant` instead.
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGImplications.fsh

* insert GenomicObservation

* derivedFrom 1..1 MS
* derivedFrom ^short = "The Variant this molecular consequence is derived from"
* derivedFrom[variant] 1..1 MS
* derivedFrom[variant] only Reference(Variant)

// functional-effect is inherited from GR
* component[functional-effect] ^short = "Functional Effect"
* component[functional-effect] ^definition = "How the variant affects overall function, e.g. loss of function, gain of function, or loss of heterozygosity - a Sequence Ontology term under SO:0001536 (functional_effect_variant)."
