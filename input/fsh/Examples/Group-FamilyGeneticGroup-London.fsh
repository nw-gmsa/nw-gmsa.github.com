Instance: FamilyGeneticGroup-London
InstanceOf: FamilyGeneticGroup
Title: "Family Genetic Group - London family (Duo)"
Description: "Family Genetic Group for the London family: the fetus (Patient, proband) and mother (RelatedPerson)"
Usage: #example

* identifier[PedigreeNumber]
  * type = $v2-0203#PGN
  * system = "https://fhir.nhs.uk/Id/genomics-pedigree-number"
  * value = "PED-2026-0042"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* type = #person
* actual = true
* code = $nwgmsa#FamilyStructureDuo "Duo"
* name = "London family"
* quantity = 2

* member[+]
  * entity = Reference(Patient-FetusLondon)
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#ONESELF "self"
* member[+]
  * entity.display = "Cersei London (mother)"
  * entity.extension[alternateReference].valueReference = Reference(RelatedPerson-MotherCerseiLondon)
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#MTH "mother"
