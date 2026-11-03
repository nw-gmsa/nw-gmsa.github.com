Profile: Task
Parent: http://hl7.org/fhir/StructureDefinition/Task
Id: Task
Description: """
`Diagnostic` Based on [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html)
"""

//* ^keyword[+] = #core "Core"
//* ^keyword[+] = #workflow "Patient Care Workflow"

* identifier only CorrelationIdentifier
* identifier MS

* groupIdentifier only CorrelationIdentifier
* groupIdentifier MS

* status MS
* businessStatus MS
* businessStatus from ReferralWorkflowStatusVS (extensible)
* businessStatus ^comment = "Referral or order status, with the matching HL7 v2 OSU^O51 ORC-1 / ORC-5 values - see [Referral Request [PCC-55]](PCC-55.html). Extensible so Tasks from other workflows (e.g. NHS England Genomic Order Management Service) are not rejected."
* statusReason MS
* statusReason from ReferralStatusReasonVS (extensible)
* statusReason ^comment = "Reason a referral or order is declined [PCC-55, PCC-56] or cancelled [PCC-58] (HL7 v2 ORC-16). Include text when the reason needs explaining to the referrer."
* intent MS
* code 1..1
* authoredOn 1..1

* for 1..1 MS
* for only Reference(Patient)
* for.identifier only NHSIdentifier

* requester only Reference(PractitionerRole or Organization)
* requester 1..1 MS
* requester.identifier only OrganisationCode

* owner only Reference(PractitionerRole or Organization)
* owner 1..1 MS
* owner.identifier only OrganisationCode

* focus 1..1 MS
* focus only Reference(ServiceRequest or Specimen)

* output MS
* output ^slicing.discriminator.type = #pattern
* output ^slicing.discriminator.path = "type"
* output ^slicing.rules = #open
* output ^slicing.ordered = false
* output ^slicing.description = "Slice based on output.type"
* output contains referenceResults 0..*

* output[referenceResults] ^short = "A report or document issued for the order - an external reference, the content is not carried in the Task"
* output[referenceResults] ^comment = "One entry per report issued, including reports from filler (sub) orders - see [Referral Outcome [PCC-57]](PCC-57.html#genomic-orders-with-multiple-reports)."
* output[referenceResults].type = TaskInputOutputParameterType#reference-results
// External systems (UGR, NRL), so the base resources not NW GMSA profiles
* output[referenceResults].value[x] only Reference(http://hl7.org/fhir/StructureDefinition/DiagnosticReport or http://hl7.org/fhir/StructureDefinition/DocumentReference)
* output[referenceResults].valueReference.reference MS
* output[referenceResults].valueReference.reference ^comment = "Absolute URL of the `DiagnosticReport` in the NHS England Unified Genomic Record (UGR), or of the `DocumentReference` in the NHS England National Record Locator (NRL), where known. Never a reference to a resource in the message or the sender's own repository."
* output[referenceResults].valueReference.type 1..1 MS
* output[referenceResults].valueReference.type ^comment = "`DiagnosticReport` (UGR) or `DocumentReference` (NRL)"
* output[referenceResults].valueReference.identifier 1..1 MS
* output[referenceResults].valueReference.identifier ^comment = "The [Report Identifier](StructureDefinition-ReportIdentifier.html) (type `FILL`, assigned by the laboratory) - the same value as OBR-3 on the report's `ORU_R01` and `DiagnosticReport.identifier`. Required so the Order Placer can match the reference to a report it has already received, as `reference` may be absent."
