Instance: TaskGenomicOrderRequested
InstanceOf: Task
Title: "Task Genomic Test Requested"
Description: "TODO"

* identifier[+].
  * value = "25GEN-029GN00001"
  * system = "https://fhir.mft.nhs.uk/Id/Specimen/Beaker"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* status = #requested
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

* requester.reference = "Organization/R0A"
* requester.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* requester.identifier.value = "R0A"
* requester.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* owner.reference = "Organization/699X0"
* owner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"
