Instance: GenomicStudy-ctDNA
InstanceOf: GenomicStudyPanel
Title: "Genomic Study Panel - ctDNA 431 Present"
Description: "TODO"

* identifier[+].value = "a93777a8-63d1-49ae-91d8-dcb8779d72b2"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #81306-3
    * display = "Variables that apply to the overall study"
    * system = $loinc

* subject = Reference(Patient-Sheffield)
* subject.display = "Theon SHEFFIELD"

* hasMember[+] = Reference(51967-8-ctDNA)
* hasMember[+] = Reference(51968-6-ctDNA)


