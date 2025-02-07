Instance: MessageHeaderGenomicOrder
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order"
Usage: #example

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"

* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https//glh.mft.nhs.uk"

* source.endpoint = "https//hive.mft.nhs.uk/"
* source.software = "MFT Epic"

* focus[+]
  * reference = "urn:uuid:54b526e9-60a7-4602-9cb3-50ab3be7b564"
  * type = #ServiceRequest
