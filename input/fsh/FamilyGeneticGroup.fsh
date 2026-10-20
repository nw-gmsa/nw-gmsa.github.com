Profile:        FamilyGeneticGroup
Parent:         http://hl7.org/fhir/StructureDefinition/Group
Id:             FamilyGeneticGroup
Title:          "Family Genetic Group"
Description:    """
A family (pedigree) tested together, e.g. a Distributed WGS (dWGS) Singleton, Duo or Trio. The group is identified by
its Pedigree Number (also known as Family Id) and/or, for dWGS, the NGIS `referral_id` from TOMS. Either can be carried
on each family member's order as its Order Group Number (`ServiceRequest.requisition`, HL7 v2 ORC-4 Placer Group
Number). Neither is a patient identifier.
"""

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the system"
* identifier ^slicing.ordered = false

* identifier contains
  PedigreeNumber 0..1 MS
  and ReferralId 0..* MS

* identifier[ReferralId] only NGISReferralId
* identifier[ReferralId] ^short = "NGIS Referral Id (referral_id from TOMS)"
* identifier[ReferralId] ^definition = "The dWGS referral_id returned by TOMS. Can be used as the Order Group Number (ServiceRequest.requisition, HL7 v2 ORC-4 Placer Group Number) on each family member's order."

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
* member.extension contains FamilyMemberRelationship named relationship 1..1 MS
* member.extension[relationship] ^short = "Role of the patient in the family: mother, father, son, daughter, ... (the proband is ONESELF)"
* member.extension contains FamilyMemberHistoryReference named familyMemberHistory 0..1 MS
* member.extension[familyMemberHistory] ^short = "Family history of this member, relative to the proband"
* member.entity only Reference(Patient)
* member.entity ^short = "Family member (Patient)"


Extension:      FamilyMemberRelationship
Id:             FamilyMemberRelationship
Title:          "Family Member Relationship"
Description:    "The role of the patient in the family group - their relationship to the proband, e.g. mother, father, son, daughter. The proband is `ONESELF`."
* ^context.type = #element
* ^context.expression = "Group.member"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype (required)


Extension:      FamilyMemberHistoryReference
Id:             FamilyMemberHistoryReference
Title:          "Family Member History Reference"
Description:    "The [FamilyMemberHistory](StructureDefinition-FamilyMemberHistory.html) recorded for this family member, in relation to the proband. Sits alongside the [Family Member Relationship](StructureDefinition-FamilyMemberRelationship.html) extension."
* ^context.type = #element
* ^context.expression = "Group.member"
* value[x] 1..1
* value[x] only Reference(FamilyMemberHistory)


ValueSet:       FamilyStructure
Id:             FamilyStructure
Title:          "Family Structure"
Description:    "How many family members are tested together: Singleton, Duo or Trio. See [dWGS - Singleton, Duo and Trio testing](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/dWGS.md#singleton-duo-and-trio-testing)."
* ^experimental = false
* $nwgmsa#FamilyStructureSingleton "Singleton"
* $nwgmsa#FamilyStructureDuo "Duo"
* $nwgmsa#FamilyStructureTrio "Trio"
