
## References 

A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 1](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) 

## Actors and Transactions

| Actor                | Definition                                                                                                                                       |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Order Placer         | Commonly the Electronic Patient Record (EPR) System                                                                                              |
| Order Filler         | Also known as a Genomic Laboratory Hub (GLH)                                                                                                     |
| Automation Manager   | This is the function of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) |
| Order Result Tracker | This is the function of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) |

See also Ref A `Section 3 Laboratory Testing Workflow (LTW) Profile` for detailed description of actors.

<figure>
{%include ihe-palm-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE LTW Actor Diagram</p>
</figure>
<br clear="all">

Initially only the IHE `LAB-1` is in focus and this is probably using HL7 v2.x ORM_O01/OML_O21 as described below.
This will be followed by IHE `LAB-1` probably using HL7 v2.x ORU_R01
Later stages will include the use of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir), using HL7 FHIR.

### Order Entity Model

#### Regional

<figure>
{%include orders-model-regional.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Regional - Genomics Test Request Model</p>
</figure>
<br clear="all">


#### National

<figure>
{%include orders-model-national.svg%}
<p id="fX.X.X.X-X" class="figureTitle">National - Genomics Test Request Model</p>
</figure>
<br clear="all">

### Order Overview HL7 Mapping 

Detailed Mapping can be here [Message OML_O21 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
Further details on genomic specific mapping can be found on [NHS England FHIR Genomics Implementation Guide - Clincial Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Clinicalheadings)

This is an initial (incomplete) map and will change to match exact requirement of GLH LIMS <- This is currently OML, not ORM (EPIC). 

| HL7 v2 OML Segment                 | Cardinality | FHIR Resource                                             | Map                                                                                                                                            | 
|------------------------------------|-------------|-----------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| MSH Message Header                 | 1..1        | MessageHeader                                             | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)                                    |
| PID Patient Identification         | 0..1        | Patient                                                   | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html) via ServiceRequest.subject                     |                                                                                          |
| NK1	Next of Kin/Associated Parties | 0..*        | RelatedPerson or Patient                                  | [NK1[RelatedPerson]](NK1[RelatedPerson]) or [NK1[Patient]](NK1[Patient])                                                                       |
| PV1 Patient visit                  | 0..1        | Encounter                                                 | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html) via ServiceRequest.encounter               | 
| **ORDER**                          | 1..*        |                                                           |                                                                                                                                                |
| - ORC Common Order                 | 1..*        | [ServiceRequest](StructureDefinition-ServiceRequest.html) | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)                                  |
| - **OBSERVATION REQUEST**          | 0..*        |                                                           |                                                                                                                                                |
| -- OBR Observation Request         | 1..*        | [ServiceRequest](StructureDefinition-ServiceRequest.html) | [OBR[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html)                                  
| -- NTE Notes and Comments          |             | [ServiceRequest](StructureDefinition-ServiceRequest.html) | [NTE[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-servicerequest.html)                                  |
| -- PRT Participation               |             | PractitionerRole                                          | [PRT[PractitionerRole]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-prt-to-practitionerrole.html) via Specimen.collection      |
| -- OBX Observation/Result          | *..*        | [Observation](StructureDefinition-ServiceRequest.html)    | [OBX[Observation-Component]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-component-to-observation.html) via ServiceRequest.supportingInfo                    
| -- DG1 Diagnosis                   | 0..*        | Condition                                                 | [DG1[Condition]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html) via ServiceRequest.resason[Reference/Code] |
| -- SPM Specimen                    | 1..*        | [Specimen](StructureDefinition-Specimen.html)             | [SPM[Specimen]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html) via ServiceRequest.specimen                  |                                                                                                         |


