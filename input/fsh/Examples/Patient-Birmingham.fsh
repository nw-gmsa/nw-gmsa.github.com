Instance: Patient-Birmingham
InstanceOf: Patient
Title: "Patient - Birmingham"
Description: """
Test Patient for Birmingham and Solihull ICB.
"""
Usage: #example

* active = true

* identifier[+]
  * type = $v2-0203#PI
  * value = "801850508989737383249"

* identifier[+]
  * use = #official
  * type = $v2-0203#NH
  * system = $nhs-number
  * value = "9737383249"

* identifier[+]
  * use = #official
  * type = $v2-0203#MR
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RXK"
  * value = "1234567"



* name.use = #official
* name.family = "Birmingham"
* name.given = "Tommen"

* birthDate = "1999-09-07"

* gender = #male

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "M85124"
  * display = "Bellevue Medical Centre"
