<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#obx" _target="_blank">OBX</a>
</div>

## Reference

- **NHS England HL7 v2** OBX [ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

```mermaid
graph
  Observation[Base Observation<br/><br/>FHIR Observation<br/>HL7 v2 OBX<br/>SNOMED or LOINC codes]
  SimpleObservation[Simple Observation<br/><br/>FHIR Observation<br/>HL7 v2 OBX]
  ObservationPanel[Observation Panel<br/><br/>FHIR QuestionnaireResponse<br/>FHIR Observation<br/>HL7 v2 OBR]
  ComponentObservation[Component Observation<br/><br/>FHIR Observation<br/>HL7 v2 OBX]
  Template[Template<br/><br/>opnEHR Template<br/>FHIR Questionnaire<br/>LOINC Groups and Panels<br/>Laboratory Batteries<br/>Survery and Questionnaires<br/>Ask At Order Entry Questions]
  ObservationDefinition[Observation Definition<br/><br/>FHIR ObservationDefinition<br/>implied by LOINC panel]
  Archetype[Clinical/Archetype/Analyte Model<br/><br/>openEHR Archetype<br/>FHIR Profile<br/>LOINC Analyte<br/>Genomic Findings+Implications]

  Template --> |defines| ObservationPanel    
  ObservationDefinition --> |defines| SimpleObservation
  Archetype --> |defines| ComponentObservation
  Archetype --> |defines| SimpleObservation
  Archetype --> |defines| ObservationDefinition

  ObservationPanel --> |contains| SimpleObservation
  ObservationPanel --> |contains| ComponentObservation
  Archetype --> |instantiates/uses| Template
  Template --> |contains| ObservationDefinition

  SimpleObservation --> |isA| Observation
  ComponentObservation --> |isA| Observation

  classDef pink fill:#F8CECC;

  class Observation,ObservationPanel,SimpleObservation,ComponentObservation pink;
```

```mermaid
mindmap
  root[Base Observation]
    SimpleObservation
      s[value 1..1<br/>component 0..*<br/>hasMember 0..0]
    ObservationPanel
      s[value 0..0<br/>component 0..0<br/>hasMember 1..*]
    LaboratoryAnalyteResult[Component Observation<br/>LaboratoryAnalyteResult]
      s[value 1..1<br/>component 1..*<br/>hasMember 0..0]
    GenomicObservation[Component Observation<br/>Genomic Observation]
      s[code = type of archetype/FHIR profile<br/>value 0..1<br/>component 1..*<br/>hasMember 0..0]
```
