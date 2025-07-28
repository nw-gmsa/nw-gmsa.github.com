## References

- HL7 Europe [ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- [NHS Genomic Medicine Service test order forms](https://www.england.nhs.uk/publication/nhs-genomic-medicine-service-test-order-forms/)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- Prior Results (Oncology)
    - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Assessment](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html)

## Domain Archetype

<figure>
{%include Laboratory-Order-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomic Test Order Sections</p>
</figure>
<br clear="all"> 

| Entity                   | Cardinality | HL7 v2 ORU_RO1 Message                  | HL7 FHIR DiagnosticReport                                                                                     | HL7 FHIR Resource (RESTful)                                                |
|--------------------------|-------------|-----------------------------------------|---------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Patient                  | 1..1        | [PID](hl7v2.html#pid)                   | subject                                                                                   | [Patient](https://nw-gmsa.github.io/R4/StructureDefinition-Patient.html)   |
| Order Number             | 1..1        | [ORC](hl7v2.html#orc) ORC-3             | basedOn [Filler Order Number](https://nw-gmsa.github.io/R4/StructureDefinition-FillerOrderNumber.html)        | [ServiceRequest](StructureDefinition-ServiceRequest.html)                  |
| Genomic Test Code        | 1..1        | [OBR](hl7v2.html#obr) OBR-4             | code [Genomic Test Directory](https://nw-gmsa.github.io/R4/ValueSet-genomic-test-directory.html)              |                                                                            |
| Report date              | 1..1        | [OBR](hl7v2.html#obr) OBR-7             | effectiveDateTime                                                                                             |                                                                            |
| Results Interpreter      | 0..*        | [OBR](hl7v2.html#obr) OBR-32 and OBR-33 | resultsInterpreter [England Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html)  | [Practitioner](StructureDefinition-Practitioner.html)                      |                                                                                            
| Performer (operator)     | 1..*        | [OBR](hl7v2.html#obr) OBR-34            | performer[operator] [England Practitioner Identifier](StructureDefinition-EnglandPractitionerIdentifier.html) | [Practitioner](StructureDefinition-Practitioner.html)                      |
| Performer (organisation) | 1..*        |                                         | performer[organisation] [Organisation Code](StructureDefinition-OrganisationCode.html)                        | [Organizaton](StructureDefinition-Organizaton.html)                        |
| presentedForm            | 1..1        | [OBX (type=ED](hl7v2.html#obx-type--ed) | presentedForm [Attachment](StructureDefinition-NWAttachment.html)                                             | [DocumentReference](StructureDefinition-DocumentReference.html) and Binary |
| Specimen                 | 0..*        | [SPM](hl7v2.html#spm)                   | specimen                                                                                  | [Specimen](StructureDefinition-Specimen.html)                              |


[Questionnaire Viewer](https://project-wildfyre.github.io/domain-archetype/?q=https://nw-gmsa.github.io/R4/Questionnaire-GenomicTestOrder.json)

