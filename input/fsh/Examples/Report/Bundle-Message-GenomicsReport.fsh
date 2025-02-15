Instance: GenomicsReportMessage
InstanceOf: Bundle
Title:       "Bundle 'Message' - Genomics Report"
Description:  "Influenced by HL7 v2 ORU_R01"
Usage: #example
* insert MessageBundle("9612365d-52a4-4fab-87e7-8a09d753f095", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:9a7e9fd9-d774-42ef-bd23-4397a1ba1b63", MessageHeaderGenomicReport)
* insert EntryDocument("urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f", DiagnosticReportGenomicsReport)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-OctaviaCHISLETT-9449305552)
// Encounter
* insert EntryDocument("urn:uuid:fe5a1b08-84c9-46e6-8162-d2dcf3e67141", fe5a1b08-84c9-46e6-8162-d2dcf3e67141)
// DocumentReference
// * insert EntryDocument("urn:uuid:a293b4a6-e46b-4402-9b2b-d9517afc7137", a293b4a6-e46b-4402-9b2b-d9517afc7137)
// Binary
* insert EntryDocument("urn:uuid:0a898233-763c-405d-8172-8c4f07e6e636", 0a898233-763c-405d-8172-8c4f07e6e636)
