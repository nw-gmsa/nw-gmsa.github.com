<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire is compared against [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [NW GLH Paper Test Request
Forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms) -
but does not yet declare `derivedFrom`/extends it: unlike the Ask At Order
Entry Questionnaires that originated from an existing digital order-entry
screen (see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions)), this
one hasn't yet been processed into the specific electronic Ask At Order
Entry shape that relationship implies for use in an actual order. It
structures the NW GLH paper **Molecular Genomic Testing Request Form -
Haemato-Oncology** (DOC5775) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Molecular Genomic Testing Request Form - Haemato-Oncology (DOCX)](https://mft.nhs.uk/app/uploads/2024/04/DOC5775-Haem-Onc-Genomics-referral-form-April-24.docx)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Surname/Forename | Free text | `Patient.name` |
| D.O.B./Biological Sex/Gender Identity | Free text | `Patient.birthDate` / `Patient.gender` / not yet mapped |
| Patient's Address/Postcode | Free text | `Patient.address` |
| Ethnicity | Coded | `Patient.extension:ethnicCategory` |
| NHS No/Hospital No | Free text | `Patient.identifier:nhsNumber` / `Patient.identifier:MedicalRecordNumber` |
| Referring Clinician/Healthcare Professional (Consultant/GP, Hospital/Surgery, Department, E-mail/Tel, Requested by/Cc. Report to) | Free text | `PractitionerRole` |
| Test panel(s) | ~25 named panel tick-boxes (Myeloid NGS, Lymphoid NGS, BCR::ABL, MRD panels, SNP array, etc.) | `ServiceRequest.code`, repeating |
| Differential diagnosis | Free text (used when "Other" panel selected) | `ServiceRequest.note` |
{:.grid}

The form's Test Code is **implied by which panel is ticked**, not a Genomic
Test Directory R-code - the named panels don't yet have a 1:1 mapping onto a
local CodeSystem in this IG, so `NOS/HaemOncPanelRequested` is left open
rather than guessing lab-internal panel codes. Specimen detail (Sample Type,
High Infection Risk, Sample Date, Taken by) beyond the common core's own
Specimen group is not restored here - see [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) for that. No Order Placer
Number, Account Number/Hospital Spell Identifier, or clinician professional
identifier (GMC/GMP) field is present on the paper form.
