Profile:        NGISReferralId
Parent:         OrderGroupNumber
Id:             NGISReferralId
Title:          "NGIS Referral Id"
Description:    """
The `referral_id` returned by TOMS (Test Order Management System, Genomics England) for a Distributed WGS (dWGS)
referral. It identifies the family tested together ([Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html))
and can be used as the Order Group Number (`ServiceRequest.requisition`, HL7 v2 ORC-4 Placer Group Number).
Assigned by Genomics England Limited (ODS `8J834`).
"""

* system = "https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier" (exactly)
* value ^example.label = "dWGS Trio"
* value ^example.valueString = "r26000000203"
* assigner ^short = "Genomics England Limited (TOMS)"
* assigner.identifier.value = "8J834"
