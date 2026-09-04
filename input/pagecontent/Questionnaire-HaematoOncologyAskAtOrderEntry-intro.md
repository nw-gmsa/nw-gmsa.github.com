<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Molecular Genomic Testing Request Form -
Haemato-Oncology** (DOC5775) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Molecular Genomic Testing Request Form - Haemato-Oncology (DOCX)](https://mft.nhs.uk/app/uploads/2024/04/DOC5775-Haem-Onc-Genomics-referral-form-April-24.docx)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Test panel(s) | ~25 named panel tick-boxes (Myeloid NGS, Lymphoid NGS, BCR::ABL, MRD panels, SNP array, etc.) | `ServiceRequest.code`, repeating |
| Differential diagnosis | Free text (used when "Other" panel selected) | `ServiceRequest.note` |
{:.grid}

Patient and Referrer detail are captured by the common core [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) Questionnaire. The form's Test
Code is **implied by which panel is ticked**, not a Genomic Test Directory
R-code - the named panels don't yet have a 1:1 mapping onto a local
CodeSystem in this IG, so `NOS/HaemOncPanelRequested` is left open rather
than guessing lab-internal panel codes. No Order Placer Number, Account
Number/Hospital Spell Identifier, or clinician professional identifier
(GMC/GMP) field is present on the paper form.
