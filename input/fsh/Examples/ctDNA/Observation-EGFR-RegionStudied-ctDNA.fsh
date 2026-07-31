Instance: region-studied-egfr-dpcr
InstanceOf: GenomicObservation
Title: "Region Studied - ctDNA"
Description: "TODO"

* identifier[+].value = "a151b1ed-5aef-4c36-af50-987cfbd5bad4"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code
  * coding[+]
    * code = #53041-0
    * display = "DNA region of interest panel"
    * system = $loinc

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:3236 "EGFR"

* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = http://www.ncbi.nlm.nih.gov/nuccore#NM_005228.5 "EGFR transcript NM_005228.5"

* note[+].text = "ILLUSTRATIVE: represents that the digital PCR assay interrogated only the EGFR exon 20 T790M hotspot position (and, in a multiplexed panel, a small number of other named hotspots such as exon 19 deletions / L858R) — not the full coding sequence of EGFR. Unlike NGS, a negative dPCR result only rules out variants at the specific positions named here; it should not be read as 'EGFR negative' more broadly. Coordinate/region detail (start/end, genome build) is omitted from this illustrative example and should be populated from the assay's validated target list in a real implementation."
