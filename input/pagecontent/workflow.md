
## Actors and Transactions

| Actor                                             | Definition                                                                   |
|---------------------------------------------------|------------------------------------------------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html)  | Typically a clinician or system that initiates a lab test.                   |
| [Order Filler](ActorDefinition-OrderFiller.html)  | Laboratory or testing system that performs the test and produces the result. |
| Clinical Data Repository                          | Repository or system used for document exchange.                             |  
| [Intermediary](ActorDefinition-Intermediary.html) | E.g. Regional or Trust Integration Engine                                    |

### Process Flow

<img style="padding:3px;width:95%;" src="LTW Use Case 1 and 4.drawio.png" alt="Genomic LTW Business Process"/>
<br clear="all">
<p class="figureTitle">Genomic LTW Business Process</p> 
<br clear="all">

### Transaction & Archetype Maps

The different options include the use of the following archetypes. The differing formats are generally compatible with each other.

| FHIR Document                                                                | HL7 v2 Message                                                                                           | HL7 FHIR Message                                                                               | HL7 FHIR Resource |
|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|-------------------|
|                                                                              | [OML_O21 Laboratory Order](hl7v2.html#oml_o21-laboratory-order)                                          | [Laboratory (Genomic) Order O21](MessageDefinition-laboratory-order.html)                      |                   |
| [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) | [ORU_R01 Unsolicited Observation](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) | [Unsolicited Observation (Genomic Report) R01](MessageDefinition-unsolicited-observation.html) | [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/)          |


## Options 

### Traditional Messaging Option

This option is the existing exchange of ORM_O01/OML_O21 Orders and ORU_R01 Reports, these messages are in either HL7 v2 Pipe+Hat or FHIR Message JSON formats, the messages follow the same semantic model.
This also follows IHE Laboratory and Testing Workflow (LTW)

<figure>
{%include LTW-now-sequence.svg%}
</figure>
<br clear="all">

#### Messaging Flow:

- Complete Referral Form
  - The Order Placer completes an order form.
- Placer Order Management (LAB-1) Genomic Order O21 – Command Message
  - A Genomic Order O21 is sent from the Order Placer to the Order Filler.
  - Purpose: To initiate and communicate the genomic testing order.
- Perform Test
  - The Order Filler processes the order and performs the test.
- Order Results Management (LAB-3) Genomic Report R01 – Document Message
  - A document message (HL7 ORU_R01) is sent from the Order Filler back to the Order Placer.
  - Purpose: To report the results of the genomic test.

#### Pros/Cons

- Fo llows International standards.
    - The FHIR Messages mentioned above are not part of an international standard.
- Makes use of [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html) and so in secondary care has considerable middleware via Trust Integration Engines (TIE).
- Does not support referral triage processes or other workflow interactions.
- UK and England HL7 standards (including UKCore) do not cover this workflow, especially around the use of business identifiers.

#### Notes 

- The NHS England Genomic Order Management Service - [Process genomic test request](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#post-/FHIR/R4) is effectively a HL7 Message same as the Genomic Order O21 Command Message. This does not support Genomic Report R01 Document Message  


### Event Notifications and Enterprise Shared Data/Document Repositories Option

Advanced, flexible, and interoperable genomic reporting workflow that combines traditional HL7 messaging with FHIR-based workflows and centralized data repositories, offering a future-ready health data exchange model.

This is an evolution of the previous option by adding in an **Enterprise Clinical Data Repository (CDR)** which can Genomic Orders and Reports data across the region. The API to this repository conforms to  
both [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) for clinical data and also [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) for (pdf) documents.
The data within the CDR will adhere to [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/)

In addition, the CDR allows the Order Placer to swap from messaging-based workflow to FHIR Workflow using the FHIR Task resource. Ideally, FHIR Workflow would be backed by [FHIR Subscription](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/toc.html). 

<figure>
{%include LTW-cdr-sequence.svg%}
</figure>
<br clear="all">

#### Messaging Flow:

1. Initial Order Message:
   - The Order Placer completes an order form.
   - Sends a Genomic Order O21 Command Message to RIE.
   - RIE forwards this command to both the CDR and Order Filler.
2. Optional FHIR Workflow (ALT Path):
  - FHIR Task with an `accepted` status is created from the Genominc Order O21 Message and is sent by the Order Placer to the CDR.
  - This begins the FHIR-based workflow as an alternative to traditional HL7 messaging.
3. Test Execution:
   - The Order Filler performs the genomic test.
4. Result Reporting:
   - The Genomic Report R01 Document Message is sent from the Order Filler to CDR, this is used to store new FHIR resource and updating existing ones such as the ServiceRequest to a `completed` status.
   - The FHIR Task is updated to with a `completed` status and is then sent to indicate completion of the task.
5. Result Retrieval Options:
   - Optional (opt):
     - The Order Placer retrieves results using a REST API (FHIR-based).
   - Traditional (fallback):
     - Results are also available via traditional HL7 v2 ORU_R01 Document Message.

#### Pro/Cons

- Hybrid Support: Works with both HL7 v2 and FHIR.
- Scalability: Central CDR enables easier data sharing across systems.
- Interoperability: Complies with widely accepted health IT standards.
- Flexibility: Supports event-driven or request-driven access to results.


### Shared Repositories and FHIR Workflow Option

A fully FHIR-based, repository-driven genomic workflow, enabling secure, scalable, and flexible collaboration between order placers and fillers through shared data access and event-driven communication.

This option would apply to North West GMSA Regional Integration Engine (RIE) and Genomic Order Management System (GOMS) working with each other. In this option both can act as the Order Placer or Filler.
This option is a full adoption of [FHIR Workflow Management Communication Patterns](https://build.fhir.org/workflow-management.html)

This differs from the current proposal to send in **Genomic Test Requests** via messaging, instead they would be shared from the source system.

<figure>
{%include LTW-fhir-sequence.svg%}
</figure>
<br clear="all">

#### Messaging Flow:

1. Initiation:
   - The Order Placer completes a referral form.
   - A Genomic Order O21 Document Message is sent to the Order Placer’s Clinical Data Repository.
     - When the order is placed with the North West region, this will be a Genomic Order O21 Message which the RIE sends to the CDR.
   - A FHIR Task (requested) event message is also generated.
2. Order Acceptance & Retrieval:
   - The Order Filler Clinical Data Repository retrieves the order using Placer Order Management (LAB-1) Genomic Order O21 REST API.
   - A FHIR Task with a status of `accepted` event message is returned to the Order Placer confirming acceptance.
3. Test Execution:
   - The Order Filler performs the genomic test.
4. Results Submission:
   - The results are submitted as a Genomic Report R01 Document Message to the Order Filler Clinical Data Repository.
   - The FHIR Task event message with a status of `completed` is sent back to the Order Placer.
5. Result Retrieval:
   - The Order Placer retrieves the genomic report using the Genomic Report R01 REST API from the Order Filler’s Clinical Data Repository.
   - The RIE on reciept of a `completed` task will then convert the report to a Genomic Report R01 Message and send onto the original Order Placer.  

#### Pro/Cons

- Orders and results are shared via FHIR repositories and APIs rather than direct HL7 v2 messages.
- Decouples systems – allowing asynchronous, federated access to shared data.
- Scalability & Interoperability: Built for modern health IT ecosystems.
- Flexibility: Systems can retrieve data when needed.
- FHIR-Centric: Enables real-time tracking and status updates via FHIR Task.

### Regional Health Information Exchange (HIE)

This approach enables real-time, federated access to patient data spread across multiple NHS organizations, without needing to centralize all data. It supports **clinical portals** that provide clinicians with a holistic view of patient information while respecting data sovereignty and system independence.
Notable examples include:

- NHS Scotland South East Region (not FHIR)
- Yorkshire and Humberside Care Record (FHIR STU3)

These exchanges typically use an [Aggregator](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Aggregator.html) pattern, similar to the approach defined in [IHE Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html), which is implemented in London.

<figure>
{%include HIE-QEDm-Federated-Sequence.svg%}
</figure>
<br clear="all">

#### Key Components:

- Clinical Data Consumer
  - The system or application (e.g., a clinical portal) that initiates the query to retrieve patient data.
- Health Information Exchange - Regional Integration Engine (RIE)
  - Acts as the central orchestrator that receives the query and distributes it across multiple data sources.
- Clinical Data Sources
  - Examples shown:
    - NW GMSA (North West Genomic Medicine Service Alliance)
    - NHS England GOMS (Genomics Order Medical Services)
  - These are systems that store patient genomic records and respond to data queries.
  - Additional clinical data repositories can be integrated into the HIE. This includes systems from regional NHS Trusts that already support IHE QEDm-compatible FHIR REST APIs in their EPR platforms—such as Meditech, EPIC, and Oracle.

#### Sequence of Events (from top to bottom):

- Initial Query
  - The Clinical Data Consumer sends a FHIR REST API request using IHE Query Existing Data (QEDm) [PCC-44](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html) to the RIE.
- Federated Query Access Start
  - The RIE starts a federated query process.
  - It forwards the same IHE QEDm PCC-44 query to each connected clinical data source.
- Responses from Data Sources
  - Each clinical data source responds individually with relevant data.
- Aggregation
  - The RIE aggregates the responses from all sources into a unified result set.
- Final Response
  - The aggregated data is sent back to the Clinical Data Consumer as a single, combined response.


