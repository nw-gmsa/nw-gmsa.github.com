Instance: MessageHeaderPatient
InstanceOf: MessageHeader
Title: "Message Header - Patient"
Description: "TODO"
Usage: #example

* meta.lastUpdated = "2025-02-01T13:39:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#A31

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RBS"
* destination.receiver.display = "ALDER HEY CHILDREN'S NHS FOUNDATION TRUST"
* destination.endpoint = "https//tie.alderhey.nhs.uk"

* source.endpoint = "https//rie.nw-gmsa.nhs.uk/"
* source.software = "GMSA RIE"

* focus[+]
  * reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
  * type = #Patient
