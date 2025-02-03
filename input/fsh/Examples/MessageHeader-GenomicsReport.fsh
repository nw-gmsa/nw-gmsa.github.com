Instance: MessageHeaderGenomicReport
InstanceOf: MessageHeader
Title: "Message Header - Genomic Report"
Usage: #example

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

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
  * reference = "uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80"
  * type = #DiagnosticReport
