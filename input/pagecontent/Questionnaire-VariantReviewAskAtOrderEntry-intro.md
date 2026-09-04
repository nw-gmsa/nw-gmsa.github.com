<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Genomic Variant Review Request Form (R442.1) -
Rare Disease** (DOC6004) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Genomic Variant Review Request Form, R442.1/DOC6004 (DOCX)](https://mft.nhs.uk/genomic-variant-review-request-form-r442-1-rare-disease/)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Reason for review | New information / time elapsed / urgent scenario / formal classification required (tick boxes) | `ServiceRequest.reasonCode` |
| Variant(s) under review | Free text | `ServiceRequest.note` |
| Prior report reference | "Report reference" free text | `ServiceRequest.basedOn` -> `DiagnosticReport` |
| Specialty | Free text (e.g. Core, Cardiology) | `PractitionerRole.specialty` |
| Additional evidence | Free text | `ServiceRequest.note` |
{:.grid}

This form does not request a new test on a new specimen - it asks the
laboratory to **re-review a variant already reported**. Its distinguishing
content is therefore a reference back to the prior report, not specimen
detail, and the common core's own Specimen group does not apply. Where the
prior report came from an external GLH, the form asks for a copy to be
attached - the same `ServiceRequest.supportingInfo` -> `DocumentReference` ->
`Binary` pattern used for the family letter on [Genetic Clinical
Referral](Questionnaire-GeneticClinicalReferral.html#family-history). No
Order Placer Number, Account Number/Hospital Spell Identifier, or clinician
professional identifier (GMC/GMP) field is present on the paper form.
