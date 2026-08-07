Instance: GenomicStudy-ctDNA-Failed
InstanceOf: GenomicStudyPanel
Title: "Genomic Study Panel - ctDNA 971 Failed"
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

* component[+]
  * code
    * coding[+]
      * code = #51967-8
      * display = "Gene dis assessed"
      * system = $loinc
  * valueCodeableConcept.coding[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicClinicalIndication#M4

* component[+]
  * code
    * coding[+]
      * code = #51968-6
      * display = "Discrete variation analysis overall interpretation"
      * system = $loinc
  * valueCodeableConcept.coding[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicTestOutcomeCode#431 "TARGET DETECTED AT A LEVEL REQUIRING CLINICAL ACTION"





