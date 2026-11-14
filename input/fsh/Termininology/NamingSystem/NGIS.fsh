Instance: NGIS-ReferralIdentifier
InstanceOf: NamingSystem
Title: "NGIS Referral Identifier"
Description: "NGIS referral_id (e.g. `r26000000203`), assigned by Genomics England (8J834) when a referral is registered in its Test Order Management System (TOMS). Identifies the referral and the family tested together. Used as the Order Filler Number of the original order, the Order Group Number (`ServiceRequest.requisition`) of each participant's sub-order, and `FamilyGeneticGroup.identifier`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."
Usage: #definition
* insert LIMSNamingSystem(NGISReferralIdentifier, https://genomicsengland.co.uk/healthcare/referral-id, PGN)
* responsible = "Genomics England"
* description = "NGIS referral_id (e.g. `r26000000203`), assigned by Genomics England (8J834) when a referral is registered in its Test Order Management System (TOMS). Identifies the referral and the family tested together. Used as the Order Filler Number of the original order, the Order Group Number (`ServiceRequest.requisition`) of each participant's sub-order, and `FamilyGeneticGroup.identifier`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."

Instance: NGIS-ParticipantIdentifier
InstanceOf: NamingSystem
Title: "NGIS Participant Identifier"
Description: "NGIS participant_id, the NGIS Patient ID (e.g. `p26000000104`, `patient_ngis_id` in the dWGS manifest), assigned by Genomics England (8J834) when a participant is added to a referral in its Test Order Management System (TOMS). Carried as `Patient.identifier` with type `PI`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."
Usage: #definition
* insert LIMSNamingSystem(NGISParticipantIdentifier, https://genomicsengland.co.uk/healthcare/participant-id, PI)
* responsible = "Genomics England"
* description = "NGIS participant_id, the NGIS Patient ID (e.g. `p26000000104`, `patient_ngis_id` in the dWGS manifest), assigned by Genomics England (8J834) when a participant is added to a referral in its Test Order Management System (TOMS). Carried as `Patient.identifier` with type `PI`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."
