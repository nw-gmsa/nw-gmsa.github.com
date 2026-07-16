Instance: 51967-8-ctDNA
InstanceOf: Observation
Title: "Discrete variation analysis overall interpretation - ctDNA"
Description: "TODO"

* identifier[+].value = "583acda5-4e59-42e4-8d94-1329a8bb759a"

* status = #final

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #51967-8
    * display = "Genetic disease(s) assessed"
    * system = $loinc

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

* valueCodeableConcept = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicClinicalIndication#M4



