
## Reporting Component Model

<figure>
{%include orders-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Order Component Model</p>
</figure>
<br clear="all">

### Interface Standards

- **Order Message Exchange**
  - HL7 v2.x ORM
    - - [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) conversion of HL7 v2 ORM Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
    - Supplier Specifications
      - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders**  (RIE to EPIC EPR)
      - iGene TO FOLLOW (LIMS to RIE)
- **Data Capture**
  - See [NW Genomics Test Order Form](Questionnaire-NW-Genomics-Test-Order.html) and [Questionnaire Viewer](https://project-wildfyre.github.io/questionnaire-viewer/?q=https://fhir-mft.github.io/FHIRGenomics/Questionnaire-NW-Genomics-Test-Order.json)

#### EPIC ORM_O21 Example

```
MSH|^~\&|EpicCare|MFT|TIE|SMHGEN|20250129103733|GNTCO|ORM^O01|527178290|T|2.4|||AL|NE
PID|1||202999^^^EPI^MR||Obstetrics^Mel^J^^^^D||19840208|F|||4563 QUARTZ STREET^^MADISON^WI^53719^UNITED STATES OF AMERICA^P||06085 554578^P^H^^^06085^554578~06085 557774^P^M^^^06085^557774|06085 554785^P^W^^^06085^554785||M||1001166717||||||||||||N
ZPD||MYCH~Post||ACTIVATED|||Y|20250729||||||||||N||||||F
PV1|1|OP|SMHCANCG^^^SMH^^^^^^^DEPID||||||||||||||||1001166717
ORC|NW|1601737^EPC||1001166717|||^^^20250129^^R^^||20250129103726|GNTCO^MEDICAL GENETICS^COUNSELOR^^|||SMHCANCG^SMH CANCER GENETICS^DEPID^SMH^^^^^SMH CANCER GENETICS|||||CLISUP^EPIC SUPPORT|||||||||||O
OBR|1|1601737^EPC|1000135203^Beaker|GENEAP^GENETICS TEST PERFORMABLE^IGEAP^^GENETICS TEST||20250129|20250129103726||||L|||||||||||||Lab|||^^^20250129^^R^^|||||||||20250129
NTE|1||Ben said it can be done.|OC
NTE|2||LALALALALALALALA|OC
PRT|1|SP||Authorizing|^HALL^GEORGINA^^||||SMHCANCG^^^SMH^^^^^^^DEPID|||||DEPARTMENT OF CLINICAL GENETICS^SAINT MARY'S HOSPITAL^MANCHESTER^^M13 9WL^ENGLAND^^^GR MANCHESTR|^^^^^^^^^^^0161 276 1847, 0161 276 6506
PRT|2|SP||Order Entry|^HALL^GEORGINA^^||||SMHCANCG^^^SMH^^^^^^^DEPID|||||DEPARTMENT OF CLINICAL GENETICS^SAINT MARY'S HOSPITAL^MANCHESTER^^M13 9WL^ENGLAND^^^GR MANCHESTR|^^^^^^^^^^^0161 276 1847, 0161 276 6506
OBX|1|ST|230056^What Type of Referral Do You Require?^IGENE||Test on Stored DNA||||||F|||20250129103726|||||||||||||||QST
OBX|2|ST|230048^Please Select Clinical Indication(s)^IGENE||R240: Diagnostic testing for known mutation(s)~R242: Predictive testing for known familial mutation(s)||||||F|||20250129103726|||||||||||||||QST
OBX|3|ST|230019^High Infection Risk^IGENE||No||||||F|||20250129103726|||||||||||||||QST
OBX|4|ST|230016^Test Type^IGENE||Diagnostic Screen/Test||||||F|||20250129103726|||||||||||||||QST
OBX|5|ST|230034^Does This Test Relate to a Pregnancy^IGENE||No||||||F|||20250129103726|||||||||||||||QST
OBX|6|ST|231284^Please Select R240 Test(s):^IGENE||R240.1: Targeted variant testing||||||F|||20250129103726|||||||||||||||QST
OBX|7|ST|231285^Please Select R242 Test(s):^IGENE||R242.1: Targeted variant testing||||||F|||20250129103726|||||||||||||||QST
OBX|8|ST|230027^Email Addresses of Non-MFT Clinicians for Result Reports^IGENE||charu||||||F|||20250129103726|||||||||||||||QST
OBX|9|ST|230029^Confirmation of Consent for Testing - MANDATORY Testing will not be performed without completed confirmation of consent^IGENE||Completed Electronically on HIVE||||||F|||20250129103726|||||||||||||||QST
OBX|10|ST|230037^Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing^IGENE||Acknowledged||||||F|||20250129103726|||||||||||||||QST
OBX|11|ST|230039^Is the Person Ordering the Test the Referring Clinician^IGENE||No||||||F|||20250129103726|||||||||||||||QST
OBX|12|ST|^Name of Supervising Clinician||DESHPANDE, CHARULATA||||||F|||20250129103726|||||||||||||||QST
SPM|1|^25GEN-029GN00001&Beaker||Blood^Blood|||||||||||||20250129103726|20250129103727||Y|||||||||||||||S
```

## North West Genomics Order Message Exchange Options

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

#### Local

<figure>
{%include orders-model-local.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Local - Genomics Test Request Model</p>
</figure>
<br clear="all">


#### National

<figure>
{%include orders-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">National - Genomics Test Request Model</p>
</figure>
<br clear="all">
