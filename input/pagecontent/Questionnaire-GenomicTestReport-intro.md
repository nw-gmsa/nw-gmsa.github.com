This Questionnaire describes the common requirement for a Genomic Test
Report, extended by Report Panel Questionnaires for each kind of individual
test finding - see [Report Panels](#report-panels) below for the full list.

Although this Questionnaire is genomics-specific in name, the model it
describes - Patient, Hospital Spell, Diagnostic Workflow and Results - is a
**core model for diagnostic reports generally**, not something unique to
genomics. The same shape applies equally to pathology, radiology and clinical
referral reports; genomics is simply the domain this IG documents it against
first. See [Diagnostic Core](diagnostic-core.html) for the basic model this
Questionnaire adds detail to, and how it relates to [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) on the order side.

## References

- [HL7 Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) (HL7 v2,5,1)
- HL7 International [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html) (HL7 FHIR)
    - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- [openEHR Genomics Project](https://ckm.openehr.org/ckm/projects/1013.30.50)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- The Royal College of Radiologists [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)
- [NHS England Genomics DiagnosticReport](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-DiagnosticReport) use text descriptions only, not the rendered profile.
- [HL7 Europe Core - DiagnosticReport](https://hl7.eu/fhir/base/2.0.0-ballot/StructureDefinition-diagnosticReport-eu-core.html)

## Domain Archetype

<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#obr" _target="_blank">OBR</a>
</div>

This is a **level 2** (field-level) view of the [basic model](diagnostic-core.html#entity-relationship-diagram)
introduced in Diagnostic Core, showing the entities and key attributes a
Genomic Test Report actually carries:

```mermaid
erDiagram
    Patient ||--|{ DiagnosticReport : subject
    HospitalSpell ||--o{ DiagnosticReport : encounter
    ServiceRequest |o--o{ DiagnosticReport : "basedOn (optional)"
    DiagnosticReport }o--o{ PractitionerRole : "performer / resultsInterpreter"
    PractitionerRole }o--|| Organization : organization
    DiagnosticReport ||--o{ Specimen : specimen
    DiagnosticReport ||--o{ Observation : "result (Report Panels)"
    DiagnosticReport ||--o| Binary : "presentedForm (Attachment.url)"
    DocumentReference ||--o| Binary : "content (Attachment.url)"

    Patient {
        Identifier nhsNumber
        Identifier medicalRecordNumber
    }

    HospitalSpell {
        Identifier hospitalProviderSpellIdentifier
    }

    ServiceRequest {
        Identifier orderIdentifier "Placer/Filler Order Number"
    }

    DiagnosticReport {
        Identifier reportIdentifier
        code code "Procedure/Test Code"
        dateTime effectiveDateTime "Report Date"
        code status "Report Status"
        string conclusion
        CodeableConcept conclusionCode "Outcome"
    }

    PractitionerRole {
        Identifier practitionerIdentifier
    }

    Organization {
        Identifier organisationCode
    }

    Specimen {
        Identifier specimenId
        Identifier accessionIdentifier
    }

    Observation {
        code code "Panel-specific finding"
    }

    DocumentReference {
        code type "Narrative Report"
    }

    Binary {
        code contentType
        base64Binary data
    }
```

`ServiceRequest` is shown as **optional** (`basedOn`) because it is only
present for a **closed-loop** report - one answering a specific prior order
the reporting system already knows about. An **unsolicited** report,
produced without a matching order ever having been received, has no order to
reference - see [Order Reference](#order-reference) below.

**Narrative Report.** The full report, as a PDF, is HL7 v2's `OBX (type =
ED)` - see [OBX (type = ED)](hl7v2.html#obx-type--ed), whose own v2-to-FHIR
conversion mapping is to `DocumentReference`. `DiagnosticReport.presentedForm`
and `DocumentReference.content` are both just an `Attachment` with a `url` -
in this IG, both point at the **same** `Binary` resource holding the actual
PDF bytes, rather than each carrying its own separate copy. `DocumentReference`
is the resource this content would be shared via (e.g. IHE XDS.b/MHD, or the
NHS England National Record Locator), while `DiagnosticReport.presentedForm`
is the more direct route for a system that already holds the `DiagnosticReport`
and just wants the PDF alongside it.

### Diagnostic Report

#### Unstructured and Structured Laboratory Reports

A laboratory report contains both structured and unstructured information, and they complement each other rather than replace one another.

- Structured data consists of discrete, machine-readable elements such as the patient, specimen, request, observations (test results), identifiers, and reporting clinician. In HL7 FHIR these are represented by resources such as Patient, Specimen, ServiceRequest, Observation, Practitioner, and DiagnosticReport. In HL7 v2 these correspond to segments such as PID, SPM, ORC, OBR, and OBX.
- Unstructured data is the human-readable laboratory report (typically a PDF) that includes the full clinical interpretation, comments, formatting, signatures, and contextual information that may not be represented as discrete data. In FHIR this is attached to the DiagnosticReport.presentedForm (or referenced via DocumentReference), while in HL7 v2 it is commonly carried in OBX segments using encapsulated data (ED).

The Laboratory Report acts as the bridge between these two worlds. It references the structured observations for computer processing, clinical decision support, analytics, and interoperability, while also linking to the complete unstructured report that clinicians view as the authoritative laboratory document. This approach ensures that systems can exchange computable data without losing the rich narrative and legal record contained in the original laboratory report.

##### Laboratory Report with FHIR and V2 Mappings

<img style="padding:3px;width:95%;" src="LaboratoryReportExplainedPage1.drawio.png" alt="Genomic Report Page 1"/>
<br clear="all">

<img style="padding:3px;width:95%;" src="LaboratoryReportExplainedPage2.drawio.png" alt="Genomic Report Page 1"/>
<br clear="all">

##### Laboratory Report with detailed FHIR Mappings

<img style="padding:3px;width:95%;" src="LaboratoryReportExplained.drawio.png" alt="Genomic Report Page 1"/>
<br clear="all">

##### FHIR Document / Clinical Document Architecture

> The FHIR DiagnosticReport illustrated above is well suited to workflow-based information exchange, where structured clinical data is exchanged between systems and individual observations can be processed, queried, and acted upon. However, it may be less suitable for document sharing use cases, such as IHE XDS/MHD or the NHS England National Record Locator (NRL), where the laboratory report is exchanged as a complete clinical document. In these scenarios, the preferred approach is a FHIR Document (the FHIR equivalent of a Clinical Document Architecture (CDA) document), which packages the report into a self-contained, attested document with a Composition resource as its root. This preserves the report as a legal and clinical record while still allowing structured data to be included.
>
> Further details are available in the Document Perspective section of the HL7 Europe Laboratory Implementation Guide: [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/index.html)
>
> NW Genomics example [FHIR Document - Genomic Report](Bundle-FHIRDocumentGeneticReportBundle2.html)

##### Laboratory Report with FHIR Composition Mappings

<img style="padding:3px;width:95%;" src="LaboratoryReportDocumentExplained.drawio.png" alt="Genomic Report Page 1"/>
<br clear="all">

### Detailed Model

Metadata is data that applies to the patient's entire clinical pathway and so it extends beyond diagnostic tests.
Test detail tends to be common across all diagnostic tests in a patient's pathway, not just genomics.

#### Patient Demographics

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#pid" _target="_blank">PID</a>
</div>

| Name                  | LOINC | Value Set / Data Type                                                 | Cardinality | HL7 v2 OML_O21 Message | HL7 FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html) | HL7 FHIR Resource (Message + RESTful)       |
|-----------------------|-------|-----------------------------------------------------------------------|-------------|------------------------|--------------------------------------------------------------------|---------------------------------------------|
| NHS Number            |       | [NHS Number](StructureDefinition-NHSIdentifier.html)                  | 0..1        | [PID](hl7v2.html#pid)  | ServiceRequest.subject.identifier                                  | [Patient](StructureDefinition-Patient.html) |
| Medical Record Number |       | [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 0..1        | [PID](hl7v2.html#pid)  | ServiceRequest.subject.identifier                                  | [Patient](StructureDefinition-Patient.html) |
{:.grid}

#### Hospital Spell

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-HospitalSpell.html" _target="_blank">Hospital Spell</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#pv1" _target="_blank">PV1</a>
</div>

Treat as mandatory for reflex or subcontracted orders.

| Name                                  | LOINC   | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html)                                                       | HL7 FHIR Resource (Message + RESTful)                                        |
|---------------------------------------|---------|---------------------------------------------------------------------------------------------|-------------|--------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Hospital Service                      |         | [Service](ValueSet-service.html)                                                            | 0..1        | [PV1](hl7v2.html#pv1)-10 |                                                                                | Encounter.serviceType                                                        | 
| Case Identification or Account Number | 56797-4 | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 0..1        | [PV1](hl7v2.html#pv1)-19 | ServiceRequest.encounter.identifier | Encounter.identifier [HospitalSpell](StructureDefinition-HospitalSpell.html) |
{:.grid}

#### Diagnostic Workflow

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#obr" _target="_blank">OBR</a>
</div>

##### Order Reference

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#orc" _target="_blank">ORC</a>
</div>

`DiagnosticReport.basedOn` references the `ServiceRequest` (order, per
[Genomic Test Order](Questionnaire-GenomicTestOrder.html)) that this report
answers, carried in HL7 v2 as `ORC-2`/`ORC-3` (see the Order Number row
below).

- **Closed-loop referral:** where the reporting system already holds the
  original order (e.g. it filled that order itself, or was told about it via
  a prior [LAB-1](LTW.html#laboratory-order-lab-1)), `basedOn` is populated
  and this section is present.
- **Unsolicited report:** `ORU_R01` (and its FHIR Message equivalent) is
  explicitly designed to also support reporting a result for an order the
  receiving system never saw in the first place. In that case there is no
  `ServiceRequest` to reference, `basedOn` is absent, and this section - and
  the Order Number row below - simply doesn't apply.

See [ctDNA Management Information - How the Two Event Messages Link
Together](NEYManagementInformation.html#how-the-two-event-messages-link-together)
for a fuller worked explanation of solicited vs unsolicited reports in this
IG.

| Name                     | Description                                                                                                                           | Value Set / Data Type                                                                          | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 FHIR [DiagnosticReport](StructureDefinition-DiagnosticReport.html) | HL7 FHIR Resource (RESTful)                               |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|-------------|------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------|
| Order Number             | The Unique order number assigned by the Order Placer (order comms or EHR), that requested the report - absent for an unsolicited report, see [Order Reference](#order-reference) above. | [Order Identifier](StructureDefinition-OrderIdentifier.html)                                   | 0..1        | [ORC](hl7v2.html#orc)-2                  | DiagnosticReport.basedOn                                               | [ServiceRequest](StructureDefinition-ServiceRequest.html) |
| Report Number            | Identifies the report, assigned by Order Filler (LIMS)                                                                                | [Report Identifier](StructureDefinition-ReportIdentifier.html)                                 | 1..1        | [OBR](hl7v2.html#obr)-3                  | DiagnosticReport.identifier[ReportNumber]                              |                                                             |
| (Order) Procedure Code   | For Genomics this is Test Directory Code. (For Radiology this is NICIP code)                                                          | See below                                                                                      | 1..1        | [OBR](hl7v2.html#obr)-4                  | DiagnosticReport.code                                                  |                                                             |
| Account(/Visit) Number   | Assigned by the Order Placer where it is known as spell or episode id. It is used by all diagnostics to link tests to a spell/episode | [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html) |             | PV1-19                                   | DiagnosticReport.encounter                                             |                                                             |
| Report date              | Date/time the report was issued                                                                                                       |                                                                                                | 1..1        | [OBR](hl7v2.html#obr)-7                  | DiagnosticReport.effectiveDateTime                                     |                                                             |
| Report Status            |                                                                                                                                       |                                                                                                | 1..1        | OBR-22                                   | DiagnosticReport.status                                                |                                                             |
| Conclusion               | Conclusion                                                                                                                            |                                                                                                |             |                                          | DiagnosticReport.conclusion                                            |                                                             |
| Outcome                  | Conclusion Code                                                                                                                       | [Genomic Test Outcome Codes](ValueSet-GenomicTestOutcomeCodes.html)                            | 0..1        | [OBX](hl7v2.html#obx) LOINC 51968-6             | DiagnosticReport.conclusionCode                                        |                                                             |
| Results Interpreter      | Who created the report                                                                                                                | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)             | 0..*        | [OBR](hl7v2.html#obr)-32 and OBR-33      | DiagnosticReport.resultsInterpreter                                    | [Practitioner](StructureDefinition-Practitioner.html)     |                                                                                            
| Performer (operator)     |                                                                                                                                       | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)             | 1..*        | [OBR](hl7v2.html#obr)-34                 | DiagnosticReport.performer[operator]                                   | [Practitioner](StructureDefinition-Practitioner.html)     |
| Performer (organisation) | The organisation who created the report                                                                                               | [Organisation Code](StructureDefinition-OrganisationCode.html)                                 | 1..*        |                                          | DiagnosticReport.performer[organization]                               | [Organizaton](StructureDefinition-Organization.html)      |
| Specimen                 | The sample(s) that were used for testing                                                                                              | See [Genomic Test Order - Specimen](Questionnaire-GenomicTestOrder.html#specimen)          | 0..1        | [SPM](hl7v2.html#spm)                    | DiagnosticReport.specimen.identifier                                   | [Specimen](StructureDefinition-Specimen.html)             |
| Results                  | Detailed (strucutured) results                                                                                                        | Domain specific - see below                                                                    | 0..*        | [OBX](hl7v2.html#obx)                    | DiagnosticReport.results                                               | Varies                                                    |   
| Narrative Report         | Results and entire Report in PDF representation                                                                                       | Domain specific - see below                                                                    | 0..*        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | DiagnosticReport.presentedForm                                         |                                                             |
{:.grid}


## Results

`DiagnosticReport.result` (see [Detailed Model](#detailed-model) above) is
where the individual findings of a test live. This is specific to genomics
and focused on the requirements of general clinicians, not genomic
specialists, so this section will tend to be an extract of the wider
[Genomics Reporting Implementation
Guide](https://build.fhir.org/ig/HL7/genomics-reporting/general.html) rather
than a complete restatement of it. It divides into two parts:

- **[Report Panels](#report-panels)** - the computable data models (FHIR
  Questionnaires) this IG has built for specific kinds of result, each
  `derivedFrom`/extended from [Genomic Test
  Report](Questionnaire-GenomicTestReport.html) the same way Ask At Order
  Entry Questionnaires extend [Genomic Test
  Order](Questionnaire-GenomicTestOrder.html).
- **[Genomic Results](#genomic-results)** - the underlying HL7 FHIR Genomics
  Reporting profiles and resources those panels (and this IG's other genomic
  content) are built from. Some of these are also modelled as a Report Panel
  Questionnaire above - where that's the case, the table below says so rather
  than repeating the same content twice.

```mermaid
classDiagram
    class GenomicReport["Genomic Laboratory Report (result)"]
    class Variant
    class GenomicStudy["Genomic Study"]
    class DiagnosticImplication["Diagnostic Implication"]
    class TherapeuticImplication["Therapeutic Implication"]
    class GenomicStudyAnalysis["Genomic Study Analysis"]

    Variant --|> GenomicReport 
    GenomicStudy --|> GenomicReport
    GenomicStudyAnalysis --|> GenomicReport
    DiagnosticImplication --|> GenomicReport
    TherapeuticImplication ..|> GenomicReport
    Variant <|--|> DiagnosticImplication
    Variant <|..|> TherapeuticImplication
```

### Report Panels

[Genomic Test Report](Questionnaire-GenomicTestReport.html) only models the
report-level metadata common to every report (patient, order/report
identifiers, dates, status, conclusion, performers) - its `/Results` group
deliberately doesn't model individual test findings inline. Instead, each
individual result is carried under `DiagnosticReport.result` as a separate,
panel-specific Questionnaire, one per kind of test - each documenting the
discrete fields a particular result type needs, in the same
Questionnaire-as-computable-data-model style as [Genomic Test
Report](Questionnaire-GenomicTestReport.html) and [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) themselves (see [How To Engineer
(scale and deliver)
Interoperability](HowToEngineerInteroperability.html#documenting-the-data-model)).

| Report Panel Questionnaire | Code | Used In | Status |
|---|---|---|---|
| [Reportable Variant Result Panel](Questionnaire-ReportableVariantResultPanel.html) | LOINC `81250-3` "Discrete genetic variant panel" | [OMICS DSS Result Integration](reportable-variants.html) | Grounded in real `Variant` examples |
| [BCR-ABL Monitoring Result Panel](Questionnaire-BCRABLResultPanel.html) | LOINC `69380-4` "BCR-ABL1 fusion transcript ... [# Ratio] ... (International Scale)" | [BCR-ABL Monitoring](BCRABLMonitoring.html) | Grounded in real `Observation` examples |
| [Chimerism Testing Result Panel](Questionnaire-ChimerismResultPanel.html) | Local code (STR-based chimerism testing) | [Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html) | Candidate mapping, not yet confirmed against a real example - see the Questionnaire's own description |
{:.grid}

New result types should follow this pattern - add a new panel Questionnaire
(rather than extending [Genomic Test
Report](Questionnaire-GenomicTestReport.html) itself), and list it in the
table above.

### Genomic Results

The underlying HL7 FHIR profiles/resources this IG's genomic results are
built from - either directly, or (where noted) via one of the [Report
Panels](#report-panels) above:

| Genomic Result | Code | Used In | Report Panel |
|---|---|---|---|
| [Genomic Study (Procedure)](StructureDefinition-GenomicStudy.html) - [description](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-study) | - | [Examples](#examples) below (Lynch syndrome, cystic fibrosis carrier) | *(none yet)* |
| [Genomic Study Analysis](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html) (extension on Genomic Study) | LOINC `48002-0` "Genomic source class [Type]" | Not yet confirmed against a real example | *(none yet)* |
| [Laboratory Analyte Result (Observation)](StructureDefinition-LaboratoryAnalyteResult.html) | - | [BCR-ABL Monitoring](BCRABLMonitoring.html) | [BCR-ABL Monitoring Result Panel](Questionnaire-BCRABLResultPanel.html) |
| [Reportable Variant (Observation)](StructureDefinition-Variant.html) | LOINC `48018-6` "Gene studied [ID]" (component) | [OMICS DSS Result Integration](reportable-variants.html) | [Reportable Variant Result Panel](Questionnaire-ReportableVariantResultPanel.html) |
| [Molecular Consequence (Observation)](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-molecular-consequence.html) | Sequence Ontology (`functional-effect`), e.g. `SO_0001786` loss_of_heterozygosity | [OMICS DSS Result Integration](reportable-variants.html) - see [Outstanding Issues](reportable-variants.html#outstanding-issues) for why Loss of Heterozygosity is modelled this way | [Reportable Variant Result Panel](Questionnaire-ReportableVariantResultPanel.html) |
| [Diagnostic Implication (Observation)](StructureDefinition-DiagnosticImplication.html) - [description](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-implications) | - | [Examples](#examples) below (Lynch syndrome, cystic fibrosis carrier) | *(none yet)* |
| [Histocompatibility and Immunogenetic Reporting](https://hl7.org/fhir/uv/genomics-reporting/histocompatibility.html) | - | [Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html) | [Chimerism Testing Result Panel](Questionnaire-ChimerismResultPanel.html) (candidate mapping by analogy, not confirmed - see the Questionnaire's own description) |
| Cytogenetic Genomic Report *(this IG's own future/proposed model - no balloted HL7 profile exists yet)* | LOINC cytogenetics panels, e.g. `62389-2` (master panel), `62356-1` (ISCN), `62367-8` (FISH) | [Haemato-Oncology Diagnostic Pathway - Future genomic data model (proposed)](HaematoOncologyPathway.html#future-genomic-data-model-proposed) | *(none yet - proposed direction only)* |
{:.grid}

## Examples

### Inherited MMR deficiency (Lynch syndrome) - R210

HL7 LRI (Ref A) Example 2 (5.9.1.2) - FOUND DISCRETE – TARGETED MUTATIONS ANALYSIS THAT STUDIES MANY MUTATIONS (106)

- [Patient LIVERPOOL](Patient-Patient-Liverpool.html) <span class="badge badge-info">Patient Administration</span>
- [Genomic Study- Inherited MMR deficiency (Lynch syndrome)](Procedure-f0036554-cd1a-463c-ac8a-d891ca409af9.html) <span class="badge badge-primary">Genomics</span>
- [Diagnostic Implication - Lynch syndrome](Observation-6beb613f-d303-42af-b025-86e8e0872061.html) <span class="badge badge-primary">Genomics</span>
- [Variant NTHL1](Observation-8385c2fd-313d-4fd5-b98e-d5ea4bae6f99.html) <span class="badge badge-primary">Genomics</span>

#### Primary or Secondary Care Examples

- [Condition - Lynch syndrome](Condition-c8f82825-e4cb-4e1f-b728-3fd2808e93db.html) <span class="badge badge-secondary">Patient Care</span>
- [Observation - Lynch Syndrome Mutation Finding](Observation-4490c092-c78c-480a-8cb7-653b70113fd5.html) <span class="badge badge-secondary">Patient Care</span>

#### Genetic Counseling Examples

- [FamilyMemberHistory - Son Patient Leeds](FamilyMemberHistory-074ea905-8d91-452c-af3c-15b5b860fdb2.html) <span class="badge badge-secondary">Patient Care</span>
- [FamilyMemberHistory - Mother Patient Nottingham](FamilyMemberHistory-c76b8bc2-ec36-4ce1-a2ea-8c57215115e2.html) <span class="badge badge-secondary">Patient Care</span>

### Cystic fibrosis Carrier R184

HL7 LRI (Ref A) Example 3 (5.9.1.3)  - SIMPLE VARIANT – MUTATION ANALYSIS WITH SEQUENCE PLUS DELETION-DUPLICATION STUDY

- [Patient LANCASTER](Patient-Patient-Lancaster.html) <span class="badge badge-info">Patient Administration</span>
- [RelatedPerson](StructureDefinition-RelatedPerson-examples.html)  <span class="badge badge-info">Patient Administration</span>
- [Genomic Study - Cystic fibrosis carrier testing](Procedure-7b362aa5-41a7-4168-94b4-f12dff0dfb2a.html) <span class="badge badge-primary">Genomics</span>
- [Diagnostic Implication - Cystic Fibrosis Carrier](Observation-a954a98c-f427-4968-9022-8b760de66628.html) <span class="badge badge-primary">Genomics</span>
- [Variant CFTR](Observation-bca547c1-78a5-41be-8cfc-03c05805ac85.html) <span class="badge badge-primary">Genomics</span>
