Instance: BCRABL
InstanceOf: LaboratoryAnalyteResult
Title: "Laboratory Analyte Result - BCRABL"
Description: "TODO"

* identifier[+].value = "679dd305-7ea2-481d-af8b-68957eac427c"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #BCR
    * system = "https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid"
  * coding[+]
    * code = #69380-4
    * system = $loinc
    * display = "t(9;22)(q34.1;q11)(ABL1,BCR) b2a2+b3a2 fusion transcript/control transcript (International Scale) [# Ratio] in Blood or Tissue by Molecular genetics method"


* referenceRange[+].text = "0.0030 to 55.00"

* component[0].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR-ABL&
* component[=].valueString = "POS"

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR-ABL&Ct
* component[=].valueQuantity.value = 9.8

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR-ABL&EndPt
* component[=].valueQuantity.value = 718.0

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"BCR-ABL&Delta Ct"
* component[=].valueQuantity.value = -0.7

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#ABL
* component[=].valueString = "PASS"

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#ABL&Ct
* component[=].valueQuantity.value = 9.2

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#ABL&EndPt
* component[=].valueQuantity.value = 411.0
