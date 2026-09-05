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
structures the **Deafness Testing Proforma (R67 Non-Syndromic Hearing
Loss)** - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Deafness Testing Proforma - R67 Non-Syndromic Hearing Loss (PDF)](https://mft.nhs.uk/5-deafness/)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Name | Free text (single field) | `Patient.name` |
| Date of birth/Gender | Free text | `Patient.birthDate` / `Patient.gender` |
| Address/Postcode | Free text | `Patient.address` |
| Hospital Number/NHS no | Free text | `Patient.identifier:MedicalRecordNumber` / `Patient.identifier:nhsNumber` |
| Referring Clinician (Referring clinician, Address, Email) | Free text | `PractitionerRole` |
| Family history/pedigree | Free text | `ServiceRequest.note` |
| Audiogram findings | Findings, severity (per ear), progression | `Observation.valueString` / `valueQuantity` |
| Suspected syndromic diagnosis | Pendred/Usher/Jervell-Lange Nielsen/Waardenburg/Branchio-oto-renal/Wolfram (tick boxes) | `ServiceRequest.reasonCode`, repeating |
| Risk factors | Prematurity/Hyperbilirubinemia/Prolonged NNU stay/Ototoxic medication (tick boxes) | `Observation.valueCodeableConcept`, repeating |
| MRI performed / findings | Yes/no + free text | `Observation.valueBoolean` / `valueString` |
{:.grid}

Unlike most of the other paper forms, the **test code (R67) is fixed by the
choice of form** rather than entered - the proforma exists purely to capture
the clinical detail supporting R67 eligibility. No Order Placer Number,
Account Number/Hospital Spell Identifier, Specimen Identifier, or clinician
professional identifier (GMC/GMP) field is present on the paper form - it
accompanies a separate DNA request card that is assumed to carry the
specimen identifier.
