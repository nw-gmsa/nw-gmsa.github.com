Profile:        MolecularConsequence
Parent:         GenomicObservation
Id:             MolecularConsequence
Title:          "Molecular Consequence (Observation)"
Description:    """
`Diagnostic - Genomics Reporting Molecular Consequence`

Communicates the calculated or observed effect of a DNA variant, generally on its
downstream transcript/protein, or a broader functional effect such as loss of
heterozygosity. Follows the HL7 Genomics Reporting IG's
[Molecular Consequence](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-molecular-consequence.html)
profile: a separate `Observation` from the `Variant` it describes the consequence
of, referenced via `derivedFrom` - not a component on the `Variant` itself.

This is this IG's preferred pattern for representing Loss of Heterozygosity (LOH) -
see [OMICS DSS Result Integration](reportable-variants.html#outstanding-issues) for
the decision and the tradeoff against modelling LOH as a bare component/extension on
`Variant` instead.
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGImplications.fsh

* code = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#molecular-consequence

* derivedFrom 1..1 MS
* derivedFrom only Reference(Variant)
* derivedFrom ^short = "The Variant this molecular consequence is derived from"

* component contains functionalEffect 0..1
* component[functionalEffect] ^short = "Functional Effect"
* component[functionalEffect] ^definition = "How the variant affects overall function, e.g. loss of function, gain of function, or loss of heterozygosity - a Sequence Ontology term under SO:0001536 (functional_effect_variant)."
* component[functionalEffect].code = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#functional-effect
* component[functionalEffect].code ^short = "functional-effect"
