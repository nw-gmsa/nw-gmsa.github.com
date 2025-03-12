
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

The following messages are used to support creation and updating of the [Genomics Test Report](vol3.html#genomic-test-report-entity-model) [composition](https://martinfowler.com/bliki/AggregationAndComposition.html)

| Message                                   | Purpose                                       | EIP Type                                                                                                 |
|-------------------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------|
| [Laboratory Results](#laboratory-results) | The results for a `laboratory-order` request. | [Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) |


### Laboratory Results

Is based on a HL7 FHIR [unsolicited-observation (R01)](MessageDefinition-unsolicited-observation.html) Message which is backwards compatible with HL7 v2 ORU_R01 Message.

Detailed Mapping can be here [Message ORU_R01 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html)

| FHIR Resource                                                                                                   | HL7 v2 ORU Segment                  | Cardinality | Map                                                                                                                                                                                                                   | 
|-----------------------------------------------------------------------------------------------------------------|-------------------------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| MessageHeader                                                                                                   | MSH - Message Header                | 1..1        | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)                                                                                                           |
| Patient                                                                                                         | PID - Patient Identification        | 1..1        | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html)                                                                                                                       |    
| Encounter                                                                                                       | PV1 - Patient visit                 | 0..1        | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html) via DiagnosticReport.encounter <br/> (.identifier (PV1-19) preferred, Encounter is optional)                      | 
| **ORDER OBSERVATION**                                                                                           |                                     | 1..*        |                                                                                                                                                                                                                       |
| [DiagnosticReport](StructureDefinition-DiagnosticReport.html)                                                   | - ORC - Common Order                | 1..*        | [ORC[DiagnosticReport]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-diagnosticreport.html)                                                                                                     |
| [ServiceRequest](StructureDefinition-ServiceRequest.html)                                                       |                                     |             | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)                                                                                                         |
|                                                   | - OBR - Observations Request        | 1..*        | [OBR[DiagnosticReport]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html)                                                                                                     |
| DiagnosticReport.note                                                                                           | - NTE - Notes and Comments          |             |                                                                                                                                                                                                                       |
| -- **OBSERVATION**                                                                                              |                                     | 1..*        |                                                                                                                                                                                                                       |
| Observation or Attachment (part of DiagnosticReport)                                                            | -- OBX - Observation/Result         | 0..*        | [OBX[Observation]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-observation.html)                                                                                                               |                                                                                                          |
| [DocumentReference](StructureDefinition-DocumentReference.html) <br/> [Binary](StructureDefinition-Binary.html) | -- OBX Observation/Result (type=ED) | 0..*        | [OBX[Observation-Component]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-documentreference.html) DiagnosticReport.extension:supporting-info <br/> and DiagnosticReport.presentedForm to Binary |

<figure>
{%include LAB3-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Order Results management [LAB-3] Sequence Diagram</p>
</figure>
<br clear="all">

### Message Delivery - Polling

During initial phases the 'laboratory report' will be delivered following a [EIP Polling Consumer](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PollingConsumer.html) pattern. This will follow HL7 FHIR [Asynchronous Messaging using the RESTful API](https://hl7.org/fhir/R4/messaging.html#rest)

The Order Placer (or TIE) FHIR RESTful query to retrieve their messages.

```
GET [base]/Bundle?message.receiver:identifier=[odsCode]&_lastUpdated=[date]
```

Example returned search results [Bundle 'SearchSet' - Genomics Order](Bundle-GenomicsOrderSearchSet.html)

Initially only queries by ODS Code will be supported to support TIE to TIE exchanges.

#### Update HL7 FHIR Messages

Messages that have been accepted by the calling Order Place (or TIE), need to be acknowledged and removed from the MessageQueue. This is achieved by sending back the messages with the sender and destination fields reversed, i.e.

**Orignial Message Header**

```
{
  "resourceType" : "MessageHeader",
  "eventCoding" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v2-0003",
    "code" : "R01"
  },
  "destination" : [
    {
      "endpoint" : "https//hive.mft.nhs.uk",
      "receiver" : {
        "identifier" : {
          "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
          "value" : "R0A"
        }
      }
    }
  ],
  "sender" : {
    "identifier" : {
      "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
      "value" : "699X0"
    }
  },
  "response" : {
    "identifier" : "9612365d-52a4-4fab-87e7-8a09d753f095",
    "code" : "ok"
  }
}
```

**Message Header for returned update**

```
{
  "resourceType" : "MessageHeader",
  "eventCoding" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v2-0003",
    "code" : "R01"
  },
  "destination" : [
    {
      "receiver" : {
        "identifier" : {
          "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
          "value" : "699X0"
        }
      }
    }
  ],
  "sender" : {
    "identifier" : {
      "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
      "value" : "R0A"
    }
  },
  "response" : {
    "identifier" : "9612365d-52a4-4fab-87e7-8a09d753f095",
    "code" : "ok"
  }
}
```

This update is sent back to the RIE as a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction)

```
POST [base]/
```


