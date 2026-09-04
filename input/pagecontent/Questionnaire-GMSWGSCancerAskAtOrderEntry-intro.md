<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire `derivedFrom`/extends [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). It
structures the **NHS Genomic Medicine Service (GMS) Whole Genome Sequencing
(WGS) Test Request - Cancer** form - the *national* GMS-branded form,
distinct from the NW GLH-specific [HRD and Tumour
BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html) form (a different
cancer test, not WGS) - see [NW Genomics paper test request
forms](Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms)
for how this compares to the other paper forms.

**Source form:** [GMS WGS Test Request Form - Cancer, V1.22 July 2024 (PDF)](https://mft.nhs.uk/app/uploads/2024/08/genomic-medicine-device-test-order-form-cancer-v1.22.pdf)

<div class="alert alert-info" role="alert">
<b>Related:</b> <a href="Questionnaire-GMSWGSRareDiseaseAskAtOrderEntry.html">GMS WGS Rare Disease Ask At Order Entry</a> -
the rare disease variant of this same national form family.
</div>

## Summary

| Item | Paper Form Field | FHIR |
|---|---|---|
| Requesting organisation / GLH laboratory | Two organisation fields | `PractitionerRole.organization` / `ServiceRequest.performer` |
| Reason NHS Number not available | Free text | `Patient.identifier:nhsNumber.extension` |
| Presentation status | First diagnosis/Recurrence/Relapse/Unknown | `Condition.clinicalStatus` |
| Additional clinical information | Free text | `ServiceRequest.note` |
| Test Directory Clinical Indication & code | Free text/code | `ServiceRequest.code` |
| Tumour presentation type (solid tumour only) | Primary/Metastatic/Unknown/Lymphoma | `Observation.valueCodeableConcept` |
| Histopathology Lab ID (solid tumour only) | Free text | `Specimen.accessionIdentifier.assigner.identifier.value` |
| Tumour topography/morphology (solid tumour only) | Free text | `Specimen.collection.bodySite` / not yet mapped |
| Haemato-oncology liquid tumour type | AML/ALL/Other | `Observation.valueCodeableConcept` |
| SIHMDS Lab ID | Free text | `Specimen.accessionIdentifier.assigner.identifier.value` |
| % Malignant nuclei/blasts | Numeric | `Observation.valueQuantity` |
| Nucleated cell count | Numeric (bone marrow/peripheral blood only) | Not yet mapped |
| Record of Discussion | Attached/to follow | `Observation.valueCodeableConcept` |
| Main contact | Name/department/phone/email, if different from responsible consultant | Not yet mapped |
{:.grid}

Tumour and germline sample sections (sample type, sample ID, collection
date/time, sample volume, comments) map directly onto the common core's own
[Specimen](Questionnaire-GenomicTestOrder.html#specimen) group and are not
re-declared here. No Order Placer Number, Account Number/Hospital Spell
Identifier, or clinician professional identifier (GMC/GMP) field is present
on the paper form - the same universal gap as every other paper form
compared on this page.
