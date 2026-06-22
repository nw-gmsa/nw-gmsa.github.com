
Three types of messages are used within this workflow process:

| Message Type                                                                                                  | HL7 Name              | IHE Name                                                                     | Description                                                                       |
|:--------------------------------------------------------------------------------------------------------------|-----------------------|------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| [**C**ommand Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html)   | Laboratory Order O21  | [LAB-1](MQ.html)                                                             | To request a laboratory order                                                     |
| [**D**ocument Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) | Laboratory Report R01 | [LAB-3](MQ.html)                                                             | Used to transfer the report back to the order placer and othre interested parties | 
|                                                                                                               | Original Document T02 | [HL7 MDM_T02](hl7v2.html#mdm_t02-original-document-notification-and-content) | Used to send a copy of the report to a HIE                                        | 

## Laboratory Order 

<figure>
{%include architecture-laboratory-order.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Order - Overview</p>
</figure>
<br clear="all">

### Messaging with a copy sent to a FHIR Repository

<img style="padding:3px;width:90%;" src="Phase 1c Repository.drawio.png" alt="Phase 1b"/>
<br clear="all">
<p class="figureTitle">Messaging + FHIR Repository</p> 
<br clear="all">

- Transformation and Enrichment (inside ESB)
  - First point of entry for HL7 FHIR O21 messages [Command Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CommandMessage.html).
  - Call NHS England PDS & Enrich Content ([Content Enricher](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DataEnricher.html))
    - Stores and enhances the message with additional data elements (GP Practice and ICS).
    - Ensures only traced NHS Numbers are present in the message.
- Update Genomic Data Platform ([Wire Tap](https://www.enterpriseintegrationpatterns.com/patterns/messaging/WireTap.html))
  - Updates internal genomic data repository using FHIR RESTful interactions. ([Messaging Gateway](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessagingGateway.html))
- Router ([Message Router](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRouter.html))
  - Routes messages based on order metadata.
- Transform to HL7 v2 Message ([Message Translator](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageTranslator.html) and v2 [Canoncial Model](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CanonicalDataModel.html))
  - Converts HL7 FHIR O21 messages into HL7 v2.5.1 OML_O21 format.
  - These transformed messages are sent to NW GMSA LIMS iGene.
- Genomic Order Management Adaptor Service FHIR API ([Messaging Gateway](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessagingGateway.html))
  - Targets NHS England Genomic Order Management Service FHIR API which is the interface to external GMSA.
  - This uses a FHIR RESTful API, similar to the Clinical Data Repository Adaptor, and like this service, the business logic (how to update the repository) is held within Regional Integrations Engine and this is not exposed externally. 

## Laboratory Report

<figure>
{%include architecture-laboratory-report.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - Overview</p>
</figure>
<br clear="all">

<img style="padding:3px;width:90%;" src="Phase 2b ESB.drawio.png" alt="Phase 2b"/>
<br clear="all">
<p class="figureTitle">Laboratory Report - Detailed</p> 
<br clear="all">

- Source System
  - NW GMSA LIMS (iGene) ([Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html))
    - Produces genomic test results in HL7 v2.3 ORU_R01 messages.
    - These are sent into the Enterprise Service Bus (ESB).
- Transformation and Enrichment (inside ESB)
  - Transform to HL7 FHIR Message ([Message Translator](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageTranslator.html) and FHIR [Canoncial Model](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CanonicalDataModel.html))
    - Converts HL7 v2.3 message into a modern HL7 FHIR R01 message.
  - Call NHS England PDS & Enrich Content ([Content Enricher](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DataEnricher.html))
    - Stores and enhances the message with additional data elements (GP Practice and ICS).
    - Ensures only traced NHS Numbers are present in the message.
  - Update Genomic Data Platform & Enrich Content ([Content Enricher](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DataEnricher.html))
    - Stores and enhances the message with additional data elements.
    - Provides a consistent, enriched dataset for downstream use.
- Routing
  - Router
    - Determines where the message should be delivered (e.g., hospital systems, care records, repositories).
    - Reports are sent to the NHS Trust which ordered the test ([Message Router](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRouter.html))
    - Reports are sent to NHS ICS Genomic Archiving and Communication System (GACS) for sharing the reports within the ICS, this is based on the GP Surgery for the patient which is obtained via a PDS lookup. ([Dynamic Router](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DynamicRouter.html))
  - Transform to HL7 v2 Message ([Message Translator](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageTranslator.html) and v2 [Canoncial Model](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CanonicalDataModel.html))
    - Converts enriched content back into a structured HL7 v2.x format for downstream systems that still rely on v2.
    - This ensures backward compatibility with existing hospital systems.
- Output
  - Reports are sent as:
    - HL7 v2.5.1 ORU_R01 or MDM_T02 messages (for systems using HL7 v2).
    - HL7 over HTTP with OAuth2 (for secure API-based delivery).
- Repository Service
  - A dedicated Repository Service captures and stores all enriched FHIR data. ([Messaging Gateway](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessagingGateway.html))
    - FHIR Repository Adapter converts incoming HL7 FHIR messages into a format suitable for storage.
    - Data is stored in the Clinic Data Repository (IRIS FHIR Repository).
    - Access is available via HL7 FHIR RESTful API.

### Laboratory Report Routing - NHS Trust (ORU_R01)

This routing is based on the ODS Code of the ordering facility.
Note: Routing logic for rest of England and Wales if for illustration purposes, neither are implemented.

<figure>
{%include routing-oru-r01.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report Routing - NHS Trust (ORU_R01)</p>
</figure>
<br clear="all">

### Laboratory Report Message Routing - NHS ICS (MDM_T02)

This routing is based on the GP Practice (ODS Code) of the Patient, for GMCR (QOP OCS Code) a further check is performed on the Patients postcode (if patient postcode is not in GMCR region then send to the Dead Letter Queue).

<figure>
{%include routing-mdm-t02.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report Routing - Laboratory Report Message Routing - NHS ICS (MDM_T02)</p>
</figure>
<br clear="all">


