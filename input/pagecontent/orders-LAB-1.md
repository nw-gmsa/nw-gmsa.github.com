
## References

- A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 2a (PaLM TF-2a) Transactions](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol2a.pdf)
- B. **Placer Order Management [LAB-1]**
  - HL7 v2.x OML_021
    - [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
  - HL7 v2.x ORM_O01
    - [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) conversion of HL7 v2 ORM Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
    - Supplier Specifications
      - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders**  (RIE to EPIC EPR)
      - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)
      - iGene TO FOLLOW (LIMS to RIE)
- C. **Data Capture**
  - See [NW Genomics Test Order Form](Questionnaire-NW-Genomics-Test-Order.html) and [Questionnaire Viewer](https://project-wildfyre.github.io/questionnaire-viewer/?q=https://fhir-mft.github.io/FHIRGenomics/Questionnaire-NW-Genomics-Test-Order.json)

## Ordering Component Model

<figure>
{%include orders-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Order Component Model</p>
</figure>
<br clear="all">

### Interface Standards

Is based on a HL7 FHIR [laboratory order (O21)](MessageDefinition-MessageDefinition-laboratory-order.html) Message which is backwards compatible with HL7 v2 OML_O21 (or ORM_O01) Message.


#### HL7 v2 Mapping 

Detailed Mapping can be here [Message OML_O21 to Bundle Map (Experimental)](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
Further details on genomic specific mapping can be found on [NHS England FHIR Genomics Implementation Guide - Clincial Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Clinicalheadings)

This is an initial (incomplete) map and will change to match exact requirement of GLH LIMS <- This is currently OML, not ORM (EPIC).

| HL7 v2 OML Segment                 | Cardinality | FHIR Resource                                             | Map                                                                                                                                            | 
|------------------------------------|-------------|-----------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| MSH Message Header                 | 1..1        | [MessageHeader](StructureDefinition-MessageHeader.html)   | [MSH[MessageHeader]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)                                    |
| PID Patient Identification         | 0..1        | [Patient](StructureDefinition-Patient.html)               | [PID[Patient]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html) via ServiceRequest.subject                     |                                                                                          |
| NK1 Next of Kin/Associated Parties | 0..*        | RelatedPerson or Patient                                  | [NK1[RelatedPerson]](NK1[RelatedPerson]) or [NK1[Patient]](NK1[Patient])                                                                       |
| PV1 Patient visit                  | 0..1        | [Encounter](StructureDefinition-Encounter.html)           | [PV1[Encounter]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html) via ServiceRequest.encounter               | 
| **ORDER**                          | 1..*        |                                                           |                                                                                                                                                |
| - ORC Common Order                 | 1..*        | [ServiceRequest](StructureDefinition-ServiceRequest.html) | [ORC[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)                                  |
| - **OBSERVATION REQUEST**          | 0..*        |                                                           |                                                                                                                                                |
| -- OBR Observation Request         | 1..*        | [ServiceRequest](StructureDefinition-ServiceRequest.html) | [OBR[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html)                                  
| -- NTE Notes and Comments          |             | [ServiceRequest](StructureDefinition-ServiceRequest.html) | [NTE[ServiceRequest]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-servicerequest.html)                                  |
| -- PRT Participation               |             | PractitionerRole                                          | [PRT[PractitionerRole]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-prt-to-practitionerrole.html) via Specimen.collection      |
| -- OBX Observation/Result          | *..*        | [Observation](StructureDefinition-ServiceRequest.html)    | [OBX[Observation-Component]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-component-to-observation.html) via ServiceRequest.supportingInfo                    
| -- DG1 Diagnosis                   | 0..*        | [Condition](StructureDefinition-Condition.html)           | [DG1[Condition]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html) via ServiceRequest.resason[Reference/Code] |
| -- SPM Specimen                    | 1..*        | [Specimen](StructureDefinition-Specimen.html)             | [SPM[Specimen]](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html) via ServiceRequest.specimen                  |                                                                                                         |


### Examples

#### EPIC Example

##### HL7 v2.4 ORM_O01

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

