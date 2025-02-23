
## Message Definitions

### OML_O21 Laboratory Order 

(and ORM_O01 General Order)

#### References

 - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
 - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)

### ORU_R01 Unsolicited transmission of an observation message

#### References

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)

#### Segments

| Segment HL7 | Optionality |
|-------------|-------------|
| [MSH](#msh) | 1..1        |
| [PID](#pid) | 1..1        |
| [PV1](#pv1) | 1..1        |
| [ORC](#orc) | 0..*        |
| [OBR](#obr) | 1..*        |
| [OBX](#obx) | 1..*        |
 
## Segments

### MSH


| Field HL7 | Fieldname                          | Data Type   | Optionality | Table and Notes                                                                                                         | Example Values                                                                                                                  |
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

| Field HL7 | Fieldname                          | Data Type | Optionality | Table and Notes                                                                                                         | Example Values                                                                                                                  |
|-----------|------------------------------------|-----------|-------------|-------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| PID-1     | Set ID-PID                         |           | R           |                                                                                                                         | 1                                                                                                                               |
| PID-3     | Patient Identifier List            | [CX](#cx) | R           | [NHS Number](StructureDefinition-NHSNumber.html) [Medical Record Number](StructureDefinition-MedicalRecordNumber.html). | 633^^^R0A^MR~9449305552^^^NHS^NH                                                                                                |
| PID-5     | Patient Name                       |           | R           |                                                                                                                         | CHISLETT^Octavia^^Miss                                                                                                          |
| PID-7     | Date/Time of Birth                 |           | R           |                                                                                                                         | 20080920                                                                                                                        |
| PID-8     | Administrative Sex                 |           | R           |                                                                                                                         | F                                                                                                                               |
| PID-11    | Patient Address                    |           | R           |                                                                                                                         | 1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST                                                                                    |
| PID-13    | Phone Number - Home                |           | R           |                                                                                                                         | 01656 123123^PRN^PH~07927655295^ORN^CP^NET^X.400^abc@home.com~01656 123123~01656123123^PRN^PH^^^abc@home.com~01656123123^PRN^PH |
| PID-32    | Identity Reliability Code          |           | O           | Mandatory if the the NHS Number tracing status is not known.                                                            | 01                                                                                                                              |

### PV1 

> The PV1 segment should represent the sending organisations encounter, i.e. the one that created the order or report. This differs from DHCW definition.

| Field HL7 | Fieldname                 | Data Type   | Optionality | Table and Notes                                                                   | Example Values                                |
|-----------|---------------------------|-------------|-------------|-----------------------------------------------------------------------------------|-----------------------------------------------|
| PV1-1     | Set ID - PV1              | [PL](#pl)   | R           |                                                                                   | 1                                             |
| PV1-3     | Assigned Patient Location |             | R           |                                                                                   | ^^^R0A09^^^^^^^R0A <br/> ^^^P1S8J^^^^^^^699X0 |
| PV1-8     | Referring Doctor          | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC             |                                                                                   
| PV1-10    | Hospital Service          |             | R           | [Service](ValueSet-service.html)                                                  | 311                                           |
| PV1-19    | Visit Number              | [CX](#cx)   | R           |                                                                                   | 12345^^^R0A                                   |                                    |

### ORC

| Field HL7 | Fieldname                | Data Type   | Optionality | Table and Notes                                                                   | Example Values                                                                                                                  |
|-----------|--------------------------|-------------|-------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| ORC-2     | Placer Order Number      | [EI](#ei)   | R           | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)                 | 1601737^ R0A^150^L                                                                                                               |
| ORC-3     | Filler Order Number      | [EI](#ei)   | R           | [Filler Order Number](StructureDefinition-FillerOrderNumber.html)                 | 1001166717^699X0^^255^ISO                                                                                                       |
| ORC-4     | Placer Group Number      | [EI](#ei)   | R           | [Placer Group Number](StructureDefinition-PlacerGroupNumber.html)                 | 1001166717^699X0^^255^ISO                                                                                                       |
| ORC-5     | Order Status             |             | O           |                                                                                   |                                                                                                                                 |
| ORC-9     | Date/Time of Transaction |             | O           |                                                                                   |                                                                                                                                 |
| ORC-12    | Ordering Provider        | [XCN](#xcn) | R           | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                                                                               |
| ORC-21    | Ordering Facility Name   | [XON](#xon) | R           | [ODS Code](StructureDefinition-OrganisationCode.html)                             |                                                                                                                                 |


### OBR 

| Field HL7 | Fieldname                          | Data Type | Optionality | Table and Notes                                                                   | Example Values                                                                                                                  |
|-----------|------------------------------------|-----------|-------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| OBR-1     | Set ID - OBR                       |           | R           |                                                                                   | 1                                                                                                                               |
| OBR-2     | Placer Order Number                | [EI](#ei) | R           | [Placer Order Number](StructureDefinition-PlacerOrderNumber.html)                | 1601737^ R0A^150^L                                                                                                               |
| OBR-3     | Filler Order Number                | [EI](#ei) | R           | [Filler Order Number](StructureDefinition-FillerOrderNumber.html)                       | 1001166717^699X0^^255^ISO                                                                                                       |
| OBR-4     | Universal Service Identifier       |           | R           | [Genomic Test Directory](ValueSet-genomic-test-directory.html)                    | R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory                                                     |
| OBR-7     | Observation Date/Time              |           | R           |                                                                                   | 20170126135745                                                                                                                  |
| OBR-16    | Ordering Provider                  |           | R           | [Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                                                                                               |
| OBR-22    | Results Rpt/Status Chng -Date/Time |           | R           |                                                                                   | 20170126135745                                                                                                                  |

### OBX

| Field HL7 | Fieldname                    | Data Type | Optionality | Table and Notes                                          | Example Values                      |
|-----------|------------------------------|-----------|-------------|----------------------------------------------------------|-------------------------------------|
| OBX-1     | Set ID – OBX                 |           | R           |                                                          | 1                                   |
| OBX-2     | Value Type                   |           | R           |                                                          | ED                                  |
| OBX-3     | Observation Identifier       | [CE](#ce) | R           | [Document Entry Type](ValueSet-document-entry-type.html) | 1054161000000101^Genetic report^SNM |
| OBX-5     | Observation Value            | ED        | R           |                                                          | MOL^IM^PDF^Base64^JVBERI0X...       |
| OBX-11    | Observation Result Status    |           | R           |                                                          | F                                   |
| OBX-14    | Date/Time of the Observation |           |             |                                                          | 20190514102417+0000                 |

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

This is baed on the definition of PL from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.
In addition, this includes of PL.11 to hold organisation ODS code.  

> The ODS Site Code **SHALL** belong to the ODS Code. This is to help avoid data issues in this codesystem. 

| Field HL7 | Fieldname                        | Data Type | Optionality | Table and Notes                                                         | Example Values |
|-----------|----------------------------------|-----------|-------------|-------------------------------------------------------------------------|----------------|
| PL.4      | Facility                         | HD        | R           | [Organisation Site Code](StructureDefinition-OrganisationSiteCode.html) | R0A09               |
| PL.11     | Assigning Authority For Location | HD        | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)          | R0A            | 

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

```aiignore
MSH|^~\&|EPIC|R0A|iGene|699X0|20190514102527+0200||OML^O21^OML_O21|9612365d-52a4-4fab-87e7-8a09d753f095|T|2.5.1|||AL
PID|1||633^^^R0A^MR~9449305552^^^NHS^NH||CHISLETT^Octavia^^Miss||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1|N|^^^R0A09^^^^^^^R0A|||||C3456789^Darwin^Samuel^^^Dr^^^GMC||311|||||||||12345^^^R0A
ORC|RE|1601737^R0A|1001166717^699X0||SC||||20170126143602|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1601737^R0A||R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory|||20190514102000+0200|||SCC|O|||20190514102000+0200||C3456789^Darwin^Samuel^^^Dr^^^GMC||||||20190514102417+0200
OBX|1|ED|721965002^Laboratory order^SNM||MOL^IM^PDF^Base64^JVBERi0x...||||||F
SPM|1|25GEN-029GN00001^R0A||||||||||||||||||Y
```

### ORU_R01 Unsolicited transmission of an observation message

```aiignore
MSH|^~\&|iGene|699X0|EPIC|R0A|20190514102527+0200||ORU^R01^ORU_R01|5051095-201905141025|T|2.5.1|||AL
PID|1||633^^^R0A^MR~9449305552^^^NHS^NH||CHISLETT^Octavia^^Miss||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1|N|^^^P1S8J^^^^^^^699X0|||||C3456789^Darwin^Samuel^^^Dr^^^GMC||311|||||||||12345^^^699X0
ORC|RE|1601737^R0A|1001166717^699X0||CM||||20170126143602|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1601737^R0A|1001166717^699X0|R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory|||20190514102000+0200|||SCC|O|||20190514102000+0200||C3456789^Darwin^Samuel^^^Dr^^^GMC||||||20190514102417+0200
OBX|1|ED|1054161000000101^Genetic report^SNM||MOL^IM^PDF^Base64^JVBERi0x...||||||F
```
