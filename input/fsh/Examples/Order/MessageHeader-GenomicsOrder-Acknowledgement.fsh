Instance: MessageHeaderGenomicOrderAcknowledgement
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order Acknowledgement"
Description: "TODO"
Usage: #example

* meta.lastUpdated = "2025-01-29T10:40:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O22

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https//hive.mft.nhs.uk"

* source.endpoint = "https//glh.mft.nhs.uk/"
* source.software = "NW GLH"

* response.identifier = "9612365d-52a4-4fab-87e7-8a09d753f095"
* response.code = #ok
