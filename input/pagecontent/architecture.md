
### Introduction

The [Intermediary](ActorDefinition-Intermediary.html), North West GMSA Regional Integration Engine (RIE) is an [Enterprise Service Bus](https://en.wikipedia.org/wiki/Enterprise_service_bus) most commonly known in health as a Trust Integration Engine (TIE).

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


### Phase 1 ESB

<img style="padding:3px;width:95%;" src="Phase 1 ESB.drawio.png" alt="Phase 1 ESB Architecture"/>
<br clear="all">
<p class="figureTitle">ESB Architecture</p> 
<br clear="all">

### Phase 2 ESB

<img style="padding:3px;width:95%;" src="Phase 2 ESB.drawio.png" alt="Phase 2 ESB Architecture"/>
<br clear="all">
<p class="figureTitle">ESB Architecture</p> 
<br clear="all">


### Future NHS England Genomics Order Management Service Adaptor

<img style="padding:3px;width:95%;" src="Future ESB.drawio.png" alt="Future NHSE GOMS Adaptor Architecture"/>
<br clear="all">
<p class="figureTitle">ESB Architecture</p> 
<br clear="all">

1. Transform to HL7 FHIR - The ESB internal format is HL7 FHIR, if HL7 v2 Messages are used they will be converted to HL7 FHIR.
2. Accept Message - Uses HL7 FHIR Validation to check the message conforms to the Canonical Model, errors will result in a rejection of the message.
3. Distribution List - The message is distributed based on the content of the event header (FHIR MessageHeader resource/v2 MSH Segment).
4. Transform to HL7 v2 - If required, messages are converted to HL7 v2. The message is sent onto the recipient, this may be another ESB (Trust Integration Engine) or a endpoint system.
5. API Adaptor - This will be used to send orders and reports to out of area systems via the NHS England Genomic Order Management Service (GOMS). This involves:
   1. Processing the messages and storing its data on a FHIR Server. GOMS does not support messaging and so the ESB must convert the message from [FHIR Message](https://hl7.org/fhir/R4/messaging.html) to series of [FHIR RESTful](https://hl7.org/fhir/R4/http.html) calls paying particular attention to the business logic implemented in external FHIR server.
   2. The API Adaptor in the ESB, reduces the development cost of interfacing with GOMS across the region. 

