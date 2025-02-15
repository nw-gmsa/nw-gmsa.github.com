Instance: MessageHeaderGenomicReport
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report"
Description: "TODO"
Usage: #example

* meta.lastUpdated = "2025-02-01T13:39:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"

* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "RBS"
* destination.receiver.display = "ALDER HEY CHILDREN'S NHS FOUNDATION TRUST"
* destination.endpoint = "https//tie.mft.nhs.uk"

* source.endpoint = "https//tie.alderhey.nhs.uk/"
* source.software = "MFT TIE"

* focus[+]
  * reference = "urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f"
  * type = #DiagnosticReport

* focus[+]
  * reference = "urn:uuid:94bf65ba-cd6c-4601-b339-6d547f424646"
  * type = #DocumentReference
