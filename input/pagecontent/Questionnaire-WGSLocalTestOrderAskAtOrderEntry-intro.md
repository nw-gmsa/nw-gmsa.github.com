<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Genetic Testing Request Form - Whole Genome
Sequencing (WGS)** form, which accompanies samples sent to a NW GLH site -
see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [NW GLH Form to accompany samples for Whole Genome Sequencing (WGS) Tests (PDF)](https://mft.nhs.uk/wgs_local_test_order_form_v9-1_-_fillable/)

<div class="alert alert-info" role="alert">
<b>Not to be confused with:</b> <a href="Questionnaire-dWGSSubOrder.html">dWGS Sub-Order Manifest</a> -
that Questionnaire is the digital manifest for a <b>distributed WGS
sub-contracted order</b> between GLHs (see <a href="dWGS.html">dWGS</a>);
this one is the plain paper form used for a local WGS request. Nor with
<a href="Questionnaire-GMSWGSRareDiseaseAskAtOrderEntry.html">GMS WGS Rare Disease</a>/
<a href="Questionnaire-GMSWGSCancerAskAtOrderEntry.html">GMS WGS Cancer</a> -
those are the <i>national</i> NHS Genomic Medicine Service-branded WGS
request forms, not an NW GLH-specific one, and are considerably richer
(mandatory HPO terms, a repeating family-member table, no equivalent of
either on this form).
</div>

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| WGS test type | Rare Disease (Proband/Family Member) or Cancer (Tumour/Germline sample) | `ServiceRequest.category` |
| Proband reference | Name/DOB of proband (Family Member pathway only) | `ServiceRequest.supportingInfo` -> `Patient` |
| Neoplastic cell content | % (Cancer tumour sample only) | `Observation.valueQuantity` |
| NGIS Test Code | Barcode/placeholder box, completed once the NGIS referral exists | `ServiceRequest.code` |
{:.grid}

Like [Prenatal Haemoglobinopathy](Questionnaire-HaemoglobinopathyPrenatalAskAtOrderEntry.html),
this form can name a **second** individual, and does so via the same
`ServiceRequest.supportingInfo` pattern used by [Genetic Clinical Referral -
Consultand](Questionnaire-GeneticReferralConsultand.html) - but **the roles
are reversed here**. In Genetic Clinical Referral/Prenatal Haemoglobinopathy,
the base ServiceRequest's own Patient group is always the proband/primary
patient, and the second individual is the supportingInfo reference. On the
**Family Member** WGS pathway, it is the other way round: the common core's
own Patient group is completed for the **family member** whose specimen this
particular order carries, and the Proband reference above names the
*already-referred* proband instead. Take care not to assume the base
Patient group is always the proband when reading this Questionnaire
alongside the others. The paper form's own "NGIS/Barcode (Until NGIS
Referral Received)" box is a placeholder used before the digital NGIS
referral exists, not a distinct Order Placer Number - it converges on
`ServiceRequest.code` once the NGIS referral is raised. No Account
Number/Hospital Spell Identifier or clinician professional identifier
(GMC/GMP) field is present on the paper form.
