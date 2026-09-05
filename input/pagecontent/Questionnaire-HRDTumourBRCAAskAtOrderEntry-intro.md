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
structures the NW GLH paper **HRD and Tumour BRCA Test Request Form**
(GB-27189) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [HRD and Tumour BRCA Test Request Form (PDF)](https://mft.nhs.uk/app/uploads/2021/10/HRD-test-request-form-new.pdf)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Forename/Surname | Free text | `Patient.name` |
| DoB (DD/MM/YY)/Sex | Free text | `Patient.birthDate` / `Patient.gender` |
| NHS number/Hospital number | Free text | `Patient.identifier:nhsNumber` / `Patient.identifier:MedicalRecordNumber` |
| Referrer's Name/Position/NHS hospital/Department | Free text | `PractitionerRole` |
| Telephone number | Free text | `PractitionerRole.telecom.value` |
| Preferred method of report | Email*/Fax (tick boxes) | not yet mapped |
| Email/ fax (1) and (2) | Free text | `PractitionerRole.telecom.value` (repeating) |
| Reporting address | Free text | not yet mapped |
| Pathway | HRD test / Tumour BRCA test only / Relapsed tumour BRCA test only (tick boxes) | `ServiceRequest.code` ($GTD#M2.5 / M2.1) |
| Newly diagnosed disease confirmation | Confirmation checkbox | `Observation.valueBoolean` |
| Relapsed disease confirmation | Confirmation checkbox | `Observation.valueBoolean` |
| International transfer consent | Consent statement (Myriad, USA) | `Observation.valueBoolean` |
| Pathologist / Pathology hospital | Free text | `Observation.valueString` |
| Neoplastic cell content | Approx. % neoplastic nuclei | `Observation.valueQuantity` |
{:.grid}

Specimen/pathology-block detail beyond Pathologist, Pathology hospital and
Neoplastic cell content (above) is captured by the common core [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) Questionnaire's own Specimen
group and is not repeated here - this form has no Order Placer Number,
Account Number/Hospital Spell Identifier, or clinician professional
identifier (GMC/GMP) field.
