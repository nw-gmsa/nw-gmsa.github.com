This logical model describes the common requirement for a Genomic Order,
which is extended by Ask At Order Entry Questionnaires. Which set of these
extension questionnaires is used depends on the order/test type
(`ServiceRequest.code`) - see [Order Entry Questions](#order-entry-questions)
below.

Although this model is genomics-specific in name, what it describes -
Patient, Hospital Spell, Diagnostic Workflow and Specimen - is a **core model
for diagnostic orders generally**, not something unique to genomics. The
same shape applies equally to pathology, radiology and clinical referral
orders; genomics is simply the domain this IG documents it against first.
See [Diagnostic Model Overview](diagnostic-core.html) for the basic model
this logical model adds detail to, and how it relates to [Genomic Test
Report](StructureDefinition-GenomicTestReport.html) on the report side.

It is not a FHIR profile and is not exchanged as is - see [From Logical Model
to Implementation Model](#from-logical-model-to-implementation-model) below,
and the **Mappings** tab for where each element goes in HL7 v2 `OML_O21`, in
this IG's FHIR profiles, and in the [Genomic Test Order
Questionnaire](Questionnaire-GenomicTestOrder.html).

### Reference

- [HL7 Europe Laboratory Report - ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- HL7 Europe [ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- [NHS England Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-ServiceRequest) use text descriptions only, not the rendered profile.
- [NHS Genomic Medicine Service test order forms](https://www.england.nhs.uk/publication/nhs-genomic-medicine-service-test-order-forms/)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- Prior Results (Oncology)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Assessment](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html)
