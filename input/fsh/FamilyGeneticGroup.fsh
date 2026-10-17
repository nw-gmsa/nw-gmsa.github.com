Profile:        FamilyGeneticGroup
Parent:         http://hl7.org/fhir/StructureDefinition/Group
Id:             FamilyGeneticGroup
Title:          "Family Genetic Group"
Description:    """
A family (pedigree) tested together, e.g. a Distributed WGS (dWGS) Singleton, Duo or Trio. The group is identified by
its Pedigree Number (also known as Family Id), which each family member's order carries as its Order Group Number
(`ServiceRequest.requisition`, HL7 v2 ORC-4 Placer Group Number). The Pedigree Number is not a patient identifier.
"""

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the system"
* identifier ^slicing.ordered = false

* identifier contains
  PedigreeNumber 1..1 MS

* identifier[PedigreeNumber] only GenomicsPedigreeNumber
* identifier[PedigreeNumber] ^short = "Pedigree Number (Family Id)"
* identifier[PedigreeNumber] ^definition = "Identifies the family/pedigree. Used as the Order Group Number (ServiceRequest.requisition, HL7 v2 ORC-4 Placer Group Number) on each family member's order."
* identifier[PedigreeNumber] ^alias[+] = "Family Id"

* type = #person (exactly)
* actual = true (exactly)

* code 0..1 MS
* code from FamilyStructure (extensible)
* code ^short = "Family Structure: Singleton, Duo or Trio"

* member MS
* member.extension contains FamilyMemberRelationship named relationship 0..1 MS
* member.entity only Reference(Patient)
* member.entity ^short = "Family member - a Patient, or a RelatedPerson via the alternate-reference extension"
* member.entity ^comment = "FHIR R4 Group.member.entity cannot reference a RelatedPerson (R5 can). For a family member held as a RelatedPerson, put the RelatedPerson reference in the alternate-reference extension on member.entity, with display or identifier as the R4 reference."
* member.entity.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named alternateReference 0..1 MS
* member.entity.extension[alternateReference].value[x] only Reference(RelatedPerson)


Extension:      FamilyMemberRelationship
Id:             FamilyMemberRelationship
Title:          "Family Member Relationship"
Description:    "The family member's relationship to the proband, e.g. father, mother, son, daughter. The proband is `ONESELF`."
* ^context.type = #element
* ^context.expression = "Group.member"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from http://terminology.hl7.org/ValueSet/v3-FamilyMember (extensible)


ValueSet:       FamilyStructure
Id:             FamilyStructure
Title:          "Family Structure"
Description:    "How many family members are tested together: Singleton, Duo or Trio. See [dWGS - Singleton, Duo and Trio testing](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/dWGS.md#singleton-duo-and-trio-testing)."
* ^experimental = false
* $nwgmsa#FamilyStructureSingleton "Singleton"
* $nwgmsa#FamilyStructureDuo "Duo"
* $nwgmsa#FamilyStructureTrio "Trio"
