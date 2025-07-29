
## Message Definitions

### OML_O21 Laboratory Order 

(and ORM_O01 General Order)

#### References

 - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
 - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)

#### Message

| Segment HL7               | Optionality | Notes                                                   |
|---------------------------|-------------|---------------------------------------------------------|
| [MSH](#msh)               | 1..1        |                                                         |
| [PID](#pid)               | 1..1        |                                                         |
| [PV1](#pv1)               | 0..1        | PV1 should be populated if PV1-19 Visit Number is known |
| **ORDER**                 | 1..*        |                                                         |
| - [ORC](#orc)             | 1..*        |                                                         |
| - **OBSERVATION REQUEST** | 1..*        |                                                         |
| -- [OBR](#obr)            | 1..*        |                                                         |
| -- [NTE](#nte)            | 0..*        |                                                         |
| -- [DG1](#dg1)            | 0..*        |                                                         |
| -- **OBSERVATION**        | 0..*        |                                                         |
| --- [OBX](#obx)           | 0..*        |                                                         |
| - **SPECIMEN**            | 0..*        | Conditional - required for complete order               |
| -- [SPM](#spm)            | 0..1        |                                                         |

### ORU_R01 Unsolicited transmission of an observation message

#### References

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)

#### Message

| Segment HL7           | Optionality | Notes                                                   |
|-----------------------|-------------|---------------------------------------------------------|
| [MSH](#msh)           | 1..1        |                                                         |
| [PID](#pid)           | 1..1        |                                                         |
| [PV1](#pv1)           | 0..1        | PV1 should be populated if PV1-19 Visit Number is known |
| **ORDER OBSERVATION** | 1..*        |                                                         |
| - [ORC](#orc)         | 1..*        |                                                         |
| - [OBR](#obr)         | 1..*        |                                                         |
| -- **OBSERVATION**    | 1..*        |                                                         |
| -- [OBX](#obx)        | 1..*        |                                                         |
 
## Segments

### MSH

This is based on the definition of MSH from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws).

| Field HL7 | Fieldname                          | Data Type   | Optionality | Data Type and Notes                                                                                                         | Example Values                                                                                                                  |
|-----------|------------------------------------|-------------|-------------|-------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| MSH-1     | Field Separator                    |             | R           |                                                                                                                         | &#9;                                                                                                                            |                                                                                                                          | `                                                                                                         |
| MSH-2     | Encoding Characters                |             | R           |                                                                                                                         | ^~\&                                                                                                                            |
| MSH-3     | Sending Application                |             | R           |                                                                                                                         | iGene                                                                                                                           |
| MSH-4     | Sending Facility                   | HD          | R           | [ODS Code](StructureDefinition-OrganisationCode.html)                                                                   | 699X0                                                                                                                           |
| MSH-5     | Receiving Application              | HD          | R           |                                                                                                                         | EPIC                                                                                                                            |
| MSH-6     | Receiving Facility                 |             | R           | [ODS Code](StructureDefinition-OrganisationCode.html)                                                                   | R0A                                                                                                                             |
| MSH-7     | Date/Time Of Message               |             | R           |                                                                                                                         | 20170126143602                                                                                                                  |
| MSH-9     | Message Type                       |             | R           |                                                                                                                         | ORU^R01^ORU_R01                                                                                                                 |
| MSH-10    | Message Control ID                 |             | R           |                                                                                                                         | 2017012614360280000                                                                                                             |
| MSH-11    | Processing ID                      |             | R           |                                                                                                                         | P                                                                                                                               |
| MSH-12    | Version ID                         |             | R           |                                                                                                                         | 2.5.1                                                                                                                           |
| MSH-13    | Accept AcknowledgmentType          |             | R           |                                                                                                                         | AL                                                                                                                              |

### PID

This is based on the definition of PID from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) and [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type | Optionality | Data Type and Notes                                                                                                               | Example Values                                                                                                                  |
|-----------|------------------------------------|-----------|-------------|-------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| PID-1     | Set ID-PID                         |           | R           |                                                                                                                               | 1                                                                                                                               |
| PID-3     | Patient Identifier List            | [CX](#cx) | R           | [NHS Number](StructureDefinition-NHSNumber.html) <br/> [Medical Record Number](StructureDefinition-MedicalRecordNumber.html). | 633^^^R0A^MR~9449305552^^^NHS^NH                                                                                                |
| PID-5     | Patient Name                       |           | R           |                                                                                                                               | CHISLETT^Octavia^^Miss                                                                                                          |
| PID-7     | Date/Time of Birth                 |           | R           |                                                                                                                               | 20080920                                                                                                                        |
| PID-8     | Administrative Sex                 |           | R           |                                                                                                                               | F                                                                                                                               |
| PID-11    | Patient Address                    |           | R           |                                                                                                                               | 1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST                                                                                    |
| PID-13    | Phone Number - Home                |           | R           |                                                                                                                               | 01656 123123^PRN^PH~07927655295^ORN^CP^NET^X.400^abc@home.com~01656 123123~01656123123^PRN^PH^^^abc@home.com~01656123123^PRN^PH |
| PID-32    | Identity Reliability Code          |           | O           | Mandatory if the the NHS Number tracing status is not known.                                                                  | 01                                                                                                                              |

> v2 to FHIR Guidance: [PID to FHIR Patient](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html)
> 
> FHIR Profile: [Patient](StructureDefinition-Patient.html)

#### Examples

```
PID|1||633^^^R0A^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
```

> FHIR Resource Example: [Patient - Octavia CHISLETT NHS Number: 9449305552](Patient-Patient-OctaviaCHISLETT-9449305552.html)

### PV1 

> The PV1 segment should represent the episode/stay/visit number, not a consultant episode. 

This is based on the definition of PV1 from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

| Field HL7 | Fieldname                 | Data Type   | Optionality | Data Type and Notes                                                                   | Example Values                                |
|-----------|---------------------------|-------------|-------------|-----------------------------------------------------------------------------------|-----------------------------------------------|
| PV1-1     | Set ID - PV1              | [PL](#pl)   | R           |                                                                                   | 1                                             |
| PV1-3     | Assigned Patient Location |             | R           |                                                                                   | ^^^R0A09^^^^^^^R0A <br/> ^^^P1S8J^^^^^^^699X0 |
| PV1-8     | Referring Doctor          | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC             |                                                                                   
| PV1-10    | Hospital Service          |             | R           | [Service](ValueSet-service.html)                                                  | 311                                           |
| PV1-19    | Visit Number              | [CX](#cx)   | O - SHOULD  | [Episode Number](StructureDefinition-EpisodeNumber.html)                            | 12345^^^R0A                                   |                                    |

> v2 to FHIR Guidance: [PV1 to FHIR Encounter](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html)
> 
> FHIR Profile: [Encounter](StructureDefinition-Encounter.html)

#### Examples

```
PV1|1|O|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||100|||||||||1001166717|||||||||||||||||||||||||20250129103726+0000
```

> FHIR Resource Example: [Encounter 'episode/stay' Example](Encounter-984b8a89-4194-4eb4-a7ea-ca8049ebeea3.html)

### ORC

This is based on the definition of ORC from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf).

| Field HL7 | Fieldname                | Data Type   | Optionality | Data Type and Notes                                                                   | Example Values                                                                                                                  |
|-----------|--------------------------|-------------|-------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| ORC-2     | Placer Order Number      | [EI](#ei)   | R           | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)                 | 1601737^R0A^150^L                                                                                                               |
| ORC-3     | Filler Order Number      | [EI](#ei)   | R           | [Filler Order Number](StructureDefinition-FillerOrderNumber.html)                 | 1001166717^699X0^^255^ISO                                                                                                       |
| ORC-4     | Placer Group Number      | [EI](#ei)   | R           | [Placer Group Number](StructureDefinition-PlacerGroupNumber.html)                 | 1001166717^699X0^^255^ISO                                                                                                       |
| ORC-5     | Order Status             |             | O           |                                                                                   |                                                                                                                                 |
| ORC-9     | Date/Time of Transaction |             | O           |                                                                                   |                                                                                                                                 |
| ORC-12    | Ordering Provider        | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                                                                               |
| ORC-21    | Ordering Facility Name   | [XON](#xon) | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)                    |                                                                                                                                 |

> v2 to FHIR Guidance: [ORC to FHIR ServiceRequest](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)
>
> FHIR Profile: [ServiceRequest](StructureDefinition-ServiceRequest.html)
>

#### Examples

```
ORC|NW|1601737^R0A|1001166717^699X0||||||20250129|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||^^R0A^^^ODS
```

> FHIR Resource Example: [ServiceRequest Coded Entries Example](ServiceRequest-ServiceRequestGenomicsOrderCodedEntries.html)

### OBR 

This is based on the definition of OBR from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type   | Optionality   | Data Type and Notes                                                                   | Example Values                                                              |
|-----------|------------------------------------|-------------|---------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| OBR-1     | Set ID - OBR                       |             | R             |                                                                                   | 1                                                                           |
| OBR-2     | Placer Order Number                | [EI](#ei)   | R             | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)                 | 1601737^ R0A^150^L                                                          |
| OBR-3     | Filler Order Number                | [EI](#ei)   | R             | [Filler Order Number](StructureDefinition-FillerOrderNumber.html)                 | 1001166717^699X0^^255^ISO                                                   |
| OBR-4     | Universal Service Identifier       |             | R             | [Genomic Test Directory](ValueSet-genomic-test-directory.html)                    | R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory |
| OBR-6     | Requested Date/Time              |             | R for OML_O21 |                                                                                   | 20170126135745                                                              |
| OBR-7     | Observation Date/Time              |             | R for ORU_R01 |                                                                                   | 20170126135745                                                              |
| OBR-16    | Ordering Provider                  |             | R             | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                           |
| OBR-22    | Results Rpt/Status Chng -Date/Time |             | R             |                                                                                   | 20170126135745                                                              |
| OBR-32    | Principal Result Interpreter       | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.resultsInterpreter[primaryReporter]                              |                                                                             |
| OBR-33    | Assistant Result Interpreter       | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.resultsInterpreter[secondaryReporter]                            |                                                                             |
| OBR-34    | Technician                         | [NDL](#ndl) | O - SHOULD    | DiagnosticReport.performer[operator]                                              |                                                                             |                                                                             |

> v2 to FHIR Guidance OML_O21: [OBR to FHIR ServiceRequest](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html)
> 
> v2 to FHIR Guidance ORU_R01: [OBR to FHIR DiagnosticReport](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html)
> 
> FHIR Profile: [DiagnosticReport](StructureDefinition-DiagnosticReport.html)


#### Examples

```
OBR|1|1601737^R0A|1001166717^699X0|R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
```

> FHIR Resource Example: [Diagnostic Report Example](DiagnosticReport-DiagnosticReportGenomicsReport.html)

### NTE

Multiple NTE should be converted to a single FHIR Annotation using markdown

| Field HL7 | Fieldname         | Data Type | Optionality | Data Type and Notes | Example Values |
|-----------|-------------------|-----------|-------------|-------------|----------------|
| NTE-1     | Set ID - NTE      |           |             |             |                | 
| NTE-2     | Source of Comment |           |             |             |                | 
| NTE-3     | Comment           |           |             |             |                | 
| NTE-4     | Comment Type      |           |             |             |                | 

> v2 to FHIR Guidance: OML_O21 [NTE to FHIR ServiceRequest](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-servicerequest.html)
> 
> v2 to FHIR Guidance: ORU_R01 [NTE to FHIR Observation](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-observation.html)

#### Examples

```
NTE|1||Referral lab PLEASE do following tests:
NTE|2||
NTE|3||Test(s) required: WGS
NTE|4||Sample type: Blood
NTE|5||Transport used: Merlin Courier
NTE|6||Tracking Number: ABC123
NTE|7||Sample sent to: LWH Genetics
NTE|8||By: PDAY       on: 02/04/25
NTE|9||
NTE|10||.Speciality Requesting Clinician: PAEDS
NTE|11||Test Group: Neurology
NTE|12||Ethnic Group: White British
NTE|13||Patient is from consanguineous union? : Unknown
NTE|14||Specimen Collection Status: Collect & send with order
NTE|15||Infection Risk: No Specific Risk
NTE|16||Clinical details:
NTE|17||
NTE|18||TESTING
NTE|19||Contact/Bleep No: 123
```

> FHIR Resource Example OML_O21: [ServiceRequest Coded Entries Example](ServiceRequest-ServiceRequestGenomicsOrderCodedEntries.html)
> 
> FHIR Resource Example ORU_R01: TODO

### DG1

| Field HL7 | Fieldname         | Data Type | Optionality | Data Type and Notes | Example Values |
|-----------|-------------------|-----------|-------------|-------------|----------------|
| DG1-3     | Diagnosis Code    | [CE](#ce)          |             |             |                | 
| DG1-4     | Diagnosis Description |           |             |             |                | 

> v2 to FHIR Guidance: [DG1 to FHIR Condition](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html)
> 
> Note: In orders this is likely to be a coded entry in ServiceRequest.reasonCode as only a code is present.
> 
> FHIR Profile: [Condition](StructureDefinition-Condition.html)

#### Examples

```
DG1|1||363349007^Malignant tumour of stomach^SNM||20250129103726+0000
```

> FHIR Resource Example ORU_R01: TODO
 
### OBX

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                    | Data Type | Optionality | Data Type and Notes         | Example Values                                                                                                |
|-----------|------------------------------|-----------|-------------|-------------------------|---------------------------------------------------------------------------------------------------------------|
| OBX-1     | Set ID – OBX                 |           | R           |                         | 1                                                                                                             |
| OBX-2     | Value Type                   |           | R           | See next section for ED | CE                                                                                                            |
| OBX-3     | Observation Identifier       | [CE](#ce) | R           |                         | 842009^Consanguinity^SNM<br/>97209-1^Shipment tracking number^LN<br/>161714006^Estimated date of delivery^SNM |
| OBX-5     | Observation Value            | Varies        | R           |                         | LN^Yes^LA33-6 (value type=CE)<br/>UK3096580215 (value type=ST)<br/>20250512103726+0000 (value type=DT)        |
| OBX-11    | Observation Result Status    |           | R           |                         | F                                                                                                             |
| OBX-14    | Date/Time of the Observation |           | O - SHOULD  |                         | 20190514102417+0000                                                                                           |

> v2 to FHIR Guidance: [OBX to FHIR Observation](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-observation.html)
> 
> FHIR Profile: [Observation](StructureDefinition-Observation.html)
>
> FHIR Resource Example: [Consanguinity (value type=CE)](Observation-OBX-Consanguinity.html)

#### Examples

```
OBX|1|CE|GENEAP^GENETICS TEST PERFORMABLE^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|2|CE|230056^What Type of Referral Do You Require?^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|3|CE|281269004^High infection risk sample^SNM|||||||||||20250129103726+0000
OBX|4|ST|230016^Test Type^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||Diagnostic Screen/Test|||||||||20250129103726+0000
```

> FHIR Resource Example: [Order Tracking Number (value type=ST)](Observation-OBX-OrderTrackingNumber.html)
> 
> FHIR Resource Example: [Pregnancy Expected Delivery Date (value type=DT)](Observation-OBX-PregnancyExpectedDeliveryDate.html)


### OBX (type = ED)

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                    | Data Type | Optionality | Data Type and Notes                                          | Example Values                           |
|-----------|------------------------------|-----------|-------------|----------------------------------------------------------|------------------------------------------|
| OBX-1     | Set ID – OBX                 |           | R           |                                                          | 1                                        |
| OBX-2     | Value Type                   | ED        | R           |                                                          | ED                                       |
| OBX-3     | Observation Identifier       | [ED](#ed) | R           | [Document Entry Type](ValueSet-document-entry-type.html) | 1054161000000101^Genetic report^SNM      |
| OBX-5     | Observation Value            |         | R           |                                                          | MOL^IM^PDF^Base64^JVBERI0X...            |
| OBX-11    | Observation Result Status    |           | R           |                                                          | F                                        |
| OBX-14    | Date/Time of the Observation |           | O - SHOULD  |                                                          | 20190514102417+0000                      |

> v2 to FHIR Guidance:  [OBX to FHIR DocumentReference](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-documentreference.html)
> 
> FHIR Profile: [DocumentReference](StructureDefinition-DocumentReference.html)

#### Examples

```
OBX|1|ED|1054161000000101^Genetic report^SNM||MOL^IM^PDF^Base64^JVBERi0x...||||||F
```

> FHIR Resource Example: [Document Reference Laboratory Report](DocumentReference-94bf65ba-cd6c-4601-b339-6d547f424646.html)

### SPM

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                     | Data Type | Optionality | Data Type and Notes                                          | Example Values                                    |
|-----------|-------------------------------|-----------|-------------|--------------------------------------------------------------|---------------------------------------------------|
| SPM-2     | Specimen ID                   |           | O           | Placer Specimen Number^Filler Specimen Number                | 25GEN-029GN00001&R0A                              |
| SPM-3     | Specimen Parent IDs           |           | O           | [Accession Number](StructureDefinition-AccessionNumber.html) | ^1001166717&699X0                                 |
| SPM-4     | Specimen Type                 |           | O           | [Specimen Type](ValueSet-specimen-type.html)                 | 119325001^Skin specimen^SNM                       |
| SPM-8     | Specimen Source Site          |           | O           |                                                              | 299706009^Bone structure of wrist and/or hand^SNM |
| SPM-9     | Specimen Source Site Modifier |           | O           |                                                              | 7771000^Left^SNM                                  |
| SPM-17    | Specimen Collection Date/Time |           | O           |                                                              |                                                   |
| SPM-18    | Specimen Received Date/Time   |           | O           |                                                              |                                                   |
| SPM-20    | Specimen Availability         |           | O           |                                                              |                                                   |
| SPM-30    | Accession ID                  |           | O           |                                                              |                                                   |

> v2 to FHIR Guidance:  [SPM to FHIR Specimen](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html)
> 
> FHIR Profile: [Specimen](StructureDefinition-Specimen.html)

#### Examples

```
SPM|1|25GEN-029GN00001&R0A|^1001166717&699X0|258580003^Whole blood specimen^SNM|||||||||||||20250129103726+0000|||Y
```

> FHIR Resource Example: [Specimen Example](Specimen-SpecimenExample.html)

## Data Types

This applies to HL7 v2 ORU_R01 feeds to the RIE.

ORC-3, ORC-12 (XCN) and ORC-21 (XON) **SHALL** be populated.

### CE 

Coded Element.
UK SNOMED CT is preferred and may be mandatory depending on use, for example for OXB Type ED, it will be required.

#### Example 

SNOMED

```1054161000000101^Genetic report^SNM```

LOINC (from HL7 International)

```53577-3^Reason for study^LN```
```51967-8^Genetic disease(s) assessed^LN```
```48018-6^Gene studied^LN```

### CX 

Extended Composite ID with Check Digit
CX.1 - Id Number, CX-4 - Assigning authority and CX.5 - Identifier Type Code are mandatory

#### Example

NHS Number 

```aiignore
9449305552^^^NHS^NH
```

Medical Record Number

```aiignore
633^^^R0A^MR
```

### EI 

Entity Identifier.
EI.1 - Entity Identifier and EI.2 - Namespace Id are mandatory

#### Example

Manchester University NHS Foundation Trust 

```aiignore
1601737^R0A
```

North West GLH Hub

```aiignore
1001166717^699X0
```

### PL

This is based on the definition of PL from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.
In addition, this includes of PL.11 to hold organisation ODS code.  

> The ODS Site Code **SHALL** belong to the ODS Code. This is to help avoid data issues in this codesystem. 

| Field HL7 | Fieldname                        | Data Type | Optionality | Data Type and Notes                                                         | Example Values |
|-----------|----------------------------------|-----------|-------------|-------------------------------------------------------------------------|----------------|
| PL.4      | Facility                         | HD        | R           | [Organisation Site Code](StructureDefinition-OrganisationSiteCode.html) | R0A09               |
| PL.11     | Assigning Authority For Location | HD        | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)          | R0A            | 


### NDL

This is based on the definitions of NDL from [Royal College of Radiologists](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

| Field HL7   | Fieldname   | Data Type | Optionality | Data Type and Notes | Example Values |
|-------------|-------------|-----------|-------------|-----------------|----------------|
| NDL-1.CNN.1 | Id Number   | ST        | O           | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html)      |                |
| NDL-1.CNN.2 | Family Name | ST        | O           | Surname         |                |
| NDL-1.CNN.3 | Given  Name | ST        | O           | Forename        |                |
| NDL-7       | Facility    | HD        | O           | [Organisation Code](StructureDefinition-OrganisationCode.html)         |                |

### XCN

Extended Composite ID Number and Name for Persons.
The definition of XCN from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.

Example

GMC Code

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

### XON 

Extended Composite Name and Identification Number for Organizations.
The definition of XON from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-21.

Example

```aiignore
MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
```

## HL7 v2 to FHIR Message Conversion

- [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
- [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) 
- [HL7 Version 2 to FHIR - Message ORU_R01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html)

## Example: Example Instances

### OML_O21 Laboratory Order

#### Genomics Order with Coded Entries

For the FHIR version see [Bundle 'Message' - Genomics Order with Coded Entries](Bundle-GenomicsOrderMessageCodedEntries.html)

```aiignore
MSH|^~\&|HIVE|R0A|LIMS|699X0|20241013103300+0000||OML^O21^OML_O21|urn:uuid:9612365d-52a4-4fab-87e7-8a09d753f095|T|2.5.1|||AL
PID|1||633^^^EPI^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1|O|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||100|||||||||1001166717|||||||||||||||||||||||||20250129103726+0000
ORC|NW|1601737^R0A|1001166717^699X0||||||20250129|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||^^R0A^^^ODS
OBR|1|1601737^R0A|1001166717^699X0|R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
NTE|1||Referral lab PLEASE do following tests:
NTE|2||
NTE|3||Test(s) required: WGS
NTE|4||Sample type: Blood
NTE|5||Transport used: Merlin Courier
NTE|6||Tracking Number: ABC123
NTE|7||Sample sent to: LWH Genetics
NTE|8||By: PDAY       on: 02/04/25
NTE|9||
NTE|10||.Speciality Requesting Clinician: PAEDS
NTE|11||Test Group: Neurology
NTE|12||Ethnic Group: White British
NTE|13||Patient is from consanguineous union? : Unknown
NTE|14||Specimen Collection Status: Collect & send with order
NTE|15||Infection Risk: No Specific Risk
NTE|16||Clinical details:
NTE|17||
NTE|18||TESTING
NTE|19||Contact/Bleep No: 123
DG1|1||363349007^Malignant tumour of stomach^SNM||20250129103726+0000
DG1|2||363349007^Malignant tumour of stomach^SNM
OBX|1|CE|GENEAP^GENETICS TEST PERFORMABLE^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|2|CE|230056^What Type of Referral Do You Require?^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|3|CE|281269004^High infection risk sample^SNM|||||||||||20250129103726+0000
OBX|4|ST|230016^Test Type^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||Diagnostic Screen/Test|||||||||20250129103726+0000
OBX|5|CE|77386006^Pregnancy^SNM|||||||||||20250129103726+0000
OBX|6|ST|231284^Please Select R240 Test(s):^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||R240.1: Targeted variant testing|||||||||20250129103726+0000
OBX|7|ST|231285^Please Select R242 Test(s):^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||R242.1: Targeted variant testing|||||||||20250129103726+0000
OBX|8|ST|230027^Email Addresses of Non-MFT Clinicians for Result Reports^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||charu|||||||||20250129103726+0000
OBX|9|CE|762911000000102^Informed consent given for treatment^SNM|||||||||||20250129103726+0000
OBX|10|ST|230037^Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||Acknowledged|||||||||20250129103726+0000
OBX|11|ST|230039^Is the Person Ordering the Test the Referring Clinician^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||No|||||||||20250129103726+0000
OBX|12|ST|unknown^Name of Supervising Clinician^https://nw-gmsa.github.io/CodeSystem/MFTQuestionIds||DESHPANDE, CHARULATA|||||||||20250129103726+0000
SPM|1|25GEN-029GN00001&R0A|^1001166717&699X0|258580003^Whole blood specimen^SNM|||||||||||||20250129103726+0000|||Y
```

#### NonWGSTestOrderForm-CancerSolidTumor-Example

For the FHIR version see [Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example](Bundle-Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example.html)

```aiignore
MSH|^~\&|HIVE|RAX|LIMS|RJZ|20241013103300+0000||OML^O21^OML_O21|156bb6ab-15e7-42f3-a819-ecd16a5b4fbd|T|2.5.1|||AL
PID|1||RWT17335^^^EPI^MR||Hadjkiss^Zelma||20110319||||2 Barclay Close^Fetcham^^^KT22 9SY
ORC|NW||||||||20230908|||9999999998^Smith^Hazel^^^Dr.^^^SDS|||||||||Kingston Hospital NHS Foundation Trust^^RAX01^^^ODS
OBR|1|||M119.5^Multi Target NGS Panel Small^England-GenomicTestDirectory||20230908||||||||||9999999998^Smith^Hazel^^^Dr.^^^SDS
NTE|1||Free text for diagnosis/reason for referral, transplant, life status at time of request details/ e.g. malignant tumour - molecular assessment will aid management
DG1|1||363358000^Malignant tumour of lung^SNM
DG1|2||relapse^Relapse^https://fhir.nhs.uk/CodeSystem/reasonfortesting-genomics
OBX|1|CE|128462008^Metastatic malignant neoplasm (disorder)^SNM|||||||||||20230908
OBX|2|CE|6574001^Necrosis (morphologic abnormality)^SNM|||||||||||20230908
SPM|1|RA257630||364611000000101^Tissue resection sample^SNM|||||||||||||20230909110000Z|||Y
```

### ORU_R01 Unsolicited transmission of an observation message

```aiignore
MSH|^~\&|iGene|699X0|EPIC|R0A|20190514102527+0200||ORU^R01^ORU_R01|5051095-201905141025|T|2.5.1|||AL
PID|1||633^^^R0A^MR~9449305552^^^NHS^NH||CHISLETT^Octavia^^Miss||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1|N|^^^R0A09^^^^^^^R0A|||||C3456789^Darwin^Samuel^^^Dr^^^GMC||311|||||||||12345^^^R0A
ORC|RE|1601737^R0A|1001166717^699X0||CM||||20170126143602|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1601737^R0A|1001166717^699X0|R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory|||20190514102000+0200|||SCC|O|||20190514102000+0200||C3456789^Darwin^Samuel^^^Dr^^^GMC||||||20190514102417+0200
OBX|1|ED|1054161000000101^Genetic report^SNM||MOL^IM^PDF^Base64^JVBERi0x...||||||F
```
