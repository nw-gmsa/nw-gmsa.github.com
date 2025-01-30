Instance: MessageHeaderGenomicReport
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report"
Usage: #example

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* sender.identifier.value = "R0A"
* sender.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* destination.receiver.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* destination.receiver.identifier.value = "RBS"
* destination.receiver.display = "ALDER HEY CHILDREN'S NHS FOUNDATION TRUST"
* destination.endpoint = "https//tie.mft.nhs.uk"

* source.endpoint = "https//tie.alderhey.nhs.uk/"
* source.software = "MFT TIE"

* focus[+]
  * reference = "urn:uuid:54b526e9-60a7-4602-9cb3-50ab3be7b564"
  * type = #DocumentReference
