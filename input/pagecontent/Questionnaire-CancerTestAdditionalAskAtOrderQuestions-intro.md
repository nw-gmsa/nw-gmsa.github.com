<div class="alert alert-danger" role="alert">
This Questionnaire is a proposal, not an active or planned project.
</div>

## Questions Summary

<span class="badge badge-primary">Diagnostic Genomics</span>

Used **alongside** [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
(the common core) **and** [Ask At Order Entry Questions
Common](Questionnaire-GenomicGeneralAskAtOrderEntry.html) for Cancer orders
specifically - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions), the
same "Test Specific" tier pattern [WGS Test Additional Ask At Order Entry
Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) already
follows for WGS orders.

Its content is **inferred**, not yet confirmed against a live order-entry
screen: each item below is a concept that recurs independently across the
two Cancer-category [NW GLH paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms) -
[HRD and Tumour BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html)
(GB-27189) and [GMS WGS Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html)
(the national form). Neither of those two Questionnaires has been changed
to actually use this one yet - both remain independent, standalone
Questionnaires, each already carrying its own copy of the fields proposed
here.

| Name                                    | Code System              | Answer ValueSet          | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | HL7 FHIR Resource (Message + RESTful)                                     |
|-------------------------------------------|----------------------------|----------------------------|-------------|------------------------|------------------|-----------------------------------------------------------------------------|
| Presentation status                       | NWGMSA PresentationFirstDiagnosis / PresentationRecurrenceRelapse | First diagnosis/Recurrence-Relapse/Unknown | 0..1 | [OBX](hl7v2.html#obx) | CE | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Neoplastic/malignant cell content (%)     | NWGMSA NeoplasticCellContent |                          | 0..1        | [OBX](hl7v2.html#obx)  | NM               | [Observation](StructureDefinition-Observation.html).valueQuantity        |
| Pathologist                               | NWGMSA PathologistName    |                            | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
| Pathology hospital / laboratory           | NWGMSA PathologyHospital  |                            | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
{:.grid}

**Neoplastic/malignant cell content (%)** is the field most worth reading
the design note on: the same underlying concept is independently modelled
three times today - on [HRD and Tumour
BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html), [GMS WGS
Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) and [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) - each under its
own suffixed linkId despite sharing the same `NWGMSA` code. This
Questionnaire proposes the single shared field this tier exists for,
rather than each Cancer-adjacent form continuing to reinvent its own copy.

**Presentation status** generalises [HRD and Tumour
BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html)'s own `Pathway`
choice (which conflates presentation status with test selection itself,
since on that specific form the pathway and the presentation are the same
choice) into the cleaner, already-separated shape [GMS WGS
Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) uses.

**Pathologist** and **Pathology hospital / laboratory** generalise HRD and
Tumour BRCA's own two named fields and GMS WGS Cancer's Histopathology Lab
ID (a related but not identical concept - a lab identifier rather than a
named hospital) into one shared pair of fields.

These two fields most directly relate to the [Cheshire and Merseyside
Pathology](CheshireAndMerseysidePathology.html) reflex use case, where a
genomic order follows on from a prior pathology order/report
(`LAB-1`/`LAB-3`) rather than starting the clinical episode itself - that
page's own [Current
Process](CheshireAndMerseysidePathology.html#current-process) still models
the pathology-to-genomics handoff entirely as HL7 v2/FHIR messaging
(`LAB-1`/`LAB-35`/`LAB-3`/`LAB-36`), which is why today's answer is free
text rather than a machine-resolvable reference. A query-based alternative
may remove the need to duplicate pathology content into the genomic
order/message at all: some NW pathology LIMS deployments (e.g. Medicus)
already support the Australian [AU
eReq](https://hl7.org.au/fhir/ereq/index.html) FHIR IG for on-demand query
access to pathology orders (and potentially reports), and MFT separately
exposes pathology data through Epic's own [FHIR Query
API](https://fhir.epic.com/). If a genomics laboratory can query pathology
directly, these two free-text fields could be replaced by a **reference**
instead - the Pathology Order Filler Number, Pathology Patient Identifier
and/or Pathology Specimen Identifier - letting the genomic order carry a
pointer for on-demand lookup rather than the pathology detail itself.
