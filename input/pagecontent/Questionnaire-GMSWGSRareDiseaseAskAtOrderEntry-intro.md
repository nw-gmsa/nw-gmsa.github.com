<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the **NHS Genomic Medicine Service (GMS) Whole Genome Sequencing
(WGS) Test Request - Rare Disease** form - the *national* GMS-branded form,
distinct from the NW GLH-specific [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) form - see [NW
Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [GMS WGS Test Request Form - Rare Disease, V2.0 April 2026 (PDF)](https://mft.nhs.uk/app/uploads/2026/05/GMS-WGS-Test-Order-Form-Rare-Disease.pdf)

<div class="alert alert-info" role="alert">
<b>Related:</b> <a href="Questionnaire-GMSWGSCancerAskAtOrderEntry.html">GMS WGS Cancer Ask At Order Entry</a> -
the cancer variant of this same national form family - and
<a href="Questionnaire-dWGSAskAtOrderEntry.html">dWGS Ask At Order Entry</a> -
the distributed sub-contracted WGS pathway, which resolves the same
"no WGS Test Category in the common core" gap the same way.
</div>

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Requesting organisation / GMS laboratory | Two organisation fields | `PractitionerRole.organization` / `ServiceRequest.performer` |
| Family test type | Singleton/Trio/Other (with number) | `Observation.valueCodeableConcept` |
| Reason NHS Number not available | Free text | `Patient.identifier:nhsNumber.extension` |
| Reason for urgency | Free text | `ServiceRequest.note` |
| Reason for diagnostic test | Patient management/reproductive decision/predictive testing (tick boxes) | `Observation.valueCodeableConcept`, repeating |
| Record of Discussion | Attached/to follow | `Observation.valueCodeableConcept` |
| Test Directory Clinical Indication & code | Free text/code | `ServiceRequest.code` |
| Additional panel(s) | Genomics England PanelApp panel name(s), mandatory for R89 | Not yet mapped |
| Proband's age at onset | Years/months | `Condition.onsetAge` |
| Specific rare disease suspected/confirmed | Free text | Not yet mapped |
| Life status | Alive/Deceased | `Patient.deceasedBoolean` |
| Family member(s) to be tested | Repeating table (name, DOB, sex, NHS number/postcode, ethnicity, life status, relationship, sample type) | `ServiceRequest.supportingInfo` -> `RelatedPerson`, repeating |
| HPO Terms | Term + Present/Absent/Unknown, repeating, **mandatory** | `Condition.code` / `Condition.verificationStatus` |
| Main contact | Name/department/phone/email, if different from responsible clinician | Not yet mapped |
{:.grid}

This is the richest of the twelve paper forms compared on [Genomic Test
Order](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms) -
see [Genomic Test Order - Common Fields We May Have
Missed](Questionnaire-GenomicTestOrder.html#common-fields-we-may-have-missed)
for the two candidate common-core additions it surfaces on its own (HPO
Terms, Main Contact), and the Family member(s) to be tested row in the table
above for how it relates to [Genetic Clinical Referral -
Consultand](Questionnaire-GeneticReferralConsultand.html).
No Order Placer Number, Account Number/Hospital Spell Identifier, or
clinician professional identifier (GMC/GMP) field is present on the paper
form - the same universal gap as every other paper form compared on this
page.
