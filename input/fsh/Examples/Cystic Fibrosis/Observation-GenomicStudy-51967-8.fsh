Instance: 5cbd1e0e-d0dd-4df2-9f8c-caa2a1785982
InstanceOf: Observation
Title: "Genomic Study (Panel) - Cystic Fibrosis  Genetic Disease"
Description: "Based on HL7 LRI Example 1 (Ref 5.9.1.2)"

* identifier[+].value = "5cbd1e0e-d0dd-4df2-9f8c-caa2a1785982"


* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* performer[+] = Reference(59577028-8fcc-4554-8b43-988561d41d9c)

* subject = Reference(Patient-Lancaster)
* subject.display = "Jaime LANCASTER"

* code = $loinc#51967-8 "Genetic disease assessed [ID]"
* valueCodeableConcept = $GCC#R185 "Cystic fibrosis carrier"
