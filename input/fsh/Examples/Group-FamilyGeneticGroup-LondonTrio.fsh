Instance: FamilyGeneticGroup-LondonTrio
InstanceOf: FamilyGeneticGroup
Title: "Family Genetic Group - London family (Trio)"
Description: "Family Genetic Group for a Trio: the fetus (proband), mother Cersei London and father Jaime Lancaster, all Patients"
Usage: #example

* identifier[PedigreeNumber]
  * type = $v2-0203#PGN
  * system = "https://fhir.nhs.uk/Id/genomics-pedigree-number"
  * value = "PED-2026-0043"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* type = #person
* actual = true
* code = $nwgmsa#FamilyStructureTrio "Trio"
* name = "London family"
* quantity = 3

* member[+]
  * entity = Reference(Patient-FetusLondon)
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#ONESELF "self"
* member[+]
  * entity = Reference(Patient-London)
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#MTH "mother"
  * extension[familyMemberHistory].valueReference = Reference(FamilyMemberHistory-London-Mother)
* member[+]
  * entity = Reference(Patient-Lancaster)
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#FTH "father"
  * extension[familyMemberHistory].valueReference = Reference(FamilyMemberHistory-London-Father)
