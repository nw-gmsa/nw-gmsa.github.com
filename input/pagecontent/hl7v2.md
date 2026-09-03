


## OML_O21 Laboratory Order 

### References

<span class="badge badge-danger">Diagnostic Workflow</span> 

 - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
 - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)

### Message

| Segment HL7               | Optionality | Notes                                                   |
|---------------------------|-------------|---------------------------------------------------------|
| [MSH](#msh)               | 1..1        |                                                         |
| [PID](#pid)               | 1..1        |                                                         |
| [NK1](#nk1)               | 0..*        | For a fetus, this shall be the mother.                  |
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
{:.grid}

## ORU_R01 Unsolicited transmission of an observation message

### References

<span class="badge badge-danger">Diagnostic Workflow</span> 

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](../DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- The Royal College of Radiologists [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

<span class="badge badge-danger">Genomics</span>

- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)

### Message

| Segment HL7           | Optionality | Notes                                                   |
|-----------------------|-------------|---------------------------------------------------------|
| [MSH](#msh)           | 1..1        |                                                         |
| [PID](#pid)           | 1..1        |                                                         |
| [PV1](#pv1)           | 0..1        | PV1 should be populated if PV1-19 Visit Number is known |
| [NK1](#nk1)          | 0..*        | For a fetus, this shall be the mother.                  |
| **ORDER OBSERVATION** | 1..*        |                                                         |
| - [ORC](#orc)         | 1..*        |                                                         |
| - [OBR](#obr)         | 1..*        |                                                         |
| -- **OBSERVATION**    | 1..*        |                                                         |
| -- [OBX](#obx)        | 1..*        |                                                         |
{:.grid}

<!--
### MASTER HL7 REPORTING PANEL

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                    | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                                            | Cardinality | Term Description                                                       |
|-------------|----------------|-----------------------------------|----------------------|----------------|-------------------------------------------------------------------|-------------|------------------------------------------------------------------------|
| CE          | 51967-8        | Genetic disease assessed [ID]     | LOINC                | 1.a            | R240^Diagnostic testing for known mutation(s)^ClinicalIndication | [0..*]      | [Clinical Indication](CodeSystem-GenomicClinicalIndication.html) |
| ED          | 51969-4        | Genetic analysis report           | LOINC                | 1              | ^AP^PDF^Base64^JVBERi0xL....                                      | [0..1]      |                                                                        |
| CE         | TESTCOME       | NHS England Genomics Test Outcome | NWGMSA         |                | 311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME        | [0..1]      | [Test Outcome](ValueSet-GenomicTestOutcomeCodes.html)    |                                                                     |

### Supplemental Codes (work in progress)

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                          | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                             | Cardinality | Term Description                                                                                                                                                                                     |
|--------------|----------------|-----------------------------------------|----------------------|----------------|----------------------------------------------------|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CNE          | 48018-6        | Gene studied [ID]                       | LOINC                | 1.a            | 21497^ACAD9^HGNC-Symb                              | [0..*]      |
| CNE          | 51968-6        | Genetic analysis overall interpretation | LOINC                | 1              | LA6576^Posititive^LN^ <br/>  10828004^Positive^SCT | [0..1]      | [Genetic disease analysis overall predictive risk interpretation (LOINC LL541-4)](https://loinc.org/LL541-4)                                                                                         |
| ST           | 69547-8        | Genomic ref allele [ID]                 | LOINC                | 2a             | C                                                  | [0..1]      | The DNA string in the reference sequence (Ref Allele) with which the DNA string in the test sample differs, starting at the first position given in  LOINC 81254-5’s Genome Allele start-end (B.12). |

### Interpretations (work in progress)

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)             | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5) | Cardinality | Term Description                                                              |
|--------------|----------------|----------------------------|----------------------|----------------|------------------------|-------------|-------------------------------------------------------------------------------|
| CNE          | 53037-8        | Genetic sequence           | LOINC                | 2a             | LA6668-3^Pathogenic^LN | [0..1]      | [ACMG_Clinical significance of genetic variation](https://loinc.org/LL4034-6) |
| CWE          | 69548-6        | Genetic variant Assessment | LOINC                | 2a             | LA9633-4^Present^LN    | [0..1]      | [Genetic variant assessment](https://loinc.org/LL1971-2)                      |
-->

## MDM_T02 Original document notification and content

<div class="alert alert-info" role="alert">
This is currently being elaborated and subject to change.
</div>

See also which are functionally equivalent and have a similar data model:

- IHE XDS Cross-Enterprise Document Sharing (XDS.b) or Cross-Enterprise Document Reliable Interchange (XDR) - [Provide and Register Document Set-b [ITI-41]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html#3.41)
- IHE MHD Mobile access to Health Documents (MHD) - [Simplified Publish [ITI-105]](https://profiles.ihe.net/ITI/MHD/ITI-105.html)

### References 

- [EPIC Incoming Scanned Document Link Interface Technical Specification](https://open.epic.com/Tech/TechSpec?spec=5323)

### Message

| Segment HL7   | Optionality | Notes                                                   |
|---------------|-------------|---------------------------------------------------------|
| [MSH](#msh)   | 1..1        |                                                         |
| EVN           | 1..1        |                                                         | 
| [PID](#pid)   | 1..1        |                                                         |
| [PV1](#pv1)   | 1..1        | PV1 should be populated if PV1-19 Visit Number is known |
| **ORDER**     | 0..*        |                                                         |
| - [ORC](#orc) | 1..1        |                                                         |
| - [OBR](#obr) | 1..1        |                                                         |
| [TXA](#txa)   | 1..1        |                                                         |
| **OBXNTE**    | 1..*        |                                                         |
| - [OBX](#obx) | 1..1        |                                                         |
{:.grid}

## Segments

### MSH

This is based on the definition of MSH from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws).

| Field HL7 | Fieldname                 | Data Type | Optionality | Identifier Type or ValueSet                           | Example Values      | Description |
|-----------|---------------------------|-----------|-------------|-------------------------------------------------------|---------------------|-------------|
| MSH-1     | Field Separator           |           | R           |                                                       | &#9;                | The character separating fields in the message - always a tab here. |
| MSH-2     | Encoding Characters       |           | R           |                                                       | ^~\&                | The component/repetition/escape/sub-component separators used throughout the message. |
| MSH-3     | Sending Application       |           | R           |                                                       | iGene               | The sending system's own name (ubiquitous term: **Sending System**). |
| MSH-4     | Sending Facility          | HD        | R           | [ODS Code](StructureDefinition-OrganisationCode.html) | 699X0               | The sending organisation (ubiquitous terms: **ODS Code**, **Trust Code**). |
| MSH-5     | Receiving Application     | HD        | R           |                                                       | EPIC                | The receiving system's own name (ubiquitous term: **Receiving System**). |
| MSH-6     | Receiving Facility        |           | R           | [ODS Code](StructureDefinition-OrganisationCode.html) | R0A                 | The receiving organisation (ubiquitous terms: **ODS Code**, **Trust Code**). |
| MSH-7     | Date/Time Of Message      |           | R           |                                                       | 20170126143602      | When the message was created (ubiquitous term: **Message Timestamp**). |
| MSH-9     | Message Type              |           | R           |                                                       | ORU^R01^ORU_R01     | What kind of message this is, e.g. a lab report vs. an order (ubiquitous term: **Message Type**). |
| MSH-10    | Message Control ID        |           | R           |                                                       | 2017012614360280000 | Uniquely identifies this message instance, used to correlate an acknowledgement back to it (ubiquitous terms: **Message ID**, **Message Control ID**). |
| MSH-11    | Processing ID             |           | R           |                                                       | P                   | Whether this is Production, Training or Debugging data (ubiquitous term: **Processing Mode**). |
| MSH-12    | Version ID                |           | R           |                                                       | 2.5.1               | The HL7 v2 version this message conforms to (ubiquitous term: **HL7 Version**). |
| MSH-13    | Accept AcknowledgmentType |           | R           |                                                       | AL                  | When the receiver should send an acknowledgement (ubiquitous term: **Ack Type**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html" _target="_blank">MSH to FHIR MessageHeader</a> 
<br/>
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-bundle.html" _target="_blank">MSH to FHIR Bundle (message)</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-MessageHeader.html" _target="_blank">MessageHeader</a> 
</div>

### PID

This is based on the definition of PID from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) and [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](../DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type | Optionality                                 | Identifier Type or ValueSet                                                                                                               | Example Values                                                                                                                  | Description |
|-----------|------------------------------------|-----------|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|-------------|
| PID-1     | Set ID-PID                         |           | R                                           |                                                                                                                               | 1                                                                                                                               | Sequence number of this PID segment within the message (ubiquitous term: **Set ID**). |
| PID-3     | Patient Identifier List            | [CX](#cx) | R <span class="badge badge-danger">S</span> | [NHS Number](StructureDefinition-NHSIdentifier.html) <br/> [Medical Record Number](StructureDefinition-MedicalRecordNumber.html). | 633^^^R0A^MR~9449305552^^^NHS^NH                                                                                                | The patient's identifiers, repeating - ubiquitous terms: **NHS Number** (national) and **Hospital Number**/**MRN** (local). |
| PID-5     | Patient Name                       |           | R <span class="badge badge-danger">S</span> |                                                                                                                               | CHISLETT^Octavia^^Miss                                                                                                          | The patient's name (ubiquitous term: **Patient Name**). |
| PID-7     | Date/Time of Birth                 |           | R <span class="badge badge-danger">S</span> |                                                                                                                               | 20080920                                                                                                                        | The patient's date of birth (ubiquitous terms: **DOB**, **Date of Birth**). |
| PID-8     | Administrative Sex                 |           | O                                           |                                                                                                                               | F                                                                                                                               | The patient's administrative/recorded sex (ubiquitous term: **Sex**). |
| PID-11    | Patient Address                    |           | R                                           |                                                                                                                               | 1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST                                                                                    | The patient's home address (ubiquitous term: **Address**). |
| PID-13    | Phone Number - Home                |           | R                                           |                                                                                                                               | 01656 123123^PRN^PH~07927655295^ORN^CP^NET^X.400^abc@home.com~01656 123123~01656123123^PRN^PH^^^abc@home.com~01656123123^PRN^PH | The patient's contact details, repeating - phone, mobile and/or email (ubiquitous term: **Contact Number**). |
| PID-32    | Identity Reliability Code          |           | O                                           | Mandatory if the the NHS Number tracing status is not known.                                                                  | 01                                                                                                                              | Flags a known data-quality issue with the patient's identity, e.g. an untraced NHS Number (ubiquitous term: **Identity Reliability**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pid-to-patient.html" _target="_blank">PID to FHIR Patient</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

#### Examples

```
PID|1||633^^^R0A^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
```

> FHIR Resource Example: [Patient - Octavia CHISLETT NHS Number: 9449305552](Patient-Patient-OctaviaCHISLETT-9449305552.html)

### PD1

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pd1-to-patient.html" _target="_blank">PD1 to FHIR Patient</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

### NK1

| Field HL7 | Fieldname                                  | Data Type | Optionality | Identifier Type or ValueSet                                                                                   | Example Values                       | Description |
|-----------|--------------------------------------------|-----------|-------------|---------------------------------------------------------------------------------------------------------------|--------------------------------------|-------------|
| NK1-2     | Name                                       | XPN       | O           |                                                                                                               | London^Cersei                        | The next of kin/relative's name (ubiquitous term: **NOK Name**). |
| NK1-3     | Relationship                               | CWE       | R           | [UKCorePersonRelationshipType](https://simplifier.net/hl7fhirukcorer4/valueset-ukcore-personrelationshiptype) | MTH                                  | How this person relates to the patient, e.g. mother, father (ubiquitous term: **Relationship**). |
| NK1.15    | Administrative Sex                         | IS        | O           |                                                                                                               | F                                    | The relative's administrative sex (ubiquitous term: **Sex**). |
| NK1-16    | Date/Time of Birth                         | TS        | O           |                                                                                                               | 19731003                             | The relative's date of birth (ubiquitous term: **DOB**). |
| NK1-33    | Next of Kin/Associated Party's Identifiers | CX        | R           |                                                                                                               | 9737383230^^^NHS^NH~1234567^^^RPY^MR | The relative's own identifiers, e.g. their own NHS Number/MRN if they are also a patient (ubiquitous term: **NOK Identifiers**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nk1-to-relatedperson.html" _target="_blank">NK1 to FHIR RelatedPerson</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-RelatedPerson.html" _target="_blank">RelatedPerson</a> 
</div>


### PV1 

> The PV1 segment should represent the episode/stay/visit number, not a consultant episode. 

This is based on the definition of PV1 from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

| Field HL7 | Fieldname                 | Data Type   | Optionality                                 | Identifier Type or ValueSet                                                                    | Example Values                                         | Description |
|-----------|---------------------------|-------------|---------------------------------------------|------------------------------------------------------------------------------------------------|--------------------------------------------------------|-------------|
| PV1-1     | Set ID - PV1              | [PL](#pl)   | R                                           |                                                                                                | 1                                                      | Sequence number of this PV1 segment within the message (ubiquitous term: **Set ID**). |
| PV1-2     | Patient Class             |             |                                             |                                                                                                | I                                                      | Inpatient, outpatient, emergency, etc. (ubiquitous term: **Patient Class**). |
| PV1-3     | Assigned Patient Location |             | R                                           |                                                                                                | ^^^R0A09^^^^^^^R0A <br/> ^^^P1S8J^^^^^^^699X0          | The ward/clinic/bed the patient is assigned to (ubiquitous terms: **Location**, **Ward**, **Bed**). |
| PV1-8     | Admitting Doctor          | [XCN](#xcn) | R                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | The doctor who admitted the patient (ubiquitous term: **Admitting Doctor**). |
| PV1-8     | Referring Doctor          | [XCN](#xcn) | R                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | The doctor who admitted the patient (ubiquitous term: **Admitting Doctor**). |
| PV1-9     | Consulting Doctor         | [XCN](#xcn) | R                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | A doctor consulted on this visit (ubiquitous term: **Consultant**). |
| PV1-10    | Hospital Service          |             | R <span class="badge badge-danger">S</span> | [Service](ValueSet-service.html)                                                               | 892761000000102^Clinical haematology service^SNM3<br/>810^Radiology^2.16.840.1.113883.2.1.6.8 | The clinical service/specialty responsible for the visit (ubiquitous term: **Specialty**). |
| PV1-17    | Admitting Doctor          | [XCN](#xcn) | R                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | The doctor formally admitting the patient (ubiquitous term: **Admitting Doctor**). |
| PV1-19    | Visit Number              | [CX](#cx)   | O <span class="badge badge-danger">S</span> | [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 12345^^^R0A                                            | The identifier for this spell/stay (ubiquitous terms: **Visit Number**, **Spell Number**, **Account Number**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html" _target="_blank">PV1 to FHIR Encounter</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-HospitalSpell.html" _target="_blank">HospitalSpell</a> 
<b>FHIR Profile:</b> <a href="StructureDefinition-Visit.html" _target="_blank">Visit</a> 
</div>

#### Examples

```
PV1|1|I|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||892761000000102^Clinical haematology service^SNM3|||||||||1001166717^^^R0A^AN|||||||||||||||||||||||||20250129103726+0000
```

> FHIR Resource Example: [Encounter 'episode/stay' Example](Encounter-984b8a89-4194-4eb4-a7ea-ca8049ebeea3.html)

### ORC

This is based on the definition of ORC from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf).

| Field HL7 | Fieldname                | Data Type   | Optionality                                  | Identifier Type or ValueSet                                                | Example Values                                        | Description |
|-----------|--------------------------|-------------|----------------------------------------------|----------------------------------------------------------------------------|-------------------------------------------------------|-------------|
| ORC-2     | Placer Order Number      | [EI](#ei)   | R <span class="badge badge-danger">S</span> | [Order Identifier](StructureDefinition-OrderIdentifier.html)               | 1601737^R0A^150^L                                     | The referring system's own order number (ubiquitous terms: **Order Number**, **Placer Order Number**). |
| ORC-3     | Filler Order Number      | [EI](#ei)   | O                                            | [Report Identifier](StructureDefinition-ReportIdentifier.html)             | 1001166717^699X0^^255^ISO                             | The receiving laboratory's own order/report number (ubiquitous terms: **Report Number**, **Filler Order Number**). |
| ORC-4     | Placer Group Number      | [EI](#ei)   | O <span class="badge badge-danger">S</span>                                           | [Order Group Number](StructureDefinition-OrderGroupNumber.html)           | 1001166717^699X0^^255^ISO                             | Links several orders placed together, e.g. a panel (ubiquitous terms: **Order Group Number**, **Panel Number**). |
| ORC-5     | Order Status             |             | O                                            |                                                                            |                                                         | The current status of the order (ubiquitous term: **Order Status**). |
| ORC-9     | Date/Time of Transaction | TS          | O                                            |                                                                            |                                                         | When this order message was created/transacted (ubiquitous term: **Transaction Date/Time**). |
| ORC-12    | Ordering Provider        | [XCN](#xcn) | O                                            | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                     | The clinician who placed the order (ubiquitous terms: **Ordering Provider**, **Requesting Clinician**). |
| ORC-21    | Ordering Facility Name   | [XON](#xon) | R  <span class="badge badge-danger">S</span>                                          | [Organisation Code](StructureDefinition-OrganisationCode.html)             | MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS | The organisation the order was placed on behalf of (ubiquitous terms: **Ordering Facility**, **Trust**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html" _target="_blank">ORC to FHIR ServiceRequest</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>

#### Examples

```
ORC|NW|1601737^R0A|1001166717^699X0||||||20250129|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||^^R0A^^^ODS
```

> FHIR Resource Example: [ServiceRequest Coded Entries Example](ServiceRequest-ServiceRequestGenomicsOrderCodedEntries.html)

### OBR 

This is based on the definition of OBR from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type   | Optionality                                  | Identifier Type or ValueSet                                                       | Example Values                                                              | Description |
|-----------|------------------------------------|-------------|----------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------|-------------|
| OBR-1     | Set ID - OBR                       |             | R                                            |                                                                                   | 1                                                                           | Sequence number of this order/observation-request group within the message (ubiquitous term: **Set ID**). |
| OBR-2     | Placer Order Number                | [EI](#ei)   | O <span class="badge badge-danger">S</span> | [Order Identifier](StructureDefinition-OrderIdentifier.html)                      | 1601737^ R0A^150^L                                                          | The referring system's own order number, repeated from ORC-2 (ubiquitous terms: **Order Number**, **Placer Order Number**). |
| OBR-3     | Filler Order Number                | [EI](#ei)   | R <span class="badge badge-danger">S</span> | [Report Identifier](StructureDefinition-ReportIdentifier.html)                   | 1001166717^699X0^^255^ISO                                                   | The receiving laboratory's own order/report number, repeated from ORC-3 (ubiquitous terms: **Report Number**, **Filler Order Number**). |
| OBR-4     | Universal Service Identifier       |             | R <span class="badge badge-danger">S</span>                                           | [Genomic Test Directory](ValueSet-GenomicTestCodes.html)                    | R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory | The test/panel being requested or reported on (ubiquitous term: **Test Code**). |
| OBR-6     | Requested Date/Time                | TS          | R for OML_O21                                |                                                                                   | 20170126135745                                                              | When the order was requested (ubiquitous term: **Requested Date/Time**). |
| OBR-7     | Observation Date/Time              | TS          | R for ORU_R01 <span class="badge badge-danger">S</span>                               |                                                                                   | 20170126135745                                                              | When the specimen/observation was taken (ubiquitous term: **Observation Date/Time**). |
| OBR-16    | Ordering Provider                  |             | R                                            | [Organisation Code](StructureDefinition-OrganisationCode.html)          |                                           | The organisation that placed the order (ubiquitous terms: **Ordering Facility**, **Trust**). |
| OBR-22    | Results Rpt/Status Chng -Date/Time | TS          | R                                            |                                                                                   | 20170126135745                                                              | When the report's status last changed, e.g. when finalised (ubiquitous term: **Report Status Date/Time**). |
| OBR-25    | Result Status                      |             |                                              |                                                                                   |                                                                             | Whether the result is preliminary, final, corrected, etc. (ubiquitous term: **Result Status**). |
| OBR-31    | Reason for Study                   | CWE         | O                                            | [Genomic Clinical Indication Codes](ValueSet-GenomicClinicalIndicationCodes.html) | R210^Lynch syndrome^GenomicClinicalIndication                               | The clinical reason the test was requested (ubiquitous terms: **Clinical Indication**, **Reason for Referral**). |
| OBR-32    | Principal Result Interpreter       | [NDL](#ndl) | O - SHOULD                                   | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                       |  C3456789^Darwin^Samuel^^^Dr^^^GMC                                                                            | The clinician who interpreted/authorised the result (ubiquitous terms: **Reporting Clinician**, **Authoriser**). |
| OBR-33    | Assistant Result Interpreter       | [NDL](#ndl) | O - SHOULD                                   | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                              |                                                                             | A second clinician who assisted in interpreting the result (ubiquitous term: **Assistant Reporter**). |
| OBR-34    | Technician                         | [NDL](#ndl) | O - SHOULD                                   | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                                                 |                                                                             | The laboratory staff member who performed the test (ubiquitous term: **Technician**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion OML_O21:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html" _target="_blank">OBR to FHIR ServiceRequest</a> 
<br/>
<b>v2 to FHIR Conversion ORU_R01:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html" _target="_blank">OBR to FHIR DiagnosticReport</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>

#### Examples

```
OBR|1|1601737^R0A|1001166717^699X0|R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
```

> FHIR Resource Example: [Diagnostic Report Example](DiagnosticReport-DiagnosticReportGenomicsReport.html)

### NTE

Multiple NTE should be converted to a single FHIR Annotation using markdown

| Field HL7 | Fieldname         | Data Type | Optionality | Identifier Type or ValueSet | Example Values | Description |
|-----------|-------------------|-----------|-------------|-----------------------------|----------------|-------------|
| NTE-1     | Set ID - NTE      |           |             |                             |                | Sequence number of this note line (ubiquitous term: **Set ID**). |
| NTE-2     | Source of Comment |           |             |                             |                | Which segment/system this comment relates to (ubiquitous term: **Comment Source**). |
| NTE-3     | Comment           |           |             |                             |                | The free-text comment itself (ubiquitous term: **Comment**, **Note**). |
| NTE-4     | Comment Type      |           |             |                             |                | The kind of comment this is, e.g. clinical vs. administrative (ubiquitous term: **Comment Type**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion OML_O21:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-servicerequest.html" _target="_blank">NTE to FHIR ServiceRequest</a> 
<br/>
<b>v2 to FHIR Conversion ORU_R01:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-nte-to-observation.html" _target="_blank">NTE to FHIR Observation</a> 
</div>

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

| Field HL7 | Fieldname         | Data Type | Optionality | Identifier Type or ValueSet | Example Values | Description |
|-----------|-------------------|-----------|-------------|-------------|----------------|-------------|
| DG1-3     | Diagnosis Code    | [CE](#ce)          |             |             |                | The coded diagnosis (ubiquitous terms: **Diagnosis Code**, **Condition**). |
| DG1-4     | Diagnosis Description |           |             |             |                | The diagnosis in plain text (ubiquitous term: **Diagnosis Description**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html" _target="_blank">DG1 to FHIR Condition</a> Note: In orders this is likely to be a coded entry in ServiceRequest.reasonCode as only a code is present.
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Condition.html" _target="_blank">Condition</a> 
</div>

#### Examples

```
DG1|1||363349007^Malignant tumour of stomach^SNM3||20250129103726+0000
```

> FHIR Resource Example ORU_R01: TODO
 
### OBX

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)


| Field HL7 | Fieldname                    | Data Type | Optionality                                 | Identifier Type or ValueSet                                   | Example Values                                                                                                  | Description |
|-----------|------------------------------|-----------|---------------------------------------------|---------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|-------------|
| OBX-1     | Set ID – OBX                 |           | R                                           |                                                               | 1                                                                                                               | Sequence number of this result line within the report (ubiquitous term: **Set ID**). |
| OBX-2     | Value Type                   |           | R <span class="badge badge-danger">S</span> | See next section for ED                                       | CE                                                                                                              | The data type of the result value that follows in OBX-5 (ubiquitous term: **Value Type**). |
| OBX-3     | Observation Identifier       | [CE](#ce) | R <span class="badge badge-danger">S</span> |                                                               | 842009^Consanguinity^SNM3<br/>97209-1^Shipment tracking number^LN<br/>161714006^Estimated date of delivery^SNM3 | What was measured/observed/tested (ubiquitous terms: **Test Name**, **Observation Code**). |
| OBX-5     | Observation Value            | Varies    | R <span class="badge badge-danger">S</span> |                                                               | LN^Yes^LA33-6 (value type=CE)<br/>UK3096580215 (value type=ST)<br/>20250512103726+0000 (value type=DT)          | The actual result (ubiquitous terms: **Result**, **Result Value**). |
| OBX-6     | Units                        | [CE](#ce) | O                                           | [ucum-units](https://build.fhir.org/valueset-ucum-units.html) |                                                                                                                 | The unit the result is expressed in, e.g. mmol/L (ubiquitous term: **Units**). |
| OBX-7     | References Range             | ST        | O                                           |                                                               |                                                                                                                 | The normal/expected range for this result (ubiquitous term: **Reference Range**, **Normal Range**). |
| OBX-8     | Abnormal Flags               | IS        | O                                           |                                                               |                                                                                                                 | Flags whether the result is high/low/abnormal (ubiquitous term: **Abnormal Flag**). |
| OBX-11    | Observation Result Status    | ID        | R                                           |                                                               | F                                                                                                               | Whether this result is preliminary, final, corrected, etc. (ubiquitous term: **Result Status**). |
| OBX-14    | Date/Time of the Observation | TS        | O - SHOULD                                  |                                                               | 20190514102417+0000                                                                                             | When this specific observation was made (ubiquitous term: **Observation Date/Time**). |
{:.grid}

#### OBX-2 Value Type

| HL7 Value Type                                        | OBX-5 FHIR Observation Mapping                                                                      | FHIR DiagnosticReport                                                                                                            |
|-------------------------------------------------------|-----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Coded Entry ([CE](#ce), [CWE](#cwe) and [CNE](#cne) ) | Obsveration.valueCodeableConcept                                                                    | DiagnosticReport.result                                                                                                          |
| Date (DT)                                             | Observation.valueDateTime                                                                           | DiagnosticReport.result                                                                                                          |
| Embedded documents ([ED](#ed))                        | n/a, convert OBX-5 to Binary and the OBX to FHIR DocumentReference [OBX (type = ED)](#obx-type--ed) | DiagnosticReport.extension(supportingInfo) - for reports, the Binary should be referenced via DiagnosticReport.presentedForm.url |
| Formatted Text (FT)                                   | Observation.valueString, HL7 v2.x formatting should be converted to markdown                        | DiagnosticReport.result                                                                                                          |
| Numeric ([NM](#nm))                                   | Observation.valueQuantity | DiagnosticReport.result                                                                                                          |
| Reference Pointer (RP)                                | n/a, convert the OBX to FHIR DocumentReference [OBX (type = ED)](#obx-type--ed)                     | DiagnosticReport.extension(supportingInfo) - for reports, the value is mapped to DiagnosticReport.presentedForm.url              |
| Structured Numeric ([SN](#sn))                        | Observation.valueQuantity | DiagnosticReport.result                                                                                                          |
| String Data (ST)                                      | Observation.valueString                                                                             | DiagnosticReport.result                                                                                                          |
| Time (TM)                                             | Observation.valueTime                                                                              | DiagnosticReport.result                                                                                                          |
| Text Data (TX)                                        | Observation.valueString, newline is represented as `\n`                                             | DiagnosticReport.result                                                                                                          |
{:.grid}

For discussion: 

- Many reports will use FT or TX for the report (Genetic Report (1054161000000101) and Laboratort Report (4241000179101)), the preferred way to represent this is to use the DiagnosticReport.presentedForm with FT/TX text converted to PDF.
- Only ED/RP documents which are reports should use the DiagnosticReport.presentedForm, others should use DiagnosticReport.extension(supportingInfo).

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-observation.html" _target="_blank">OBX to FHIR Observation</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Observation.html" _target="_blank">Observation</a> 
</div>

#### Examples

```
OBX|1|CE|GENEAP^GENETICS TEST PERFORMABLE^https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|2|CE|230056^What Type of Referral Do You Require?^https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds|||||||||||20250129103726+0000
OBX|3|CE|281269004^High infection risk sample^SNM3|||||||||||20250129103726+0000
OBX|4|ST|230016^Test Type^https://fhir.nwgenomics.nhs.uk/CodeSystem/MFTQuestionIds||Diagnostic Screen/Test|||||||||20250129103726+0000
```

Genomic Genomic Test Outcome Codes Example - this is mapped to DiagnosticReport.conclusionCode in FHIR.

```
OBX|2|CE|51968-6^^LN|1|432^NO TARGET DETECTED OR TARGET DETECTED BELOW A LEVEL REQUIRING CLINICAL ACTION|||||||||20260604200000+0000
```

> FHIR Resource Example: [Consanguinity (value type=CE)](Observation-OBX-Consanguinity.html)
> 
> FHIR Resource Example: [Order Tracking Number (value type=ST)](Observation-OBX-OrderTrackingNumber.html)
> 
> FHIR Resource Example: [Pregnancy Expected Delivery Date (value type=DT)](Observation-OBX-PregnancyExpectedDeliveryDate.html)


#### OBX (type = ED)

This is based on the definition of OBX from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                    | Data Type | Optionality | Identifier Type or ValueSet                                          | Example Values                       | Description |
|-----------|------------------------------|-----------|-------------|----------------------------------------------------------|--------------------------------------|-------------|
| OBX-1     | Set ID – OBX                 |           | R           |                                                          | 1                                    | Sequence number of this result line within the report (ubiquitous term: **Set ID**). |
| OBX-2     | Value Type                   |        | R <span class="badge badge-danger">S</span>          |                                                          | ED                                   | The data type of the value that follows - `ED` for an embedded document (ubiquitous term: **Value Type**). |
| OBX-3     | Observation Identifier       | [CE](#ce) | R <span class="badge badge-danger">S</span>          | [Document Entry Type](ValueSet-document-entry-type.html) | 1054161000000101^Genetic report^SNM3 | What kind of document this is, e.g. a genetics report (ubiquitous terms: **Document Type**, **Report Type**). |
| OBX-5     | Observation Value            | [ED](#ed)        | R <span class="badge badge-danger">S</span>          |                                                          | MOL^IM^PDF^Base64^JVBERI0X...        | The embedded document itself, base64-encoded (ubiquitous terms: **Attachment**, **Report PDF**). |
| OBX-11    | Observation Result Status    |           | R           |                                                          | F                                    | Whether this document is preliminary, final, corrected, etc. (ubiquitous term: **Result Status**). |
| OBX-14    | Date/Time of the Observation |           | O - SHOULD  |                                                          | 20190514102417+0000                  | When this document was produced (ubiquitous term: **Observation Date/Time**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-documentreference.html" _target="_blank">OBX to FHIR DocumentReference</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DocumentReference.html" _target="_blank">DocumentReference</a> 
</div>

#### Examples

```
OBX|1|ED|1054161000000101^Genetic report^SNM3||MOL^IM^PDF^Base64^JVBERi0x...||||||F
```

> FHIR Resource Example: [Document Reference Laboratory Report](DocumentReference-94bf65ba-cd6c-4601-b339-6d547f424646.html)

### SPM

This is based on the definition of SPM from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

Specimen Type is SNOMED CT, not HL7 v2 Table 0487, for conversion to SNOMED see [HL7 Terminology - hl7VS-specimenType](https://terminology.hl7.org/7.0.1/ValueSet-v2-0487.html)

| Field HL7 | Fieldname                     | Data Type   | Optionality                                 | Identifier Type or ValueSet                                                   | Example Values                                     | Description |
|-----------|-------------------------------|-------------|---------------------------------------------|-------------------------------------------------------------------------------|----------------------------------------------------|-------------|
| SPM-2     | Specimen ID                   |             | O                                           | Placer Specimen Number^Filler Specimen Number                                 | 25GEN-029GN00001&R0A                               | The specimen's own identifier, from the requester and/or the laboratory (ubiquitous terms: **Specimen Number**, **Specimen ID**). |
| SPM-3     | Specimen Parent IDs           |             | O <span class="badge badge-danger">S</span> |                                                                               | ^1001166717&699X0                                  | Identifiers of the order(s) this specimen relates to (ubiquitous terms: **Order Number**, **Report Number**). |
| SPM-4     | Specimen Type                 | [CWE](#cwe) | R <span class="badge badge-danger">S</span> | [Specimen Type](ValueSet-specimen-type.html)                                  | 119325001^Skin specimen^SNM3                       | What kind of specimen this is, e.g. blood, tissue (ubiquitous term: **Specimen Type**). |
| SPM-8     | Specimen Source Site          | [CWE](#cwe) | O <span class="badge badge-danger">S</span> | [Specimen Body Site](ValueSet-specimen-bodysite.html)                         | 299706009^Bone structure of wrist and/or hand^SNM3 | Where on/in the body the specimen was taken from (ubiquitous term: **Body Site**). |
| SPM-9     | Specimen Source Site Modifier |             | O                                           |                                                                               | 7771000^Left^SNM3                                  | A qualifier on the body site, e.g. left/right (ubiquitous term: **Body Site Modifier**, **Laterality**). |
| SPM-17    | Specimen Collection Date/Time | TS          | O                                           |                                                                               |                                                    | When the specimen was taken from the patient (ubiquitous term: **Collection Date/Time**). |
| SPM-18    | Specimen Received Date/Time   | TS          | O                                           |                                                                               |                                                    | When the specimen arrived at the laboratory (ubiquitous term: **Received Date/Time**). |
| SPM-20    | Specimen Availability         |             | O                                           |                                                                               |                                                    | Whether the specimen is available for further testing (ubiquitous term: **Specimen Availability**). |
| SPM-30    | Accession ID                  |             | O <span class="badge badge-danger">S</span> | [Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) |                                                    | The laboratory's own number for this specimen (ubiquitous terms: **Accession Number**, **Lab Number**). |
| SPM-32    | Shipment Tracking Number      |             | O                                           | [Shipment Tracking Number](StructureDefinition-ShipmentTrackingNumber.html)   |                                                    | The courier/logistics tracking number for the specimen's shipment (ubiquitous terms: **Tracking Number**, **Consignment Number**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>Container Identifier:</b> Where a specimen container (e.g. a tube or pot) needs to be identified separately from the specimen itself, use an identifier with Identifier Type Code <a href="ValueSet-NWIdentifierType.html">ZCID "Container Identifier"</a>. This is a local (Z) code, as HL7 v2 Table 0203 has no equivalent concept. In FHIR this maps directly to the dedicated <code>Specimen.container.identifier</code> element, so no identifier type code is needed on the FHIR side.
</div>

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-spm-to-specimen.html" _target="_blank">SPM to FHIR Specimen</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
</div>

### TXA

| Field HL7 | Fieldname                           | Data Type | Optionality | Identifier Type or ValueSet                               | Example Values                       | Description |
|-----------|-------------------------------------|-----------|-------------|-----------------------------------------------------------|--------------------------------------|-------------|
| TXA-1     | Set ID - TXA                        |           | R           |                                                           | 1                                    | Sequence number of this document notification (ubiquitous term: **Set ID**). |
| TXA-2     | Document Type                       | [CWE](#cwe)       | R           | [Document Entry Type](ValueSet-document-entry-type.html)  | 1054161000000101^Genetic report^SNM3 | What kind of document this is, e.g. a genetics report (ubiquitous terms: **Document Type**, **Report Type**). |
| TXA-4     | Activity Date/Time                  | TS        | R           |                                                           |                                      | When the document was produced/activity occurred (ubiquitous term: **Activity Date/Time**). |
| TXA-5     | Primary Activity Provider Code/Name | XCN       |             |                                                           |                                      | The person/system that produced the document (ubiquitous term: **Author**). |
| TXA-12    | Unique Document Number              | [EI](#ei) | R           |                                                           | 1001166717^699X0                     | The document's own unique identifier (ubiquitous terms: **Document Number**, **Report Number**). |
| TXA-17    | Document Completion Status          |           | R           |                                                           | F                                    | Whether the document is final, in progress, etc. (ubiquitous term: **Document Status**). |
| TXA-24    | Folder Assignment                   | [CWE](#cwe)       |             | [DocumentEntry Class](ValueSet-document-entry-class.html) |                                      | The clinical folder/category the document is filed under (ubiquitous term: **Document Folder**, **Category**). |
| TXA-25    | Document Title                      | ST        |             |                                                           |                                      | The document's display title (ubiquitous term: **Document Title**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-txa-to-documentreference.html" _target="_blank">TXA to DocumentReference</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DocumentReference.html" _target="_blank">DocumentReference</a> 
</div>

#### Examples

```
SPM|1|25GEN-029GN00001&R0A|^1001166717&699X0|258580003^Whole blood specimen^SNM3|||||||||||||20250129103726+0000|||Y
```

> FHIR Resource Example: [Specimen Example](Specimen-SpecimenExample.html)

## Data Types

This applies to HL7 v2 ORU_R01 feeds to the RIE.

ORC-3, ORC-12 (XCN) and ORC-21 (XON) **SHALL** be populated.

### CNE 

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cne-to-codeableconcept.html" _target="_blank">CNE to FHIR CodeableConcept</a>
</div>

### CWE

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/datatype_maps.html" _target="_blank">CWE to FHIR Value[x]</a>
</div>

### CE 

Coded Element.
UK SNOMED CT is preferred and may be mandatory depending on use, for example for OXB Type ED, it will be required.

#### Example 

SNOMED

```1054161000000101^Genetic report^SNM3```

LOINC (from HL7 International)

```53577-3^Reason for study^LN```
```51967-8^Genetic disease assessed [ID]^LN```
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

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-ce-to-codeableconcept.html" _target="_blank">CE to FHIR CodeableConcept</a>
</div>

### ED 

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-ed-to-documentreference.html" _target="_blank">ED to FHIR DocumentReference</a>
</div>

| Field HL7 | Fieldname          | Data Type | Optionality | Identifier Type or ValueSet                                     | Example Values        | Description |
|-----------|--------------------|-----------|-------------|-----------------------------------------------------------------|-----------------------|-------------|
| ED.1      | Source Application | HD        | O           |                                                                 |                       | The system that originated the attached data (ubiquitous term: **Source System**). |
| ED.2      | Type Of Data       | ID        | R           | [DocumentEntry mimeType](ValueSet-document-entry-mimetype.html) | AP or application/pdf | The high-level MIME type of the attachment, e.g. application (ubiquitous term: **File Type**). |
| ED.3      | Data Subtype       | ID        | R           |                                                                 | PDF                   | The specific format of the attachment, e.g. PDF (ubiquitous term: **File Format**). |
| ED.4      | Encoding           | ID        | R           |                                                                 | Base64                | How the data is encoded, e.g. Base64 (ubiquitous term: **Encoding**). |
| ED.5      | Type Of Data       | TX        | R           |                                                                 | JVBERI0X…                    | The encoded file content itself (ubiquitous terms: **Attachment**, **File Content**). |
{:.grid}

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

| Field HL7 | Fieldname                        | Data Type | Optionality | Identifier Type or ValueSet                                                         | Example Values | Description |
|-----------|----------------------------------|-----------|-------------|-------------------------------------------------------------------------|----------------|-------------|
| PL.4      | Facility                         | HD        | R           | [Organisation Site Code](StructureDefinition-OrganisationSiteIdentifier.html) | R0A09               | The specific site/building the patient/specimen is at (ubiquitous terms: **Site Code**, **ODS Site Code**). |
| PL.11     | Assigning Authority For Location | HD        | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)          | R0A            | The organisation the site belongs to (ubiquitous terms: **ODS Code**, **Trust Code**). |
{:.grid}

### NDL

This is based on the definitions of NDL from [Royal College of Radiologists](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

| Field HL7   | Fieldname   | Data Type | Optionality | Identifier Type or ValueSet | Example Values | Description |
|-------------|-------------|-----------|-------------|-----------------|----------------|-------------|
| NDL-1.CNN.1 | Id Number   | ST        | O           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)      |                | The clinician's own professional identifier (ubiquitous terms: **GMC Number**, **Professional Registration Number**). |
| NDL-1.CNN.2 | Family Name | ST        | O           |          |                | The clinician's family name (ubiquitous term: **Surname**). |
| NDL-1.CNN.3 | Given  Name | ST        | O           |         |                | The clinician's given name (ubiquitous term: **First Name**). |
| NDL-7       | Facility    | HD        | O           | [Organisation Code](StructureDefinition-OrganisationCode.html)         |                | The organisation the clinician belongs to (ubiquitous terms: **ODS Code**, **Trust Code**). |
{:.grid}

### NM

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-nm-to-quantity.html" _target="_blank">NM to FHIR Quantity</a>
</div>

### SN

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-sn-to-quantity.html" _target="_blank">SN to FHIR Quantity</a>
</div>

### XCN

Extended Composite ID Number and Name for Persons.
The definition of XCN from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.

| Field HL7 | Fieldname    | Data Type | Optionality | Identifier Type or ValueSet                                                | Example Values | Description |
|-----------|--------------|-----------|-------------|----------------------------------------------------------------------------|----------------|-------------|
| XCN-1     | Id Number    | ST        | O           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) |                | The person's own professional identifier (ubiquitous terms: **GMC Number**, **Professional Registration Number**). |
| XCN-2     | Family Name  | ST        | O           |                                                                     |                | The person's family name (ubiquitous term: **Surname**). |
| XCN-3     | Given  Name  | ST        | O           |                                                                   |                | The person's given name (ubiquitous term: **First Name**). |
| XCN-8     | Source Table | HD        | O           | See [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                                                                        |                | Which professional register/code system XCN-1 comes from, e.g. GMC (ubiquitous term: **Identifier Type**). |
{:.grid}

Example

GMC Code

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

### XON 

Extended Composite Name and Identification Number for Organizations.
The definition of XON from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) should be followed and **SHALL** be used in ORC-21.

| Field HL7 | Fieldname            | Data Type | Optionality | Identifier Type or ValueSet                                                                                                                                                                   | Example Values                             | Description |
|-----------|----------------------|-----------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|-------------|
| XON-1     | Organization Name    | ST        | R           |                                                                                                                                                                                               | MANCHESTER UNIVERSITY NHS FOUNDATION TRUST | The organisation's display name (ubiquitous term: **Organisation Name**). |
| XON-3     | Id Number            | NM        | R           | [Organisation Code](StructureDefinition-OrganisationCode.html) <br/> [Organisation Site Code](StructureDefinition-OrganisationSiteIdentifier.html) when present XON-8 must be populated | R0A or R0A02                               | The organisation's (or site's) own code (ubiquitous terms: **ODS Code**, **ODS Site Code**). |
| XON-6     | Assigning Authority  | ST        | R           |                                                                                                                                                                                               | ODS                                        | The scheme the code in XON-3 comes from, e.g. ODS (ubiquitous term: **Assigning Authority**). |
| XON.7     | Identifier Type Code | ID        | O           | [FHIR Organization Type](http://hl7.org/fhir/ValueSet/organization-type)                                                                                                                      |                                            | The kind of organisation this is (ubiquitous term: **Organisation Type**). |
| XON-8     | Assigning Facility   | HD        | O           | [Organisation Code](StructureDefinition-OrganisationCode.html)                                                                                                                          | R0A                                        | The parent organisation a site code belongs to (ubiquitous terms: **ODS Code**, **Trust Code**). |
{:.grid}


Example

```aiignore
MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS^R0A
```

```aiignore
Manchester Royal Infirmary^^R0A02^^^ODS^R0A
```

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-xon-to-organization.html" _target="_blank">XON to FHIR Organization</a>
</div>


## HL7 v2 to FHIR Message Conversion

- [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
- [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) 
- [HL7 Version 2 to FHIR - Message ORU_R01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html)

## Example: Example Instances

### OML_O21 Laboratory Order

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [North West Genomics HL7 v2 OML_O21](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/O21) |
| [FHIR Message O21](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/O21)                 |
| [Original Hl7 v2 OML_O21](https://github.com/nw-gmsa/Testing/tree/main/Input/V2/O21)             |
{:.grid}

### ORU_R01 Unsolicited transmission of an observation message

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [North West Genomics HL7 v2 ORU_R01](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/R01) |
| [FHIR Message R01](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/R01)                 |
| [Original Hl7 v2 ORU_R01](https://github.com/nw-gmsa/Testing/tree/main/Input/V2/R01)             |
{:.grid}

### MDM_T02 Original document notification and content

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [North West Genomics HL7 v2 MDM_T02](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/T02) |
| [FHIR Message T02](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/T02)                 |
| Original message is ORU_R01                                                                      |
{:.grid}
