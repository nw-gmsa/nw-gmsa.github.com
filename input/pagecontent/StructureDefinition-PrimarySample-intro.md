This logical model describes the **Primary sample**: the initial material provided
directly to the first laboratory. The requirements are from the NHS England Genomics
Master Dataset (MDS) v1.062, Genomic Test Ordering, **Data group - Primary sample**.
It adds detail to the `specimen` of the [Genomic Test
Order](StructureDefinition-GenomicTestOrder.html).

Most of the Primary sample data group is **not genomics specific**. It describes a
laboratory specimen, and the tumour it came from, which other domains already define
using international standards. This model therefore follows those standards in
preference to the MDS picklists:

| Part of the model | Owning domain | Standard followed |
|---|---|---|
| Specimen - identifier, collection, type, condition, additive, method, body site, risk, processing | Laboratory (all disciplines) | HL7 Europe Laboratory [Specimen-eu-lab](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Specimen-eu-lab.html), HL7 v2 `SPM`, SNOMED CT, HL7 v2 tables |
| Specimen assessment - necrosis, cell content, blasts, maternal cell contamination | Laboratory (cellular pathology, haematology, prenatal) | Observation about the specimen, coded with SNOMED CT or LOINC |
| Tumour - specimen nature, morphology, topography, stage, grade | Cancer (pathology report) | [Cancer Pathology Report](https://kevinmayfield.github.io/CancerPathologyReport/en/StructureDefinition-PathologyReport.html) - COSD Pathology, mCODE |
{:.grid}

It is not a FHIR profile and is not exchanged as is. The **Mappings** tab shows each
element's MDS data element (PS-nnn), the FHIR mapping (HL7 Europe Laboratory), an
indicative HL7 v2 `SPM` mapping, and the matching Cancer Pathology Report element.

### Reference

- [Genomics Master Dataset (MDS) v1.062](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/NHSGenomics/Genomics%20Master%20Dataset%20_MDS_%20v1.062.xlsx) - Genomic Test Ordering, Data group - Primary sample (source of requirements)
- [HL7 Europe Laboratory Report - Specimen](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Specimen-eu-lab.html) and [Specimen Types](https://build.fhir.org/ig/hl7-eu/laboratory/ValueSet-lab-specimenType-eu-lab.html)
- [Cancer Pathology Report (Proof of Concept)](https://kevinmayfield.github.io/CancerPathologyReport/en/index.html) - COSD Pathology v5 Core with mCODE aligned profiles; lists neoplastic cell content as a gap that belongs with the specimen
- HL7 v2 tables [0487 Specimen Type](https://terminology.hl7.org/CodeSystem-v2-0487.html), [0493 Specimen Condition](https://terminology.hl7.org/CodeSystem-v2-0493.html), [0371 Additive/Preservative](https://terminology.hl7.org/CodeSystem-v2-0371.html), [0489 Risk Codes](https://terminology.hl7.org/CodeSystem-v2-0489.html)
- HL7 USA [mCODE - Cancer Stage ValueSet](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/ValueSet-mcode-cancer-stage-type-vs.html) (cited by the MDS for PS-036)

### Domain Archetype

```mermaid
erDiagram
    ServiceRequest ||--|{ Specimen : specimen
    ServiceRequest }o--o{ DiagnosticReport : "supportingInfo (pathology report)"
    Specimen }o--|| Patient : subject
    Specimen }o--o| Specimen : "parent (block)"
    Specimen }o--|| Organization : "identifier.assigner, collection.collector"
    Observation }o--|| Specimen : "focus (assessment)"
    DiagnosticReport ||--o{ Observation : "result (tumour)"

    Specimen {
        Identifier identifier "PS-002, PS-003"
        Identifier parent "PS-030"
        CodeableConcept type "PS-011 SNOMED CT"
        CodeableConcept condition "PS-012 v2-0493"
        dateTime collection_collectedDateTime "PS-010"
        Reference collection_collector "PS-038"
        CodeableConcept collection_method "PS-029, PS-039 SNOMED CT"
        CodeableConcept collection_bodySite "PS-019 SNOMED CT"
        CodeableConcept risk "PS-024 v2-0489"
        Reference processing_additive "PS-025, PS-031 Substance"
        Period processing_time "PS-032, PS-033"
        CodeableConcept processing_procedure "PS-034"
    }
    Observation {
        CodeableConcept code "PS-013, PS-014, PS-015, PS-026, PS-023, PS-021, PS-027"
        Quantity value "%"
    }
    DiagnosticReport {
        CodeableConcept tumour "PS-017, PS-018, PS-035, PS-036, PS-037"
    }
```

### Terminology

Codes checked on [tx.fhir.org](https://tx.fhir.org) (SNOMED CT International and UK
editions, LOINC). The MDS column shows the code given in the MDS, where it differs.

| Element | MDS | Code | MDS code |
|---|---|---|---|
| assessment.necrosis | PS-013 | SNOMED CT `405921002` Percentage of neoplasm involved by necrosis | Same (marked TBC) |
| assessment.nucleatedCellCount | PS-014 | **None identified** | `1022461000000100` is *Nucleated red blood cell count* (UK) - not a total nucleated cell count |
| assessment.tumourContentWholeSection | PS-015 | SNOMED CT `371510003` Proportion of specimen involved by tumour | Same (marked TBC) |
| assessment.tumourContentMarkedArea | PS-026 | **None identified** | TBC |
| assessment.blasts | PS-023 | LOINC `11150-0` Blasts/cells in Bone marrow | SNOMED CT `1015521000000107` Percentage blast cells (UK edition only) |
| assessment.maternalCellContamination | PS-021, PS-027 | LOINC `59266-7` Maternal cell contamination [Identifier] in Specimen Nominal (also `35457-1` Amniotic fluid, `40704-9` Blood) | `726741007` is *Maternal cell free DNA* (a substance) - not MCC |
| collectionMethod | PS-029, PS-039 | SNOMED CT `129314006` Biopsy - action, `129304002` Excision - action ([FHIR Specimen Collection Method](https://hl7.org/fhir/R4/valueset-specimen-collection-method.html)) | Same for PS-029 |
| processing.fixative | PS-031 | HL7 v2-0371 `BF10` Buffered 10% formalin | Picklist |
| risk.code | PS-024 | HL7 v2-0489 `INF` Material Danger Infectious | Picklist of reasons only |
| tumour.morphology | PS-017 | SNOMED CT is-a `400177003` Neoplasm and/or hamartoma; LOINC `31206-6` (mCODE Histologic Behavior and Type) | - |
| tumour.topography | PS-018 | SNOMED CT is-a `442083009` Anatomical or acquired body structure | - |
| tumour.stage | PS-036 | LOINC `21902-2` Stage group.pathology Cancer (mCODE TNM Stage Group) | mCODE Cancer Stage ValueSet |
| tumour.grade | PS-037 | LOINC `33732-9` Histology grade [Identifier] in Cancer specimen; SNOMED CT `371469007` Histologic grade of neoplasm | `371469007` |
| tumour.specimenNature | PS-035 | COSD Specimen Nature (pCR0970): 1 Primary tumour, 5 Metastatic site, 9 Not known | `BodyStructure.morphology` child of `14799000` Neoplasm, metastatic |
{:.grid}

#### MDS Picklists to International Codes

**Specimen type (PS-011)** to SNOMED CT, from the HL7 Europe Laboratory [Specimen
Types](https://build.fhir.org/ig/hl7-eu/laboratory/ValueSet-lab-specimenType-eu-lab.html)
value set. Several are not yet in this IG's [Specimen Type](ValueSet-specimen-type.html)
subset.

| MDS | SNOMED CT | MDS | SNOMED CT |
|---|---|---|---|
| PERIPHERAL BLOOD | `122551003` Peripheral blood specimen | LIQUID BLOOD | **To confirm** |
| FETALBLOOD | `737357006` Fetal blood specimen | CORDBLOOD | `122556008` Cord blood specimen |
| POC | `258428005` Products of conception tissue specimen | CVS | `258565009` Chorionic villi specimen |
| AMNIOTIC FLUID | `119373006` Amniotic fluid specimen | URINE | `122575003` Urine specimen |
| SALIVA | `119342007` Saliva specimen | BUCCAL | `733104004` Swab from buccal mucosa |
| CSF | `258450006` Cerebrospinal fluid specimen | PERICARDIAL | `122571007` Pericardial fluid specimen |
| PERITONEAL | `168139001` Peritoneal fluid specimen | PLEURALFLUID | `418564007` Pleural fluid specimen |
| FIBROBLASTS | `119333000` Fibroblast specimen | TUMOUR | `258435002` Tumor tissue specimen |
| BONEMARRROWASPIRATE | `396997002` Specimen from bone marrow obtained by aspiration | BONEMARROWTREPHINE | **To confirm** - not in the HL7 Europe value set |
| LYMPHNODE | `258589002` Lymph node specimen | SKIN | `608969007` Specimen from skin |
| MUSCLE | `705054005` Muscle specimen | SPLEEN | `433308004` Specimen from spleen |
| HEART | `127462005` Specimen from heart | LIVER | `119383005` Specimen from liver |
| KIDNEY | `127473003` Specimen from kidney | OTHER | Text |
{:.grid}

**Specimen state (PS-012)**, **preservative (PS-025)** and **biopsy type (PS-039)**.
The MDS picklists mix specimen type, condition, additive and container, which the
international standards keep apart.

| MDS | MDS value | International code |
|---|---|---|
| PS-012 | FFPE | Specimen type SNOMED CT `441652008` Formalin-fixed paraffin-embedded tissue specimen |
| PS-012 | FRESH | Specimen type SNOMED CT `441479001` Fresh tissue specimen (no v2-0493 code) |
| PS-012 | FROZEN, FLASHFROZEN | Condition v2-0493 `FROZ` Frozen |
| PS-012 | BLOODSPOT | Specimen type SNOMED CT `119294007` Dried blood specimen |
| PS-012, PS-025 | NUCLEICACIDSTABILISER | Additive - **To confirm** |
| PS-025 | EDTA | Additive SNOMED CT `69519002` Edetic acid |
| PS-025 | LITHIUMHEPARIN | Additive SNOMED CT `1256102004` Heparin lithium |
| PS-025 | NONE | v2-0371 `NONE` None |
| PS-025 | STRECK, ROCHE | Container type (cell-free DNA blood collection tube brands), not an additive - **To confirm** codes |
| PS-025 | MEDIUM, SALINE | **To confirm** |
| PS-039 | BIOPSY | SNOMED CT `129314006` Biopsy - action |
| PS-039 | SURGICAL EXCISION | SNOMED CT `129304002` Excision - action |
| PS-039 | LIQUID | Not a collection method - a liquid biopsy is a blood or plasma specimen type. **Open** |
{:.grid}

### Obligations by Modality

From the MDS DGTS Modalities columns. **M** Mandatory, **M IF** Mandatory if the
condition is met, **O** Optional, **-** Not applicable. The Beta Broker rejects a
missing PS-038, PS-002 or PS-003 (hard error); all other elements are permissive.

| Element | MDS | Solid Tumour (Tissue) | Solid Tumour (Blood) | Haem Malignancies | R&ID | PGx | Reanalysis | R&ID Sample Storage | Condition |
|---|---|---|---|---|---|---|---|---|---|
| collector | PS-038 | M | M | M | M | M | - | M | |
| identifier.value | PS-002 | M | M | M | M | M | - | M | |
| identifier.assigner | PS-003 | M | M | M | M | M | - | M | |
| collectedDate | PS-010 | M | M | M | M | M | - | M | |
| type | PS-011 | M | M | M | M | M | - | M | |
| condition | PS-012 | M | M | M | M | M | - | M | |
| additive | PS-025 | M | M | M | M | M | - | M | |
| parentIdentifier | PS-030 | M IF | - | M IF | M IF | M IF | - | M IF | PS-012 is FFPE or tissue |
| processing.fixative | PS-031 | M IF | - | O | O | O | - | O | PS-012 is FFPE or tissue |
| processing.hoursToFixation | PS-032 | O | - | O | O | O | - | O | |
| processing.hoursInFixative | PS-033 | O | - | O | O | O | - | O | |
| processing.tumourEnrichment | PS-034 | O | - | - | - | - | - | - | |
| collectionMethod (is biopsy) | PS-029 | M | - | M | M | - | - | M | |
| collectionMethod (biopsy type) | PS-039 | M | - | - | - | - | - | - | |
| bodySite | PS-019 | M IF | - | - | M IF | - | - | M IF | PS-029 is Y |
| risk | PS-024 | M | M | O | O | O | - | O | |
| assessment.necrosis | PS-013 | O | - | O | - | - | - | - | |
| assessment.nucleatedCellCount | PS-014 | - | - | M | - | - | - | - | |
| assessment.tumourContentWholeSection | PS-015 | M IF | - | M IF | - | - | - | - | PS-012 is FFPE or test method is WGS, and PS-026 not populated |
| assessment.tumourContentMarkedArea | PS-026 | M IF | - | M IF | - | - | - | - | PS-012 is FFPE or test method is WGS, and PS-015 not populated |
| assessment.blasts | PS-023 | - | - | O | - | - | - | - | |
| assessment.maternalCellContamination.observed | PS-021 | - | - | - | M IF | - | - | - | PS-011 is FETALBLOOD, AMNIOTIC FLUID or CVS, and PS-027 not populated |
| assessment.maternalCellContamination.confirmed | PS-027 | - | - | - | M IF | - | - | - | PS-011 is FETALBLOOD, AMNIOTIC FLUID or CVS, and PS-021 not populated |
| tumour.specimenNature | PS-035 | O | O | - | - | - | - | - | |
| tumour.morphology | PS-017 | M IF | - | O | - | - | - | - | test is treatment determining (TR-038) |
| tumour.topography | PS-018 | M IF | - | - | - | - | - | - | test (TR-024) is not GT401 or GT19 |
| tumour.stage | PS-036 | M IF | - | - | - | - | - | - | test (TR-024) is GT401 or GT19 |
| tumour.grade | PS-037 | O | - | - | - | - | - | - | |
{:.grid}

### MDS Items Not in this Model

These Primary sample data elements are not properties of the specimen. They belong to
other domains and are left out of this model.

| MDS | Data element | Where it belongs |
|---|---|---|
| PS-028 | Patient life status at the time of collection (ALIVE, DECEASED) | Patient. Derived from the collection date and `Patient.deceasedDateTime` - not captured |
| PS-022 | Option for all products of conception (SENSITIVEINCINERATION, CREMATION, RETURNTOPATIENT). M IF for R&ID and R&ID Sample Storage when gestation (PCI-039) is under 24 weeks | Consent and disposal of tissue - the patient's wishes, not a laboratory property. Belongs with consent or the order. MDS maps it to `specimen-specialHandling`, whose HL7 v2 table 0376 has storage and transport codes only |
{:.grid}

### Example in HL7 v2

How this model looks in an HL7 v2 `OML_O21` order: the Royal Blackburn Hospital laboratory
(`690D0`) reflexes a tumour BRCA test (M2.1) to the North West GLH from an archived FFPE
block - step 2 of [Pathology to Genomics Reflex - Ovarian Cancer Tumour
BRCA](ExampleScenario-PathologyReflexTumourBRCA.html), also shown with the other
[Sub-order (LAB-35)](hl7v2.html#sub-order-lab-35) examples. The PDF is shortened.

```
MSH|^~\&|LIMS|690D0|RIE|699X0|20261103143000+0000||OML^O21^OML_O21|urn:uuid:3f0c9e52-6b1d-4c1e-9a57-2d8f1b7e4a10|T|2.5.1|||AL
PID|1||9737383389^^^NHS^NH~690D07418265^^^690D0^MR~RXN7316420^^^RXN^MR||BURNLEY^Selyse^^^^^L||19670918|F|||Manchester Road^^Burnley^Lancashire^BB11 9SA
PV1|1|I|^^^RXN02^^^^^^^RXN||||C5678901^FICTITIOUS^Priya^^^Dr^^^GMC|||503^Gynaecological Oncology^2.16.840.1.113883.2.1.6.8|||||||C5678901^FICTITIOUS^Priya^^^Dr^^^GMC||SP2503130417^^^RXN^AN|||||||||||||||||||||||||20250313090000+0000
ORC|NW|G26-04417-1^690D0||||||EPR-552871&RXN^H25-11823&690D0|20261103143000+0000|||C7890123^FICTITIOUS^Morgan^^^Dr^^^GMC|||||||||ROYAL BLACKBURN HOSPITAL LABORATORY^^690D0^^^ODS
OBR|1|G26-04417-1^690D0||M2.1^Ovarian Carcinoma, Multi-target NGS panel - small variant (BRCA1, BRCA2, SMARCA4)^England-GenomicTestDirectory||20261103||||^^^^^^^^^^^^^RXN||||||C7890123^FICTITIOUS^Morgan^^^Dr^^^GMC|||||||||||||||M2^Ovarian Carcinoma^GenomicClinicalIndication
NTE|1||Relapsed high-grade serous ovarian carcinoma, second line. Tumour BRCA for PARP inhibitor eligibility.
OBX|1|CWE|RelapsedDiseaseConfirmation^Confirmation of relapsed high-grade disease, second line of treatment or beyond^NWGMSA||Y^Yes^HL70136||||||F
SPM|1|H25-11823-A3-S1&690D0|H25-11823-A3&690D0|441652008^Formalin-fixed paraffin-embedded tissue specimen^SNM3||BF10^Buffered 10% formalin^HL70371|65801008^Excision^SNM3|15497006^Ovarian structure^SNM3||||||10 x 5 um sections and marked H&E guide slide from block A3|||20250314100000+0000|20250314150000+0000||Y
PV1|1|I|^^^RXN02^^^^^^^RXN||||C5678901^FICTITIOUS^Priya^^^Dr^^^GMC|||503^Gynaecological Oncology^2.16.840.1.113883.2.1.6.8|||||||C5678901^FICTITIOUS^Priya^^^Dr^^^GMC||SP2503130417^^^RXN^AN|||||||||||||||||||||||||20250313090000+0000
ORC|RE|EPR-552871^RXN|H25-11823^690D0||CM|||||||C5678901^FICTITIOUS^Priya^^^Dr^^^GMC|||||||||LANCASHIRE TEACHING HOSPITALS NHS FOUNDATION TRUST^^RXN^^^ODS
OBR|1|EPR-552871^RXN|H25-11823^690D0|HISTO^Histopathology^690D0|||20250314100000+0000|||||||||C5678901^FICTITIOUS^Priya^^^Dr^^^GMC||||||20250321160000+0000|||F
OBX|1|CWE|21855-2^Primary site Cancer^LN^pCR6410^Topography (SNOMED)^COSD||C56.9^Ovary^ICDO3^15497006^Ovarian structure^SNM3||||||F
OBX|2|ED|1054291000000102^Cellular pathology report^SNM3||^application^pdf^Base64^JVBERi0x...||||||F
OBR|2|EPR-552871^RXN|H25-11823^690D0|77753-2^Tumor morphology panel Cancer^LN|||20250314100000+0000|||||||||||||||20250321160000+0000|||F||||EPR-552871&RXN^H25-11823&690D0
OBX|1|CWE|31205-8^Histology ICD-O-3 Cancer^LN^pCR6420^Morphology (SNOMED)^COSD||8461^High grade serous carcinoma^ICDO3^703563003^High grade serous carcinoma^SNM3||||||F
OBX|2|CWE|31206-6^Behavior ICD-O-3 Cancer^LN||3^Malignant, primary site^ICDO3||||||F
OBR|3|EPR-552871^RXN|H25-11823^690D0|TMA^Tumour assessment for molecular testing^690D0|||20250314100000+0000|||||||||||||||20261102110000+0000|||F
NTE|1||Block A3 - tumour area ringed on H&E guide slide
OBX|1|NM|TCC^Tumour cell content^690D0||60|%^percent^UCUM|||||F|||20261102110000+0000
```

> FHIR Message Example: [Bundle Message - Genomics Order - Pathology Reflex](Bundle-GenomicsOrderMessage-PathologyReflex.html)

The Specimen elements are in the genomic order's `SPM` (and `OBR-10`). The assessment and
tumour elements are **prior results** of the pathology order, because they are pathology's
findings, not statements made by genomics.

| Element | MDS | HL7 v2 | In the example |
|---|---|---|---|
| identifier.value, identifier.assigner | PS-002, PS-003 | `SPM-2` | `H25-11823-A3-S1&690D0` - the sections sent, numbered by `690D0` |
| parentIdentifier | PS-030 | `SPM-3` | `H25-11823-A3&690D0` - block A3 |
| collector | PS-038 | `OBR-10` (`XCN.14` assigning facility) | `RXN` - Lancashire Teaching Hospitals, where the surgery was done |
| collectedDate | PS-010 | `SPM-17` | 14 March 2025 |
| type | PS-011, PS-012 | `SPM-4` | `441652008` Formalin-fixed paraffin-embedded tissue specimen |
| condition | PS-012 | `SPM-24` | Not sent - FFPE is carried by the type |
| additive, processing.fixative | PS-025, PS-031 | `SPM-6` | `BF10` Buffered 10% formalin |
| collectionMethod | PS-029, PS-039 | `SPM-7` | `65801008` Excision |
| bodySite | PS-019 | `SPM-8` | `15497006` Ovarian structure |
| risk | PS-024 | `SPM-16` | Not sent - no known infection risk, and no "none" code |
| assessment.tumourContentMarkedArea | PS-026 | Prior `OBR` 3, `OBX` 1 | `TCC` Tumour cell content, 60 % - the tumour area ringed on the H&E guide slide |
| tumour.topography | PS-018 | Prior `OBR` 1, `OBX` 1 | LOINC `21855-2` Primary site: ICD-O-3 `C56.9`, SNOMED CT `15497006` |
| tumour.morphology | PS-017 | Prior `OBR` 2, `OBX` 1-2 | LOINC `31205-8` Histology: ICD-O-3 `8461`, SNOMED CT `703563003` High grade serous carcinoma; `31206-6` Behaviour: malignant |
| tumour.stage, tumour.grade, tumour.specimenNature | PS-036, PS-037, PS-035 | - | Not sent as discrete results (not required for M2.1); stage is in the PDF text |
{:.grid}

#### What the reader sees

The same order, shown the way a genomic scientist would read it: the specimen sent, then the
prior results from pathology, then the attached pathology report (the `OBX` of type `ED`) as it
appears when the PDF is opened. The mock is fictitious. The small grey labels show which HL7 v2
segments each block comes from - a real viewer would not show them.

<div style="border:1px solid #bbb; box-shadow:0 2px 8px rgba(0,0,0,0.15); background:#fff; color:#222; max-width:820px; margin:16px auto; padding:28px 36px; font-family:Arial,sans-serif; font-size:14px; line-height:1.5;">

<div style="display:flex; justify-content:space-between; align-items:flex-start; border-bottom:2px solid #333; padding-bottom:8px; margin-bottom:12px;">
  <div>
    <div style="font-size:20px; font-weight:bold;">Genomic Reflex Order G26-04417-1</div>
    <div>From Royal Blackburn Hospital Laboratory (690D0) to North West GLH (699X0)</div>
  </div>
  <div style="font-size:12px; color:#c00; font-weight:bold; border:1px solid #c00; padding:2px 6px;">FICTITIOUS EXAMPLE</div>
</div>

<div style="font-size:11px; color:#888;">PID &middot; PV1 &middot; ORC &middot; OBR &middot; NTE &middot; OBX (ask at order entry)</div>
<table style="width:100%; font-size:13px; margin-bottom:12px; border:none;">
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Patient</b></td><td style="border:none;">BURNLEY, Selyse (F)</td><td style="border:none;"><b>NHS Number</b></td><td style="border:none;">973 738 3389</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Date of birth</b></td><td style="border:none;">18-Sep-1967</td><td style="border:none;"><b>Hospital numbers</b></td><td style="border:none;">690D07418265 (690D0), RXN7316420 (RXN)</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Test</b></td><td style="border:none;">M2.1 Ovarian Carcinoma, Multi-target NGS panel - small variant (BRCA1, BRCA2, SMARCA4)</td><td style="border:none;"><b>Ordered</b></td><td style="border:none;">03-Nov-2026</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Ordered by</b></td><td style="border:none;">Dr Morgan FICTITIOUS (GMC C7890123), Royal Blackburn Hospital Laboratory</td><td style="border:none;"><b>Relapsed disease</b></td><td style="border:none;">Yes - second line or beyond</td></tr>
</table>
<p style="margin:2px 0 12px;"><i>Relapsed high-grade serous ovarian carcinoma, second line. Tumour BRCA for PARP inhibitor eligibility.</i></p>

<div style="font-size:11px; color:#888;">SPM &middot; OBR-10 - the Primary sample (this model)</div>
<div style="font-size:16px; font-weight:bold; border-bottom:1px solid #999; margin:10px 0 6px;">Specimen sent</div>
<div style="margin-left:20px;">
Sections: <b>H25-11823-A3-S1</b> (690D0), cut from block <b>H25-11823-A3</b><br/>
Type: <b>Formalin-fixed paraffin-embedded tissue specimen</b> &nbsp; Fixative: <b>Buffered 10% formalin</b><br/>
Collection: <b>Excision</b>, <b>ovary</b>, at <b>Lancashire Teaching Hospitals (RXN)</b> on <b>14-Mar-2025</b><br/>
Sent: <b>10 x 5 &micro;m sections and marked H&amp;E guide slide from block A3</b>
</div>

<div style="font-size:11px; color:#888; margin-top:14px;">PATIENT_VISIT_PRIOR (PV1) &middot; ORDER_PRIOR ORC, OBR 1</div>
<div style="font-size:16px; font-weight:bold; border-bottom:1px solid #999; margin:4px 0 6px;">Prior results - Histopathology H25-11823</div>
<div style="margin-left:20px;">
Original order: <b>EPR-552871</b> (RXN) &nbsp; Laboratory number: <b>H25-11823</b> (690D0)<br/>
Requested by: <b>Dr Priya FICTITIOUS</b> (GMC C5678901), Gynaecological Oncology, <b>Lancashire Teaching Hospitals NHS Foundation Trust</b><br/>
Hospital spell: <b>SP2503130417</b>, inpatient ward RXN02, admitted 13-Mar-2025<br/>
Collected: <b>14-Mar-2025</b> &nbsp; Reported: <b>21-Mar-2025</b> &nbsp; Status: <b>Final</b>
</div>

<div style="font-size:11px; color:#888; margin-top:8px;">OBR 1 &middot; OBX 1 &middot; OBR 2 (LOINC 77753-2 Tumor morphology panel) &middot; OBX 1-2</div>
<div style="font-weight:bold;">DIAGNOSIS</div>
<div style="margin-left:20px;">
Primary site: <b>Ovary</b> (ICD-O-3 C56.9; SNOMED CT 15497006)<br/>
Histology: <b>High grade serous carcinoma</b> (ICD-O-3 8461; SNOMED CT 703563003)<br/>
Behaviour: <b>Malignant, primary site</b>
</div>

<div style="font-size:11px; color:#888; margin-top:8px;">OBR 3 (TMA) &middot; NTE &middot; OBX 1 - a later result of the same pathology order</div>
<div style="font-weight:bold;">TUMOUR ASSESSMENT FOR MOLECULAR TESTING - 02-Nov-2026</div>
<div style="margin-left:20px;">
Block A3 - tumour area ringed on H&amp;E guide slide<br/>
Tumour cell content: <b>60 %</b>
</div>

<div style="font-size:11px; color:#888; margin-top:14px;">OBR 1 &middot; OBX 2 (type ED, application/pdf) - the attached report, as shown when the PDF is opened</div>
<div style="border:1px solid #999; background:#fafafa; margin:4px 0 0; padding:18px 24px; font-family:Georgia,'Times New Roman',serif; font-size:14px;">

<div style="display:flex; justify-content:space-between; border-bottom:1px solid #333; padding-bottom:6px; margin-bottom:8px;">
  <div><div style="font-size:18px; font-weight:bold;">Histopathology Report</div><div>Royal Blackburn Hospital Laboratory</div></div>
  <div style="text-align:right; font-size:13px;">Lab No: <b>H25-11823</b><br/>Final report</div>
</div>
<table style="width:100%; font-size:13px; margin-bottom:8px; border:none;">
<tr><td style="border:none; padding:1px 8px 1px 0;"><b>Patient</b></td><td style="border:none;">BURNLEY, Selyse</td><td style="border:none;"><b>NHS No</b></td><td style="border:none;">973 738 3389</td></tr>
<tr><td style="border:none; padding:1px 8px 1px 0;"><b>DOB</b></td><td style="border:none;">18-Sep-1967</td><td style="border:none;"><b>Hospital No</b></td><td style="border:none;">RXN7316420</td></tr>
<tr><td style="border:none; padding:1px 8px 1px 0;"><b>Requested by</b></td><td style="border:none;">Dr P FICTITIOUS, Gynaecological Oncology, Lancashire Teaching Hospitals</td><td style="border:none;"><b>Received</b></td><td style="border:none;">14-Mar-2025</td></tr>
</table>
<p style="margin:2px 0 6px;"><b>Clinical details.</b> Pelvic mass with omental disease and raised CA125. Primary debulking surgery.</p>
<p style="margin:2px 0 6px;"><b>Specimen.</b> A: Total abdominal hysterectomy, bilateral salpingo-oophorectomy and omentectomy.</p>
<p style="margin:2px 0 6px;"><b>Macroscopy.</b> The right ovary is replaced by a solid and cystic tumour, 85 mm in maximum dimension, with surface involvement. The left ovary, uterus and tubes are unremarkable to the eye. The omentum contains tumour deposits up to 30 mm. Blocks A1 to A3 right ovarian tumour, A4 left ovary, A5 uterus, A6 omentum.</p>
<p style="margin:2px 0 6px;"><b>Microscopy.</b> The right ovarian tumour is a high-grade serous carcinoma, with marked nuclear pleomorphism and frequent mitoses. Omental deposits of carcinoma are present. The left ovary, uterus and fallopian tubes are not involved. Immunohistochemistry: WT1 positive; p53 aberrant (null pattern).</p>
<div style="border:1px solid #999; background:#fff; padding:6px 10px; margin:4px 0 8px;"><b>Diagnosis.</b> Right ovary: high-grade serous carcinoma, with omental metastases. FIGO stage IIIC (pT3c).</div>
<p style="margin:2px 0 6px;"><b>Comment.</b> FFPE blocks A1 to A6 are retained in the laboratory archive.</p>
<div style="border-top:1px solid #333; padding-top:4px; font-size:13px;">Reported by: Dr M FICTITIOUS, Consultant Histopathologist &nbsp;&middot;&nbsp; Authorised: 21-Mar-2025 16:00</div>
</div>

</div>

**Reading the mock**

- The **header** is the genomic order itself: what is asked for and by whom. Pathology is the
  Order Placer, so the order is from `690D0`.
- **Specimen sent** is this logical model - `SPM` and `OBR-10`. It describes the sections sent,
  not the original resection specimen.
- **Prior results** keep the original pathology order's own identity: its numbers, the
  requesting clinician and Trust (`RXN`), the hospital spell, dates and status. The genomic
  report can be sent back to that clinician.
- The **Diagnosis** block is the discrete data genomics checks against the MDS (PS-017, PS-018).
  The same facts are in the PDF, written for a person to read.
- The **Tumour assessment** is not in the PDF: it is a later result of the same pathology order
  (reported 02-Nov-2026), made when block A3 was selected for this test (PS-026).
- The **PDF** is the report the clinician received in March 2025. It carries detail that is not
  sent as discrete results, such as the stage and the IHC.

### Open Issues

| MDS | Issue |
|---|---|
| PS-014, PS-021, PS-027 | MDS codes do not mean what the data element says - see [Terminology](#terminology). |
| PS-014, PS-026 | No international code identified. |
| PS-024 | The MDS values are clinical reasons (conditions) for the risk, not a risk code. Modelled as `risk.code` (v2-0489) plus `risk.reason` (SNOMED CT condition). FHIR R4 has no core Specimen element for HL7 v2 `SPM-16`. |
| PS-030, PS-031 | The condition "state is FFPE or tissue" - tissue is not a PS-012 value. **To confirm** whether this means the specimen type is a tissue. |
| PS-021, PS-027 | MDS value set is TEXT, but the FHIR mapping is `valueBoolean` and `valueQuantity`. Modelled as the FHIR mapping; MCC units **to confirm**. LOINC `59266-7` is a Nominal result. |
| PS-013, PS-014, PS-015, PS-023, PS-026 | MDS value set is INTEGER (%). Modelled as Quantity (UCUM `%`), as an Observation value. |
| PS-038 | FHIR conformance is 0..1, but the element is mandatory for every modality and a hard error in the Beta Broker. Modelled as 1..1. |
| PS-018 | FHIR conformance is `BodyStructure.location` 1..1, but the element is Mandatory IF. Modelled as 0..1. |
| PS-017, PS-018, PS-035, PS-036, PS-037 | Tumour content duplicates the cancer pathology report. **Open** whether the order should carry them, or reference the pathology report (Genomic Test Order `pathologyReport`). |
| PS-002, PS-003 | The local id assigned by the sending organisation, carried in `Specimen.identifier` (MDS cites the system `https://fhir.nhs.uk/local-identifier/specimen`). It is not the [NGIS Primary Sample Identifier](NamingSystem-NGIS-PrimarySampleIdentifier.html), which is the GLH's id carried in `Specimen.accessionIdentifier`. |
{:.grid}
