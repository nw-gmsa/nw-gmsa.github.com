Instance: 51968-6-ctDNA
InstanceOf: Observation
Title: "Discrete variation analysis overall interpretation - ctDNA"
Description: "TODO"

* identifier[+].value = "583acda5-4e59-42e4-8d94-1329a8bb759a"

* status = #final

* effectiveDateTime = "2025-10-14T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #51968-6
    * display = "Discrete variation analysis overall interpretation"
    * system = $loinc

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

//* valueCodeableConcept.coding[+] = $loinc#LA9633-4 "Present"
* valueCodeableConcept.coding[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicTestOutcomeCode#431 "TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION"


