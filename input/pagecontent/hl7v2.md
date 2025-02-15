
## Behavior: Message Definitions

### ORM_O01 General Order and OML_O21 - Laboratory Order

#### References

 - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
 - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)

### ORU_R01 Unsolicited transmission of an observation message

#### References

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)

#### Using ORU to Publish PDF Reports

The following table describes the minimum fields to meet the NHS Wales Informatics Service standards. OIDs
will be agreed as part of on-boarding process. The fields here are all mandatory

##### Required segments

MSH, PID, PV1, Single OBR, Single OBX

| Field HL7 | Fieldname                          | Data Type   | Optionality | Table                                                 | Example Values                                                                                                                  |
|-----------|------------------------------------|-------------|-------------|-------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| MSH.1     | Field Separator                    |             |             |                                                       | &#9;                                                                                                                            |                                                                                                                          | `                                                                                                         |
| MSH.2     | Encoding Characters                |             |             |                                                       | ^~\&                                                                                                                            |
| MSH.3     | Sending Application                |             |             |                                                       | iGene                                                                                                                           |
| MSH.4     | Sending Facility                   |             |             | [ODS Code](StructureDefinition-OrganisationCode.html) | 699X0                                                                                                                           |
| MSH.5     | Receiving Application              |             |             |                                                       | EPIC                                                                                                                            |
| MSH.6     | Receiving Facility                 |             |             | [ODS Code](StructureDefinition-OrganisationCode.html) | R0A                                                                                                                             |
| MSH.7     | Date/Time Of Message               |             |             |                                                       | 20170126143602                                                                                                                  |
| MSH.9     | Message Type                       |             |             |                                                       | ORU^R01^ORU_R01                                                                                                                 |
| MSH.10    | Message Control ID                 |             |             |                                                       | 2017012614360280000                                                                                                             |
| MSH.11    | Processing ID                      |             |             |                                                       | P                                                                                                                               |
| MSH.12    | Version ID                         |             |             |                                                       | 2.5.1                                                                                                                           |
| MSH.13    | Accept AcknowledgmentType          |             |             |                                                       | AL                                                                                                                              |
| PID.1     | Set ID-PID                         |             |             |                                                       | 1                                                                                                                               |
| PID.3     | Patient Identifier List            |             |             |                                                       | M21300019^^^2.16.840.1.113883.2.1.8.1.3.126^MR ~9999999998^^^NHS^NH                                                             |
| PID.5     | Patient Name                       |             |             |                                                       | Bloggs^Joe^^Mr                                                                                                                  |
| PID.7     | Date/Time of Birth                 |             |             |                                                       | 20010328                                                                                                                        |
| PID.8     | Administrative Sex                 |             |             |                                                       | M                                                                                                                               |
| PID.11    | Patient Address                    |             |             |                                                       | Street^Other^Town^County^Postcode                                                                                               |
| PID.13    | Phone Number - Home                |             |             |                                                       | 01656 123123^PRN^PH~07927655295^ORN^CP^NET^X.400^abc@home.com~01656 123123~01656123123^PRN^PH^^^abc@home.com~01656123123^PRN^PH |
| PID.32    | Identity Reliability Code          |             |             |                                                       | 01                                                                                                                              |
| PV1.1     | Set ID - PV1                       |             |             |                                                       | 1                                                                                                                               |
| PV1.3     | Assigned Patient Location          |             |             |                                                       | ^^^^^^^^Greendale Surgery^W95023                                                                                                |
| PV1.8     | Referring Doctor                   | [XCN](#XCN) |             |                                                       | 1234567^Jones^Indiana                                                                                                           
| PV1.10    | Hospital Service                   |             |             |                                                       | 311                                                                                                                             |
| OBR.1     | Set ID - OBR                       |             |             |                                                       | 1                                                                                                                               |
| OBR.2     | Placer Order Number                |             |             |                                                       | 287018^^150^L                                                                                                                   |
| OBR.3     | Filler Order Number                |             |             |                                                       | 287018^^255^ISO                                                                                                                 |
| OBR.4     | Universal Service Identifier       |             |             |                                                       | CXR^Chest Xray^RCR National Procedure Codes                                                                                     |
| OBR.7     | Observation Date/Time              |             |             |                                                       | 20170126135745                                                                                                                  |
| OBR.16    | Ordering Provider                  |             |             |                                                       | 1234567^Jones^Indiana^^^Dr^^^GMC                                                                                                |
| OBR.22    | Results Rpt/Status Chng -Date/Time |             |             |                                                       | 20170126135745                                                                                                                  |
| OBX.1     | Set ID – OBX                       |             |             |                                                       | 1                                                                                                                               |
| OBX.2     | Value Type                         |             |             |                                                       | ED                                                                                                                              |
| OBX.3     | Observation Identifier             |             |             |                                                       | MOLT^MOL TEST NAME^L                                                                                                            |
| OBX.5     | Observation Value                  |             |             |                                                       | MOL^IM^PDF^Base64^JVBERI0X...                                                                                                   |
| OBX.11    | Observation Result Status          |             |             |                                                       | F                                                                                                                               |


## Structures: Data Type Profiles

This applies to HL7 v2 ORU_R01 feeds to the RIE.

ORC-3, ORC-12 (XCN) and ORC-21 (XON) **SHALL** be populated.

### XCN

Extended Composite ID Number and Name for Persons.
The definition of XCN from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.

Example

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

## v2 to FHIR: Structure Maps

- [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
- [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) conversion of HL7 v2 ORM Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
- [HL7 Version 2 to FHIR - Message ORU_R01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html) conversion of HL7 v2 ORU Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))


## Example: Example Instances

### ORM_O01 General Order


### ORU_R01 Unsolicited transmission of an observation message

```aiignore
# HL7v2Examples/ORU_R01_PDF_NW.txt
```
