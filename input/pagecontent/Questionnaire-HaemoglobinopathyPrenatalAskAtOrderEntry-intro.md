This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Request for Prenatal Diagnosis of
Haemoglobinopathies** form (DOC4544) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Request for Prenatal Diagnosis of Haemoglobinopathies, DOC4544 (PDF)](https://mft.nhs.uk/app/uploads/2022/03/DOC4544-NW-GLH-Request-for-Prenatal-Haemoglobinopathy-genetic-testing-form.pdf)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Paternal details | Second full patient demographic block | `ServiceRequest.supportingInfo` -> `Patient` |
| Parental genotypes/reason for referral | Free text | `ServiceRequest.reasonCode.text` |
| Gestation of pregnancy | Weeks | `Observation.valueQuantity` |
| Estimated date of delivery | Date | `Observation.valueDateTime` |
| Fetal sample taken | Date + sample type | `Specimen.collection.collectedDateTime` |
{:.grid}

This is one of only two forms (with [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)) that names a
**second** patient - the common core's own Patient group is completed for
the mother throughout, and the father is referenced from here. This is the
same `ServiceRequest.supportingInfo` pattern used by [Genetic Clinical
Referral - Consultand](Questionnaire-GeneticReferralConsultand.html) to
reference a second individual, but points at a full `Patient` rather than a
`RelatedPerson` - the father's own NHS/hospital number is asked for on the
form, so he is independently identifiable, not just named in passing.
Unlike [WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html#summary),
the roles here never swap - the mother is always this ServiceRequest's own
subject, whichever parent's detail is being completed. No Order Placer
Number, Account Number/Hospital Spell Identifier, or clinician professional
identifier (GMC/GMP) field is present on the paper form.
