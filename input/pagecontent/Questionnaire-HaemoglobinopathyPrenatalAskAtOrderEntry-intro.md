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
structures the NW GLH paper **Request for Prenatal Diagnosis of
Haemoglobinopathies** form (DOC4544) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [Request for Prenatal Diagnosis of Haemoglobinopathies, DOC4544 (PDF)](https://mft.nhs.uk/app/uploads/2022/03/DOC4544-NW-GLH-Request-for-Prenatal-Haemoglobinopathy-genetic-testing-form.pdf)

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Surname/Forename/DoB | Free text (Maternal Details) | `Patient.name` / `Patient.birthDate` |
| NHS No/Hospital No/Sex | Free text | `Patient.identifier:nhsNumber` / `Patient.identifier:MedicalRecordNumber` / `Patient.gender` |
| Address/Postcode | Free text | `Patient.address` |
| Ethnicity/country of origin | Local A-H category scheme | `Patient.extension:ethnicCategory` |
| GP name and address | Free text | Not yet mapped |
| Referring Clinician (Referred by, Hospital/Department/Address, Report to, Email, Telephone number, Copy report to) | Free text | `PractitionerRole` |
| Paternal details | Second full patient demographic block | `RelatedPerson` (NK1-shaped, Role = Consultand), repeating group |
| Parental genotypes/reason for referral | Free text | `ServiceRequest.reasonCode.text` |
| Gestation of pregnancy | Weeks | `Observation.valueQuantity` |
| Estimated date of delivery | Date | `Observation.valueDateTime` |
| Fetal sample taken | Date + sample type | `Specimen.collection.collectedDateTime` |
{:.grid}

This is one of only two forms (with [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)) that names a
**second** patient - the common core's own Patient group is completed for
the mother throughout, and the father is referenced from here using the
same NK1-shaped `RelatedPerson` group as [NW Genomic General Ask At Order
Questions - Related Individual
(NK1)](Questionnaire-GenomicGeneralAskAtOrderEntry.html) and [Genetic
Clinical Referral - Consultand](Questionnaire-GeneticReferralConsultand.html),
under its **Consultand** role (fixed here, since the mother is always this
ServiceRequest's own subject). `RelatedPerson.identifier` already
accommodates the father's own NHS/hospital number when known - the same
fields the form asks for - so no detail is lost by using the shared shape
rather than a full `Patient` reference, as this item previously did. Unlike
[WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html#summary),
the roles here never swap - the mother is always this ServiceRequest's own
subject, whichever parent's detail is being completed. No Order Placer
Number, Account Number/Hospital Spell Identifier, or clinician professional
identifier (GMC/GMP) field is present on the paper form.
