## Referenced Standards

- A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 2a (PaLM TF-2a) Transactions](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf)
- B. **Test Order Forms**
  - See [NW GMSA Genomics Test Order](DDD-TestOrder.html) 
  - 
## Scope

This transaction is used by the Order Placer to place an Order Group (FHIR RequestGroup) (i.e., a set of Orders to be tested together for a patient) or a standalone Order to the Order Filler. The transaction enables both Order Placer and Order Filler to notify all subsequent changes of status and/or content of each Order to the other side.

[EIP - Command Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html)

## Actor Roles

<figure>
{%include LAB1-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Placer Order Management [LAB-1] Component Diagram</p>
</figure>
<br clear="all">


## Messages

The following messages are used to support creation and updating of the [Genomics Test Order](DDD-TestOrder.html) [aggregation](https://martinfowler.com/bliki/AggregationAndComposition.html)/[archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)) 

| Message                                                             | Purpose                                                                                                     | EIP Type                                                                                                |
|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| [Laboratory Order](#laboratory-order)               | Sending the initial `laboratory-order` request.                                                              | [Command Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html) |
| Laboratory Order Acknowledgement | Is used to update the `order-placer` of changes to `laboratory-order` such as an assigned `AccessionNumber` | [Event Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)     |                                                                                      |
| Laboratory Order Updates   | Is used to update master data in the `laboratory-order` such as changes to Patient and Pracitioner details. | [Event Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)     |

### Laboratory Order

Is based on a HL7 FHIR [laboratory order (O21)](MessageDefinition-laboratory-order.html) Message which is backwards compatible with HL7 v2 OML_O21 (or ORM_O01) Message.

Detailed Mapping can be here [Message OML_O21 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
Further details on genomic specific mapping can be found on [NHS England FHIR Genomics Implementation Guide - Clincial Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Clinicalheadings)

This is an initial (incomplete) map and will change to match exact requirement of GLH LIMS <- This is currently OML, not ORM (EPIC).

| FHIR Resource                                                   | HL7 v2 OML Segment                  | Cardinality                                     | Map                                                                                                                                                           | 
|-----------------------------------------------------------------|-------------------------------------|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [MessageHeader](StructureDefinition-MessageHeader.html)         | MSH Message Header                  | 1..1                                            | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)                                                   |
| [Patient](StructureDefinition-Patient.html)                     | PID Patient Identification          | 1..1                                            | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html) via ServiceRequest.subject                                    |                                                                                          |
| [Encounter](StructureDefinition-Encounter.html)                 | PV1 Patient visit                   | 0..1                                            | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html) via ServiceRequest.encounter                              | 
| **ORDER**                                                       |                                     | 1..*                                            |                                                                                                                                                               |
| [ServiceRequest](StructureDefinition-ServiceRequest.html)       | - ORC Common Order                  | 1..*                                            | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)                                                 |
| - **OBSERVATION REQUEST**                                       |                                     | 1..*                                            |                                                                                                                                                               |
| [ServiceRequest](StructureDefinition-ServiceRequest.html)       | -- OBR Observation Request          | 1..*                                            | [OBR[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html)                                                 |
| [ServiceRequest](StructureDefinition-ServiceRequest.html)       | -- NTE Notes and Comments           |                                                 | [NTE[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-servicerequest.html)                                                 |
| [Observation](StructureDefinition-Observation.html)             | -- OBX Observation/Result           | 0..*                                            | [OBX[Observation-Component]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-component-to-observation.html) via ServiceRequest.supportingInfo |
| [DocumentReference](StructureDefinition-DocumentReference.html) | -- OBX Observation/Result (type=ED) | 0..*                                            | [OBX[Observation-Component]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-documentreference.html) via ServiceRequest.supportingInfo     |
|                                                                 | -- DG1 Diagnosis                    | 0..*                                            |                                                                                                                                                               | ServiceRequest.resasonCode    |  
| - **SPECIMEN**                                                  |                                     | 0..*  Conditional - required for complete order |                                                                                                                                                               |
| [Specimen](StructureDefinition-Specimen.html)                   | -- SPM Specimen                     | 1..*                                            | [SPM[Specimen]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html) via ServiceRequest.specimen                                 |                                                                                                         |


<figure>
{%include LAB1-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional Placer Order Management [LAB-1] Sequence Diagram</p>
</figure>
<br clear="all">

#### Complete Order Test Form

In many Order Placer applications (i.e. the EPR or Order Comms) the order is captured via a form.

#### Submit Test Order Form (Send HL7 FHIR Message Laboratory Order)

The  [laboratory order (O21)](MessageDefinition-laboratory-order.html) is sent to the RIA via the [$process-message](OperationDefinition-ProcessMessage.html) API

```
POST [base]/$process-messsage
```

Example payload [Bundle 'Message' - Genomics Order](Bundle-GenomicsOrderMessageAttachment.html) 

#### Validate Message and Transform FHIR to HL7 v2 Message 

The incoming order is checked for validity, this may include [FHIR Validation](https://hl7.org/fhir/R4/validation.html) against this Implementation Guide. If the message is accepted it is then transformed to a HL7 v2 Message, else a [Response HL7 FHIR Message](#response-hl7-fhir-message) is returned listing the issues in a [FHIR OperationOutcome](StructureDefinition-OperationOutcome.html) resource.

#### Send HL7 v2 Message and Response HL7 v2 Message

The RIE then sends the converted HL7 v2 Message to the Order Filler (LIMS) which responds back with a ORL_O22? message. Depending on the capabilty of the LIMS system this may include a ORC with an accession number (Filler Order Number) and a PID with updated/new identifiers, these can then be converted to a FHIR ServiceRequest and Patient respectively. 

#### Response HL7 FHIR Message

The response message contains a FHIR MessageHeader with a populated response element, the focus element is not populated.

Example payload [Bundle 'Message' - Genomics Order Acknowledgement](Bundle-GenomicsOrderMessageAcknowledgement.html)

For sucessful messages the [MessageHeader](StructureDefinition-MessageHeader.html) will have `response.code` returned will be `ok` and will look like:

{% fragment MessageHeader/MessageHeaderGenomicOrderAcknowledgement JSON EXCEPT:response EXCEPT:identifier|code BASE:response %}

Where the identifier refers to the Bundle.identifier in the orignial message. The Bundle may also include modified FHIR Patient or ServiceRequest resources with updated and new identifiers.

When the RIE is unable to accept the message due to issues such as FHIR Validation issues, the returned [MessageHeader](StructureDefinition-MessageHeader.html) will have `response.code` returned will be `error`, e.g.:

{% fragment MessageHeader/MessageHeaderGenomicOrderAcknowledgementFatal JSON EXCEPT:response EXCEPT:identifier|code|details BASE:response %}


where the details section contains a reference to an included OperationOutcome listing details of the failure.

Should the RIE encounter a technical problem, such as an internal service such as `FHIR Validation Service` or `Terminology Service` being unavailable, the message has not been accepted and the sender should wait and try again. the returned [MessageHeader](StructureDefinition-MessageHeader.html) will have `response.code` returned will be `transient-error`, e.g.: 

{% fragment MessageHeader/MessageHeaderGenomicOrderAcknowledgementTransient JSON EXCEPT:response EXCEPT:identifier|code|details BASE:response %}


