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

Instance: NGIS-LabSampleIdentifier
InstanceOf: NamingSystem
Title: "NGIS Lab Sample Identifier"
Description: "NGIS lab sample ID: the 2D barcode on the DNA tube (e.g. FluidX `4000000004`, `dispatched_sample_lsid` in the dWGS manifest), assigned by the laboratory that sent the tube. Genomics England's `GermlineSample.labSampleId`. Carried as `Specimen.container.identifier` with type `ZCID`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."
Usage: #definition
* name = "NGISLabSampleIdentifier"
* status = #draft
* kind = #identifier
* date = "2026-11-14"
* responsible = "Genomics England"
* type = $nwgmsa#ZCID
* uniqueId[+]
  * type = #uri
  * value = "https://genomicsengland.co.uk/healthcare/lab-sample-id"
  * preferred = true
* description = "NGIS lab sample ID: the 2D barcode on the DNA tube (e.g. FluidX `4000000004`, `dispatched_sample_lsid` in the dWGS manifest), assigned by the laboratory that sent the tube. Genomics England's `GermlineSample.labSampleId`. Carried as `Specimen.container.identifier` with type `ZCID`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."

Instance: NGIS-PrimarySampleIdentifier
InstanceOf: NamingSystem
Title: "NGIS Primary Sample Identifier"
Description: "NGIS primary sample ID: the GLH's identifier for the primary sample (e.g. `S26-1A04`, `primary_sample_id_in_glh_lims` in the dWGS manifest), assigned by the GLH laboratory. Carried as `Specimen.accessionIdentifier` with type `ACSN`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."
Usage: #definition
* insert LIMSNamingSystem(NGISPrimarySampleIdentifier, https://genomicsengland.co.uk/healthcare/primary-sample-id, ACSN)
* responsible = "Genomics England"
* description = "NGIS primary sample ID: the GLH's identifier for the primary sample (e.g. `S26-1A04`, `primary_sample_id_in_glh_lims` in the dWGS manifest), assigned by the GLH laboratory. Carried as `Specimen.accessionIdentifier` with type `ACSN`. The system is the national one used by Genomics England and the NHS England Upload Genomic Data API."
