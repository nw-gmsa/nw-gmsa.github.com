Instance: GenomicsOrderSearchSet
InstanceOf: Bundle
Title:       "Bundle 'SearchSet' - Genomics Order"
Description:  "FHIR Message Query Example for use with Asynchronous Message Delivery"
Usage: #example
* insert SearchBundle(1, [[http://rie.mft.nhs.uk/Bundle?message.reciever:identifier=R0A&_lastUpdated=>2025-03-01T02:00:02+01:00]])
* insert EntryMatch(Bundle, GenomicsOrderMessageReply)

