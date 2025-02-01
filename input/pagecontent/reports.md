
## Reporting Component Model

<figure>
{%include reports-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Report Component Model</p>
</figure>
<br clear="all">

### Interface Standards

- **Document/Report Message Exchange**
    - HL7 v2.x ORU -
        - [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
          - [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/) conversion of HL7 v2 Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
        - Supplier specifications
            - iGene TO FOLLOW (LIMS to RIE)
            - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)
    - IHE [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) ITI-41/[MHD](https://profiles.ihe.net/ITI/MHD/index.html) ITI-105 - The document in the payload can be pdf or a FHIR Document (informatics description: composition). [NHS England - National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir) is also an option here.
        - [HL7 EU Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) - This a [FHIR Document](https://hl7.org/fhir/R4/documents.html) version of the HL7 v2 ORU (and any FHIR Message equivalent).
- **Document/Report Sharing**
    - HL7 [IPA](https://build.fhir.org/ig/HL7/fhir-ipa/) (or IHE [QEDm](https://profiles.ihe.net/PCC/QEDm/)). Note this is already implemented in EPIC.
        - **Data Standards** [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html) which describes international data models around Genomics
        - Supplier specifications
            - [EPIC FHIR](https://fhir.epic.com/)
    - IHE [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) ITI-18 & 43/[MHD](https://profiles.ihe.net/ITI/MHD/index.html) ITI-67 and 68
    - [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) which is a centralised workflow broker service for managing Genomics Order
        - **Data Standards** [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide). **Note the application of this data standard may extend to other interfaces**
- **Document/Report Event Notification**
    - IHE [DSUBm](https://profiles.ihe.net/ITI/DSUBm/index.html) ITI-112
    - [Multicast Notification Service](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)


## North West Genomics Report Message Exchange Options

<figure>
{%include reports.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Report Options</p>
</figure>
<br clear="all">

### Overview Mapping 

Detailed Mapping can be here [Message ORU_R01 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html)

| HL7 v2 ORU Segment           | Cardinality | FHIR Resource                                                 | Map                                                                                                               | 
|------------------------------|-------------|---------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| MSH - Message Header         | 1..1        | MessageHeader                                                 | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)       |
| PID - Patient Identification | 0..1        | Patient                                                       | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html)                   |    
| PV1 - Patient visit          | 0..1        | Encounter                                                     | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html)               | 
| ORC - Common Order           | 1..*        | [DiagnosticReport](StructureDefinition-DiagnosticReport.html) | [ORC[DiagnosticReport]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-diagnosticreport.html) |
|                              |             | [ServiceRequest](StructureDefinition-ServiceRequest.html)     | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)     |
| OBR - Observations Request   |             | [DiagnosticReport](StructureDefinition-DiagnosticReport.html) | [OBR[DiagnosticReport]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html) |
| NTE - Notes and Comments     |             | Observation.note?                                             |                                                                                                                   |
| OBX - Observation/Result     |             | Observation or Attachment (part of DiagnosticReport)          | [OBX[Observation]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-observation.html)           |                                                                                                          |

### Entity Model

<figure>
{%include reports-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Report Model</p>
</figure>
<br clear="all">
