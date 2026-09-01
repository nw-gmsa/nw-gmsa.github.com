Instance: ctdna9737383222-seqv1
InstanceOf: Variant
Title: "Variant - ctDNA Small Variant (BRCA1)"
Description: """
Standalone extraction of the small-variant `Observation` (`BRCA1` deletion) from
[Bundle-ctdna9737383222-testresults](Bundle-ctdna9737383222-testresults.html), for
individual reference - see [OMICS DSS Result
Integration](reportable-variants.html#result-panel) for the LRI/FHIR/iGene mapping
this example grounds.
"""
Usage: #example

* identifier[+].value = "ctdna9737383222-seqv1"

* status = #final

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* subject = Reference(Patient-Leeds)

* effectiveDateTime = "2026-07-14T15:59:16+00:00"

* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* valueCodeableConcept = $loinc#LA9633-4 "Present"

* method = $loinc#LA26398-0 "Sequencing"

* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:1100 "BRCA1"

* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6683-2 "Germline"

* component[+].code = $loinc#48013-7 "Genomic reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NC_000017.10

* component[+].code = $loinc#92822-6 "Genomic coordinate system [Type]"
* component[=].valueCodeableConcept = $loinc#LA30102-0 "1-based character counting"

* component[+].code = $loinc#69547-8 "Genomic ref allele [ID]"
* component[=].valueString = "TCT"

* component[+].code = $loinc#69551-0 "Genomic alt allele [ID]"
* component[=].valueString = "T"

* component[+].code = $loinc#48019-4 "DNA change type"
* component[=].valueCodeableConcept = http://www.sequenceontology.org#SO:0000159 "deletion"

* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_007294.3

* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#"NM_007294.3(BRCA1):c.68_69del"

* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"p.(Glu23ValfsTer17)"

* component[+].code = $loinc#81290-9 "Genomic DNA change (gHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"g.41276047_41276048del"

* component[+].code = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
* component[=].valueCodeableConcept.text = "Pathogenic"

* component[+].code = $loinc#94186-4 "Origin of germline genetic variant [Type]"
* component[=].valueCodeableConcept = $loinc#LA26320-4 "Maternal"

* component[+].code = $loinc#81254-5 "Genomic allele start-end"
* component[=].valueRange.low.value = 41276046

* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity.value = 0.33
* component[=].valueQuantity.unit = "decimal"
* component[=].valueQuantity.system = $ucum

* component[+].code = $loinc#53034-5 "Allelic state"
* component[=].valueCodeableConcept = $loinc#LA6706-1 "heterozygous"
