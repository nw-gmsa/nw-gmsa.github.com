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
structures the NW GLH paper **Genomic Testing Request Form - Rare Disease**
(DOC4900), the generic Rare Disease paper order form - see [NW Genomics
paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Genomic Testing Request Form - Rare Disease, DOC4900 (DOCX)](https://mft.nhs.uk/app/uploads/2021/11/DOC4900-Genomic-Testing-Request-Form-Rare-Disease.docx)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Surname/Forename | Free text | `Patient.name` |
| D.O.B./Biological Sex/Gender Identity | Free text | `Patient.birthDate` / `Patient.gender` / not yet mapped |
| Address/Postcode | Free text | `Patient.address` |
| Ethnicity | Coded | `Patient.extension:ethnicCategory` |
| NHS No/Hospital No | Free text | `Patient.identifier:nhsNumber` / `Patient.identifier:MedicalRecordNumber` |
| Referring Clinician/Healthcare Professional (Consultant, Hospital/Surgery, Specialty/Department, E-mail/Tel, Requested by/Cc. Report to) | Free text | `PractitionerRole` |
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
