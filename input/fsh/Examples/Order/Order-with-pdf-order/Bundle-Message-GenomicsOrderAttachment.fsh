Instance: GenomicsOrderMessageAttachment
InstanceOf: Bundle
Title:       "Bundle 'Message' - Genomics Order with Attachment"
Description:  "Influenced by HL7 v2 OML_O21"
Usage: #example
* insert MessageBundle("9612365d-52a4-4fab-87e7-8a09d753f095", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:9a7e9fd9-d774-42ef-bd23-4397a1ba1b63", MessageHeaderGenomicOrder)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-OctaviaCHISLETT-9449305552)
* insert EntryDocument("urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3", 984b8a89-4194-4eb4-a7ea-ca8049ebeea3)
// Practitioner Role - order creator
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
* insert EntryDocument("urn:uuid:54b526e9-60a7-4602-9cb3-50ab3be7b564", ServiceRequestGenomicsOrderAttachment)
* insert EntryDocument("urn:uuid:a293b4a6-e46b-4402-9b2b-d9517afc7137", a293b4a6-e46b-4402-9b2b-d9517afc7137)
* insert EntryDocument("urn:uuid:0a898233-763c-405d-8172-8c4f07e6e636", 837d78a0-30cd-478c-83a8-f83d16fc4443)
* insert EntryDocument("urn:uuid:89e66518-9197-4553-9253-5ab5133b62c0", SpecimenExample)
