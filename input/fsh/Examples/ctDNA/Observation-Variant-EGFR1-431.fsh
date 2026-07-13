Instance: EGFR1-431
InstanceOf: Variant
Title: "Variant - EGFR1 431 Target Detected"
Description: "TODO"

* identifier[+].value = "0a64f432-524c-4e75-8be6-9b7d3036de47"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #69548-6
    * display = "Genetic variant assessment"
    * system = $loinc

* valueCodeableConcept = $loinc#LA9633-4 "Present"

* subject = Reference(Patient-Sheffield)
* subject.display = "Theon SHEFFIELD"


* component[0].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:3236 "EGFR1"


