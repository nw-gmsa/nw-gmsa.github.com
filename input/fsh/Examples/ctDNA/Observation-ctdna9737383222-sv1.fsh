Instance: ctdna9737383222-sv1
InstanceOf: Variant
Title: "Variant - ctDNA Structural Variant"
Description: """
Standalone extraction of the structural-variant `Observation` from
[Bundle-ctdna9737383222-testresults](Bundle-ctdna9737383222-testresults.html), for
individual reference - see [OMICS DSS Result
Integration](reportable-variants.html#result-panel) for the LRI/FHIR/iGene mapping
this example grounds, including the open gap around iGene's own `81262-8` "Complex
variant HGVS name" field, which this example does not populate.
"""
Usage: #example

* identifier[+].value = "ctdna9737383222-sv1"

* status = #final

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* subject = Reference(Patient-Leeds)

* effectiveDateTime = "2026-07-14T15:59:16+00:00"

* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* valueCodeableConcept = $loinc#LA9633-4 "Present"

* method = $loinc#LA26398-0 "Sequencing"

* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SV "Structural Variant"

* component[+].code = $loinc#48013-7 "Genomic reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NC_000023.10

* component[+].code = $loinc#92822-6 "Genomic coordinate system [Type]"
* component[=].valueCodeableConcept = $loinc#LA30102-0 "1-based character counting"

* component[+].code = $loinc#69547-8 "Genomic ref allele [ID]"
* component[=].valueString = "T"

* component[+].code = $loinc#69551-0 "Genomic alt allele [ID]"
* component[=].valueString = "<DEL>"

* component[+].code = $loinc#48019-4 "DNA change type"
* component[=].valueCodeableConcept = http://www.sequenceontology.org#SO:0000159 "deletion"

* component[+].code = $loinc#81290-9 "Genomic DNA change (gHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"g.100652797_153792676del"

* component[+].code = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
* component[=].valueCodeableConcept.text = "Pathogenic"

* component[+].code = $loinc#81302-2 "Structural variant inner start and end"
* component[=].valueRange.low.value = 100652796
* component[=].valueRange.high.value = 153792676

* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity.value = 0.33
* component[=].valueQuantity.unit = "decimal"
* component[=].valueQuantity.system = $ucum
