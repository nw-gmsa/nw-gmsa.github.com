Instance: TaskGenomicOrderCompleted
InstanceOf: Task
Title: "Task Genomic Test Completed"
Description: "**For future use.** Referral Outcome [PCC-57]: the NW GLH has issued every report for the laboratory order, so the order is complete (HL7 v2 OSU^O51, ORC-1 SC, ORC-5 CM). The reports are external references to the NHS England Unified Genomic Record (UGR)."
Usage: #example
* insert GenomicOrderStatusTask

* identifier[+].
  * value = "25GEN-029GN00001"
  * system = "http://www.acme.org/specimen/Beaker"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* status = #completed
* businessStatus = ReferralWorkflowStatus#completed
* lastModified = "2025-02-20T11:00:00+00:00"

* output[+]
  * type = TaskInputOutputParameterType#reference-results
  // External reference to the report held in the NHS England Unified Genomic Record (UGR)
  * valueReference.reference = "https://ugr.example.nhs.uk/FHIR/R4/DiagnosticReport/25edee2b-add8-4522-9fa2-1ee8f229bd75"
  * valueReference.type = "DiagnosticReport"
  * valueReference.display = "Genomic test report (NHS England Unified Genomic Record)"
  * valueReference.identifier.type = $v2-0203#FILL
  * valueReference.identifier.system = "http://www.acme.org/diagnosticreport/identifiers"
  * valueReference.identifier.value = "25edee2b-add8-4522-9fa2-1ee8f229bd75"
  * valueReference.identifier.assigner.identifier.system = $ods-code
  * valueReference.identifier.assigner.identifier.value = "699X0"
