<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire is a **CSV manifest description**, not an Ask At Order
Entry Questionnaire - it documents the complete 42-field digital manifest a
Requesting Genomic Laboratory sends for a distributed WGS (dWGS)
sub-contracted order, including several fields also asked by [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) itself. See [dWGS - Ask at Order
Entry: the dWGS digital
manifest](dWGS.html#ask-at-order-entry-the-dwgs-digital-manifest) for the
full narrative, [dWGS - Field
mapping](dWGS.html#field-mapping-csv--hl7-v2--fhir) for the complete
field-by-field CSV/HL7 v2/FHIR mapping, and [dWGS Ask At Order Entry
Questions](Questionnaire-dWGSAskAtOrderEntry.html) for the genuinely
additional Ask At Order Entry Questionnaire this manifest was split from.

## Summary

Unlike the [NW GLH Paper Test Request
Forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms),
this Questionnaire genuinely does carry its own Patient/order-identifier
fields directly (it doesn't rely on `derivedFrom`/extends Genomic Test Order
for them) - see [dWGS - Field
mapping](dWGS.html#field-mapping-csv--hl7-v2--fhir) for the full 42-field
table; the fields below are the identifying subset most comparable to what
those other Ask At Order Entry Questionnaires' own Summary sections list:

| Item | CSV Field | FHIR |
|---|---|---|
| Patient first/last name | `patient_forename`/`patient_surname` | `Patient.name` |
| Date of birth | `patient_date_of_birth` | `Patient.birthDate` |
| NHS Number | `patient_nhs_number` | `Patient.identifier:nhsNumber` |
| Patient Identifier (NGIS) | `patient_ngis_id` | `Patient.identifier` (assigner Genomics England, ODS `8J834`) |
| Original Order Placer Group Number (Referral ID) | `referral_id` | `ServiceRequest.requisition` |
| Test Code | `clinical_indication_test_type_id` | `ServiceRequest.code.coding` (`England-GenomicTestDirectory`) |
| Original Ordering Facility Code | `ordering_entity_id` | `Specimen.identifier.assigner.identifier.value` |
| Filler Order Ordering Facility Code (GLH) | `glh_laboratory_id` | `ServiceRequest.requester.identifier.value` |
| Family Structure / Participant Type | Singleton/Duo/Trio, Proband/Family Member | `Observation.valueCodeableConcept` (`ServiceRequest.supportingInfo`) |
{:.grid}
