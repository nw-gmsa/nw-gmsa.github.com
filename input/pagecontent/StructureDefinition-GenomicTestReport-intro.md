This logical model describes the common requirement for a Genomic Test
Report, extended by Report Panels for each kind of individual test finding -
see [Report Panels](#report-panels) below for the full list.

Although this model is genomics-specific in name, what it describes -
Patient, Hospital Spell, Diagnostic Workflow and Results - is a **core model
for diagnostic reports generally**, not something unique to genomics. The
same shape applies equally to pathology, radiology and clinical referral
reports; genomics is simply the domain this IG documents it against first.
See [Diagnostic Model Overview](diagnostic-core.html) for the basic model
this logical model adds detail to, and how it relates to [Genomic Test
Order](StructureDefinition-GenomicTestOrder.html) on the order side.

It is not a FHIR profile and is not exchanged as is - see [From Logical Model
to Implementation Model](#from-logical-model-to-implementation-model) below,
and the **Mappings** tab for where each element goes in HL7 v2 `ORU_R01`, in
this IG's FHIR profiles, and in the [Genomic Test Report
Questionnaire](Questionnaire-GenomicTestReport.html).

### References

- [HL7 Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) (HL7 v2,5,1)
- HL7 International [Genomics Reporting Implementation Guide](https://hl7.org/fhir/uv/genomics-reporting/STU3/index.html) (HL7 FHIR)
    - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- [openEHR Genomics Project](https://ckm.openehr.org/ckm/projects/1013.30.50)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- The Royal College of Radiologists [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf)
- [NHS England Genomics DiagnosticReport](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-DiagnosticReport) use text descriptions only, not the rendered profile.
- [HL7 Europe Core - DiagnosticReport](https://hl7.eu/fhir/base/2.0.0-ballot/StructureDefinition-diagnosticReport-eu-core.html)
