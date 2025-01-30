Instance: GenomicsReportMessage
InstanceOf: Bundle
Title:       "Bundle 'Message' - Genomics Report"
Description:  "Influenced by HL7 v2 ORU_R01"
Usage: #example
* insert MessageBundle("9612365d-52a4-4fab-87e7-8a09d753f095", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:9a7e9fd9-d774-42ef-bd23-4397a1ba1b63", MessageHeaderGenomicReport)
* insert EntryDocument("urn:uuid:54b526e9-60a7-4602-9cb3-50ab3be7b564", DiagnosticReportGenomicsReport)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-JackDawkins-9912003888)
