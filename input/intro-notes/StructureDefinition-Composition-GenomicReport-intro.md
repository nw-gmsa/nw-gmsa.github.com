## References

- HL7 International [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
- [openEHR Project: Genomics](https://ckm.openehr.org/ckm/projects/1013.30.50)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- [NHS England Genomics Test Reporting Specification](https://www.england.nhs.uk/publication/genomics-testing-reporting-specification/)
- Related 
  - HL7 Europe [Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/index.html) 
  - HL7 Europe [Imaging](https://build.fhir.org/ig/hl7-eu/imaging/index.html)

## Domain Archetype

> **DRAFT FOR ELABORATION PURPOSES**

<figure>
{%include LaboratoryReport-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - Map</p>
</figure>
<br clear="all">

### Phase 1 PDF Report

| Entity                    | Cardinality | HL7 v2 ORU_RO1 Message                  | HL7 FHIR DiagnosticReport                                                                                     | HL7 FHIR Resource (RESTful)                                                |
|---------------------------|-------------|-----------------------------------------|---------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Patient                   | 1..1        | [PID](hl7v2.html#pid)                   | subject                                                                                                       | [Patient](StructureDefinition-Patient.html)   |
| Episode/Visit/Stay Number | 0..1        | [PV1](hl7v2.html#pv1) PV1-19            | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html)                   | [Encounter](StructureDefinition-Encounter.html)                            |
| Order Number              | 1..1        | [ORC](hl7v2.html#orc) ORC-3             | basedOn [Filler Order Number](StructureDefinition-FillerOrderNumber.html)        | [ServiceRequest](StructureDefinition-ServiceRequest.html)                  |
| Genomic Test Code         | 1..1        | [OBR](hl7v2.html#obr) OBR-4             | code [Genomic Test Directory](CodeSystem-NHSEngland-GenomicTestDirectory.html)                                |                                                                            |
| Report date               | 1..1        | [OBR](hl7v2.html#obr) OBR-7             | effectiveDateTime                                                                                             |                                                                            |
| Results Interpreter       | 0..*        | [OBR](hl7v2.html#obr) OBR-32 and OBR-33 | resultsInterpreter [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html)  | [Practitioner](StructureDefinition-Practitioner.html)                      |                                                                                            
| Performer (operator)      | 1..*        | [OBR](hl7v2.html#obr) OBR-34            | performer[operator] [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | [Practitioner](StructureDefinition-Practitioner.html)                      |
| Performer (organisation)  | 1..*        |                                         | performer[organisation] [Organisation Code](StructureDefinition-OrganisationCode.html)                        | [Organizaton](StructureDefinition-Organisaton.html)                        |
| presentedForm             | 1..1        | [OBX (type=ED](hl7v2.html#obx-type--ed) | presentedForm [Attachment](StructureDefinition-NWAttachment.html)                                             | [DocumentReference](StructureDefinition-DocumentReference.html) and Binary |
| Specimen                  | 0..*        | [SPM](hl7v2.html#spm)                   | specimen                                                                                                      | [Specimen](StructureDefinition-Specimen.html)                              |

### Phase 2 Structured Report

TODO - This will include a modernisation to core FHIR concepts such as  FHIR Workflow, FHIR Subscription and FHIR RESTful.


> **DRAFT FOR ELABORATION PURPOSES**

<!-- 
### Somatic Reporting

[HL7 FHIR Genomics Reporting - Somatic Reporting](https://hl7.org/fhir/uv/genomics-reporting/pharmacogenomics.html)

is a mindmap 

### Pharmacogenomic Reporting

[HL7 FHIR Genomics Reporting - Pharmacogenomic Reporting](https://hl7.org/fhir/uv/genomics-reporting/pharmacogenomics.html)

is a mindmap

### HL7 v2 Genetic Variant Reporting (ORU_R01)

> This is not included in the current phase and is for reference purposes. 

> [Master HL7 genetic variant reporting panel](https://fhir.nwgenomics.nhs.uk/R4/Questionnaire-81247-9.html)

-->


