Instance: fe5a1b08-84c9-46e6-8162-d2dcf3e67141
InstanceOf: Encounter
Title: "GLH-PV1 Example"
Description: "TODO"

* status = #finished

* identifier[+]
  * value = "1001"
  * assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
  * assigner.identifier.value = "699X0"

* class = #AMB

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"

* period.start = "2025-01-29T10:37:26+00:00"

* participant[referringDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#REF
* participant[referringDoctor].individual.reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* location[+]
  * location.identifier.system = "https://fhir.nhs.uk/Id/ods-site-code"
  * location.identifier.value = "699X0"
  * location.identifier.assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
  * location.identifier.assigner.identifier.value = "699X0"
