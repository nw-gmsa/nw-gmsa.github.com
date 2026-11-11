Instance: Patient-Brough
InstanceOf: Patient
Title: "Patient - Brough"
Description: """
Test Patient for Brough - the Proband of the dWGS Trio referral r26000000203
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383362"
* identifier[1].type = $v2-0203#PI
* identifier[1].value = "p26000000104"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "8J834"

* name.use = #official
* name.family = "BROUGH"
* name.given = "Gilly"

* birthDate = "1989-07-01"

* gender = #female

* address.line[0] = "Townhead House"
* address.line[1] = "Brough"
* address.line[2] = "Sowerby"
* address.city = "KIRKBY STEPHEN"
* address.postalCode = "CA17 4EG"

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "A82038"
