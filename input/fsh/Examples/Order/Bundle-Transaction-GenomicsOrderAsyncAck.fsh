Instance: TransactionGenomicsOrderReplyAck
InstanceOf: Bundle
Title:       "Bundle 'Transaction' - Genomics Order Asynchronous Message Reply Acknowledgement"
Description:  "Influenced by HL7 v2 OML_O22"
Usage: #example
* type = #transaction

* insert TransactionBundle("2024-10-13T10:33:00+00:00")
* insert EntryTransaction("Bundle","Bundle/GenomicsOrderMessageReplyAcknowledge", GenomicsOrderMessageReplyAcknowledge)

