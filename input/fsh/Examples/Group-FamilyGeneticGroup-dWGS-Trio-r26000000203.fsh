Instance: FamilyGeneticGroup-dWGS-Trio-r26000000203
InstanceOf: FamilyGeneticGroup
Title: "Family Genetic Group - dWGS Trio r26000000203"
Description: "Family Genetic Group for the dWGS Trio referral r26000000203, identified by its NGIS referral_id. Each member references its Patient, also identified by NHS Number."
Usage: #example

* identifier[ReferralId]
  * type = $v2-0203#PGN
  * system = "https://genomicsengland.co.uk/healthcare/referral-id"
  * value = "r26000000203"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "8J834"

* type = #person
* actual = true
* code = $nwgmsa#FamilyStructureTrio "Trio"
* quantity = 3

* member[+]
  * entity.reference = "Patient/Patient-Brough"
  * entity.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
  * entity.identifier.value = "9737383362"
  * entity.display = "Gilly Brough (p26000000104)"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#ONESELF "self"
* member[+]
  * entity.reference = "Patient/Patient-Editestpatient-Thirteen"
  * entity.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
  * entity.identifier.value = "9999999581"
  * entity.display = "Thirteen Editestpatient (p26000000105)"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#FAMMEMB "family member"
* member[+]
  * entity.reference = "Patient/Patient-Editestpatient-Six"
  * entity.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
  * entity.identifier.value = "9999999514"
  * entity.display = "Six Editestpatient (p26000000106)"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#FAMMEMB "family member"
