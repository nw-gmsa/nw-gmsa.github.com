## References

- A. [HL7 Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) (HL7 v2,5,1)
- B. HL7 International [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html) (HL7 FHIR)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- C. [openEHR Genomics Project](https://ckm.openehr.org/ckm/projects/1013.30.50)
- D. [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)

## Domain Archetype

<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

<figure>
{%include LaboratoryReport-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - MindMap</p>
</figure>
<br clear="all">

### Diagnostic Report

Metadata is data that applies to the patient's entire clinical pathway and so it extends beyond diagnostic tests.
Test detail tends to be common across all diagnostic tests in a patient's pathway, not just genomics.

<span class="badge badge-info">Patient Demographics</span>


| Name                  | LOINC | Value Set / Data Type                                                 | Cardinality | HL7 v2 OML_O21 Message | HL7 FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html) | HL7 FHIR Resource (Message + RESTful)       |
|-----------------------|-------|-----------------------------------------------------------------------|-------------|------------------------|--------------------------------------------------------------------|---------------------------------------------|
| NHS Number            |       | [NHS Number](StructureDefinition-NHSIdentifier.html)                  | 0..1        | [PID](hl7v2.html#pid)  | ServiceRequest.subject.identifier                                  | [Patient](StructureDefinition-Patient.html) |
| Medical Record Number |       | [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 0..1        | [PID](hl7v2.html#pid)  | ServiceRequest.subject.identifier                                  | [Patient](StructureDefinition-Patient.html) |
{:.grid}

<span class="badge badge-info">Hospital Spell</span>

Treat as mandatory for reflex or subcontracted orders.

| Name                                  | LOINC   | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html)                                                       | HL7 FHIR Resource (Message + RESTful)                                        |
|---------------------------------------|---------|---------------------------------------------------------------------------------------------|-------------|--------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Hospital Service                      |         | [Service](ValueSet-service.html)                                                            | 0..1        | [PV1](hl7v2.html#pv1)-10 |                                                                                | Encounter.serviceType                                                        | 
| Case Identification or Account Number | 56797-4 | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 0..1        | [PV1](hl7v2.html#pv1)-19 | ServiceRequest.encounter.identifier | Encounter.identifier [HospitalSpell](StructureDefinition-HospitalSpell.html) |
{:.grid}

<div class="alert alert-info" role="alert">
<b><a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>

<span class="badge badge-primary">Diagnostic Workflow</span>

| Name                     | LOINC   | Value Set / Data Type                                                              | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 FHIR [DiagnosticReport](StructureDefinition-DiagnosticReport.html) | HL7 FHIR Resource (RESTful)                               |
|--------------------------|---------|------------------------------------------------------------------------------------|-------------|------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------|
| Order Identifier         |         | [Order Identifier](StructureDefinition-OrderIdentifier.html)                       | 1..1        | [ORC](hl7v2.html#orc)-2                  | DiagnosticReport.basedOn                                               | [ServiceRequest](StructureDefinition-ServiceRequest.html) |
| Report Identifier        |         | [Report Identifier](StructureDefinition-ReportIdentifier.html)                     | 1..1        | [OBR](hl7v2.html#obr)-3                  | DiagnosticReport.identifier[ReportNumber]                              |                                                           |
| (Order) Procedure Code   |         | See below                                                                          | 1..1        | [OBR](hl7v2.html#obr)-4                  | [DiagnosticReport.code                                                 |                                                           |
| Report date              |         |                                                                                    | 1..1        | [OBR](hl7v2.html#obr)-7                  | DiagnosticReport.effectiveDateTime                                     |                                                           |
| Results Interpreter      |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 0..*        | [OBR](hl7v2.html#obr)-32 and OBR-33      | DiagnosticReport.resultsInterpreter                                    | [Practitioner](StructureDefinition-Practitioner.html)     |                                                                                            
| Performer (operator)     |         | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 1..*        | [OBR](hl7v2.html#obr)-34                 | DiagnosticReport.performer[operator]                                   | [Practitioner](StructureDefinition-Practitioner.html)     |
| Performer (organisation) |         | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 1..*        |                                          | DiagnosticReport.performer[organization]                               | [Organizaton](StructureDefinition-Organization.html)      |
| Specimen                 | 80398-1 | See [Genomic Test Order - Specimen](Questionnaire-GenomicTestOrder.html#specimen)  | 0..1        | [SPM](hl7v2.html#spm)                    | DiagnosticReport.specimen.identifier                                   | [Specimen](StructureDefinition-Specimen.html)             |
| Results                  |         | Domain specific - see below                                                        | 0..*        | [OBX](hl7v2.html#obx)                    | DiagnosticReport.results                                               | Varies                                                    |   
| Narrative Report         |         | Domain specific - see below                                                        | 0..*        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | DiagnosticReport.presentedForm                                         |                                                           |
{:.grid}

<span class="badge badge-primary">Genomic Observation </span>

| Name                           | LOINC   | Value Set / Data Type                                                                       | Cardinality | HL7 v2 ORU_RO1 Message              | HL7 FHIR DiagnosticReport                                                               | HL7 FHIR Resource (RESTful)                               |
|--------------------------------|---------|---------------------------------------------------------------------------------------------|-------------|-------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------------------------|
| (Order) Procedure Code - Genomic Test Code |         | [Genomic Test Code](ValueSet-GenomicTestCodes.html)                                         | 1..1        | [OBR](hl7v2.html#obr)-4             | [DiagnosticReport](StructureDefinition-DiagnosticReport.html).code                      |                                                           |
{:.grid}



### Results Mapping

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

Results section is specific to genomics and is focused on the requirements of general clinicians, not genomic specialists. For this reason this section will tend to be an extract of the wider genomics reporting specifications.

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

A more detailed mapping of the results section of the laboratory report, see [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/general.html)


| Name              | LOINC   | Value Set / Data Type | Example | Cardinality | HL7 v2 ORU_RO1 Message                   | HL7 v2 OBX-4 | HL7 FHIR Resource (RESTful)                                                                                                                                                     |
|-------------------|---------|----------|---------|-------------|------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Narrative Report  | 51969-4 |          |         | 1..1        | [OBX (type=ED)](hl7v2.html#obx-type--ed) | 1            | DiagnosticReport.presentedForm [Attachment](StructureDefinition-NWAttachment.html) and Binary                                                                                   |
| Gene studied [ID] | 48018-6 |          | ACAD9   | 0..1        | [OBX](hl7v2.html#obx)                    | 1.a          | [Observation](StructureDefinition-Observation.html) Profile [Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html).component:gene-studied |
{:.grid}

### Genomic Study

Description: [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-study)

#### Genomic Study

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

<span class="badge badge-primary">Genomic Observation </span>

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-GenomicStudy.html" _target="_blank">Procedure Genomic Study</a> 
</div>

#### Genomic Study Analysis

<div class="alert alert-danger" role="alert">
This is for elaboration and subject to change.
</div>

TBC - This includes Gene studied [ID] (48018-6) and Gene mutations tested (36908-2). Maybe a requirement from oncology.
This appears to be part of [FHIR R6 GenomicStudy](https://build.fhir.org/genomicstudy.html)

| Name                        | LOINC   | Value Set / Data Type                               | Example | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                                                                   |
|-----------------------------|---------|-----------------------------------------------------|---------|-------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| regions                     |         |                                                     |         |             |              | [Genomic Study Analysis ](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html).extension[regions]             |
| Genomic source class [Type] | 48002-0 | [Genetic variant source](https://loinc.org/LL378-1) | Somatic | 0..1        |            | [Genomic Study Analysis](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html).extension[genomic-source-class] |
| specimen                    |         |                                                     |         |             |           | [Genomic Study Analysis](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study-analysis.html).extension[specimen]             |
{:.grid}

### Findings / Observations

<span class="badge badge-primary">Genomic Observation </span>

#### Laboratory Analyte Result

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-LaboratoryAnalyteResult.html" _target="_blank">Laboratory Analyte Result (Observation)</a> 
</div>

#### Reportable Variant

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-Variant.html" _target="_blank">Variant (Observation)</a> 
</div>

### Implications

Description: [Genomic Implications](https://build.fhir.org/ig/HL7/genomics-reporting/general.html#genomic-implications)

#### Diagnostic Implication

<span class="badge badge-primary">Genomic Observation </span>

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-DiagnosticImplication.html" _target="_blank">Diagnostic Implication (Observation)</a> 
</div>

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

