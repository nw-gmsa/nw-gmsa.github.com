Instance: TaskGenomicOrderCompleted
InstanceOf: Task
Title: "Task Genomic Test Completed"
Description: "TODO"

* identifier[+].
  * value = "25GEN-029GN00001"
  * system = "http://www.acme.org/specimen/Beaker"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* status = #completed
* intent = #order

* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill

* for.reference = "Patient/Patient-OctaviaCHISLETT-9449305552"
* for.display = "Octavia CHISLETT"
* for.identifier
  * system = $nhs-number
  * value = "9449305552"

* authoredOn = "2025-01-29"

* focus.reference = "ServiceRequest/ServiceRequestGenomicsOrderCodedEntries"
* focus.identifier.type = $v2-0203#PLAC
* focus.identifier.value = "1601737"
* focus.identifier.system = "http://www.acme.org/servicerequest/identifier"
* focus.identifier.assigner.identifier.system = $ods-code
* focus.identifier.assigner.identifier.value = "R0A"

* requester.reference = "Organization/R0A"
* requester.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* requester.identifier.value = "R0A"
* requester.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* owner.reference = "Organization/699X0"
* owner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"

* output[+]
  * type = http://hl7.org/fhir/task-inputoutput-parameter-type#reference-results
  * valueReference.reference = "DiagnosticReport/DiagnosticReportGenomicsReport"
  * valueReference.identifier.system = "http://www.acme.org/diagnosticreport/identifiers"
  * valueReference.identifier.value = "25edee2b-add8-4522-9fa2-1ee8f229bd75"
  * valueReference.identifier.assigner.identifier.system = $ods-code
  * valueReference.identifier.assigner.identifier.value = "699X0"
