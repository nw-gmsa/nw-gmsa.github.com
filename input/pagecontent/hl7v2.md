


### OML_O21 Laboratory Order 

<div class="alert alert-info" role="alert">
<a href="#omg_o19-general-clinical-order">OMG_O19 General Clinical Order</a> <b>MAY</b>
be used instead of OML_O21 - it has the same segments, including SPM.
</div>

#### References

<span class="badge badge-danger">Diagnostic Workflow</span> 

 - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Outgoing Ancillary Orders** (EPR to RIE)
 - [MEDITECH HL7 v2](https://ehr.meditech.com/sites/default/files/documents/20240613/om-orders-outbound-24.pdf)

#### Message

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

#### Examples

Converted from the FHIR Messages in the Example Scenarios (see [Artifacts](artifacts.html)).

##### Laboratory Order (LAB-1)

[LAB-1](LTW.html#laboratory-order-lab-1): East Cheshire NHS Trust orders germline BRCA testing
(R208.1) from the North West GLH, with the cellular pathology report attached - step 1 of
[Hereditary Breast and Ovarian Cancer](ExampleScenario-BreastCancer.html).

```
MSH|^~\&|RJN|RJN|RIE|699X0|20261005103000+0000||OML^O21^OML_O21|urn:uuid:275b30d2-1af0-4b9a-9bb8-52caf89a7403|T|2.5.1|||AL
PID|1||9737383281^^^NHS^NH~M482113^^^RJN^MR||CONGLETON^Margaery^^^^^L||19820211|F|||Town Hall^7 High Street^CONGLETON^^CW12 1BN
ORC|NW|RJN-26-48213^RJN|||||||20261005|||C4567891^FICTITIOUS^Helen^^^^^^GMC|||||||||EAST CHESHIRE NHS TRUST^^RJN^^^ODS
OBR|1|RJN-26-48213^RJN||R208.1^^England-GenomicTestDirectory||20261005||||||||||C4567891^FICTITIOUS^Helen^^^^^^GMC|||||||||||||||R208^Inherited breast cancer and ovarian cancer^GenomicClinicalIndication
NTE|1||Triple-negative invasive breast cancer diagnosed at 44. No known family history. Genetic testing offered regardless of family history.
OBX|1|ED|1054291000000102^Cellular pathology report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
SPM|1|26GEN-RJN-008734&RJN||258580003^Whole blood specimen^SNM3|||||||||||||20261005100000+0000|20261006090000+0000||Y
```

> FHIR Message Example: [Bundle Message - Genomics Order - Breast Cancer](Bundle-GenomicsOrderMessage-BreastCancer.html)

##### Work Order (LAB-4)

[LAB-4](LTW.html#work-order-management-lab-4): iGene (the Order Filler) sends the ctDNA work order
to DLIMS (the Automation Manager) in the same laboratory, so MSH-4 and MSH-6 are both `699X0` and
MSH-3 / MSH-5 identify the systems. ORC-2 is the iGene report number, ORC-3 the DLIMS order number
and ORC-4 the iGene referral - see [ctDNA](ExampleScenario-ctDNA.html) step 4.

```
MSH|^~\&|iGene|699X0|DLIMS|699X0|20260702090000+0000||OML^O21^OML_O21|urn:uuid:5e8c2b71-3f4a-4d69-a0b8-7c1d9e6f2a40|T|2.5.1|||AL
PID|1||9737873858^^^NHS^NH~336292^^^699X0^PI||SHEFFIELD^Theon^^^^^L||19860912|M|||SPITAL STREET^^SHEFFIELD^^S3 9LB
ORC|NW|T26-59XG^699X0|D26-004512^699X0|R26-15AY^699X0|||||20260702||||||||||||NW GLH^^699X0^^^ODS
OBR|1|T26-59XG^699X0|D26-004512^699X0|M4.14^^England-GenomicTestDirectory||20260702|||||||||||||||||||||||||M4^^GenomicClinicalIndication
SPM|1|^S26-1K1Q&699X0||119297000^Blood specimen^SNM3|||||||||||||20260629|20260630||Y
```

> FHIR Resource Example: [ServiceRequest - ctDNA DLIMS Work Order](ServiceRequest-ServiceRequest-ctDNA-DLIMS-WorkOrder.html)

##### Sub-order (LAB-35)

[LAB-35](ILW.html#sub-order-management-lab-35): the North Thames GLH sub-orders hearing loss
testing (R67.1) from the North West GLH via the Genomic Order Management Service (GOMS). The
first SPM is the DNA sent; the second is the original blood sample it was extracted from - step 2
of [Specialist Test for another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html).

```
MSH|^~\&|GOMS|69A70|RIE|699X0|20260916090000+0000||OML^O21^OML_O21|urn:uuid:67770cf6-9e01-4afa-a5b2-ae63217e7e4a|T|2.5.1|||AL
PID|1||9737383427^^^NHS^NH||CAMDEN^Oliver^^^^^L||20250214|M
ORC|NW|NT26-80455^69A70|||||||20260916||||||||||||NORTH THAMES GLH^^69A70^^^ODS
OBR|1|NT26-80455^69A70||R67.1^^England-GenomicTestDirectory||20260916|||||||||||||||||||||||||R67^Monogenic hearing loss^GenomicClinicalIndication
NTE|1||Bilateral moderate to severe sensorineural hearing loss identified on newborn hearing screening. No syndromic features. CMV negative. DNA sent by sample transport.
SPM|1|NT26-80455-D1&69A70||258566005^Deoxyribonucleic acid sample^SNM3|||||||||||||20260915150000+0000|||Y
SPM|2|RP426-0310558&RP4||258580003^Whole blood specimen^SNM3|||||||||||||20260914103000+0000|20260914160000+0000||Y
```

> FHIR Message Example: [Bundle Message - Genomics Sub-order - Specialist Test](Bundle-GenomicsSubOrderMessage-SPT.html)

The North West GLH sub-orders prenatal exome sequencing (R21.2) for a fetus, identified by the
hospital's fetal MRN, with the mother in NK1 - step 4 of [Rapid Prenatal Exome
Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html).

```
MSH|^~\&|RIE|699X0|GOMS|69A70|20260911090000+0000||OML^O21^OML_O21|urn:uuid:ffdea2ea-45f1-4204-96b4-03a6d74e3404|T|2.5.1|||AL
PID|1||R0A-F26-0042^^^R0A^MR||WIGAN^Baby^^^^^A||2027
NK1|1|WIGAN^Imogen|MTH^mother^http://terminology.hl7.org/CodeSystem/v3-RoleCode||||||||||||F|19940312|||||||||||||||||9737383400^^^NHS^NH
ORC|NW|G26-41180^699X0|||||||20260911||||||||||||NORTH WEST GLH^^699X0^^^ODS
OBR|1|G26-41180^699X0||R21.2^^England-GenomicTestDirectory||20260911|||||||||||||||||||||||||R21^Fetal anomalies with a likely genetic cause^GenomicClinicalIndication
NTE|1||Short, bowed long bones and multiple fractures on the 20-week anomaly scan. QF-PCR (R21.1) and microarray (R21.3) normal. Fetal DNA sent by sample transport.
SPM|1|G26-41180-D1&699X0||258566005^Deoxyribonucleic acid sample^SNM3|||||||||||||20260910160000+0000|||Y
SPM|2|R0A26-0090411&R0A||119373006^Amniotic fluid specimen^SNM3|||||||||||||20260907110000+0000|20260907153000+0000||Y
```

> FHIR Message Example: [Bundle Message - Genomics Sub-order - Rapid Prenatal Exome](Bundle-GenomicsSubOrderMessage-RPX.html)

### ORU_R01 Unsolicited transmission of an observation message

#### References

<span class="badge badge-danger">Diagnostic Workflow</span> 

- [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](../DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
  - See Appendix A – Using ORU to Publish PDF Reports
- The Royal College of Radiologists [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

<span class="badge badge-danger">Genomics</span>

- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
- [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See **Discrete Genomic Results** (RIE to EPIC EPR)
- [CodeX HL7 FHIR Accelerator - GenomeX Data Exchange - Transport](https://build.fhir.org/ig/CodeX-HL7-FHIR-Accelerator/GenomeX-DataExchange/transport.html) - suggests sending a genomic FHIR Bundle via `ORU_R01`, either embedded or via `OBX-2 = RP` (Reference Pointer) pointing to a URL - see the design discussion under [MDM_T02](#mdm_t02-original-document-notification-and-content) below for how this differs from this guide's own approach

#### Message

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

#### Examples

Converted from the FHIR Messages in the Example Scenarios (see [Artifacts](artifacts.html)).
Report PDFs are shortened (`JVBERi0x...`).

##### Laboratory Report (LAB-3)

[LAB-3](LTW.html#laboratory-report-lab-3): the North West GLH reports a pathogenic BRCA1 variant
to East Cheshire NHS Trust - the report PDF (OBX 1) followed by the variant and its clinical
significance, grouped by OBX-4 sub-ID `2a` - step 2 of [Hereditary Breast and Ovarian
Cancer](ExampleScenario-BreastCancer.html).

```
MSH|^~\&|RIE|699X0|RJN|RJN|20261026120000+0000||ORU^R01^ORU_R01|urn:uuid:004e4011-782b-499e-ae78-afb8294e26f1|T|2.5.1|||AL
PID|1||9737383281^^^NHS^NH~M482113^^^RJN^MR||CONGLETON^Margaery^^^^^L||19820211|F|||Town Hall^7 High Street^CONGLETON^^CW12 1BN
ORC|RE|RJN-26-48213^RJN
OBR|1|RJN-26-48213^RJN||R208.1^^England-GenomicTestDirectory|||20261005100000+0000|||||||||||||||20261026120000+0000|||F|||||||C1234567&FICTITIOUS&Ralph^^^^^^699X0&https://fhir.nhs.uk/Id/ods-organization-code&URI
OBX|1|ED|1054161000000101^Genetic report^SNM3|1|^application^pdf^Base64^JVBERi0x...||||||F
OBX|2|CWE|69548-6^Genetic variant assessment^LN|2a|LA9633-4^Present^LN||||||F|||20261026120000+0000
OBX|3|CWE|83005-9^Variant category^LN|2a|SEQV^Sequence Variant^https://fhir.nwgenomics.nhs.uk/CodeSystem/IGeneVariantCategory||||||F|||20261026120000+0000
OBX|4|CWE|48018-6^Gene studied [ID]^LN|2a|HGNC:1100^BRCA1^HGNC||||||F|||20261026120000+0000
OBX|5|CWE|51958-7^Transcript reference sequence [ID]^LN|2a|NM_007294.3^^RefSeq-T||||||F|||20261026120000+0000
OBX|6|CWE|48004-6^DNA change (c.HGVS)^LN|2a|NM_007294.3:c.68_69del^^HGVS.c||||||F|||20261026120000+0000
OBX|7|CWE|48002-0^Genomic source class [Type]^LN|2a|LA6683-2^Germline^LN||||||F|||20261026120000+0000
OBX|8|CWE|53034-5^Allelic state^LN|2a|LA6706-1^Heterozygous^LN||||||F|||20261026120000+0000
OBX|9|CWE|53037-8^^LN|2a|LA6668-3^Pathogenic^LN||||||F|||20261026120000+0000
OBX|10|CWE|81259-4^^LN|2a|718220008^Hereditary breast and ovarian cancer syndrome^SNM3||||||F|||20261026120000+0000
OBX|11|ST|conclusion-string^^http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs|2a|Heterozygous pathogenic BRCA1 variant, consistent with hereditary breast and ovarian cancer.||||||F|||20261026120000+0000
```

> FHIR Message Example: [Bundle Message - Genomics Report - Breast Cancer](Bundle-GenomicsReportMessage-BreastCancer.html)

##### Test Results (LAB-5)

[LAB-5](LTW.html#test-results-management-lab-5): DLIMS (the Automation Manager) returns the ctDNA
variant to iGene. These are preliminary results for the Order Filler to validate, so OBR-25 and
OBX-11 are `P` and there is no report PDF - see [ctDNA](ExampleScenario-ctDNA.html) step 9.

```
MSH|^~\&|DLIMS|699X0|iGene|699X0|20260706112100+0000||ORU^R01^ORU_R01|urn:uuid:a064cfd3-9c89-4213-861b-3966cb2dc77a|T|2.5.1|||AL
PID|1||9737873858^^^NHS^NH~336292^^^699X0^PI||SHEFFIELD^Theon^^^^^L||19860912|M|||SPITAL STREET^^SHEFFIELD^^S3 9LB
ORC|RE|T26-59XG^699X0
OBR|1|T26-59XG^699X0||M4.14^^England-GenomicTestDirectory|||20260706112000+0000||||||||||||||||||P|||||||^^^^^^699X0&https://fhir.nhs.uk/Id/ods-organization-code&URI
OBX|1|CWE|69548-6^^LN|2a|LA9633-4^Present^LN||||||P|||20260706112000+0000
OBX|2|CWE|83005-9^Variant category^LN|2a|SEQV^Sequence Variant^https://fhir.nwgenomics.nhs.uk/CodeSystem/IGeneVariantCategory||||||P|||20260706112000+0000
OBX|3|CWE|48018-6^Gene studied [ID]^LN|2a|HGNC:3236^EGFR^HGNC||||||P|||20260706112000+0000
OBX|4|CWE|48002-0^Genomic source class [Type]^LN|2a|LA6684-0^Somatic^LN||||||P|||20260706112000+0000
OBX|5|CWE|51958-7^Transcript reference sequence [ID]^LN|2a|NM_005228.5^^RefSeq-T||||||P|||20260706112000+0000
OBX|6|CWE|48004-6^DNA change (c.HGVS)^LN|2a|NM_005228.5:c.2369C>T^^HGVS.c||||||P|||20260706112000+0000
OBX|7|CWE|48005-3^Amino acid change (pHGVS)^LN|2a|NP_005219.2:p.(Thr790Met)^^HGVS.p||||||P|||20260706112000+0000
OBX|8|CWE|48019-4^DNA change type^LN|2a|SO:1000002^substitution^http://www.sequenceontology.org||||||P|||20260706112000+0000
OBX|9|NM|81258-6^Sample variant allelic frequency [NFr]^LN|2a|.0042|decimal|||||P|||20260706112000+0000
SPM|1|^S26-1K1Q&699X0||119297000^Blood specimen^SNM3|||||||||||||20260629|20260630||Y
```

> FHIR Message Example: [Bundle Message - Test Results - ctDNA (Omics DSS)](Bundle-TestResultsMessage-ctDNA-OmicsDSS.html)

##### Sub-order Results (LAB-36)

[LAB-36](ILW.html#sub-order-results-delivery-lab-36): the North West GLH returns its report on the
hearing loss sub-order to the North Thames GLH via GOMS - step 8 of [Specialist Test for another
GLH](ExampleScenario-SpecialistTestForAnotherGLH.html).

```
MSH|^~\&|iGene|699X0|GOMS|69A70|20261019140000+0000||ORU^R01^ORU_R01|urn:uuid:0c55edb0-0af3-4d88-8f09-f5b5ba429584|T|2.5.1|||AL
PID|1||9737383427^^^NHS^NH||CAMDEN^Oliver^^^^^L||20250214|M
ORC|RE|NT26-80455^69A70|||||||||||||||||||NORTH THAMES GLH^^69A70^^^ODS
OBR|1|NT26-80455^69A70||R67.1^^England-GenomicTestDirectory|||20260915150000+0000|||||||||||||||20261019140000+0000|||F||||||R67^Monogenic hearing loss^GenomicClinicalIndication|C1234567&FICTITIOUS&Ralph^^^^^^699X0&https://fhir.nhs.uk/Id/ods-organization-code&URI
OBX|1|ED|1054161000000101^Genetic report^SNM3|1|^application^pdf^Base64^JVBERi0x...||||||F
OBX|2|CWE|69548-6^Genetic variant assessment^LN|2a|LA9633-4^Present^LN||||||F|||20261019140000+0000
OBX|3|CWE|83005-9^Variant category^LN|2a|SEQV^Sequence Variant^https://fhir.nwgenomics.nhs.uk/CodeSystem/IGeneVariantCategory||||||F|||20261019140000+0000
OBX|4|CWE|48018-6^Gene studied [ID]^LN|2a|HGNC:4284^GJB2^HGNC||||||F|||20261019140000+0000
OBX|5|CWE|51958-7^Transcript reference sequence [ID]^LN|2a|NM_004004.6^^RefSeq-T||||||F|||20261019140000+0000
OBX|6|CWE|48004-6^DNA change (c.HGVS)^LN|2a|NM_004004.6:c.35del^^HGVS.c||||||F|||20261019140000+0000
OBX|7|CWE|48002-0^Genomic source class [Type]^LN|2a|LA6683-2^Germline^LN||||||F|||20261019140000+0000
OBX|8|CWE|53034-5^Allelic state^LN|2a|LA6705-3^Homozygous^LN||||||F|||20261019140000+0000
OBX|9|CWE|53037-8^^LN|2a|LA6668-3^Pathogenic^LN||||||F|||20261019140000+0000
OBX|10|CWE|81259-4^^LN|2a|^Autosomal recessive non-syndromic hearing loss (DFNB1)||||||F|||20261019140000+0000
OBX|11|ST|conclusion-string^^http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs|2a|Homozygous pathogenic GJB2 variant, consistent with autosomal recessive non-syndromic hearing loss (DFNB1).||||||F|||20261019140000+0000
SPM|1|NT26-80455-D1&69A70||258566005^Deoxyribonucleic acid sample^SNM3|||||||||||||20260915150000+0000|||Y
SPM|2|RP426-0310558&RP4||258580003^Whole blood specimen^SNM3|||||||||||||20260914103000+0000|20260914160000+0000||Y
```

> FHIR Message Example: [Bundle Message - Genomics Sub-order Report - Specialist Test](Bundle-GenomicsSubOrderReportMessage-SPT.html)

The cytogenetics laboratory returns its karyotype (an ISCN expression) on the haemato-oncology
sub-order - step 3 of [Suspected Blood Cancer - Haemato-Oncology
Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html).

```
MSH|^~\&|RIE|R0A|RIE|R0A|20261016120000+0000||ORU^R01^ORU_R01|urn:uuid:d576368f-989b-421c-985a-1686daa6fcd7|T|2.5.1|||AL
PID|1||9737383397^^^NHS^NH||TAMESIDE^Hodor^^^^^L||19600727|M|||Stockport Road^^TAMESIDE^^OL7 0NS
ORC|RE|HO26-11872-C^R0A
OBR|1|HO26-11872-C^R0A||M80.3^^England-GenomicTestDirectory|||20261012100000+0000|||||||||||||||20261016120000+0000|||F|||||||C6789012&FICTITIOUS&Clara^^^^^^R0A&https://fhir.nhs.uk/Id/ods-organization-code&URI
OBX|1|ED|1054161000000101^Genetic report^SNM3|1|^application^pdf^Base64^JVBERi0x...||||||F
OBX|2|ST|62356-1^Chromosome analysis result in ISCN expression^LN||47,XY,+8,del(7)(q22q36)[18]/46,XY[2]||||||F|||20261012100000+0000
```

> FHIR Message Example: [Bundle Message - Genomics Sub-order Report - Haemato-Oncology Cytogenetics](Bundle-GenomicsSubOrderReportMessage-HaematoOncology-Cytogenetics.html)

<!--
#### MASTER HL7 REPORTING PANEL

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                    | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                                            | Cardinality | Term Description                                                       |
|-------------|----------------|-----------------------------------|----------------------|----------------|-------------------------------------------------------------------|-------------|------------------------------------------------------------------------|
| CE          | 51967-8        | Genetic disease assessed [ID]     | LOINC                | 1.a            | R240^Diagnostic testing for known mutation(s)^ClinicalIndication | [0..*]      | [Clinical Indication](CodeSystem-GenomicClinicalIndication.html) |
| ED          | 51969-4        | Genetic analysis report           | LOINC                | 1              | ^AP^PDF^Base64^JVBERi0xL....                                      | [0..1]      |                                                                        |
| CE         | TESTCOME       | NHS England Genomics Test Outcome | NWGMSA         |                | 311^RESULT CONSISTENT WITH REFERRAL INDICATION^TESTOUTCOME        | [0..1]      | [Test Outcome](ValueSet-GenomicTestOutcomeCodes.html)    |                                                                     |

#### Supplemental Codes (work in progress)

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)                          | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5)                             | Cardinality | Term Description                                                                                                                                                                                     |
|--------------|----------------|-----------------------------------------|----------------------|----------------|----------------------------------------------------|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CNE          | 48018-6        | Gene studied [ID]                       | LOINC                | 1.a            | 21497^ACAD9^HGNC-Symb                              | [0..*]      |
| CNE          | 51968-6        | Genetic analysis overall interpretation | LOINC                | 1              | LA6576^Posititive^LN^ <br/>  10828004^Positive^SCT | [0..1]      | [Genetic disease analysis overall predictive risk interpretation (LOINC LL541-4)](https://loinc.org/LL541-4)                                                                                         |
| ST           | 69547-8        | Genomic ref allele [ID]                 | LOINC                | 2a             | C                                                  | [0..1]      | The DNA string in the reference sequence (Ref Allele) with which the DNA string in the test sample differs, starting at the first position given in  LOINC 81254-5’s Genome Allele start-end (B.12). |

#### Interpretations (work in progress)

| Type (OBX-2) | Code (OBX-3.1) | Name (OBX-3.2)             | CodeSystem (OBX-3.3) | Sub ID (OBX-4) | Example values (OBX-5) | Cardinality | Term Description                                                              |
|--------------|----------------|----------------------------|----------------------|----------------|------------------------|-------------|-------------------------------------------------------------------------------|
| CNE          | 53037-8        | Genetic sequence           | LOINC                | 2a             | LA6668-3^Pathogenic^LN | [0..1]      | [ACMG_Clinical significance of genetic variation](https://loinc.org/LL4034-6) |
| CWE          | 69548-6        | Genetic variant Assessment | LOINC                | 2a             | LA9633-4^Present^LN    | [0..1]      | [Genetic variant assessment](https://loinc.org/LL1971-2)                      |
-->

### MDM_T02 Original document notification and content

<div class="alert alert-info" role="alert">
This is currently being elaborated and subject to change.
</div>

See also which are functionally equivalent and have a similar data model:

- IHE XDS Cross-Enterprise Document Sharing (XDS.b) or Cross-Enterprise Document Reliable Interchange (XDR) - [Provide and Register Document Set-b [ITI-41]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html#3.41)
- IHE MHD Mobile access to Health Documents (MHD) - [Simplified Publish [ITI-105]](https://profiles.ihe.net/ITI/MHD/ITI-105.html)

#### Design Decision: ORU_R01 vs MDM_T02/ITI-105 for the Laboratory Report (Composition)

<div class="alert alert-danger" role="alert">
This has not yet been decided.
</div>

[CodeX HL7 FHIR Accelerator - GenomeX Data Exchange -
Transport](https://build.fhir.org/ig/CodeX-HL7-FHIR-Accelerator/GenomeX-DataExchange/transport.html)
suggests sending a genomic FHIR Bundle - the equivalent of this guide's own
[Laboratory Report
(Composition)](StructureDefinition-Composition-GenomicReport.html), see
[Diagnostic Model Overview - Closed-Loop
Referrals](diagnostic-core.html#closed-loop-referrals) - embedded in, or
referenced from, an `ORU_R01` message: either the whole Bundle base64-encoded
in an `OBX`, or an `OBX-2 = RP` (Reference Pointer) `OBX` whose `OBX-5` is a
URL the receiver retrieves the FHIR resource from - see [OBX-2 Value
Type](#obx-2-value-type) below. This guide instead suggests `MDM_T02` or IHE
MHD [Simplified Publish [ITI-105]](https://profiles.ihe.net/ITI/MHD/ITI-105.html)
for that same content, treating it as a *document* rather than a discrete
result.

By the same logic, the `RP` pattern above is really a **document
notification** - telling the receiver a document/resource exists at a URL,
without embedding it - which is what HL7 v2 `MDM^T01` (Document Notification,
without content) or IHE Document Metadata Subscription (DSUBm) are for,
rather than `ORU_R01`/`OBX`. Both remain live options for how a Laboratory
Report (Composition) is signalled/delivered in this guide.

This decision is only about how the *document* (the Laboratory Report
(Composition)) is packaged and delivered - it does not affect `ORU_R01`'s
existing use for *discrete, structured* results (the `OBX` conventions
described throughout this page). For that content this guide already follows
the [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface
(LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
- e.g. the same LOINC codes and panel/battery conventions - rather than
inventing its own.

#### References 

- [EPIC Incoming Scanned Document Link Interface Technical Specification](https://open.epic.com/Tech/TechSpec?spec=5323)

#### Message

| Segment HL7   | Optionality | Notes                                                   |
|---------------|-------------|---------------------------------------------------------|
| [MSH](#msh)   | 1..1        |                                                         |
| EVN           | 1..1        |                                                         | 
| [PID](#pid)   | 1..1        |                                                         |
| [PV1](#pv1)   | 1..1        | PV1-19 Visit Number if known; with no encounter, `PV1\|1\|U` (patient class unknown) |
| **ORDER**     | 0..*        |                                                         |
| - [ORC](#orc) | 1..1        |                                                         |
| - [OBR](#obr) | 1..1        |                                                         |
| [TXA](#txa)   | 1..1        |                                                         |
| **OBXNTE**    | 1..*        |                                                         |
| - [OBX](#obx) | 1..1        |                                                         |
{:.grid}

#### Examples

Converted from the FHIR Messages in the Example Scenarios (see [Artifacts](artifacts.html)).
Report PDFs are shortened (`JVBERi0x...`). None of these reports has an encounter, so PV1 is
`PV1|1|U`. There is no ORDER group: TXA-12 is the document's unique id, and TXA-17 `DO`
(documented) its completion status.

The North West GLH sends the Laboratory Report PDF to the regional Shared Care Record for
Cheshire and Merseyside (`QYG`) - step 3 of [Hereditary Breast and Ovarian
Cancer](ExampleScenario-BreastCancer.html).

```
MSH|^~\&|RIE|699X0|QYG|QYG|20261026120500+0000||MDM^T02^MDM_T02|urn:uuid:9167f601-9be1-494f-9330-813fe2ab5a3f|T|2.5.1|||AL
EVN|T02|20261026120500+0000
PID|1||9737383281^^^NHS^NH~M482113^^^RJN^MR||CONGLETON^Margaery^^^^^L||19820211|F|||Town Hall^7 High Street^CONGLETON^^CW12 1BN
PV1|1|U
TXA|1|1054161000000101^Genetic report^SNM3||20261026120000+0000||20261026120000+0000||||||70ce6e2f-6588-4469-aeaf-4a56c394f47e|||||DO
OBX|1|ED|1054161000000101^Genetic report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
```

> FHIR Message Example: [Bundle Message - Document - Breast Cancer](Bundle-DocumentMessage-BreastCancer.html)

The North West GLH sends its molecular genomic report to the Greater Manchester Care Record
(`GMCR`, `QOP`) - step 7 of [Suspected Blood Cancer - Haemato-Oncology
Diagnostics](ExampleScenario-HaematoOncologyDiagnostics.html).

```
MSH|^~\&|RIE|699X0|GMCR|QOP|20261023120500+0000||MDM^T02^MDM_T02|urn:uuid:e1e801e5-e62c-4342-ae7b-1d51cbc16290|T|2.5.1|||AL
EVN|T02|20261023120500+0000
PID|1||9737383397^^^NHS^NH||TAMESIDE^Hodor^^^^^L||19600727|M|||Stockport Road^^TAMESIDE^^OL7 0NS
PV1|1|U
TXA|1|1054161000000101^Genetic report^SNM3||20261023120000+0000||20261023120000+0000||||||b89807ea-8296-416e-bcab-77593fd26c7b|||||DO
OBX|1|ED|1054161000000101^Genetic report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
```

> FHIR Message Example: [Bundle Message - Document - Haemato-Oncology Molecular](Bundle-DocumentMessage-HaematoOncology-Molecular.html)

The North West GLH sends a fetal Laboratory Report to the central repository (`UGR`, NHS England
`X26`). A fetus has no NHS Number, so PID-3 is the hospital's fetal MRN - step 14 of [Rapid
Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html).

```
MSH|^~\&|RIE|699X0|UGR|X26|20260928093000+0000||MDM^T02^MDM_T02|urn:uuid:8e93a6b8-32e7-46ed-b50d-fcbddde48c74|T|2.5.1|||AL
EVN|T02|20260928093000+0000
PID|1||R0A-F26-0042^^^R0A^MR||WIGAN^Baby^^^^^A||2027
PV1|1|U
TXA|1|1054161000000101^Genetic report^SNM3||20260928090000+0000||20260928090000+0000||||||87733553-52c1-4662-b0d2-a9cf22573c98|||||DO
OBX|1|ED|1054161000000101^Genetic report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
```

> FHIR Message Example: [Bundle Message - Document - Rapid Prenatal Exome](Bundle-DocumentMessage-RPX.html)

### OMG_O19 General Clinical Order

<div class="alert alert-info" role="alert">
<b>Laboratory orders:</b> <code>OMG^O19</code> <b>MAY</b> be used instead of
<a href="#oml_o21-laboratory-order">OML_O21</a> for a laboratory (genomic test) order.
The segments, including <a href="#spm">SPM</a>, and their field rules are the same as
OML_O21, and the FHIR equivalent is the same
<a href="MessageDefinition-laboratory-order.html">Laboratory Order</a> FHIR Message.
</div>

<div class="alert alert-warning" role="alert">
<b>Referrals - for future use.</b> <code>OMG^O19</code> is also the IHE 360X referral
order for a <a href="StructureDefinition-GeneticClinicalReferral.html">Genetic Clinical
Referral</a> - see <a href="PCC-55.html">Referral Request [PCC-55]</a>. Not used by any
interface in this guide today.
</div>

#### References

<span class="badge badge-danger">Diagnostic Workflow</span> <span class="badge badge-danger">Referral Workflow</span>

- [IHE PCC 360X Closed Loop Referral](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_360X.pdf) PCC TF-2 3.55
- [HL7 Version 2 to FHIR - ORC to ServiceRequest](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html)

`OMG^O19^OMG_O19` has the same `ORC`/`OBR`/`SPM` shape as
[OML_O21](#oml_o21-laboratory-order), so it can carry either:

- a **laboratory order** - a specific test (e.g. a Genomic Test Directory code in OBR-4),
  with its specimens in the SPECIMEN group; FHIR equivalent [Laboratory Order
  (O21)](MessageDefinition-laboratory-order.html); or
- a **referral** (IHE 360X, ORC-1 `NW`) - a clinical service (e.g. a clinical genetics
  assessment) in OBR-4, normally with no specimen; FHIR equivalent [Referral Order
  (O19)](MessageDefinition-referral-order.html).

#### Message

| Segment HL7               | Optionality | Notes                                                                                   |
|---------------------------|-------------|-----------------------------------------------------------------------------------------|
| [MSH](#msh)               | 1..1        | For a referral, MSH-5 / MSH-6 identify the referred-to service                          |
| [PID](#pid)               | 1..1        |                                                                                         |
| [NK1](#nk1)               | 0..*        | For a fetus, this shall be the mother; for a referral, a named consultand (at-risk relative) |
| [PV1](#pv1)               | 0..1        | PV1 should be populated if PV1-19 Visit Number is known                                 |
| **ORDER**                 | 1..*        | A referral has one ORDER                                                                |
| - [ORC](#orc)             | 1..1        | ORC-2 Placer Order Number / Referral ID; ORC-12 and ORC-21 the orderer / referrer        |
| - TQ1                     | 0..1        | TQ1-8 expected by date, TQ1-9 priority                                                  |
| - [OBR](#obr)             | 1..1        | OBR-4 Genomic Test Directory code, or for a clinical genetics referral `306119003^^SCT`; OBR-31 reason for referral |
| - [NTE](#nte)             | 0..*        | Clinical details                                                                        |
| - [DG1](#dg1)             | 0..*        | Suspected/confirmed condition                                                           |
| - **OBSERVATION**         | 0..*        |                                                                                         |
| -- [OBX](#obx)            | 0..*        | Ask At Order Entry answers; for a referral, the referral question (OBX-11 `O`, OBX-29 `QST`), forms and documents as `RP` or [ED](#obx-type--ed) |
| - **SPECIMEN**            | 0..*        | Conditional - required for a complete laboratory order; normally absent for a referral  |
| -- [SPM](#spm)            | 1..1        |                                                                                         |
| -- [OBX](#obx)            | 0..*        | Observations about the specimen                                                         |
{:.grid}

##### Examples

A laboratory order sent as `OMG^O19` instead of OML_O21 - see [Referral Request
[PCC-55]](PCC-55.html#examples). For a referral, OBR-4 is `306119003^^SCT` and there is
normally no `SPM`.

```
MSH|^~\&|EPIC|R0A|RIE|699X0|20250129103726+0000||OMG^O19^OMG_O19|MSG001601737|P|2.5.1|||AL|NE
PID|1||633^^^R0A^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
PV1|1|I|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||892761000000102^Clinical haematology service^SNM3|||||||||1001166717^^^R0A^AN
ORC|NW|1601737^R0A|||||||20250129103726+0000|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1601737^R0A||R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
SPM|1|25GEN-029GN00001&R0A||258580003^Whole blood specimen^SNM3|||||||||||||20250129103726+0000|||Y
```

> FHIR Message Example: [Bundle 'Message' - Genomics Order with Attachment](Bundle-GenomicsOrderMessageAttachment.html)

A **referral** (IHE 360X): after a pathogenic BRCA1 variant is found, East Cheshire NHS Trust refers
the family to clinical genetics (OBR-4 `306119003^^SCT`, OBR-31 the clinical indication). The
proband is in PID and the at-risk relative (consultand) in NK1; OBX 1 is the referral question
and OBX 2 points (`RP`) to the proband's report. There is no SPM - step 5 of [Hereditary Breast
and Ovarian Cancer](ExampleScenario-BreastCancer.html).

```
MSH|^~\&|RJN|RJN|eRS|R0A|20261030110000+0000||OMG^O19^OMG_O19|urn:uuid:bfd06c25-451f-4619-bd8e-849ec115f2e5|T|2.5.1|||AL
PID|1||9737383281^^^NHS^NH~M482113^^^RJN^MR||CONGLETON^Margaery^^^^^L||19820211|F|||Town Hall^7 High Street^CONGLETON^^CW12 1BN
NK1|1|BUXTON^Lysa|SIS^Sister^HL70063||||||||||||F|19710101|||||||||||||||||9737383338^^^NHS^NH
ORC|NW|RJN-REF-26-1188^RJN|||||||20261030|||C4567891^FICTITIOUS^Helen^^^^^^GMC|||||||||EAST CHESHIRE NHS TRUST^^RJN^^^ODS
OBR|1|RJN-REF-26-1188^RJN||306119003^Referral to genetics service^SNM3||20261030||||||||||C4567891^FICTITIOUS^Helen^^^^^^GMC|||||||||||||||R208^Inherited breast cancer and ovarian cancer^GenomicClinicalIndication
NTE|1||Heterozygous pathogenic BRCA1 variant found in Margaery Congleton. Please see the family for genetic counselling and predictive testing of relatives for the same variant.
OBX|1|CWE|FamilyMemberRelationship^Relationship to proband^NWGMSA||ONESELF^self^v3-RoleCode||||||O
OBX|2|RP|1054161000000101^Genetic report^SNM3||https://ugr.example.nhs.uk/FHIR/R4/Bundle/G26-48213||||||F
```

> FHIR Message Example: [Bundle Message - Genomics Referral - Breast Cancer](Bundle-GenomicsReferralMessage-BreastCancer.html)

A referral for a fetus, identified by the hospital's fetal MRN, with both parents in NK1 for
genetic counselling and parental testing - step 15 of [Rapid Prenatal Exome
Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html).

```
MSH|^~\&|EPIC|R0A|eRS|R0A|20260928140000+0000||OMG^O19^OMG_O19|urn:uuid:98d2ed39-d05b-4e43-808e-f1dda6e134dc|T|2.5.1|||AL
PID|1||R0A-F26-0042^^^R0A^MR||WIGAN^Baby^^^^^A||2027
NK1|1|WIGAN^Imogen|MTH^Mother^HL70063||||||||||||F|19940312|||||||||||||||||9737383400^^^NHS^NH
NK1|2|WIGAN^Daniel|FTH^Father^HL70063||||||||||||M|19921105|||||||||||||||||9737383419^^^NHS^NH
ORC|NW|1702388^R0A|||||||20260928|||C5678234^FICTITIOUS^Ruth^^^^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
OBR|1|1702388^R0A||306119003^Referral to genetics service^SNM3||20260928||||||||||C5678234^FICTITIOUS^Ruth^^^^^^GMC
NTE|1||Rapid prenatal exome sequencing (R21.2): heterozygous pathogenic variant in COL1A1 in the fetus, consistent with osteogenesis imperfecta. Please see the family for genetic counselling and parental testing.
OBX|1|CWE|FamilyMemberRelationship^Relationship to proband^NWGMSA||ONESELF^self^v3-RoleCode||||||O
OBX|2|RP|1054161000000101^Genetic report^SNM3||https://ugr.example.nhs.uk/FHIR/R4/Bundle/G26-41180||||||F
```

> FHIR Message Example: [Bundle Message - Genomics Referral - Rapid Prenatal Exome](Bundle-GenomicsReferralMessage-RPX.html)

### OSU_O51 Order Status Update

<div class="alert alert-warning" role="alert">
<b>For future use.</b> Not used by any interface in this guide today. Used for
<a href="StructureDefinition-GeneticClinicalReferral.html">Genetic Clinical Referral</a>
status updates - see <a href="PCC-55.html">[PCC-55]</a>, <a href="PCC-56.html">[PCC-56]</a>
and <a href="PCC-57.html">[PCC-57]</a>.
</div>

#### References

<span class="badge badge-danger">Referral Workflow</span>

- [IHE PCC 360X Closed Loop Referral](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_360X.pdf) PCC TF-2 3.55 to 3.59
- [NHS England Multicast Notification Service - Genomic Order Event](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service/genomic-order-event)

<div class="alert alert-info" role="alert">
<b>Note:</b> <code>OSU^O51</code> is an HL7 v2.8 message - it is not in HL7 v2.5.1, the
version used by IHE PaLM (LTW, ILW) and the other messages in this guide. The IHE
laboratory equivalents report order status with <code>ORL^O22</code> /
<code>OML^O21</code> (ORC-1 and ORC-5) instead.
</div>

`OSU^O51^OSU_O51` reports a change in the status of an order - accept, decline,
interim note, outcome, cancellation. The FHIR equivalent is the [Referral Order Status
(O51)](MessageDefinition-referral-order-status.html) FHIR Message, whose focus is a
[Task](StructureDefinition-Task.html).

Where the referral or order is managed by the NHS England Genomic Order Management
Service (GOMS), the Regional Integration Engine (RIE) receives a `genomic-order-event-1`
notification from the NHS England Multicast Notification Service (MNS), retrieves the
`Task` from GOMS, and converts it to `OSU^O51` (or the FHIR Message) - see [Status
Updates from GOMS via MNS](PCC-55.html#status-updates-from-goms-via-mns).

#### Message

| Segment HL7   | Optionality | Notes                                                                   |
|---------------|-------------|-------------------------------------------------------------------------|
| [MSH](#msh)   | 1..1        |                                                                         |
| [PID](#pid)   | 1..1        | Required in this guide                                                  |
| [ORC](#orc)   | 1..*        | ORC-1 / ORC-5 the status; ORC-2 the Referral ID; ORC-12 and ORC-21 the referrer (required in this guide); ORC-16 the reason |
{:.grid}

#### Order Control and Status

| Status update | ORC-1 | ORC-5 | FHIR `Task.status` | `Task.businessStatus` ([Referral Workflow Status](CodeSystem-referral-workflow-status.html)) |
|---|---|---|---|---|
| Accept [PCC-55] | `OK` | `IP` | `accepted` | `accepted` |
| Decline [PCC-55, PCC-56] | `UA` | `CA` | `rejected` | `declined` |
| Interim Consultation Note [PCC-59] | `SC` | `A` | `in-progress` | `interim-report` |
| Referral Outcome [PCC-57] | `SC` | `CM` | `completed` | `completed` |
| Cancel Request [PCC-58] | `CA` | `CA` | `cancelled` | `cancel-requested` |
| Cancel Confirmation [PCC-58] | `CR` | `CA` | `cancelled` | `cancelled` |
{:.grid}

##### Example

```
MSH|^~\&|RIE|699X0|EPIC|R0A|20250130093000+0000||OSU^O51^OSU_O51|GLH-MSG-250130001|P|2.8|||AL|NE
PID|1||633^^^R0A^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
ORC|OK|1601737^R0A|R25012345^699X0||IP||||20250130093000+0000|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
```

> FHIR Message Example: [Bundle Message - Order Status (O51), accepted](Bundle-GenomicOrderStatusAcceptMessage.html)

### Segments

#### MSH

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

#### PID

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

##### Examples

```
PID|1||633^^^R0A^MR~9449305552^^^^NH||CHISLETT^Octavia||20080920|F|||1 RAVENSFIELD GARDENS^^EPSOM^SURREY^KT19 0ST
```

> FHIR Resource Example: [Patient - Octavia CHISLETT NHS Number: 9449305552](Patient-Patient-OctaviaCHISLETT-9449305552.html)

#### PD1

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pd1-to-patient.html" _target="_blank">PD1 to FHIR Patient</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

#### NK1

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


#### PV1 

> The PV1 segment should represent the episode/stay/visit number, not a consultant episode. 

Where a message requires PV1 but there is no encounter ([MDM_T02](#mdm_t02-original-document-notification-and-content)),
send `PV1|1|U` (patient class unknown) with no other fields - the field rules below then don't apply.

This is based on the definition of PV1 from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

| Field HL7 | Fieldname                 | Data Type   | Optionality                                 | Identifier Type or ValueSet                                                                    | Example Values                                         | Description |
|-----------|---------------------------|-------------|---------------------------------------------|------------------------------------------------------------------------------------------------|--------------------------------------------------------|-------------|
| PV1-1     | Set ID - PV1              | SI          | R                                           |                                                                                                | 1                                                      | Sequence number of this PV1 segment within the message (ubiquitous term: **Set ID**). |
| PV1-2     | Patient Class             |             |                                             |                                                                                                | I                                                      | Inpatient, outpatient, emergency, etc. (ubiquitous term: **Patient Class**). |
| PV1-3     | Assigned Patient Location | [PL](#pl)   | R                                           |                                                                                                | ^^^R0A09^^^^^^^R0A <br/> ^^^P1S8J^^^^^^^699X0          | The ward/clinic/bed the patient is assigned to (ubiquitous terms: **Location**, **Ward**, **Bed**). |
| PV1-8     | Referring Doctor          | [XCN](#xcn) | O                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | The doctor who referred the patient (ubiquitous terms: **Referring Doctor**, **Referrer**). |
| PV1-9     | Consulting Doctor         | [XCN](#xcn) | O                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | A doctor consulted on this visit (ubiquitous term: **Consultant**). |
| PV1-10    | Hospital Service          |             | R <span class="badge badge-danger">S</span> | [Service](ValueSet-service.html)                                                               | 892761000000102^Clinical haematology service^SNM3<br/>810^Radiology^2.16.840.1.113883.2.1.6.8 | The clinical service/specialty responsible for the visit (ubiquitous term: **Specialty**). |
| PV1-17    | Admitting Doctor          | [XCN](#xcn) | R                                           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                     | C3456789^Darwin^Samuel^^^Dr^^^GMC                      | The doctor formally admitting the patient (ubiquitous term: **Admitting Doctor**). |
| PV1-19    | Visit Number              | [CX](#cx)   | O <span class="badge badge-danger">S</span> | [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html) (`AN`) - required for diagnostic laboratory orders. A clinical genetics referral (`OMG_O19`) may instead use [Visit Number](StructureDefinition-VisitNumber.html) (`VN`) | 1001166717^^^R0A^AN                                    | The identifier for this spell/stay (ubiquitous terms: **Visit Number**, **Spell Number**, **Account Number**). |
{:.grid}

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-pv1-to-encounter.html" _target="_blank">PV1 to FHIR Encounter</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-HospitalSpell.html" _target="_blank">HospitalSpell</a> 
<b>FHIR Profile:</b> <a href="StructureDefinition-Visit.html" _target="_blank">Visit</a> 
</div>

##### Examples

```
PV1|1|I|^^^R0A09^^^^^^^R0A||||C3456789^Darwin^Samuel^^^Dr^^^GMC|||892761000000102^Clinical haematology service^SNM3|||||||||1001166717^^^R0A^AN|||||||||||||||||||||||||20250129103726+0000
```

> FHIR Resource Example: [Encounter 'episode/stay' Example](Encounter-984b8a89-4194-4eb4-a7ea-ca8049ebeea3.html)

#### ORC

This is based on the definition of ORC from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf).

| Field HL7 | Fieldname                | Data Type   | Optionality                                  | Identifier Type or ValueSet                                                | Example Values                                        | Description |
|-----------|--------------------------|-------------|----------------------------------------------|----------------------------------------------------------------------------|-------------------------------------------------------|-------------|
| ORC-2     | Placer Order Number      | [EI](#ei)   | R <span class="badge badge-danger">S</span> | [Order Placer Number](StructureDefinition-OrderPlacerNumber.html) (type `PLAC`) | 1601737^R0A^150^L                                     | The referring system's own order number. Maps to `ServiceRequest.identifier` (ubiquitous terms: **Order Number**, **Placer Order Number**). |
| ORC-3     | Filler Order Number      | [EI](#ei)   | O                                            | [Order Filler Number](StructureDefinition-OrderFillerNumber.html) (type `FILL`) | R25012345^699X0                                       | The receiving laboratory's own number for the order, e.g. the iGene **R-Number**. Maps to `ServiceRequest.identifier` (ubiquitous terms: **Filler Order Number**, **Lab Order Number**). |
| ORC-4     | Placer Group Number      | [EI](#ei)   | O <span class="badge badge-danger">S</span>                                           | [Order Group Number](StructureDefinition-OrderGroupNumber.html)           | r25012345678^8J834                                    | Assigned by the ordering system to link several orders placed together, e.g. the NGIS Referral Id or a panel (ubiquitous terms: **Order Group Number**, **Panel Number**). |
| ORC-5     | Order Status             |             | O                                            |                                                                            |                                                         | The current status of the order (ubiquitous term: **Order Status**). |
| ORC-8     | Parent                   | EIP         | O                                            | [Order Group Number](StructureDefinition-OrderGroupNumber.html) (provisional) | ^R25012345&699X0                                      | The parent order's Placer and/or Filler Order Number, e.g. the pathology order a genomic reflex order follows on from. **Provisionally** maps to `ServiceRequest.requisition` - see [Linking Related Orders](diagnostic-core.html#linking-related-orders-servicerequestrequisition) (ubiquitous term: **Parent Order Number**). |
| ORC-9     | Date/Time of Transaction | TS          | O                                            |                                                                            |                                                         | When this order message was created/transacted (ubiquitous term: **Transaction Date/Time**). |
| ORC-12    | Ordering Provider        | [XCN](#xcn) | O                                            | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | C3456789^Darwin^Samuel^^^Dr^^^GMC                     | The clinician who placed the order (ubiquitous terms: **Ordering Provider**, **Requesting Clinician**). Intended to become **R** (required), see note below. |
| ORC-21    | Ordering Facility Name   | [XON](#xon) | R  <span class="badge badge-danger">S</span>                                          | [Organisation Code](StructureDefinition-OrganisationCode.html)             | MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS | The organisation the order was placed on behalf of (ubiquitous terms: **Ordering Facility**, **Trust**). |
{:.grid}

<div class="alert alert-warning" role="alert">
<b>ORC-12 Ordering Provider:</b> ORC-12 is currently optional, but it is intended that it will be made mandatory (<b>R</b>) in a future version of this guide. Senders <b>SHOULD</b> populate ORC-12 now in preparation for this change.
</div>

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-orc-to-servicerequest.html" _target="_blank">ORC to FHIR ServiceRequest</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>

##### Examples

```
ORC|NW|1601737^R0A|R25012345^699X0||||||20250129|||C3456789^Darwin^Samuel^^^Dr^^^GMC|||||||||^^R0A^^^ODS
```

> FHIR Resource Example: [ServiceRequest Attachment Example](ServiceRequest-ServiceRequestGenomicsOrderAttachment.html)

#### OBR 

This is based on the definition of OBR from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

| Field HL7 | Fieldname                          | Data Type   | Optionality                                  | Identifier Type or ValueSet                                                       | Example Values                                                              | Description |
|-----------|------------------------------------|-------------|----------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------|-------------|
| OBR-1     | Set ID - OBR                       |             | R                                            |                                                                                   | 1                                                                           | Sequence number of this order/observation-request group within the message (ubiquitous term: **Set ID**). |
| OBR-2     | Placer Order Number                | [EI](#ei)   | O <span class="badge badge-danger">S</span> | [Order Placer Number](StructureDefinition-OrderPlacerNumber.html)                 | 1601737^ R0A^150^L                                                          | The referring system's own order number, repeated from ORC-2 (ubiquitous terms: **Order Number**, **Placer Order Number**). |
| OBR-3     | Filler Order Number                | [EI](#ei)   | R <span class="badge badge-danger">S</span> | [Report Identifier](StructureDefinition-ReportIdentifier.html)                   | T25067890^699X0                                                             | The receiving laboratory's own number for this test/report, e.g. the iGene **T-Number**. Maps to `DiagnosticReport.identifier`. This may differ from ORC-3 (the order), see note below (ubiquitous terms: **Report Number**, **Test Number**, **Filler Order Number**). |
| OBR-4     | Universal Service Identifier       |             | R <span class="badge badge-danger">S</span>                                           | [Genomic Test Directory](ValueSet-GenomicTestCodes.html)                    | R240.1^Diagnostic testing for known variant(s)^England-GenomicTestDirectory | The test/panel being requested or reported on (ubiquitous term: **Test Code**). |
| OBR-6     | Requested Date/Time                | TS          | R for OML_O21                                |                                                                                   | 20170126135745                                                              | When the order was requested (ubiquitous term: **Requested Date/Time**). |
| OBR-7     | Observation Date/Time              | TS          | R for ORU_R01 <span class="badge badge-danger">S</span>                               |                                                                                   | 20170126135745                                                              | When the specimen/observation was taken (ubiquitous term: **Observation Date/Time**). |
| OBR-16    | Ordering Provider                  |             | R                                            | [Organisation Code](StructureDefinition-OrganisationCode.html)          |                                           | The organisation that placed the order (ubiquitous terms: **Ordering Facility**, **Trust**). |
| OBR-22    | Results Rpt/Status Chng -Date/Time | TS          | R for ORU_R01 <span class="badge badge-danger">S</span>                                             |                                                                                   | 20170126135745                                                              | When the report's status last changed, e.g. when finalised (ubiquitous term: **Report Status Date/Time**). |
| OBR-25    | Result Status                      |             |                                              |                                                                                   |                                                                             | Whether the result is preliminary, final, corrected, etc. (ubiquitous term: **Result Status**). |
| OBR-31    | Reason for Study                   | CWE         | O                                            | [Genomic Clinical Indication Codes](ValueSet-GenomicClinicalIndicationCodes.html) | R210^Lynch syndrome^GenomicClinicalIndication                               | The clinical reason the test was requested (ubiquitous terms: **Clinical Indication**, **Reason for Referral**). |
| OBR-32    | Principal Result Interpreter       | [NDL](#ndl) | O - SHOULD                                   | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                       |  C3456789^Darwin^Samuel^^^Dr^^^GMC                                                                            | The clinician who interpreted/authorised the result (ubiquitous terms: **Reporting Clinician**, **Authoriser**). |
| OBR-33    | Assistant Result Interpreter       | [NDL](#ndl) | O - SHOULD                                   | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                              |                                                                             | A second clinician who assisted in interpreting the result (ubiquitous term: **Assistant Reporter**). |
| OBR-34    | Technician                         | [NDL](#ndl) | O - SHOULD                                   | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                                                 |                                                                             | The laboratory staff member who performed the test (ubiquitous term: **Technician**). |
| OBR-46    | Placer Supplemental Service Information | CWE    | O                                            |                                                                                   |                                                                              | Further coded qualifier(s) on the requested service, supplementing OBR-4 rather than replacing it - maps to FHIR `ServiceRequest.orderDetail` (ubiquitous term: **Supplemental Service Information**). |
{:.grid}

<div class="alert alert-warning" role="alert">
<b>ORC-3 and OBR-3:</b> HL7 v2.5.1 expects OBR-3 to repeat ORC-3. In this guide they can differ: ORC-3 is the laboratory's number for the order (e.g. iGene R-Number, <code>ServiceRequest.identifier</code>) and OBR-3 is its number for each test/report under that order (e.g. iGene T-Number, <code>DiagnosticReport.identifier</code>). This follows the <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html" _target="_blank">v2 to FHIR ORU_R01 mapping</a>. Receivers that check ORC-3 = OBR-3 need to allow for this.
</div>

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion OML_O21:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-servicerequest.html" _target="_blank">OBR to FHIR ServiceRequest</a> 
<br/>
<b>v2 to FHIR Conversion ORU_R01:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obr-to-diagnosticreport.html" _target="_blank">OBR to FHIR DiagnosticReport</a> 
<br/>
<b>FHIR Profile:</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>

##### Examples

```
OBR|1|1601737^R0A|T25067890^699X0|R240.1^^England-GenomicTestDirectory||20250129||||||||||C3456789^Darwin^Samuel^^^Dr^^^GMC
```

> FHIR Resource Example: [Diagnostic Report Example](DiagnosticReport-DiagnosticReportGenomicsReport.html)

#### NTE

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

##### Examples

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

> FHIR Resource Example OML_O21: [ServiceRequest Attachment Example](ServiceRequest-ServiceRequestGenomicsOrderAttachment.html)
> 
> FHIR Resource Example ORU_R01: TODO

#### DG1

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

##### Examples

```
DG1|1||363349007^Malignant tumour of stomach^SNM3||20250129103726+0000
```

> FHIR Resource Example ORU_R01: TODO
 
#### OBX

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

##### OBX-2 Value Type

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

##### Examples

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

##### OBX (type = ED)

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

##### Examples

```
OBX|1|ED|1054161000000101^Genetic report^SNM3||MOL^IM^PDF^Base64^JVBERi0x...||||||F
```

> FHIR Resource Example: [Document Reference Laboratory Report](DocumentReference-94bf65ba-cd6c-4601-b339-6d547f424646.html)

#### SPM

This is based on the definition of SPM from [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)

Specimen Type is SNOMED CT, not HL7 v2 Table 0487, for conversion to SNOMED see [HL7 Terminology - hl7VS-specimenType](https://terminology.hl7.org/7.0.1/ValueSet-v2-0487.html)

| Field HL7 | Fieldname                     | Data Type   | Optionality                                 | Identifier Type or ValueSet                                                   | Example Values                                     | Description |
|-----------|-------------------------------|-------------|---------------------------------------------|-------------------------------------------------------------------------------|----------------------------------------------------|-------------|
| SPM-2     | Specimen ID                   |             | O                                           | Placer Specimen Number^[Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) | 25GEN-029GN00001&R0A^S25034567&699X0               | The specimen's own identifier. SPM-2.1 is the requester's number; SPM-2.2 (Filler Assigned Identifier) is the laboratory's own number, e.g. the iGene **S-Number**, which maps to `Specimen.accessionIdentifier` (ubiquitous terms: **Specimen Number**, **Specimen ID**, **Accession Number**, **Lab Number**). |
| SPM-3     | Specimen Parent IDs           |             | O <span class="badge badge-danger">S</span> |                                                                               | ^R25012345&699X0                                   | Identifiers of the order(s) this specimen relates to, i.e. the Filler Order Number in ORC-3 (ubiquitous term: **Order Number**). |
| SPM-4     | Specimen Type                 | [CWE](#cwe) | R <span class="badge badge-danger">S</span> | [Specimen Type](ValueSet-specimen-type.html)                                  | 119325001^Skin specimen^SNM3                       | What kind of specimen this is, e.g. blood, tissue (ubiquitous term: **Specimen Type**). |
| SPM-8     | Specimen Source Site          | [CWE](#cwe) | O <span class="badge badge-danger">S</span> | [Specimen Body Site](ValueSet-specimen-bodysite.html)                         | 299706009^Bone structure of wrist and/or hand^SNM3 | Where on/in the body the specimen was taken from (ubiquitous term: **Body Site**). |
| SPM-9     | Specimen Source Site Modifier |             | O                                           |                                                                               | 7771000^Left^SNM3                                  | A qualifier on the body site, e.g. left/right (ubiquitous term: **Body Site Modifier**, **Laterality**). |
| SPM-17    | Specimen Collection Date/Time | TS          | O                                           |                                                                               |                                                    | When the specimen was taken from the patient (ubiquitous term: **Collection Date/Time**). |
| SPM-18    | Specimen Received Date/Time   | TS          | O                                           |                                                                               |                                                    | When the specimen arrived at the laboratory (ubiquitous term: **Received Date/Time**). |
| SPM-20    | Specimen Availability         |             | O                                           |                                                                               |                                                    | Whether the specimen is available for further testing (ubiquitous term: **Specimen Availability**). |
| SPM-30    | Accession ID                  |             | Not used                                    | [Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) |                                                    | HL7 v2.7 and later only - not part of HL7 v2.5.1, which ends at SPM-29. For v2.5.1 feeds the laboratory's specimen number goes in SPM-2.2 (ubiquitous terms: **Accession Number**, **Lab Number**). |
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

##### Examples

```
SPM|1|25GEN-029GN00001&R0A^S25034567&699X0|^R25012345&699X0|258580003^Whole blood specimen^SNM3|||||||||||||20250129103726+0000|||Y
```

> FHIR Resource Example: [Specimen Example](Specimen-SpecimenExample.html)

#### TXA

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

### Data Types

This applies to HL7 v2 ORU_R01 feeds to the RIE.

ORC-21 (XON) **SHALL** be populated. ORC-12 (XCN) **SHOULD** be populated, and is intended to become mandatory, see [ORC](#orc).

#### CNE 

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-cne-to-codeableconcept.html" _target="_blank">CNE to FHIR CodeableConcept</a>
</div>

#### CWE

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/datatype_maps.html" _target="_blank">CWE to FHIR Value[x]</a>
</div>

#### CE 

Coded Element.
UK SNOMED CT is preferred and may be mandatory depending on use, for example for OXB Type ED, it will be required.

##### Example 

SNOMED

```1054161000000101^Genetic report^SNM3```

LOINC (from HL7 International)

```53577-3^Reason for study^LN```
```51967-8^Genetic disease assessed [ID]^LN```
```48018-6^Gene studied^LN```

#### CX 

Extended Composite ID with Check Digit
CX.1 - Id Number, CX-4 - Assigning authority and CX.5 - Identifier Type Code are mandatory

##### Example

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

#### ED 

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

#### EI 

Entity Identifier.
EI.1 - Entity Identifier and EI.2 - Namespace Id are mandatory

##### Example

Manchester University NHS Foundation Trust 

```aiignore
1601737^R0A
```

North West GLH Hub

```aiignore
1001166717^699X0
```

#### PL

This is based on the definition of PL from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in PV1-3.
In addition, this includes of PL.11 to hold organisation ODS code.  

> The ODS Site Code **SHALL** belong to the ODS Code. This is to help avoid data issues in this codesystem. 

| Field HL7 | Fieldname                        | Data Type | Optionality | Identifier Type or ValueSet                                                         | Example Values | Description |
|-----------|----------------------------------|-----------|-------------|-------------------------------------------------------------------------|----------------|-------------|
| PL.4      | Facility                         | HD        | R           | [Organisation Site Code](StructureDefinition-OrganisationSiteIdentifier.html) | R0A09               | The specific site/building the patient/specimen is at (ubiquitous terms: **Site Code**, **ODS Site Code**). |
| PL.11     | Assigning Authority For Location | HD        | R           | [Organisation Code](StructureDefinition-OrganisationCode.html)          | R0A            | The organisation the site belongs to (ubiquitous terms: **ODS Code**, **Trust Code**). |
{:.grid}

#### NDL

This is based on the definitions of NDL from [Royal College of Radiologists](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)

| Field HL7   | Fieldname   | Data Type | Optionality | Identifier Type or ValueSet | Example Values | Description |
|-------------|-------------|-----------|-------------|-----------------|----------------|-------------|
| NDL-1.CNN.1 | Id Number   | ST        | O           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)      |                | The clinician's own professional identifier (ubiquitous terms: **GMC Number**, **Professional Registration Number**). |
| NDL-1.CNN.2 | Family Name | ST        | O           |          |                | The clinician's family name (ubiquitous term: **Surname**). |
| NDL-1.CNN.3 | Given  Name | ST        | O           |         |                | The clinician's given name (ubiquitous term: **First Name**). |
| NDL-7       | Facility    | HD        | O           | [Organisation Code](StructureDefinition-OrganisationCode.html)         |                | The organisation the clinician belongs to (ubiquitous terms: **ODS Code**, **Trust Code**). |
{:.grid}

#### NM

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-nm-to-quantity.html" _target="_blank">NM to FHIR Quantity</a>
</div>

#### SN

<div class="alert alert-info" role="alert">
<b>v2 to FHIR Conversion:</b> <a href="https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-datatype-sn-to-quantity.html" _target="_blank">SN to FHIR Quantity</a>
</div>

#### XCN

Extended Composite ID Number and Name for Persons.
The definition of XCN from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) **SHOULD** be followed and **SHALL** be used in ORC-12.

| Field HL7 | Fieldname    | Data Type | Optionality | Identifier Type or ValueSet                                                | Example Values | Description |
|-----------|--------------|-----------|-------------|----------------------------------------------------------------------------|----------------|-------------|
| XCN-1     | Id Number    | ST        | O           | [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) |                | The person's own professional identifier (ubiquitous terms: **GMC Number**, **Professional Registration Number**). |
| XCN-2     | Family Name  | ST        | O           |                                                                     |                | The person's family name (ubiquitous term: **Surname**). |
| XCN-3     | Given  Name  | ST        | O           |                                                                   |                | The person's given name (ubiquitous term: **First Name**). |
| XCN-8     | Source Table | HD        | O           | See [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                                                                        |                | Only used for an SDS User ID, value SDS (XCN-9 is then X26). |
| XCN-9     | Assigning Authority | HD        | O           | See [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)                                                                        |                | The professional register that assigned XCN-1, e.g. GMC or GMP, or X26 (NHS England) for an SDS User ID (ubiquitous term: **Identifier Type**). |
{:.grid}

Example

GMC Code

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

#### XON 

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


### HL7 v2 to FHIR Message Conversion

- [HL7 Version 2 to FHIR - Message OML_O21 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oml-o21-to-bundle.html)
- [HL7 Version 2 to FHIR - Message ORM_O01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-orm-o01-to-bundle.html) 
- [HL7 Version 2 to FHIR - Message ORU_R01 to Bundle Map](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-message-oru-r01-to-bundle.html)

### Example: Example Instances

#### OML_O21 Laboratory Order

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [North West Genomics HL7 v2 OML_O21](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/O21) |
| [FHIR Message O21](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/O21)                 |
| [Original Hl7 v2 OML_O21](https://github.com/nw-gmsa/Testing/tree/main/Input/V2/O21)             |
{:.grid}

#### ORU_R01 Unsolicited transmission of an observation message

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [North West Genomics HL7 v2 ORU_R01](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/R01) |
| [FHIR Message R01](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/R01)                 |
| [Original Hl7 v2 ORU_R01](https://github.com/nw-gmsa/Testing/tree/main/Input/V2/R01)             |
{:.grid}

#### OMG_O19 General Clinical Order and OSU_O51 Order Status Update

For future use - see [Referral Request [PCC-55]](PCC-55.html), [Referral Decline
[PCC-56]](PCC-56.html) and [Referral Outcome [PCC-57]](PCC-57.html) for HL7 v2 and FHIR
Message examples.

#### MDM_T02 Original document notification and content

| Format                                                                                           | 
|--------------------------------------------------------------------------------------------------|
| [North West Genomics HL7 v2 MDM_T02](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/T02) |
| [FHIR Message T02](https://github.com/nw-gmsa/Testing/tree/main/Output/FHIR/T02)                 |
| Original message is ORU_R01                                                                      |
{:.grid}
