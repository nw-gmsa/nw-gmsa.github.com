Instance: variant-egfr
InstanceOf: Variant
Title: "Variant - ctDNA"
Description: "TODO"

* identifier[+].value = "00c22e97-a226-4845-b17a-e24ec1f4f77a"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #69548-6
    * display = "Genetic variant assessment"
    * system = $loinc

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

* valueCodeableConcept = $loinc#LA9633-4 "Present"

* method.text = "Digital PCR (BEAMing / OncoBEAM platform). NOTE: unlike 'Sequencing' (LOINC LA26398-0), the standard LOINC/SNOMED CT answer lists referenced by this IG do not currently include a dedicated coded answer for 'digital PCR' — captured here as free text pending a suitable coded term (e.g. a local or SNOMED CT extension) being agreed with your terminology team."

* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:3236 "EGFR"

* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_005228.5:c.2369C>T

* component[+].code = $loinc#48019-4 "DNA change type"
* component[=].valueCodeableConcept = http://www.sequenceontology.org#SO:1000002 "substitution"

* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6684-0 "Somatic"

* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity.value = 0.42
* component[=].valueQuantity.unit = "%"
* component[=].valueQuantity.system = $ucum
* component[=].valueQuantity.code = #%

* note[+].text = "ILLUSTRATIVE VALUES ONLY. The allelic frequency component (81258-6) is the field of primary clinical interest for a dPCR ctDNA result: it carries the mutant-allele fraction quantified directly by the assay (droplet/bead-positive fraction, Poisson-corrected), which is what a clinician uses to gauge ctDNA burden and track it serially — analogous to how VAF is used from NGS, but here derived from a targeted few-plex assay rather than sequencing depth."
