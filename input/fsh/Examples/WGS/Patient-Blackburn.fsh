Instance: Patient-Blackburn
InstanceOf: Patient
Title: "Patient - Blackburn"
Description: """
Test Patient for Blackburn
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383370"

* name.use = #official
* name.family = "BLACKBURN"
* name.given = "Robert"

* birthDate = "1965-01-14"

* gender = #male

* address.line = "King William Street"
* address.city = "Blackburn"
* address.district = "Lancashire"
* address.postalCode = "BB1 7DY"

* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "Y02657"
