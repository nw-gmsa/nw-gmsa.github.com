
## Behavior: Message Definitions

### ORM_O01 General Order and OML_O21 - Laboratory Order

- HL7 v2.x OML_021
    - [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
- HL7 v2.x ORM_O01
    - [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) conversion of HL7 v2 ORM Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
- Supplier Specifications
    - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
    - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)
    - Cerner
    - iGene TO FOLLOW (LIMS to RIE)

### ORU_R01 Unsolicited transmission of an observation message

#### References

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [HL7 Version 2 to FHIR - Message ORU_R01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html) conversion of HL7 v2 ORU Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
- Supplier specifications
  - iGene TO FOLLOW (LIMS to RIE)
  - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)

## Structures: Data Type Profiles

This applies to HL7 v2 ORU_R01 feeds to the RIE.

ORC-3, ORC-12 (XCN) and ORC-21 (XON) **SHALL** be populated.

### XCN - Extended Composite ID Number and Name for Persons

The definition of XCN from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.

Example

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

### XON - Extended Composite Name and Identification Number for Organizations

The definition of XON from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-21.

Example

```aiignore
MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
```


## Example: Example Instances

### ORM_O01 General Order

#### EPIC Example v2.4

```
MSH|^~\&|EpicCare|MFT|TIE|SMHGEN|20250129103733|GNTCO|ORM^O01|527178290|T|2.4|||AL|NE
PID|1||202999^^^EPI^MR||Obstetrics^Mel^J^^^^D||19840208|F|||4563 QUARTZ STREET^^MADISON^WI^53719^UNITED STATES OF AMERICA^P||06085 554578^P^H^^^06085^554578~06085 557774^P^M^^^06085^557774|06085 554785^P^W^^^06085^554785||M||1001166717||||||||||||N
ZPD||MYCH~Post||ACTIVATED|||Y|20250729||||||||||N||||||F
PV1|1|OP|SMHCANCG^^^SMH^^^^^^^DEPID||||||||||||||||1001166717
ORC|NW|1601737^EPC||1001166717|||^^^20250129^^R^^||20250129103726|GNTCO^MEDICAL GENETICS^COUNSELOR^^|||SMHCANCG^SMH CANCER GENETICS^DEPID^SMH^^^^^SMH CANCER GENETICS|||||CLISUP^EPIC SUPPORT|||||||||||O
OBR|1|1601737^EPC|1000135203^Beaker|GENEAP^GENETICS TEST PERFORMABLE^IGEAP^^GENETICS TEST||20250129|20250129103726||||L|||||||||||||Lab|||^^^20250129^^R^^|||||||||20250129
NTE|1||Said it can be done.|OC
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

### ORU_R01 Unsolicited transmission of an observation message

#### iGene v2.4

```
MSH|^~\&|IGENE|MFT|EPIC|MFT|202502030930||ORU^R01|MSG00001|P|2.3
PID|1||EPI1234^^^MR||Doe^John^Michael^Mr.||19800101|123 Main St^Anytown^CA^12345||555-1234||S||ABC123|987654321|M
PV1|1||TBC^1234
ORC|RE|ABC123|XYZ789
OBR|1|ABC123|ABC123|TEST001^Complete Blood Count^IGEAP||202502030930|||||||||PROV123^Smith^John||||||202502030930
OBX|1|TX|TEST001^Complete Blood Count^IGENE|1|Normal|||||F
```

