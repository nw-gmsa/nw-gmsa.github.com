Instance: ServiceRequest-dWGS-Trio-r26000000203-Referral
InstanceOf: ServiceRequest
Title: "ServiceRequest - dWGS Trio referral r26000000203 (original order)"
Description: "Fictitious example: the dWGS referral for the Trio family r26000000203 (LAB-1). It is the original order: its subject is the family and its Order Filler Number is the NGIS referral_id assigned by Genomics England. Each participant's LAB-35 sub-order shares the referral_id as its Order Group Number (requisition)."
Usage: #example

* identifier[OrderFillerNumber]
  * type = $v2-0203#FILL
  * system = "https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier"
  * value = "r26000000203"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "8J834"

* requisition
  * type = $v2-0203#PGN
  * system = "https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier"
  * value = "r26000000203"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "8J834"

* status = #active
* intent = #original-order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* code = $test-directory#R27.3

* subject
  * reference = "Group/FamilyGeneticGroup-dWGS-Trio-r26000000203"
  * type = "Group"
  * identifier
    * type = $v2-0203#PGN
    * system = "https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier"
    * value = "r26000000203"
    * assigner.identifier.system = $ods-code
    * assigner.identifier.value = "8J834"
  * display = "Trio family r26000000203"

* requester
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "RTD"
  * display = "The Newcastle upon Tyne Hospitals NHS Foundation Trust"

// The Requesting Genomic Laboratory (RGL), the Order Filler of the referral
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699N0"
  * display = "Northern Genetics Service, Newcastle (NE&Y Genomics)"

* authoredOn = "2026-06-01"

* note[+].text = "Patient has intellectual disability"
