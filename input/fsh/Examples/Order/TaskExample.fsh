Instance: TaskExample
InstanceOf: Task
Title: "Task Genomic Test Requested"
Description: "TODO"

* identifier[+].
  * value = "25GEN-029GN00001"
  * system = "https://fhir.mft.nhs.uk/Id/Specimen/Beaker"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* status = #accepted
* intest = #order

* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill

* for.reference = "Patient/Patient-OctaviaCHISLETT-9449305552"
* for.display = "Octavia CHISLETT"
* for.identifier
  * system = $nhs-number
  * value = "9449305552"

* requester.reference = "PractitionerRole/ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"
* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C3456789"
* requester.display = "Dr Samuel Darwin"

* owner.reference = "Organization/699X0"
* owner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"
