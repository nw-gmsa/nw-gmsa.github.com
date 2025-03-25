
## Introduction

The [Intermediary](ActorDefinition-Intermediary.html), North West GMSA Regional Integration Engine (RIE) is an [Enterprise Service Bus](https://en.wikipedia.org/wiki/Enterprise_service_bus) most commonly known in the NHS as a Trust Integration Engine (TIE).

This implement as series of [Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/) based around messaging, the diagrams below follow conventions used for these patterns.

The ESB has a [Canonical Data Model](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CanonicalDataModel.html) which is expressed in this Implementation Guide using HL7 FHIR. This model is common to all the exchange formats used in the ESB:

- JSON [HL7 FHIR](https://hl7.org/fhir/)
- pipe+hat [HL7 v2](https://en.wikipedia.org/wiki/Health_Level_7)
- potential use case for sharing reports: XML [IHE XDS.b](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html)

This canonical model is a mandatory extension to [HL7 UK Core](https://simplifier.net/guide/ukcoreversionhistory) and includes requirements from 
- [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](https://interop-nwengland.github.io/LTW-Genomics/DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
- [Royal College of Radiologist](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)
- [IHE Europe Metadata for exchange medical documents and images](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf) see UK content.
- [NHS Data Model and Dictionary](https://www.datadictionary.nhs.uk/)

> This canonical model is not specific to Genomics. It is focused on standard message construction patterns in particular [CorrelationIdentifier](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CorrelationIdentifier.html) such as Order Numbers and Episode/Stay Identifiers and use of Clinical Coding Systems such as UK SNOMED CT. 
> 
> Genomic Specific modelling, which this model supports, can be found on [NHS England FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide)

To support genomics workflow, this guide is aligned to enterprise workflow processes described in [IHE Laboratory Testing Workflow](https://wiki.ihe.net/index.php/Laboratory_Testing_Workflow), terminology from this guide especially around Actors is used throughout this Implementation Guide.

Three types of messages are used within this workflow process:

| Message Type                                                                                                  | HL7 Name                     | IHE Name                                                         | Description                                             |
|---------------------------------------------------------------------------------------------------------------|------------------------------|------------------------------------------------------------------|---------------------------------------------------------|
| [**C**ommand Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html)   | Laboratory Order O21         | [LAB-1](LAB-1.html) and [LAB-4](LAB-1.html)                      | To request a laboratory order                           |
| [**E**vent Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)       | Laboratory Order O21 and O22 | [LAB-1](LAB-1.html), [LAB-4](LAB-1.html) and [LAB-2](LAB-2.html) | Used to inform participants in the workflow of changes. | 
| [**D**ocument Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) | Laboratory Report R01        | [LAB-3](LAB-3.html) and [LAB-5](LAB-5.html)                      | Used to transfer the report to interested parties       | 


## Phase 1 ESB

<img style="padding:3px;width:60%;" src="Phase 1 ESB.drawio.png" alt="Phase 1 ESB Architecture"/>
<br clear="all">
<p class="figureTitle">Phase 1 ESB Architecture</p> 
<br clear="all">

### Laboratory Order

- **Accept Message** The Order Placer (NHS trust) sends a FHIR Message (NW GMSA) Laboratory Order O21 to the RIE via the $process-message endpoint
  - If the RIE doesn’t understand the message for technical reasons it will respond immediately with an error message.
  - **Validation** The RIE performs FHIR Validation on the order against the requirements listed in this Implementation Guide. The validation contains no errors, it is accepted, any errors will cause the message to be rejected. The RIE responds to the order placer asynchronously via a message queue, this is accessed by the order placer via a **Polling Consumer**
- **Distribution List** If the message is accepted, it is passed to a router, at present this router passes the message onto the next process. This router is for future use with the national broker.
- **Transform to HL7 v2** The RIE will convert the FHIR Message to a HL7 v 2.3 ORM O01 and send this to iGene.

### Laboratory Report

- IGene sends the HL7 v2 ORU_R01 to RIE
- **Transform to HL7 FHIR** The RIE converts the report into a FHIR Message (NW GMSA) Laboratory Report R01
- **Distribution List** The message is then passed to a router – this router is for future use with the national broker. Currently, the only route is to a **Message Queue**
- **Polling Consumer** The Order Placer (NHS trust) will poll the **Message Queue** for messages, this queue will include reports and also accept/reject messages.
  - If messages are present, the NHS Trust will acknowledge the message and then process it, this may include conversion back to HL7 v2.

## Phase 2 ESB

<img style="padding:3px;width:60%;" src="Phase 2 ESB.drawio.png" alt="Phase 2 ESB Architecture"/>
<br clear="all">
<p class="figureTitle">Phase 2 ESB Architecture</p> 
<br clear="all">

The use of a **Polling Consumer** is not optimal. This phase will send messages directly to Trust Integration Engines. 
As we are using http RESTful for communication between the Trust Integration Engines, this security and authorisation can be solved in a number of ways such as:

- TLA-MA
- openid

These are practical for point-to-point connections but as the solution grows it can become complicated, so it is preferred we move to enterprise level security such as OAuth2 Client Credentials Grant.

- [IHE Internet User Authorization (IUA)](https://profiles.ihe.net/ITI/IUA/index.html)
- [NHS England - Application-restricted APIs](https://digital.nhs.uk/developer/guides-and-documentation/security-and-authorisation#application-restricted-apis)

<img style="padding:3px;width:75%;" src="basic-flow.png" alt="IHE IUA Basic Flow"/>
<br clear="all">
<p class="figureTitle">IHE IUA Basic Flow</p> 
<br clear="all">


## Future NHS England Genomics Order Management Service Adaptor

This is not part of the current project and is shown here to describe how the RIE could evolve and connect to the national Genomic Order Management Service.

<img style="padding:3px;width:95%;" src="Future ESB.drawio.png" alt="Future NHSE GOMS Adaptor Architecture"/>
<br clear="all">
<p class="figureTitle">Future NHSE GOMS Adaptor Architecture</p> 
<br clear="all">

The national service uses a FHIR RESTful resource-based API which does not contain business logic. This business logic would be implemented in the RIE and this is subdivided as follows:

- Patient Master Identity Registry (PMIR) Service - This handles updates to patient demographics and is populated via a Patient Identity Feed (like HL7 v2 ADT A28/31/40 and IHE PIX), for genomics the patient identity feed is extracted from the laboratory order/report.
- Health Provider Directory (HPD) Service - This maintains the list of Practitioners and is populated by a Master File feed like HL7 v2 MFN), for genomics the master file feed is extracted from the laboratory order/report.
- Order and Report Service - This converts the incoming messages to a FHIR Transactional message, for genomics this uses patient and practitioner's identifiers obtained from the PMIR and HPD services. 


### Outgoing Messages

- **Outgoing Messages** are received from the main RIE workflow (known here as the Enterprise Service Bus) 
- **Process Message** orchestrates the calls to the NHS England GOMS, this involves:
  - getting the patient id (and updating patient demographics) via the **Patient Master Identity Registry (PMIR) Service**
  - getting practitioner ids via the **Health Provider Directory (HPD) Service**
  - Transforming the order or report to a FHIR Transaction and updating patient and practitioner references to include NHS England GOMS id's

### Incoming Messages

- **Polling Consumer** checks for orders and reports for the North West region by calling the NHS England GOMS at frequent intervals.
- **Assemble Message** if orders/reports are found, then the RIE will assemble a FHIR Message Laboratory Order/Report.
- **Incoming Message** these messages are then passed to the RIE ESB for message delivery.
