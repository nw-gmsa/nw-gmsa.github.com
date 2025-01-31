
<figure>
{%include orders.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Order Options</p>
</figure>
<br clear="all">

Note: 
- The use of FHIR Message may be required for HL7 v2.x ORM conversion, this involves the addition of a FHIR MessageHeader to the FHIR Bundle 
- The actor `Document Registry` is defined in [IHE MHDS Actors and Transactions](https://profiles.ihe.net/ITI/MHDS/volume-1.html#1501-mhds-actors-transactions-and-content-modules). This use case can be solved by IHE XDS or Electronic Document Management System (EDMS).

### Overview Mapping 

Detailed Mapping can be here [Message OML_O21 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
Further details on genomic specific mapping can be found on [NHS England FHIR Genomics Implementation Guide - Clincial Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Clinicalheadings)

This is an initial (incomplete) map and will change to match exact requirement of GLH LIMS <- This is currently OML, not ORM. 

| HL7 v2 OML Segment           | Cardinality | FHIR Resource            | Map                                                                                                           | 
|------------------------------|-------------|--------------------------|---------------------------------------------------------------------------------------------------------------|
| MSH - Message Header         | 1..1        | MessageHeader            | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)   |
| PID - Patient Identification | 0..1        | Patient                  | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html)               |                                                                                          |
| NK1 -	Next of Kin/Associated Parties | 0..* | RelatedPerson or Patient | [NK1[RelatedPerson]](NK1[RelatedPerson]) or [NK1[Patient]](NK1[Patient])                                      |
| PV1 - Patient visit          | 0..1        | Encounter                | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html)           | 
| ORC - Common Order           | 1..*        | [ServiceRequest](StructureDefinition-ServiceRequest.html)       | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html) |
| DG1 - Diagnosis              | 0..*        | Condition                | [DG1[Condition]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html)           |
| SPM - Specimen               | 0..*        | Specimen                 | [SPM[Specimen]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html)             |                                                                                                         |

### Entity Model

<figure>
{%include orders-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Request Model</p>
</figure>
<br clear="all">
