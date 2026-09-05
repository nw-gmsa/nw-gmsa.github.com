<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
carries the fields from the [dWGS digital
manifest](dWGS.html#field-mapping-csv--hl7-v2--fhir) (NHS England `RGL to SGL
SOP` Appendix 3, plus 5 local extension fields) that are **not** already
asked by the common core - see [dWGS Sub-Order
Manifest](Questionnaire-dWGSSubOrder.html) for the full 42-field manifest
description this Questionnaire was extracted from.

<div class="alert alert-info" role="alert">
<b>Related:</b> <a href="Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html">WGS Local Test Order Ask At Order Entry</a> -
a different WGS ordering pathway (local paper form rather than a distributed
sub-contracted digital manifest).
</div>

## Questions at a Glance

| Group | Item | LinkId | FHIR Field | Note |
|---|---|---|---|---|
| Referral / Sub-Order | Original Order Placer Group Number (Referral ID) | `dWGS/referral_id` | `ServiceRequest.requisition` | Related to, but distinct from, the base's G Number (Pedigree Number) |
| Referral / Sub-Order | Test Code | `dWGS/clinical_indication_test_type_id` | `ServiceRequest.code` | Fills a gap - no WGS Test Category exists in the base's Test Code branches |
| Referral / Sub-Order | Original Ordering Facility Code | `dWGS/ordering_entity_id` | `Specimen.identifier.assigner.identifier.value` | Overlaps conceptually with the base's Referring Organisation ODS Code (HL7/ORC-21) |
| Referral / Sub-Order | Filler Order Ordering Facility Code (GLH) | `dWGS/glh_laboratory_id` | `ServiceRequest.requester.identifier.value` | Overlaps conceptually with the base's Referring Organisation ODS Code (HL7/ORC-21) |
| Referral / Sub-Order | Retrospective Sample Flag | `dWGS/retrospective_sample` | `ServiceRequest.intent` | - |
| Referral / Sub-Order | Clinical Information | `dWGS/clinical_information` | `ServiceRequest.note` | Same FHIR target as the base's Relevant clinical information (HL7/NTE-1), different v2 NTE occurrence |
| Referral / Sub-Order | Approved By | `dWGS/approved_by` | - | - |
| Patient | Patient Identifier (NGIS) | `dWGS/patient_ngis_id` | `Patient.identifier` | Base Patient group (name/DOB/NHS number) is not repeated |
| Ask At Order Entry Questions | Family Structure | `NOS/FamilyStructure` | `Observation.valueCodeableConcept` | Singleton/Duo/Trio - see [Singleton, Duo and Trio testing](dWGS.html#singleton-duo-and-trio-testing) |
| Ask At Order Entry Questions | Participant Type | `NOS/ParticipantType` | `Observation.valueCodeableConcept` | Proband/Family Member |
| Primary Specimen | Sample Received Date | `dWGS/primary_sample_received_date` | `Specimen.receivedTime` | Same FHIR target as General AAOE's Date and time sample received (NOS/SampleReceived) |
| Primary Specimen | Received Sample Identifier | `dWGS/primary_sample_id_as_received_by_glh` | `Specimen.identifier` (type=PLAC) | PLAC-typed instance of the base's Specimen ID Number (LN/80398-1) |
| Primary Specimen | LIMS Sample Identifier | `dWGS/primary_sample_id_in_glh_lims` | `Specimen.identifier` (type=FILL) | Conceptually the base's Lab DNA Number, on a different FHIR element |
| Primary Specimen | Sample Type (germline/tumour) | `dWGS/primary_sample_type` | - | Low confidence, no FHIR field yet |
| Primary Specimen | Sample Topography | `dWGS/received_sample_topography` | `Specimen.bodySite` | Cancer only; overlaps with the base's Tissue source/organ of origin (LN/39111-0) |
| Primary Specimen | Sample Morphology | `dWGS/received_sample_morphology` | - | - |
| Primary Specimen | Tumour Content (%) | `dWGS/received_sample_tumour_content_pct` | - | Cancer only; same concept as WGS Local Test Order's Neoplastic Cell Content |
| Primary Specimen | Sample Comments | `dWGS/received_sample_comments` | - | - |
| Dispatched Specimen | Dispatched Sample Identifier | `dWGS/dispatched_sample_id_in_glh_lims` | - | - |
| Dispatched Specimen | Specimen Barcode | `dWGS/dispatched_sample_lsid` | `Specimen.container.identifier` (type=ZCID) | - |
| Dispatched Specimen | Dispatched Sample Type | `dWGS/dispatched_sample_type` | - | - |
| Dispatched Specimen | Dispatched Material Type | `dWGS/dispatched_sample_state` | - | Not currently built into any FHIR resource |
| Dispatched Specimen | Sample Volume (uL) | `dWGS/dispatched_sample_volume_ul` | `Specimen.collection.quantity` | Same FHIR target as the base's Specimen Volume (LN/3169-0) |
| Dispatched Specimen | DNA Extraction Method | `dWGS/dna_extraction_protocol` | `Specimen.collection.method` | - |
| Dispatched Specimen | Consignment Number | `dWGS/glh_sample_consignment_number` | `Specimen.identifier` (type=STN) | Same identifier type as the base's Tracking Number (LN/97209-1) |
| Laboratory QC and Logistics | Remaining Banked Volume, DNA Concentration/Purity/Integrity/Fragment Size, QC Status, Dispatch Date, Plating Organisation, Rack Identifier/Well Position, Sample Storage Method | `dWGS/*` | - | Lab-internal QC/logistics fields, no equivalent anywhere in the base |
{:.grid}

**Not carried over from the manifest**: `patient_forename`, `patient_surname`,
patient date of birth, NHS Number, Sample Material Type (Specimen Type), and
Specimen Collection Date all use the **same** `linkId`s and codes as items
already in [Genomic Test Order](Questionnaire-GenomicTestOrder.html)'s own
Patient and Specimen groups - see the six rows marked **Genomic Test Order
(base)** in [dWGS - Field mapping](dWGS.html#field-mapping-csv--hl7-v2--fhir)
for the full list. They remain part of [dWGS Sub-Order
Manifest](Questionnaire-dWGSSubOrder.html)'s complete manifest description,
just not repeated here.
