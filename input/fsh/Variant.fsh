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

* method 1..1
* valueCodeableConcept 1..1

* component contains gene-studied 0..*
  and representative-transcript-ref-seq 0..*

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

//48002-0
//48013-7
//92822-6
//69547-8
//69551-0
//48019-4
//51958-7
//48004-6
//48005-3
//81290-9
//53037-8
//94186-4
//81254-5
//81258-6
//53034-5
