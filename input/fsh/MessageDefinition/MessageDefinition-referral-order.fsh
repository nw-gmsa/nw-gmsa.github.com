// FHIR Messaging for the IHE 360X HL7 v2 referral order (OMG^O19) and order status
// updates (OSU^O51), adapted from the Patient Care Coordination proof of concept for
// Genetic Clinical Referral. For future use - see Referral Request [PCC-55].

Instance:  referral-order
InstanceOf: MessageDefinition
Title:   "Message Definition - Referral Order (O19)"
Description: "**For future use.** FHIR Message equivalent of the IHE 360X HL7 v2.5.1 `OMG^O19^OMG_O19` referral order - Referral Request [PCC-55]. The focus is the referral `ServiceRequest`."
Usage:  #definition

* name = "ReferralOrder"
* title = "Referral Order (O19)"
* status = #draft
* experimental = true
* date = "2026-11-03"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O19
* category = #consequence
* description = """
**For future use.** FHIR Message equivalent of the IHE 360X HL7 v2.5.1 `OMG^O19^OMG_O19`
referral order (ORC-1 `NW`), used for a [Genetic Clinical
Referral](StructureDefinition-GeneticClinicalReferral.html) - `ServiceRequest.code`
SNOMED CT `306119003`. The Referral Recipient replies with a [Referral Order Status
(O51)](MessageDefinition-referral-order-status.html) message (accept or decline). A
laboratory order sent as `OMG^O19` uses the [Laboratory
Order](MessageDefinition-laboratory-order.html) FHIR Message instead.
"""
* focus[+]
  * code = #ServiceRequest
  * profile = "http://hl7.org/fhir/StructureDefinition/ServiceRequest"
  * min = 1
  * max = "1"
* responseRequired = #always
* allowedResponse[+]
  * message = Canonical(referral-order-status)
  * situation = "Accept (ORC-1 OK, ORC-5 IP) or decline (ORC-1 UA, ORC-5 CA) [PCC-55]."
* allowedResponse[+]
  * message = Canonical(acknowledgement)

Instance:  referral-order-status
InstanceOf: MessageDefinition
Title:   "Message Definition - Referral Order Status (O51)"
Description: "**For future use.** FHIR Message equivalent of the IHE 360X HL7 v2.5.1 `OSU^O51^OSU_O51` order status update for a referral or laboratory order - accept, decline, interim note, outcome, cancel request and cancel confirmation [PCC-55] to [PCC-59]. The focus is the `Task`."
Usage:  #definition

* name = "ReferralOrderStatus"
* title = "Referral Order Status (O51)"
* status = #draft
* experimental = true
* date = "2026-11-03"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O51
* category = #notification
* description = """
**For future use.** FHIR Message equivalent of the IHE 360X HL7 v2.5.1 `OSU^O51^OSU_O51`
order status update, for a [Genetic Clinical
Referral](StructureDefinition-GeneticClinicalReferral.html) or a laboratory order ([Genomic
Test Order](StructureDefinition-GenomicTestOrder.html)). The
[Task](StructureDefinition-Task.html) carries the status
(`status`, `businessStatus`, `statusReason`); for an outcome [PCC-57] the message also
carries the clinical document or report referenced from `Task.output`.

Where the referral is managed by the NHS England Genomic Order Management Service (GOMS),
the Regional Integration Engine (RIE) receives a `genomic-order-event-1` notification
from the NHS England Multicast Notification Service (MNS), retrieves the `Task` from GOMS,
and converts it to this message (or HL7 v2 `OSU^O51`) for the Referral Initiator - see
[Referral Request [PCC-55]](PCC-55.html#status-updates-from-goms-via-mns).

| 360X | ORC-1 / ORC-5 | Task.businessStatus |
|---|---|---|
| Accept [PCC-55] | OK / IP | accepted |
| Decline [PCC-55, PCC-56] | UA / CA | declined |
| Interim Consultation Note [PCC-59] | SC / A | interim-report |
| Referral Outcome [PCC-57] | SC / CM | completed |
| Cancel Request [PCC-58] | CA / CA | cancel-requested |
| Cancel Confirmation [PCC-58] | CR / CA | cancelled |
"""
* focus[+]
  * code = #Task
  * profile = Canonical(Task)
  * min = 1
  * max = "1"
* responseRequired = #on-error
* allowedResponse[+]
  * message = Canonical(acknowledgement)
