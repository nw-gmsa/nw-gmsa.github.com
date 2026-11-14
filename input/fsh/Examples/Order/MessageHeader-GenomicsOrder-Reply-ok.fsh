Instance: MessageHeaderGenomicOrderReplyOk
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order Reply ok"
Description: "Message header for the North West GLH's acknowledgement (`response.code` = `ok`) of the laboratory order (O21) from Manchester University NHS Foundation Trust"
Usage: #example

* meta.lastUpdated = "2025-01-29T10:40:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "NW GLH"

* response.identifier = "9612365d-52a4-4fab-87e7-8a09d753f095"
* response.code = #ok
