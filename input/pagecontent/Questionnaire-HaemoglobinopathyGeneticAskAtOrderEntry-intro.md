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
structures the NW GLH paper **Request for Genetic Testing for
Haemoglobinopathies** form (DOC4544) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Request for Genetic Testing for Haemoglobinopathies, DOC4544 (PDF)](https://mft.nhs.uk/app/uploads/2022/03/DOC4544-NW-GLH-Request-for-Haemoglobinopathy-genetic-testing-form-1.pdf)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Surname/Forename/DoB | Free text | `Patient.name` / `Patient.birthDate` |
| NHS No/Sex/Hospital No | Free text | `Patient.identifier:nhsNumber` / `Patient.gender` / `Patient.identifier:MedicalRecordNumber` |
| Address/Postcode | Free text | `Patient.address` |
| Ethnicity/country of origin | Local A-H category scheme | `Patient.extension:ethnicCategory` |
| Referring Clinician (Consultant, Hospital, Department, Copy report to, Telephone No, Email) | Free text | `PractitionerRole` |
| Test Code | R361.1/R361.2/R372.1/R93.1/R93.2 (tick boxes) | `ServiceRequest.code` |
| Antenatal patient / gestation | Yes/no + weeks | `Observation.valueBoolean` / `Observation.valueQuantity` |
| Laboratory results | Hb, RBC, MCV, MCH, Ferritin, Hb A2 %, Hb F %, Other Hb % | `Observation.valueQuantity`, one per analyte |
| Relative/partner | Name/DOB, affected/carrier status, known variant | `ServiceRequest.supportingInfo` -> `RelatedPerson`, `Observation` |
{:.grid}

The **Laboratory Results** group is unusual among these forms: it submits
*prior* full blood count/HPLC results **with** the request, to help interpret
the genetic result, rather than being an outcome the genomic test itself
produces. No Order Placer Number, Account Number/Hospital Spell Identifier,
or clinician professional identifier (GMC/GMP) field is present on the paper
form.
