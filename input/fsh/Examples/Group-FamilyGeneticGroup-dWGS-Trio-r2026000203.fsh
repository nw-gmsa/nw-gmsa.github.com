Instance: FamilyGeneticGroup-dWGS-Trio-r2026000203
InstanceOf: FamilyGeneticGroup
Title: "Family Genetic Group - dWGS Trio r2026000203"
Description: "Family Genetic Group for the dWGS Trio referral r2026000203, identified by its NGIS referral_id. Members are referenced by NHS Number, as the participants are only held in the dWGS example Bundles."
Usage: #example

* identifier[ReferralId]
  * type = $v2-0203#PGN
  * system = "https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier"
  * value = "r2026000203"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "8J834"

* type = #person
* actual = true
* code = $nwgmsa#FamilyStructureTrio "Trio"
* quantity = 3

* member[+]
  * entity.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
  * entity.identifier.value = "9737383362"
  * entity.display = "Gilly Brough (p2026000104)"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#ONESELF "self"
* member[+]
  * entity.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
  * entity.identifier.value = "9999999581"
  * entity.display = "Thirteen Editestpatient (p2026000105)"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#FAMMEMB "family member"
* member[+]
  * entity.identifier.system = "https://fhir.nhs.uk/Id/nhs-number"
  * entity.identifier.value = "9999999514"
  * entity.display = "Six Editestpatient (p2026000106)"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#FAMMEMB "family member"
