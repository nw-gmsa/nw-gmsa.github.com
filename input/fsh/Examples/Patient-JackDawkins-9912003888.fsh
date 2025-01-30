Instance: Patient-JackDawkins-9912003888
InstanceOf: Patient
Title: "Patient - Jack Dawkins NHS Number: 9912003888"
Description: """
Example taken from existing NHS England specifications
"""
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = http://terminology.hl7.org/CodeSystem/v2-0203#JHN
* identifier[0].system = $nhs-number
* identifier[0].value = "9912003888"
* identifier[0].assigner.identifier.value = "X24"
* identifier[1].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[1].value = "A12356565"
* identifier[1].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[1].assigner.identifier.value = "RBS"
* identifier[2].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[2].value = "633"
* identifier[2].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[2].assigner.identifier.value = "R0A"

* name.use = #official
* name.family = "DAWKINS"
* name.given = "Jack"

* birthDate = "1937-10-02"

* address[+]
  * use = #home
  * type = #both
  * city = "Leodis"
  * postalCode = "LA19 5YN"


* gender = #male

* contact.name.use = #official
* contact.name.family = "DAWKINS"
* contact.name.given = "Bob"
* contact.telecom.value = "077021231231"
* contact.telecom.use = #mobile
