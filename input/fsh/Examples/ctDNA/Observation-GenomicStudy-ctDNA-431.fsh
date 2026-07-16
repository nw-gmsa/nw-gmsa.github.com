Instance: GenomicStudy-ctDNA
InstanceOf: GenomicStudyPanel
Title: "Genomic Study Panel - ctDNA 431 Present"
Description: "TODO"

* identifier[+].value = "a93777a8-63d1-49ae-91d8-dcb8779d72b2"

* status = #final

* effectiveDateTime = "2025-10-14T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #81306-3
    * display = "Variables that apply to the overall study"
    * system = $loinc

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

* hasMember[+].reference = "urn:uuid:cd491a5f-62ec-4f6b-904f-206bae2c9b20"
* hasMember[+].reference = "urn:uuid:b3b6b20f-8e5a-432c-8155-579dc4d60a09"


