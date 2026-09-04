This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Request for Genetic Cystic Fibrosis (CF)
Carrier Testing (CFTR Gene)** form - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [GP Form: Cystic Fibrosis carrier test request, DOC4356 (DOCX)](https://mft.nhs.uk/app/uploads/2022/09/DOC4356_GP_CF-request-form.docx)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Referral scenario | Family history of CF / Partner affected or carrier | `Observation.valueCodeableConcept` |
| Relative/partner | Name/DOB, relationship, affected/carrier status, known CFTR variant | `ServiceRequest.supportingInfo` -> `RelatedPerson`, `Observation` |
{:.grid}

This is the only one of the ten paper forms explicitly designed for use by
**General Practitioners** rather than a hospital-based ordering clinician -
its Referring Clinician section is labelled "GP Name"/"Surgery Address"
rather than "Consultant"/"Hospital", though both map onto the same common
core `HealthcareProfessional` group. Carrier testing is restricted to
patients aged 16 or over (informed consent), noted as a help item rather
than a data field. No Order Placer Number, Account Number/Hospital Spell
Identifier, or clinician professional identifier (GMC/GMP) field is present
on the paper form.
