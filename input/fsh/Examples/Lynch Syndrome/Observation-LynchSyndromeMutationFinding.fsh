Instance: 4490c092-c78c-480a-8cb7-653b70113fd5
InstanceOf: Observation
Title: "Observation - Lynch Syndrome Mutation Finding"
Description: "Based on HL7 LRI Example 3 (Ref 5.9.1.3)"

* identifier[+].value = "4490c092-c78c-480a-8cb7-653b70113fd5"

* status = #final

* effectiveDateTime = "2025-10-23T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"

* derivedFrom.reference = "urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
// SNOMED Validation issues * code = $sct#1365861003 "Lynch syndrome gene mutation detected"
* code = $sct#716318002 "Lynch syndrome"

