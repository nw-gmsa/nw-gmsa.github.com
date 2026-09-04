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
| Family member(s) to be tested | Repeating group (name, DOB, sex, NHS number/postcode, life status, status, ethnicity, relationship), each with its own nested Sample sub-group | `ServiceRequest.supportingInfo` -> `RelatedPerson`, repeating group |
| HPO Terms | Term (offered from a [38-term guide list](CodeSystem-GMSWGSGuideHPOTerms.html), or free text) + Present/Absent/Unknown, repeating, **mandatory** | `Condition.code` (`#open-choice`) / `Condition.verificationStatus` |
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

The source PDF's fillable form fields (rather than its plain text) show it
hard-codes exactly two family-member slots (`FM1_*`/`FM2_*`), each with its
own demographic fields **and** its own matching sample fields further down
the form - modelled here as a single repeating `Family Members` group (not
capped at two) with a nested `Sample` sub-group per repetition, rather than
two hard-coded, disconnected sections. One field name from the PDF -
`FM1_status`/`FM2_status`, alongside but distinct from `FM1_deceased` - has
no stated purpose on the form's own visible labels; it is carried through
as free text pending confirmation of what it means.

### Practical Issues: One Form, Multiple Orders

Unlike every other paper form in this comparison, a single completed copy
of this form names **several** people - the proband plus, for a Duo/Trio
or larger family test, one or more repeating [Family member(s) to be
tested](#summary) rows - each of whom is (or becomes) their own `Patient`
with their own specimen. Modelled strictly, this Questionnaire's answers
don't decompose into one order, but into **one order per person tested**.
That composite shape is worth flagging as a practical implementation
problem in its own right, separate from the question of whether it's a
referral or an order:

- **EPR order entry is built around a single patient context.** Most
  Electronic Patient Record systems raise an order from within one
  patient's own record - there is no natural place to enter "and also
  order this same test for these other two people" on the same order
  screen. A family test referred this way would most likely need
  raising as separate orders per person within the EPR already, with this
  form's family-level fields (Family test type, clinical justification,
  HPO terms) either repeated on each or attached once and cross-referenced.
- **LIMS will very likely only accept one patient and one specimen per
  order.** Even if an EPR could somehow raise a single composite order for
  multiple people, the receiving Laboratory Information Management System
  is unlikely to have a concept of "one order, several patients/specimens”
  - it needs one order per patient/specimen to allocate accessioning,
  worklists and results against. Something upstream of the LIMS (the
  ordering system, or an integration engine) would need to split this
  form's answers into per-person orders before they could reach it.
- **[dWGS](dWGS.html) already solves this exact problem, for the
  distributed pathway.** Its own answer is that "each participant in a
  Duo or Trio is sequenced and submitted as their own **separate**
  sub-order (their own `Patient`, `Specimen` and `ServiceRequest`)...not
  combined into one message", tied together only by a shared requisition
  number - see [dWGS - Singleton, Duo and Trio
  testing](dWGS.html#singleton-duo-and-trio-testing). If this form were
  taken forward as a real digital order, the same per-person decomposition
  (rather than a single multi-patient resource) is the pattern it would
  most likely need to follow - not attempted as a new Questionnaire here,
  since that would need its own dedicated design work rather than a quick
  extension of the existing Ask At Order Entry pattern.
- **[WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)
  already models what one decomposed order looks like.** Its own Family
  Member pathway - one order per specimen, whose own common-core Patient
  group is the family member being tested, with a `NOS/ProbandReference`
  linking back to the proband's separate order - is a concrete, existing
  answer to exactly this decomposition problem, closer to home than dWGS
  since it isn't tied to sub-contracting between GLHs. A Family Members
  repetition here naming a relative's specimen could plausibly decompose
  into an order shaped exactly like that Family Member pathway, rather than
  needing a new pattern designed from scratch - see [WGS Local Test Order -
  Relationship to GMS WGS Rare
  Disease](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html#relationship-to-gms-wgs-rare-disease).
