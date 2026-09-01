Instance: ctdna9737383222-icnv1
InstanceOf: Variant
Title: "Variant - ctDNA Intragenic Copy Number Variant (FBN1)"
Description: """
Standalone extraction of the intragenic-CNV `Observation` (`FBN1` exon deletion) from
[Bundle-ctdna9737383222-testresults](Bundle-ctdna9737383222-testresults.html), for
individual reference - see [OMICS DSS Result
Integration](reportable-variants.html#result-panel) for the LRI/FHIR/iGene mapping
this example grounds.
"""
Usage: #example

* identifier[+].value = "ctdna9737383222-icnv1"

* status = #final

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* subject = Reference(Patient-Leeds)

* effectiveDateTime = "2026-07-14T15:59:16+00:00"

* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* valueCodeableConcept = $loinc#LA9633-4 "Present"

* method = $loinc#LA26398-0 "Sequencing"

* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:3603 "FBN1"

* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6683-2 "Germline"

* component[+].code = $loinc#48013-7 "Genomic reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NC_000015.9

* component[+].code = $loinc#92822-6 "Genomic coordinate system [Type]"
* component[=].valueCodeableConcept = $loinc#LA30102-0 "1-based character counting"

* component[+].code = $loinc#69547-8 "Genomic ref allele [ID]"
* component[=].valueString = "C"

* component[+].code = $loinc#69551-0 "Genomic alt allele [ID]"
* component[=].valueString = "<DEL>"

* component[+].code = $loinc#48019-4 "DNA change type"
* component[=].valueCodeableConcept = http://www.sequenceontology.org#SO:0001019 "copy_number_variation"

* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_000138.4

* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#"NM_000138.4(FBN1):exon13_to_exon15del"

* component[+].code = $loinc#81290-9 "Genomic DNA change (gHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"g.48797222_48802366del"

* component[+].code = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
* component[=].valueCodeableConcept.text = "Pathogenic"

* component[+].code = $loinc#94186-4 "Origin of germline genetic variant [Type]"
* component[=].valueCodeableConcept = $loinc#LA26320-4 "Maternal"

* component[+].code = $loinc#81302-2 "Structural variant inner start and end"
* component[=].valueRange.low.value = 48797221
* component[=].valueRange.high.value = 48802366

* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity.value = 0.33
* component[=].valueQuantity.unit = "decimal"
* component[=].valueQuantity.system = $ucum

* component[+].code = $loinc#82155-3 "Genomic structural variant copy number"
* component[=].valueQuantity.value = 1
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #1
