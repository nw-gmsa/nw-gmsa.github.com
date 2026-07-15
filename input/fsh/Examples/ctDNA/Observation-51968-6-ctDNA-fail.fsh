Instance: 51968-6-ctDNA-failed
InstanceOf: Observation
Title: "Discrete variation analysis overall interpretation - ctDNA Failed"
Description: "TODO"

* identifier[+].value = "583acda5-4e59-42e4-8d94-1329a8bb759a"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #51968-6
    * display = "Discrete variation analysis overall interpretation"
    * system = $loinc

* subject = Reference(Patient-Sheffield)
* subject.display = "Theon SHEFFIELD"

* dataAbsentReason.coding[+] = $loinc#LA9664-9 "Failure"
* dataAbsentReason.coding[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicTestOutcomeCode#971 "FAILED"
* dataAbsentReason.coding[+] = http://terminology.hl7.org/CodeSystem/data-absent-reason#error "Error"

