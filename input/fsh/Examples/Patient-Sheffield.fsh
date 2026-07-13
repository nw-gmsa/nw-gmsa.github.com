Instance: Patient-Sheffield
InstanceOf: Patient
Title: "Patient - Theon Sheffield NHS Number: 9737873858"
Description: """
Test Patient for South Yorkshire ICB
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737873858"

* identifier[1].type = $v2-0203#MR
* identifier[1].value = "RXR3302855"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "RHQ"

* identifier[1].type = $v2-0203#PI
* identifier[1].value = "336292"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "699X0"

* name.use = #official
* name.family = "SHEFFIELD"
* name.given = "Theon"

* birthDate = "1986-09-12"

* address[+]
  * use = #home
  * type = #both
  * line[+] = "SPITAL STREET"
  * city = "SHEFFIELD"
  * postalCode = "S3 9LB"

* gender = #male


* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "C88622"
  * display = "Sheffield Medical Centre"
