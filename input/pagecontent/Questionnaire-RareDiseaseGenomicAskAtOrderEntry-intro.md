<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Genomic Testing Request Form - Rare Disease**
(DOC4900), the generic Rare Disease paper order form - see [NW Genomics
paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Genomic Testing Request Form - Rare Disease, DOC4900 (DOCX)](https://mft.nhs.uk/app/uploads/2021/11/DOC4900-Genomic-Testing-Request-Form-Rare-Disease.docx)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Clinical utility | Patient management / Reproductive decision making / Predictive testing (tick boxes) | `Observation.valueCodeableConcept`, repeating |
| Targeted familial testing | Yes/no + known familial variant/affected relative | `Observation.valueBoolean` / `Observation.valueString` |
{:.grid}

This is the closest of the ten paper forms to [Genomic Test
Order](Questionnaire-GenomicTestOrder.html)'s own common core - its R code,
test name and clinical details fields map directly onto the core Test
Request group, so this Ask At Order Entry Questionnaire is deliberately
thin. No Order Placer Number, Account Number/Hospital Spell Identifier, or
clinician professional identifier (GMC/GMP) field is present on the paper
form.
