Instance: 53227665-9af2-4150-9891-40fa60dbfc0c
InstanceOf: Observation
Title: "Genomic Study (Panel) - Lynch Syndrome Genetic Disease"
Description: "Based on HL7 LRI Example 3 (Ref 5.9.1.3)"

* identifier[+].value = "53227665-9af2-4150-9891-40fa60dbfc0c"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"

* code = $loinc#51967-8 "Genetic disease assessed [ID]"
* valueCodeableConcept = $GCC#R210 "Inherited MMR deficiency (Lynch syndrome)"


