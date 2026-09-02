Instance: ctdna9737383222-seqv1-loh
InstanceOf: MolecularConsequence
Title: "Molecular Consequence - Loss of Heterozygosity (BRCA1)"
Description: """
Worked example of this IG's preferred pattern for Loss of Heterozygosity: a separate
`MolecularConsequence` Observation, `derivedFrom` the `Variant` it is the consequence
of, rather than a component on the `Variant` itself. Represents the classic
germline-mutation-plus-somatic-LOH "two-hit" finding at the same locus as
[Variant - ctDNA Small Variant (BRCA1)](Observation-ctdna9737383222-seqv1.html) - see
[OMICS DSS Result Integration](reportable-variants.html#outstanding-issues) for the
decision this grounds.
"""
Usage: #example

* identifier[+].value = "ctdna9737383222-seqv1-loh"

* status = #final

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* subject = Reference(Patient-Leeds)

* effectiveDateTime = "2026-07-14T15:59:16+00:00"

* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* derivedFrom = Reference(ctdna9737383222-seqv1)

* component[0].code = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#functional-effect
* component[=].valueCodeableConcept = http://www.sequenceontology.org#SO_0001786 "loss_of_heterozygosity"
