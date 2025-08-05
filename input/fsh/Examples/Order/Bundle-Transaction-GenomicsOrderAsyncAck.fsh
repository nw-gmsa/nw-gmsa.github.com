Instance: Transaction-GenomicsOrderAsyncAck
InstanceOf: Bundle
Title:       "Bundle 'Transaction' - Genomics Order Asynchronous Message Acknowledgement"
Description:  "Influenced by HL7 v2 OML_O21"
Usage: #example
* type = #transaction

* insert MessageBundle("urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:9a7e9fd9-d774-42ef-bd23-4397a1ba1b63", MessageHeaderGenomicOrder)

