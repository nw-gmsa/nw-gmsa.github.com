<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **HRD and Tumour BRCA Test Request Form**
(GB-27189) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [HRD and Tumour BRCA Test Request Form (PDF)](https://mft.nhs.uk/app/uploads/2021/10/HRD-test-request-form-new.pdf)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Pathway | HRD test / Tumour BRCA test only / Relapsed tumour BRCA test only (tick boxes) | `ServiceRequest.code` ($GTD#M2.5 / M2.1) |
| Newly diagnosed disease confirmation | Confirmation checkbox | `Observation.valueBoolean` |
| Relapsed disease confirmation | Confirmation checkbox | `Observation.valueBoolean` |
| International transfer consent | Consent statement (Myriad, USA) | `Observation.valueBoolean` |
| Pathologist / Pathology hospital | Free text | `Observation.valueString` |
| Neoplastic cell content | Approx. % neoplastic nuclei | `Observation.valueQuantity` |
{:.grid}

Patient, Referrer, and Specimen/pathology-block detail are all captured by
the common core [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
Questionnaire and are not repeated here - this form has no Order Placer
Number, Account Number/Hospital Spell Identifier, or clinician professional
identifier (GMC/GMP) field.
