Instance: EPIC-PV1
InstanceOf: Encounter
Title: "EPIC-PV1 Example"
Description: "TODO"

* status = #finished

* identifier[+]
  * value = "1001166717"
  * assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
  * assigner.identifier.value = "R0A"

* class = #AMB

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"
