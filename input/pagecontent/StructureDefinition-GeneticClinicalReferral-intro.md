<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This logical model describes a closed-loop clinical referral into a
genomics/clinical genetics service - the narrative use case is [Genetic
Referrals](GeneticReferrals.html), and the underlying HL7 v2 message it is
modelled on is `REF_I12` (Patient Referral), per that page's own [Referral
Data Model](GeneticReferrals.html#referral-data-model) and [Target Referral
Model](GeneticReferrals.html#target-referral-model).

The referral itself stays small. Clinical content travels as **forms**
(`QuestionnaireResponse`) and **clinical documents** - the pathology report,
the patient summary and the family letter - referenced from the referral,
not copied into it.

It is deliberately built the same way as [Genomic Test
Order](StructureDefinition-GenomicTestOrder.html) and [Genomic Test
Report](StructureDefinition-GenomicTestReport.html). Where a data item is
genuinely the same one [Genomic Test
Order](StructureDefinition-GenomicTestOrder.html) already captures (e.g.
patient demographics, both populating HL7 v2 `PID`), this model reuses the
same element rather than re-defining it, per the "check for existing
patterns" principle in [How To Engineer (scale and deliver)
Interoperability](HowToEngineerInteroperability.html#check-for-existing-patterns-before-modelling-new-ones).

It is not a FHIR profile and is not exchanged as is - see [From Logical Model
to Implementation Model](#from-logical-model-to-implementation-model) below,
and the **Mappings** tab for where each element goes in HL7 v2 `REF_I12`, in
this IG's FHIR profiles, and in the [Genetic Clinical Referral
Questionnaire](Questionnaire-GeneticClinicalReferral.html).

### References

- [Genetic Referrals](GeneticReferrals.html) - the narrative use case, actors and transactions
- NHS England [Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/Genomics-ServiceRequest) use text descriptions only, not the rendered profile.
- [Clinical Referral](https://kevinmayfield.github.io/PatientCareCoordination/en/StructureDefinition-Referral.html) logical model (Patient Care Coordination, proof of concept) - the forms and clinical document pattern used here
- HL7 Europe [Hospital Discharge Report (HDR)](https://build.fhir.org/ig/hl7-eu/hdr/) and [Patient Summary (EPS)](https://build.fhir.org/ig/hl7-eu/eps/) - clinical documents as FHIR Document `Bundle`s
- HL7 Europe [Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/index.html) - document perspective, for the pathology report
