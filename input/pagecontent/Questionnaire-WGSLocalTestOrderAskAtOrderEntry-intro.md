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
<a href="Questionnaire-GMSWGSRareDisease.html">GMS WGS Rare Disease</a>/
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
| Proband | Name/DOB of proband (Family Member pathway only) | `RelatedPerson` (NK1-shaped, Role = Proband), repeating group |
| Neoplastic cell content | % (Cancer tumour sample only) | `Observation.valueQuantity` |
| NGIS Test Code | Barcode/placeholder box, completed once the NGIS referral exists | `ServiceRequest.code` (`#choice`, bound to [NGIS Test Code](ValueSet-NGISTestCodeVS.html)) |
{:.grid}

Like [Prenatal Haemoglobinopathy](Questionnaire-HaemoglobinopathyPrenatalAskAtOrderEntry.html),
this form can name a **second** individual, and does so via the same
NK1-shaped `RelatedPerson` group as [NW Genomic General Ask At Order
Questions - Related Individual
(NK1)](Questionnaire-GenomicGeneralAskAtOrderEntry.html) (`NOS/Proband`
here, reusing that same group under its **Proband** role rather than
**Consultand**) - but **the roles are reversed here**. In Genetic Clinical
Referral/Prenatal Haemoglobinopathy/the Consultand role of that shared
group, the base ServiceRequest's own Patient group is always the
proband/primary patient, and the second individual is the
`RelatedPerson.patient`-referencing relative. On the **Family Member** WGS
pathway, it is the other way round: the common core's own Patient group is
completed for the **family member** whose specimen this particular order
carries, and the `NOS/Proband` group above names the *already-referred*
proband instead, with NHS/hospital number (if known) enough to resolve it
back to that proband's own existing `Patient` record rather than
duplicating it. Take care not to assume the base Patient group is always
the proband when reading this Questionnaire alongside the others. The
paper form's own "NGIS/Barcode (Until NGIS Referral Received)" box is a
placeholder used before the digital NGIS referral exists, not a distinct
Order Placer Number - it converges on `ServiceRequest.code` once the NGIS
referral is raised, and is bound to the same [NGIS Test Code](ValueSet-NGISTestCodeVS.html)
ValueSet (all codes from the [Genomic Test Code](CodeSystem-GenomicTestCode.html)
CodeSystem) rather than free text. No Account Number/Hospital Spell Identifier or
clinician professional identifier (GMC/GMP) field is present on the paper
form.

### Relationship to GMS WGS Rare Disease

The **Family Member** pathway here is effectively a **consultand test**:
the same real-world scenario as one repetition of [GMS WGS Rare
Disease](Questionnaire-GMSWGSRareDisease.html)'s own repeating [Family
member(s) to be tested](Questionnaire-GMSWGSRareDisease.html#summary)
group - a relative tested alongside a proband, referenced back to them for
interpretation. The two Questionnaires model it in opposite directions for
the same reason described above (`ServiceRequest.supportingInfo` roles
reversed): this form produces **one order per specimen**, so the family
member is this order's own subject and the proband is the reference,
whereas GMS WGS Rare Disease's composite form keeps the proband as the
subject and lists family members as repeating `RelatedPerson` references
instead - see [GMS WGS Rare Disease - Practical Issues: One Form, Multiple
Orders](Questionnaire-GMSWGSRareDisease.html#practical-issues-one-form-multiple-orders).
This Questionnaire may therefore represent a ready-made way of resolving
that composite-form problem, not just an analogy to it: decomposing GMS WGS
Rare Disease's Family Members group into individual per-person orders could
reuse this Family Member pathway's own shape directly - proband referenced
back via `NOS/Proband`, the same NK1-shaped `RelatedPerson` group as each
Family Members repetition on GMS WGS Rare Disease, both ultimately the same
[NW Genomic General Ask At Order Questions - Related Individual
(NK1)](Questionnaire-GenomicGeneralAskAtOrderEntry.html) group first
generalised from [Genetic Clinical Referral -
Consultand](Questionnaire-GeneticReferralConsultand.html) - rather than
needing a new decomposition pattern designed from scratch.
