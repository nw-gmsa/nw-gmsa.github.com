Instance: MessageHeaderO21ctDNA
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order ctDNA O21"
Description: "TODO"
Usage: #example


* meta.lastUpdated = "2026-07-13T10:39:26+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699N0"
* destination.receiver.display = "NEY GMSA"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NEYAWSSQS"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"
* source.software = "NW GMSA"

* focus[+]
  * reference = "urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-ctDNA
InstanceOf: BundleMessage
Title:       "Bundle 'Message' - Genomics Order ctDNA O21"
Description:  "Genomics Order ctDNA"
Usage: #example
* insert MessageBundle("urn:uuid:1aa724a8-981e-488e-9e6b-7a73e7c3c07a", "2025-10-14T15:59:16+00:00")
* insert EntryDocument("urn:uuid:72d8c754-ebd0-4e3c-b6e1-4d99cadb7f50", MessageHeaderO21ctDNA)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:6e26d6b3-490e-4348-9d6c-37281567d6ec", ServiceRequest-ctDNA)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
