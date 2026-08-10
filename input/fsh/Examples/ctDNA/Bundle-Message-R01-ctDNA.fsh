Instance: MessageHeaderR01ctDNA
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order ctDNA R01"
Description: "TODO"
Usage: #example


* meta.lastUpdated = "2026-07-13T10:39:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699N0"
* destination.receiver.display = "NEY GMSA"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NEYAWSSQS"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"
* source.software = "NW GMSA"

* focus[+]
  * reference = "urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3"
  * type = #DiagnosticReport


Instance: GenomicsReportMessage-ctDNA
InstanceOf: BundleMessage
Title:       "Bundle 'Message' - Genomics Report ctDNA R01"
Description:  "Genomics Report ctDNA"
Usage: #example
* insert MessageBundle("urn:uuid:306502f1-96b2-420f-b13a-2bfc174bc8f4", "2025-10-14T15:59:16+00:00")
* insert EntryDocument("urn:uuid:d63688c2-cd33-4cf1-8189-5cc2020333a3", MessageHeaderR01ctDNA)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:0a6ad8ec-b069-4a65-8c65-c7569d8413e3", DiagnosticReport-ctDNA)
//* insert EntryDocument("urn:uuid:f80f704c-b2b2-4912-ac6f-e62aaadd4ff0", GenomicStudy-ctDNA)
//* insert EntryDocument("urn:uuid:cd491a5f-62ec-4f6b-904f-206bae2c9b20", 51967-8-ctDNA)
//* insert EntryDocument("urn:uuid:b3b6b20f-8e5a-432c-8155-579dc4d60a09", 51968-6-ctDNA)
//* insert EntryDocument("urn:uuid:13028359-6a38-4dff-8978-55a57dbdfb56",DocumentReference-ctDNA)
* insert EntryDocument("urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec", ServiceRequest-ctDNA)
// Reqyester PractitionerRole
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)

