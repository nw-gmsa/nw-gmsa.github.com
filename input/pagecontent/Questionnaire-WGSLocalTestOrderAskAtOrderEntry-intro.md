This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the NW GLH paper **Genetic Testing Request Form - Whole Genome
Sequencing (WGS)** form, which accompanies samples sent to a NW GLH site -
see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

<div class="alert alert-info" role="alert">
<b>Not to be confused with:</b> <a href="Questionnaire-dWGSSubOrder.html">dWGS Sub-Order Manifest</a> -
that Questionnaire is the digital manifest for a <b>distributed WGS
sub-contracted order</b> between GLHs (see <a href="dWGS.html">dWGS</a>);
this one is the plain paper form used for a local WGS request.
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
this form can name a **second** individual (the proband, when a family
member's sample is being sent). The paper form's own "NGIS/Barcode (Until
NGIS Referral Received)" box is a placeholder used before the digital NGIS
referral exists, not a distinct Order Placer Number - it converges on
`ServiceRequest.code` once the NGIS referral is raised. No Account
Number/Hospital Spell Identifier or clinician professional identifier
(GMC/GMP) field is present on the paper form.
