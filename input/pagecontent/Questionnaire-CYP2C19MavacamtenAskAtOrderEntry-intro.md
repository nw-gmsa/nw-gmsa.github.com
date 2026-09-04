This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the **R454 Mavacamten CYP2C19 Test Request Form** (DOC6602) - see
[NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| R454 testing required | Single tick box | `ServiceRequest.code` |
{:.grid}

This is the leanest of the ten paper forms - the test itself (R454) is fixed
by the choice of form, and beyond a Gender Identity field (see [Genomic Test
Order - Common Fields We May Have
Missed](Questionnaire-GenomicTestOrder.html#common-fields-we-may-have-missed))
there is no content beyond the common core's own Patient, Referrer and
Specimen groups. No Order Placer Number, Account Number/Hospital Spell
Identifier, or clinician professional identifier (GMC/GMP) field is present
on the paper form.
