// Referral workflow status and status reasons - adapted from the Patient Care
// Coordination (360X) proof of concept for Genetic Clinical Referral. For future use.

CodeSystem: ReferralWorkflowStatus
Id: referral-workflow-status
Title: "Referral Workflow Status"
Description: """
**For future use.** Business status of a [Genetic Clinical
Referral](StructureDefinition-GeneticClinicalReferral.html) or a laboratory order
([Genomic Test Order](StructureDefinition-GenomicTestOrder.html)), from the IHE 360X state
transitions (PCC TF-1 X.4.1). Carried in `Task.businessStatus`, with the matching HL7 v2
`OSU^O51` ORC-1 / ORC-5 values - see [Referral Request [PCC-55]](PCC-55.html).
`information-requested` is not in 360X; it covers the eRS "return to referrer" step.
"""
* ^experimental = true
* ^caseSensitive = true
* #requested "Referral requested" "The Referral Initiator has sent the referral request [PCC-55]."
* #information-requested "More information requested" "The Referral Recipient has asked for more information or a completed form before deciding (eRS return to referrer; not in 360X)."
* #accepted "Referral accepted" "The Referral Recipient has accepted the referral [PCC-55] (ORC-1 OK, ORC-5 IP)."
* #declined "Referral declined" "The Referral Recipient has declined the referral, initially [PCC-55] or after acceptance [PCC-56] (ORC-1 UA, ORC-5 CA)."
* #interim-report "Interim consultation note sent" "The Referral Recipient has sent an interim consultation note [PCC-59] (ORC-1 SC, ORC-5 A)."
* #cancel-requested "Cancellation requested" "The Referral Initiator has asked for the referral to be cancelled [PCC-58] (ORC-1 CA, ORC-5 CA)."
* #cancelled "Referral cancelled" "The Referral Recipient has confirmed the cancellation [PCC-58] (ORC-1 CR, ORC-5 CA). Ends the referral."
* #completed "Referral completed" "The Referral Recipient has sent the referral outcome [PCC-57] (ORC-1 SC, ORC-5 CM). Ends the referral."

ValueSet: ReferralWorkflowStatusVS
Id: referral-workflow-status-vs
Title: "Referral Workflow Status Value Set"
Description: "**For future use.** Business status of a referral, from the IHE 360X state transitions."
* ^experimental = true
* include codes from system ReferralWorkflowStatus

CodeSystem: ReferralStatusReason
Id: referral-status-reason
Title: "Referral Status Reason"
Description: """
**Example only, for future use.** Reasons a referral or laboratory order is declined [PCC-55, PCC-56] or
cancelled [PCC-58] (HL7 v2 ORC-16). 360X only requires free text (ORC-16.2). NHS England
eRS, BaRS and the Genomic Order Management Service may have their own reasons - **To
confirm** whether one of those should replace this list.
"""
* ^experimental = true
* ^caseSensitive = true
* #service-not-provided "Service not provided" "The requested service is not provided by the Referral Recipient."
* #not-eligible "Patient not eligible" "The patient does not meet the service's referral criteria (e.g. National Genomic Test Directory eligibility)."
* #insufficient-information "Insufficient information" "The referral does not contain enough information to triage (e.g. no pathology report or family history)."
* #sample-unsuitable "Sample unsuitable" "The sample cannot be tested (e.g. insufficient DNA); a new sample and order are needed."
* #patient-declined "Patient declined" "The patient has declined the referral or the care offered (e.g. genetic counselling)."
* #no-show "Patient did not attend" "The patient did not attend, and the service has discharged them back to the referrer."
* #no-longer-required "No longer required" "The referral is no longer needed (cancellation)."
* #duplicate "Duplicate referral" "The referral duplicates another referral."
* #other "Other" "Another reason, given as text."

ValueSet: ReferralStatusReasonVS
Id: referral-status-reason-vs
Title: "Referral Status Reason Value Set"
Description: "**Example only, for future use.** Reasons a referral is declined or cancelled."
* ^experimental = true
* include codes from system ReferralStatusReason
