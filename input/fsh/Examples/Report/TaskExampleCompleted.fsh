Instance: TaskGenomicOrderCompleted
InstanceOf: Task
Title: "Task Genomic Test Completed"
Description: "TODO"

* identifier[+].
  * value = "25GEN-029GN00001"
  * system = "https://fhir.mft.nhs.uk/Id/Specimen/Beaker"
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
* focus.identifier.system = "urn:oid:1.2.840.114350.1.13.861.1.7.2.798268"
* focus.identifier.assigner.identifier.system = $ods-code
* focus.identifier.assigner.identifier.value = "R0A"

* requester.reference = "PractitionerRole/ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C3456789"
* requester.display = "Dr Samuel Darwin"

* owner.reference = "Organization/699X0"
* owner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"

* output[+]
  * type = http://hl7.org/fhir/task-inputoutput-parameter-type#reference-results
  * valueReference.reference = "DiagnosticReport/DiagnosticReportGenomicsReport"
  * valueReference.identifier.system = "https://fhir.nwglh.nhs.uk/Id/ReportId"
  * valueReference.identifier.value = "25edee2b-add8-4522-9fa2-1ee8f229bd75"
  * valueReference.identifier.assigner.identifier.system = $ods-code
  * valueReference.identifier.assigner.identifier.value = "699X0"
