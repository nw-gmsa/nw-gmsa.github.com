
## Referenced Standards

- A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 2a (PaLM TF-2a) Transactions](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf)
- B. [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)

## Scope

It transmits the observation results from the Order Filler to the Order Result Tracker, when a result is acquired, clinically validated, modified or deleted at the Order Filler level. 

[EIP - Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html)

## Actor Roles

<figure>
{%include LAB3-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Order Results management [LAB-3] Component Diagram</p>
</figure>
<br clear="all">

## Message

The following messages are used to support creation and updating of the [Genomics Test Report](DDD-TestReport.html) [composition](https://martinfowler.com/bliki/AggregationAndComposition.html)

| Message                                   | Purpose                                       | EIP Type                                                                                                 |
|-------------------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------|
| [Laboratory Results](#laboratory-results) | The results for a `laboratory-order` request. | [Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) |


### Laboratory Results

<div class="alert alert-info" role="alert">
<b>FHIR Message Definition:</b> <a href="MessageDefinition-unsolicited-observation.html" _target="_blank">Unsolicited Observations (R01)</a> 
</div>

<figure>
{%include LAB3-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Order Results management [LAB-3] Sequence Diagram</p>
</figure>
<br clear="all">

### Asynchronous Message Delivery

During initial phases the 'laboratory report' will be delivered following a [EIP Polling Consumer](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PollingConsumer.html) pattern. This will follow HL7 FHIR [Asynchronous Messaging using the RESTful API](https://hl7.org/fhir/R4/messaging.html#rest)

The Order Placer (or TIE) FHIR RESTful query to retrieve their messages.

<div class="alert alert-success" role="alert">
GET [base]/Bundle?message.receiver:identifier=[odsCode]&_lastUpdated=[date]
</div>

Example returned search results [Bundle 'SearchSet' - Genomics Order](Bundle-GenomicsOrderSearchSet.html)

Initially, only queries by ODS Code will be supported to support TIE to TIE exchanges.

#### Update HL7 FHIR Messages

Messages that have been accepted by the calling Order Place (or TIE) need to be acknowledged and removed from the MessageQueue. This is achieved by sending back the messages with the sender and destination fields reversed, i.e.

**Orignial Message Header**

{% fragment MessageHeader/MessageHeaderGenomicReport JSON %}

**Message Header for returned update**

{% fragment MessageHeader/MessageHeaderGenomicReportAck JSON %}

This update is sent back to the RIE as a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction)

```
POST [base]/
```


