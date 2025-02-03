
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

At present only the IHE `LAB-1` is in focus and this is using HL7 v2.x ORM as described below.
Later stages will include modernised versions of `LAB-4` and `LAB-5` via the [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir), this will also include a HL7 FHIR version of `LAB-1`

### Entity Model

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

### Overview Mapping 

Detailed Mapping can be here [Message OML_O21 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
Further details on genomic specific mapping can be found on [NHS England FHIR Genomics Implementation Guide - Clincial Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Clinicalheadings)

This is an initial (incomplete) map and will change to match exact requirement of GLH LIMS <- This is currently OML, not ORM (EPIC). 

| HL7 v2 OML Segment           | Cardinality | FHIR Resource            | Map                                                                                                           | 
|------------------------------|-------------|--------------------------|---------------------------------------------------------------------------------------------------------------|
| MSH - Message Header         | 1..1        | MessageHeader            | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)   |
| PID - Patient Identification | 0..1        | Patient                  | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html)               |                                                                                          |
| NK1 -	Next of Kin/Associated Parties | 0..* | RelatedPerson or Patient | [NK1[RelatedPerson]](NK1[RelatedPerson]) or [NK1[Patient]](NK1[Patient])                                      |
| PV1 - Patient visit          | 0..1        | Encounter                | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html)           | 
| ORC - Common Order           | 1..*        | [ServiceRequest](StructureDefinition-ServiceRequest.html)       | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html) |
| DG1 - Diagnosis              | 0..*        | Condition                | [DG1[Condition]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html)           |
| SPM - Specimen               | 0..*        | Specimen                 | [SPM[Specimen]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html)             |                                                                                                         |


