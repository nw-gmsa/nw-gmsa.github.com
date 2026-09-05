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
structures the **R454 Mavacamten CYP2C19 Test Request Form** (DOC6602) - see
[NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [CYP2C19 R454 Mavacamten Test Request Form, DOC6602 (PDF)](https://mft.nhs.uk/cyp2c19-r454-mavacamten-referral-form/)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Surname/Forename | Free text | `Patient.name` |
| D.O.B. | Free text | `Patient.birthDate` |
| NHS No/Hospital Number | Free text | `Patient.identifier:nhsNumber` / `Patient.identifier:MedicalRecordNumber` |
| NHS/Private | Tick box | not yet mapped |
| Patient's Address/Postcode | Free text | `Patient.address` |
| Biological Sex/Gender Identity | Free text | `Patient.gender` / not yet mapped |
| Ethnicity | Coded | `Patient.extension:ethnicCategory` |
| Referring Clinician/Healthcare Professional (Consultant/GP, Hospital/Surgery, Department, Contact E-mail, Requested by/Cc. Report to) | Free text | `PractitionerRole` |
| R454 testing required | Single tick box | `ServiceRequest.code` |
{:.grid}

This is the leanest of the ten paper forms - the test itself (R454) is fixed
by the choice of form, and beyond a Gender Identity field and an NHS/Private
tick box (see [Genomic Test Order - Common Fields We May Have
Missed](Questionnaire-GenomicTestOrder.html#common-fields-we-may-have-missed))
its Patient and Referring Clinician/Healthcare Professional content maps
cleanly onto the common core's own Patient and Healthcare Professional
groups. No Order Placer Number, Account Number/Hospital Spell Identifier,
Specimen-specific field beyond the common core's own Specimen group, or
clinician professional identifier (GMC/GMP) field is present on the paper
form.
