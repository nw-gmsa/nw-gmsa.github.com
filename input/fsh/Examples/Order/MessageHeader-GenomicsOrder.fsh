Instance: MessageHeaderGenomicOrder
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order"
Description: "TODO"
Usage: #example


* meta.lastUpdated = "2025-01-29T10:39:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https//fhir.mft.nhs.uk/Endpoint/LIMS"

* source.endpoint = "https//fhir.mft.nhs.uk/Endpoint/HIVE"
* source.software = "MFT Epic"

* focus[+]
  * reference = "urn:uuid:54b526e9-60a7-4602-9cb3-50ab3be7b564"
  * type = #ServiceRequest
