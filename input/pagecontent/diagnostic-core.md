This implementation guide primarily focuses on the **Diagnostic Workflow** and how it integrates within the broader **health data model**, as illustrated in the diagram above.
- **Patient Care** and **Patient Administration** are typically found in NHS providers **Electronic Patient Record** systems
- **Care Directory Service** on the other hand, are centrally defined by NHS England, with supporting APIs also provided by NHS England (for example, the ODS API).

In software design, these areas are often referred to as [domains](https://en.wikipedia.org/wiki/Domain-driven_design). The **Genomic Diagnostic Workflow** operates across several of these domains — in software architecture terms, this is known as a [bounded context](https://martinfowler.com/bliki/BoundedContext.html).

<figure style="overflow-x:auto;">
{%include Diagnostic-Workflow-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Diagnostic Workflow - MindMap</p>
</figure>
<br clear="all">

## Entity Relationship Diagram

This is the **basic model** this guide is built on: an `OrderingFacilityAndPractitioner`
places a `ServiceRequest` (order) for a `Patient`, which references a
`Specimen` and produces a `DiagnosticReport`, with a `HospitalSpell` linking
orders and reports back to the episode of care they belong to. Both the order
and the report are extended with further detail beyond this basic model -
`AskAtOrderQuestions` for the order, `ReportPanels` and `Results` for the
report - see [Archetype Questionnaires](#archetype-questionnaires) below.

```mermaid
erDiagram
    OrderingFacilityAndPractitioner ||--|{ ServiceRequest : places
    Patient ||--|{ ServiceRequest : subject
    HospitalSpell ||--o{ ServiceRequest : links
    ServiceRequest ||--o{ Specimen : contains
    ServiceRequest ||--|{ DiagnosticReport : produces
    Patient ||--|{ DiagnosticReport : subject
    HospitalSpell ||--o{ DiagnosticReport : links
    ServiceRequest ||--o{ AskAtOrderQuestions : "extended by"
    DiagnosticReport ||--o{ ReportPanels : "extended by"
    DiagnosticReport ||--o{ Results : "extended by"
```

This is deliberately a **high-level (level 1) view** - just the entities and
how they relate. Field-level (level 2) diagrams, showing the actual
attributes each entity carries, are on the two archetype Questionnaire pages
below.

## Archetype Questionnaires

This basic model is deliberately abstract - it doesn't yet say which specific
fields an order or report needs, or how those fields map onto HL7 v2 segments
and FHIR profiles. That detail is added by two **archetype Questionnaires**,
one for each side of the `ServiceRequest`/`DiagnosticReport` relationship
above:

```mermaid
flowchart LR
    M["Basic model<br/>(this page)"] --> O["Questionnaire-<br/>GenomicTestOrder"]
    M --> R["Questionnaire-<br/>GenomicTestReport"]
    O --> OAOE["Ask At Order Entry<br/>Questionnaires<br/>(derived/extended)"]
    R --> RP["Report Panels<br/>(derived/extended)"]
    O --> FHIRV2O["FHIR ServiceRequest /<br/>HL7 v2 OML_O21"]
    R --> FHIRV2R["FHIR DiagnosticReport /<br/>HL7 v2 ORU_R01"]
```

- **[Genomic Test Order](Questionnaire-GenomicTestOrder.html)** - the common
  core order form (Patient, Hospital Spell, Diagnostic Workflow, Specimen)
  shared by every order, regardless of test type. Order/test-type-specific
  questions are added by **Ask At Order Entry Questionnaires**, which
  `derivedFrom`/extend this common core - see [Order Entry
  Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions) for
  the full list. `ServiceRequest` itself also splits into `OriginalOrder` and
  `FillerOrder` - see [Original Order and Filler
  Order](Questionnaire-GenomicTestOrder.html#original-order-and-filler-order).
- **[Genomic Test Report](Questionnaire-GenomicTestReport.html)** - the common
  core report metadata (patient, order/report identifiers, dates, status,
  conclusion, performers) shared by every report. Individual test findings are
  added by **Report Panel Questionnaires**, which are likewise
  `derivedFrom`/extended from this common core - see [Report
  Panels](Questionnaire-GenomicTestReport.html#report-panels) for the full
  list.

Each archetype's own page carries the field-by-field detail this summary page
doesn't: which [HL7 FHIR profile](artifacts.html) and [HL7 v2
segment](hl7v2.html) each field maps onto, ready to implement against.
