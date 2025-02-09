Instance: ServiceRequestGenomicsOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[placerOrderNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* identifier[placerOrderNumber].value = "1601737"
* identifier[placerOrderNumber].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[placerOrderNumber].assigner.identifier.value = "R0A"

* identifier[accessionNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
* identifier[accessionNumber].value = "1001166717"
* identifier[accessionNumber].assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[accessionNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2025-01-29"

* code = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory#R240.1

* requester.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* requester.identifier.value = "C9999999"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Jack DAWKINS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"

