Instance: NGIS-ReferralIdentifier
InstanceOf: NamingSystem
Title: "NGIS Referral Identifier"
Description: "NGIS referral_id (e.g. `r26000000203`), assigned by Genomics England (8J834) when a referral is registered in its Test Order Management System (TOMS). Identifies the referral and the family tested together. Used as the Order Filler Number of the original order, the Order Group Number (`ServiceRequest.requisition`) of each participant's sub-order, and `FamilyGeneticGroup.identifier`."
Usage: #definition
* insert LIMSNamingSystem(NGISReferralIdentifier, https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier, PGN)
* responsible = "Genomics England"
* description = "NGIS referral_id (e.g. `r26000000203`), assigned by Genomics England (8J834) when a referral is registered in its Test Order Management System (TOMS). Identifies the referral and the family tested together. Used as the Order Filler Number of the original order, the Order Group Number (`ServiceRequest.requisition`) of each participant's sub-order, and `FamilyGeneticGroup.identifier`."
