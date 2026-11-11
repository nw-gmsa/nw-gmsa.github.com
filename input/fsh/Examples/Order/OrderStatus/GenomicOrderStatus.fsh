// Order status examples (OSU^O51 / Referral Order Status (O51)) for the existing
// laboratory order ServiceRequestGenomicsOrderAttachment - Referral Request [PCC-55],
// Referral Decline [PCC-56] and Referral Outcome [PCC-57]. For future use.
// The completed Task is the existing TaskGenomicOrderCompleted; its reports are external
// references to the NHS England Unified Genomic Record (UGR), not carried in the message.

RuleSet: GenomicOrderStatusTask
* basedOn.reference = "ServiceRequest/ServiceRequestGenomicsOrderAttachment"
* basedOn.identifier.type = $v2-0203#PLAC
* basedOn.identifier.value = "1601737"
* basedOn.identifier.system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
* basedOn.identifier.assigner.identifier.system = $ods-code
* basedOn.identifier.assigner.identifier.value = "R0A"
* focus.reference = "ServiceRequest/ServiceRequestGenomicsOrderAttachment"
* focus.identifier.type = $v2-0203#PLAC
* focus.identifier.value = "1601737"
* focus.identifier.system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
* focus.identifier.assigner.identifier.system = $ods-code
* focus.identifier.assigner.identifier.value = "R0A"
* for.reference = "Patient/Patient-OctaviaCHISLETT-9449305552"
* for.display = "Octavia CHISLETT"
* for.identifier.type = $v2-0203#NH
* for.identifier.system = $nhs-number
* for.identifier.value = "9449305552"
* intent = #order
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill
* authoredOn = "2025-01-29"
* requester.reference = "Organization/R0A"
* requester.identifier.system = $ods-code
* requester.identifier.value = "R0A"
* requester.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* owner.reference = "Organization/699X0"
* owner.identifier.system = $ods-code
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"

// Accept [PCC-55]

Instance: TaskGenomicOrderAccepted
InstanceOf: Task
Title: "Task Genomic Test Accepted"
Description: "**For future use.** Referral Accept [PCC-55]: the NW GLH has accepted the laboratory order (HL7 v2 OSU^O51, ORC-1 OK, ORC-5 IP)."
Usage: #example
* insert GenomicOrderStatusTask
* status = #accepted
* businessStatus = ReferralWorkflowStatus#accepted
* lastModified = "2025-01-30T09:30:00+00:00"

// Decline [PCC-55] - alternative first response

Instance: TaskGenomicOrderDeclined
InstanceOf: Task
Title: "Task Genomic Test Declined"
Description: "**For future use.** Referral Decline [PCC-55]: the alternative first response - the NW GLH declines the laboratory order because the patient does not meet the test directory eligibility criteria (HL7 v2 OSU^O51, ORC-1 UA, ORC-5 CA, reason in ORC-16)."
Usage: #example
* insert GenomicOrderStatusTask
* status = #rejected
* businessStatus = ReferralWorkflowStatus#declined
* statusReason = ReferralStatusReason#not-eligible
* statusReason.text = "Does not meet the R240 eligibility criteria - no known familial variant provided. Please contact the laboratory."
* lastModified = "2025-01-30T09:30:00+00:00"

// Decline [PCC-56] - after acceptance

Instance: TaskGenomicOrderDeclinedAfterAcceptance
InstanceOf: Task
Title: "Task Genomic Test Declined after acceptance (sample unsuitable)"
Description: "**For future use.** Referral Decline [PCC-56]: the laboratory order was accepted, then the sample was found to be unsuitable, so the NW GLH declines the order (HL7 v2 OSU^O51, ORC-1 UA, ORC-5 CA, reason in ORC-16)."
Usage: #example
* insert GenomicOrderStatusTask
* status = #rejected
* businessStatus = ReferralWorkflowStatus#declined
* statusReason = ReferralStatusReason#sample-unsuitable
* statusReason.text = "Insufficient DNA extracted from the sample. Please send a new blood sample with a new order."
* lastModified = "2025-02-05T10:00:00+00:00"

// FHIR Messages - Referral Order Status (O51)

RuleSet: GenomicOrderStatusHeader(focus, date)
* meta.lastUpdated = {date}
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O51
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus.reference = {focus}
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/referral-order-status"

Instance: MessageHeaderGenomicOrderStatusAccept
InstanceOf: MessageHeader
Title: "Message Header - Order Status (O51), accepted"
Description: "**For future use.** Referral Accept [PCC-55]."
Usage: #example
* insert GenomicOrderStatusHeader("urn:uuid:9e24c762-a7a6-451a-9ee1-adf516b1e7cf", "2025-01-30T09:30:00+00:00")

Instance: GenomicOrderStatusAcceptMessage
InstanceOf: BundleMessage
Title: "Bundle Message - Order Status (O51), accepted"
Description: "**For future use.** FHIR Message equivalent of the HL7 v2 OSU^O51 accept (ORC-1 OK, ORC-5 IP) on Referral Request [PCC-55]."
Usage: #example
* insert MessageBundle("urn:uuid:3015ed84-85d1-438a-9741-2bf21d8dae38", "2025-01-30T09:30:00+00:00")
* insert EntryDocument("urn:uuid:cb7a19b2-eee2-40ea-8628-eaf95222e841", MessageHeaderGenomicOrderStatusAccept)
* insert EntryDocument("urn:uuid:9e24c762-a7a6-451a-9ee1-adf516b1e7cf", TaskGenomicOrderAccepted)

Instance: MessageHeaderGenomicOrderStatusDecline
InstanceOf: MessageHeader
Title: "Message Header - Order Status (O51), declined"
Description: "**For future use.** Referral Decline [PCC-55]."
Usage: #example
* insert GenomicOrderStatusHeader("urn:uuid:e1ba7074-9279-4e38-a640-4fd0fb59e32a", "2025-01-30T09:30:00+00:00")

Instance: GenomicOrderStatusDeclineMessage
InstanceOf: BundleMessage
Title: "Bundle Message - Order Status (O51), declined"
Description: "**For future use.** FHIR Message equivalent of the HL7 v2 OSU^O51 decline (ORC-1 UA, ORC-5 CA, reason in ORC-16) on Referral Request [PCC-55]."
Usage: #example
* insert MessageBundle("urn:uuid:713796e2-833a-440b-bccf-ba6f428aa19b", "2025-01-30T09:30:00+00:00")
* insert EntryDocument("urn:uuid:ac9ad3a5-b4b3-4c4f-90d3-ae09ab093e04", MessageHeaderGenomicOrderStatusDecline)
* insert EntryDocument("urn:uuid:e1ba7074-9279-4e38-a640-4fd0fb59e32a", TaskGenomicOrderDeclined)

Instance: MessageHeaderGenomicOrderStatusLaterDecline
InstanceOf: MessageHeader
Title: "Message Header - Order Status (O51), declined after acceptance"
Description: "**For future use.** Referral Decline [PCC-56]."
Usage: #example
* insert GenomicOrderStatusHeader("urn:uuid:e8c50144-4538-41ba-99d1-eecae8860ec8", "2025-02-05T10:00:00+00:00")

Instance: GenomicOrderStatusLaterDeclineMessage
InstanceOf: BundleMessage
Title: "Bundle Message - Order Status (O51), declined after acceptance"
Description: "**For future use.** FHIR Message equivalent of the HL7 v2 OSU^O51 on Referral Decline [PCC-56]."
Usage: #example
* insert MessageBundle("urn:uuid:399da194-8280-447d-a3ec-7585bccec0e6", "2025-02-05T10:00:00+00:00")
* insert EntryDocument("urn:uuid:6f70cb81-531c-4ef2-a21b-ef1a76b1cf9d", MessageHeaderGenomicOrderStatusLaterDecline)
* insert EntryDocument("urn:uuid:e8c50144-4538-41ba-99d1-eecae8860ec8", TaskGenomicOrderDeclinedAfterAcceptance)

Instance: MessageHeaderGenomicOrderStatusOutcome
InstanceOf: MessageHeader
Title: "Message Header - Order Status (O51), outcome"
Description: "**For future use.** Referral Outcome [PCC-57]."
Usage: #example
* insert GenomicOrderStatusHeader("urn:uuid:b0ee013a-b63d-4665-9c1f-ce87b76cdf7a", "2025-02-20T11:00:00+00:00")

Instance: GenomicOrderStatusOutcomeMessage
InstanceOf: BundleMessage
Title: "Bundle Message - Order Status (O51), outcome"
Description: "**For future use.** FHIR Message equivalent of the HL7 v2 OSU^O51 outcome (ORC-1 SC, ORC-5 CM) on Referral Outcome [PCC-57]: the completed Task only. The genomic test reports are external references (with Report Identifiers) to the NHS England Unified Genomic Record."
Usage: #example
* insert MessageBundle("urn:uuid:9efaef2e-8dbb-4e03-aa25-4968c76bd1fc", "2025-02-20T11:00:00+00:00")
* insert EntryDocument("urn:uuid:5597012c-542f-4a2d-ad4c-3431403f4b54", MessageHeaderGenomicOrderStatusOutcome)
* insert EntryDocument("urn:uuid:b0ee013a-b63d-4665-9c1f-ce87b76cdf7a", TaskGenomicOrderCompleted)
