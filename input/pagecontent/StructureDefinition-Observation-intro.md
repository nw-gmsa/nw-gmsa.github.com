<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#obx" _target="_blank">OBX</a>
</div>

## Reference

- **NHS England HL7 v2** OBX [ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

```mermaid
mindmap
  root[Observation]
    SimpleObservation
      s[value 1..1<br/>hasMember 0..0]
    ObservationPanel
      s[value 0..0<br/>hasMember 1..*]
    LaboratoryAnalyteResult
      s[value 1..1<br/>component 0..*<br/>hasMember 0..0]
    GenomicObservation
      s[code = type of archetype/FHIR profile<br/>value 0..1<br/>component 0..*<br/>hasMember 0..0]
```