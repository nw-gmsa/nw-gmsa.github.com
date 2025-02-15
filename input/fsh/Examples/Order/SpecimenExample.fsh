Instance: SpecimenExample
InstanceOf: Specimen
Title: "Specimen Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[+].
  * value = "25GEN-029GN00001&Beaker"
  * assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
  * assigner.identifier.value = "R0A"

* accessionIdentifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* accessionIdentifier.value = "1001166717"
* accessionIdentifier.assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* accessionIdentifier.assigner.identifier.value = "699X0"

* status = #available

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9449305552"

