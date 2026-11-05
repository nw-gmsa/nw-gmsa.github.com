### References

- HL7 International [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Genomics](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-genomics.html)
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
- [openEHR Project: Genomics](https://ckm.openehr.org/ckm/projects/1013.30.50)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- [NHS England Genomics Test Reporting Specification](https://www.england.nhs.uk/publication/genomics-testing-reporting-specification/)
- Related 
  - HL7 Europe [Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/index.html) 
  - HL7 Europe [Imaging](https://build.fhir.org/ig/hl7-eu/imaging/index.html)

### Document Layout

<div class="alert alert-warning" role="alert">
<b>Open question.</b> What is the common layout of a genomic laboratory report, and so which
sections should this Composition have? This profile's sections follow the <b>inferred</b> layout
below, as a starting point for discussion. It has not been agreed, and the section codes are
candidates.
</div>

A genomic report sent as a FHIR Document (see [Report Types](ReportTypes.html)) is a `Bundle` of
type `document` with this `Composition` as its first entry. Each section carries its own
human-readable narrative (`section.text`, mandatory in `Composition-eu-lab`). A viewer shows those
narratives in order, like the pages of the printed (PDF) report, and the coded entries sit behind
them for computers to use.

No single source defines a FHIR Document layout for a genomic report. A layout can be inferred by
combining these sources:

| Source | What it gives |
|---|---|
| HL7 Europe [Laboratory Report](https://hl7.eu/fhir/laboratory/) `Composition-eu-lab` | The base profile: at least one section, `section.code` and `section.text` 1..1, sections nested at most **two levels** (top level for the study or specialty, second for report items), and an **Annotations** section (LOINC `48767-8`) for comments, text only |
| HL7 [Genomics Reporting](https://hl7.org/fhir/uv/genomics-reporting/) `genomic-report` | The content but not the layout: `DiagnosticReport.result` slices for variant, genotype, haplotype, biomarker, diagnostic and therapeutic implication, and the `recommended-action`, `genomic-study` and `coded-note` extensions |
| [NHS England Genomics Test Reporting Specification](https://www.england.nhs.uk/publication/genomics-testing-reporting-specification/) and ACGS reporting guidance | The headings a UK genomic report is expected to show - to be confirmed against the published specification |
| [Master HL7 genetic variant reporting panel](https://loinc.org/81247-9) (LOINC `81247-9`) | The HL7 v2 grouping of results: overall interpretation, discrete variants, complex variants, pharmacogenomics |
| NHS England [FHIR Genomics Implementation Guide - Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings?version=0.6.2) | Headings from the Genomics Minimum Dataset for the test request - see [Alternative Layout](#alternative-layout-nhs-england-clinical-headings) |
{:.grid}

#### Inferred Layout

The headings of a typical UK genomic laboratory report, as a FHIR Document. These are the
`section` slices of this profile. The codes are candidates, not decisions. Section titles are not
fixed, so a laboratory can use its own headings.

```mermaid
flowchart TB
    subgraph BUNDLE["Bundle (BundleDocument, type = document)"]
        direction TB
        COMP["<b>Composition</b> (Composition Genomic Report)<br/>type: Genetic report, LOINC 51969-4 Genetic analysis report<br/>subject: Patient - author: reporting laboratory (GLH)<br/>attester: authorising clinical scientist<br/>custodian: reporting laboratory"]

        S1["Section: Referral<br/>reason for referral, test requested (R / M code)<br/><i>text + ServiceRequest, Condition</i>"]
        S2["Section: Specimen<br/>sample type, collected, received<br/><i>text + Specimen</i>"]
        S3["Section: Result summary<br/>headline result<br/><i>text + DiagnosticReport</i>"]
        S4["Section: Results<br/>variant table<br/><i>text + Variant, Genomic Study Analysis,<br/>Molecular Consequence</i>"]
        S5["Section: Interpretation<br/><i>text + Diagnostic and<br/>Therapeutic Implication</i>"]
        S6["Section: Recommendations<br/>family testing, further tests<br/><i>text + recommended actions</i>"]
        S7["Section: Methodology and limitations<br/>genes/regions studied, coverage<br/><i>text + Genomic Study Panel,<br/>Genomic Study, Genomic Study Analysis</i>"]
        S8["Section: Presented form<br/><i>the PDF: DocumentReference, Binary</i>"]
        S9["Section: Annotations<br/><i>comments - text only</i>"]
        DR["DiagnosticReport<br/><i>result: the same Observations</i>"]
    end

    COMP --> S1
    COMP --> S2
    COMP --> S3
    COMP --> S4
    COMP --> S5
    COMP --> S6
    COMP --> S7
    COMP --> S8
    COMP --> S9
    COMP <-->|"extension diagnosticReport /<br/>DiagnosticReport composition"| DR
```

| Section (slice) | Code | Content (entries) | Notes |
|---|---|---|---|
| Referral (`Referral`) | LOINC `42349-1` Reason for referral (narrative) | Text; entries [ServiceRequest](StructureDefinition-ServiceRequest.html), [Condition](StructureDefinition-Condition.html) | Clinical indication and the [National Genomic Test Directory](https://www.england.nhs.uk/publication/national-genomic-test-directories/) test requested. Could instead be in the Composition header only |
| Specimen (`Specimen`) | SNOMED CT `123038009` Specimen | Text; entry [Specimen](StructureDefinition-Specimen.html) | No LOINC document section code found; as used by the [ctDNA UGR example](Bundle-ctdna9737383222-eulab-document.html) |
| Result summary (`ResultSummary`) | LOINC `51968-6` Discrete variation analysis overall interpretation | Text; entry [DiagnosticReport](StructureDefinition-DiagnosticReport.html) | The headline result shown first on the report |
| Results (`Results`) | LOINC `69548-6` Genetic variant assessment | Text (the variant table); entries [Variant](StructureDefinition-Variant.html), [Genomic Study Analysis](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html), [Molecular Consequence](StructureDefinition-MolecularConsequence.html) | Could be split into sub-sections following the `81247-9` panel (discrete variants, complex variants, pharmacogenomics) |
| Interpretation (`Interpretation`) | [Genomic Report Section](CodeSystem-GenomicReportSection.html) `interpretation` (local) | Text; entries [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html), [Therapeutic Implication](StructureDefinition-TherapeuticImplication.html) | Is this separate from the result summary? |
| Recommendations (`Recommendations`) | LOINC `62385-0` Recommendation | Text; entries follow-up and medication recommendations (Task) | For example testing of relatives. LOINC `18783-1` Study recommendation is an alternative |
| Methodology and limitations (`Methodology`) | [Genomic Report Section](CodeSystem-GenomicReportSection.html) `methodology` (local) | Text; entries [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html), [Genomic Study](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html), [Genomic Study Analysis](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) (regions studied) | Genes or regions studied, technology, coverage, limitations |
| Presented form (`PresentedForm`) | LOINC `77599-9` Additional documentation | Entries DocumentReference, Binary | Used while the PDF remains the authorised report (UGR phase 1) |
| Annotations (`annotations`) | LOINC `48767-8` Annotation comment | Text only, no entries | Inherited from `Composition-eu-lab` |
{:.grid}

Examples: [Lynch syndrome](Bundle-FHIRDocumentGeneticReportBundle2.html),
[ctDNA](Bundle-FHIRDocumentGeneticReportBundle-ctDNA.html) and
[Targeted Variant](Bundle-FHIRDocumentGeneticReportBundle.html).

##### What the Reader Sees (Inferred Layout)

A viewer shows each section's narrative in order, like the pages of a printed report. The mock below
is a fictitious germline (Lynch syndrome) report laid out this way. The small grey labels show which
part of the FHIR Document each block comes from - a real viewer would not show them.

<div style="border:1px solid #bbb; box-shadow:0 2px 8px rgba(0,0,0,0.15); background:#fff; color:#222; max-width:820px; margin:16px auto; padding:28px 36px; font-family:Georgia,'Times New Roman',serif; font-size:15px; line-height:1.5;">
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888; text-align:right;">Composition.title &middot; type SNOMED CT Genetic report, LOINC 51969-4</div>
<div style="display:flex; justify-content:space-between; align-items:flex-start; border-bottom:2px solid #333; padding-bottom:8px; margin-bottom:12px;">
<div><div style="font-size:22px; font-weight:bold;">Genomic Test Report</div><div>North West Genomic Laboratory Hub (ODS 699X0)</div></div>
<div style="font-family:Arial,sans-serif; font-size:12px; color:#c00; font-weight:bold; border:1px solid #c00; padding:2px 6px;">FICTITIOUS EXAMPLE</div>
</div>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Composition header: subject (Patient), identifier, date, status, author, attester</div>
<table style="width:100%; font-size:14px; margin-bottom:14px; border:none;">
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Patient</b></td><td style="border:none;">EXAMPLE, Alex</td><td style="border:none;"><b>NHS Number</b></td><td style="border:none;">999 000 0001</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Date of birth</b></td><td style="border:none;">01-Jan-1970</td><td style="border:none;"><b>Laboratory number</b></td><td style="border:none;">G26-012345</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Requested by</b></td><td style="border:none;">Dr A Clinician, Clinical Genetics</td><td style="border:none;"><b>Report status</b></td><td style="border:none;">Final</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Reported</b></td><td style="border:none;">21-Oct-2026</td><td style="border:none;"><b>Authorised by</b></td><td style="border:none;">Dr B Scientist, Consultant Clinical Scientist</td></tr>
</table>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Referral &middot; LOINC 42349-1 &middot; entries ServiceRequest, Condition</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Referral</div>
<p style="margin:2px 0 10px;"><b>Reason for referral.</b> R210 Inherited MMR deficiency (Lynch syndrome). Colorectal adenocarcinoma at age 42; tumour immunohistochemistry showed loss of MLH1 and PMS2 with no <i>MLH1</i> promoter hypermethylation.</p>
<p style="margin:2px 0 10px;"><b>Test requested.</b> R210.2 - National Genomic Test Directory.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Specimen &middot; SNOMED CT 123038009 &middot; entry Specimen</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Specimen</div>
<p style="margin:2px 0 10px;">Peripheral blood (EDTA). Collected 30-Sep-2026, received 01-Oct-2026.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Result summary &middot; LOINC 51968-6 &middot; entry DiagnosticReport</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Result summary</div>
<div style="border:1px solid #999; background:#f6f6f6; padding:6px 10px; margin:2px 0 14px;"><b>Pathogenic <i>MLH1</i> variant detected. This result confirms a diagnosis of Lynch syndrome.</b><br/>Test outcome: 311 RESULT CONSISTENT WITH REFERRAL INDICATION</div>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Results &middot; LOINC 69548-6 &middot; entries Variant</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Results</div>
<table style="width:100%; font-size:14px; border-collapse:collapse; margin:4px 0 10px;">
<tr style="background:#eee;"><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Gene</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Variant (HGVS)</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Zygosity</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Inheritance</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Classification</th></tr>
<tr><td style="padding:3px 6px; border:1px solid #ccc;"><i>MLH1</i></td><td style="padding:3px 6px; border:1px solid #ccc;">NM_000249.4:c.350C&gt;T p.(Thr117Met)</td><td style="padding:3px 6px; border:1px solid #ccc;">Heterozygous</td><td style="padding:3px 6px; border:1px solid #ccc;">Germline</td><td style="padding:3px 6px; border:1px solid #ccc;"><b>Pathogenic</b> (class 5)</td></tr>
</table>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Interpretation &middot; GenomicReportSection#interpretation &middot; entries Diagnostic Implication</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Interpretation</div>
<p style="margin:2px 0 10px;">This variant has been reported in many individuals with Lynch syndrome and is classified as pathogenic. It is consistent with the loss of MLH1 and PMS2 seen in the tumour.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Recommendations &middot; LOINC 62385-0 &middot; entries recommended actions (Task)</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Recommendations</div>
<p style="margin:2px 0 10px;">Predictive testing is available for at-risk relatives through Clinical Genetics. Management should follow national guidance for Lynch syndrome.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Methodology and limitations &middot; GenomicReportSection#methodology &middot; entries Genomic Study Panel, Genomic Study, Genomic Study Analysis</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Methodology and limitations</div>
<p style="margin:2px 0 10px;">Next generation sequencing of the coding regions and exon-intron boundaries of <i>MLH1</i>, <i>MSH2</i>, <i>MSH6</i>, <i>PMS2</i> and <i>EPCAM</i>, with copy number analysis. Deep intronic variants and low-level mosaicism may not be detected.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Presented form &middot; LOINC 77599-9 &middot; entry DocumentReference (PDF)</div>
<p style="margin:2px 0 10px;"><i>The authorised report is also attached as a PDF.</i></p>
</div>


#### Alternative Layout: NHS England Clinical Headings

The NHS England [FHIR Genomics Implementation Guide - Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings?version=0.6.2)
(version 0.6.2, draft) gives another possible layout. No PRSB headings exist for genomics, so its
headings are recreated from the Genomics Minimum Dataset (MDS v1.062). They describe the **test
request** (the Genomic Order Management Service order), so as document sections they would cover the
referral side of a report, not the results:

```mermaid
flowchart TB
    COMP["<b>Composition</b><br/>Genomic report"]
    H1["Healthcare Professional<br/><i>PractitionerRole</i>"]
    H2["Patient<br/><i>Patient</i>"]
    H3["Fetus<br/><i>Patient</i>"]
    H4["Test Request<br/><i>ServiceRequest</i>"]
    H5["NGRL Consent<br/><i>Consent, QuestionnaireResponse</i>"]
    H6["Primary Sample<br/><i>Specimen, BodyStructure</i>"]
    H7["Patient Clinical Information<br/><i>Condition, Observation</i>"]
    H8["Specialist Testing Requirements<br/><i>by test</i>"]
    H9["Miscellaneous<br/><i>Condition, Observation</i>"]
    H10["Hospital Encounter<br/><i>Encounter</i>"]
    RES["Results, interpretation, recommendations<br/><b>no heading defined</b>"]
    COMP --> H1
    COMP --> H2
    COMP --> H3
    COMP --> H4
    COMP --> H5
    COMP --> H6
    COMP --> H7
    COMP --> H8
    COMP --> H9
    COMP --> H10
    COMP -.-> RES
```

| Clinical heading | FHIR resource | Compared with the inferred layout |
|---|---|---|
| Healthcare Professional | PractitionerRole (`ServiceRequest.requester`) | Composition header, or the Referral section |
| Patient | Patient | Composition header (`subject`) |
| Fetus | Patient (fetus) | Not in the inferred layout - needed for prenatal reports |
| Test Request | ServiceRequest | Referral section |
| NGRL Consent | Consent, QuestionnaireResponse (record of discussion) | Not in the inferred layout |
| Primary Sample | Specimen, BodyStructure | Specimen section |
| Patient Clinical Information | Condition, Observation (for example HPO phenotypes) | Referral section (clinical indication) |
| Specialist Testing Requirements | By test (for example NIPD pregnancy details) | Not in the inferred layout |
| Miscellaneous | Condition, Observation, `ServiceRequest.note` | Annotations section |
| Hospital Encounter | Encounter | Composition header (`encounter`) |
| - | - | Result summary, Results, Interpretation, Recommendations, Methodology and limitations: **no clinical heading** |
{:.grid}

The guide also has headings that are not document content (Mapping to HL7v2/IHE, OMOP, Task
Updates). It gives no section codes and no cardinality for its headings.

##### What the Reader Sees (Alternative Layout)

The same fictitious report, with the NHS England clinical headings as its sections. The referral side
is more detailed (consent, clinical information), but the result - the part the reader most needs -
has no heading to go under (shown in red).

<div style="border:1px solid #bbb; box-shadow:0 2px 8px rgba(0,0,0,0.15); background:#fff; color:#222; max-width:820px; margin:16px auto; padding:28px 36px; font-family:Georgia,'Times New Roman',serif; font-size:15px; line-height:1.5;">
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888; text-align:right;">Composition.title &middot; headings from NHS England Clinical Headings</div>
<div style="display:flex; justify-content:space-between; align-items:flex-start; border-bottom:2px solid #333; padding-bottom:8px; margin-bottom:12px;">
<div><div style="font-size:22px; font-weight:bold;">Genomic Test Report</div><div>North West Genomic Laboratory Hub (ODS 699X0)</div></div>
<div style="font-family:Arial,sans-serif; font-size:12px; color:#c00; font-weight:bold; border:1px solid #c00; padding:2px 6px;">FICTITIOUS EXAMPLE</div>
</div>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Healthcare Professional &middot; PractitionerRole</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Healthcare Professional</div>
<p style="margin:2px 0 10px;">Dr A Clinician, Clinical Genetics, Example Hospital NHS Foundation Trust.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Patient &middot; Patient</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Patient</div>
<table style="width:100%; font-size:14px; margin-bottom:10px; border:none;">
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Name</b></td><td style="border:none;">EXAMPLE, Alex</td><td style="border:none;"><b>NHS Number</b></td><td style="border:none;">999 000 0001</td></tr>
<tr><td style="border:none; padding:2px 8px 2px 0;"><b>Date of birth</b></td><td style="border:none;">01-Jan-1970</td><td style="border:none;"><b>Phenotypic sex</b></td><td style="border:none;">Female</td></tr>
</table>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Test Request &middot; ServiceRequest</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Test Request</div>
<p style="margin:2px 0 10px;">R210 Inherited MMR deficiency (Lynch syndrome) - test R210.2. Priority routine. Laboratory number G26-012345.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">NGRL Consent &middot; Consent, QuestionnaireResponse</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">NGRL Consent</div>
<p style="margin:2px 0 10px;">Record of discussion completed 30-Sep-2026. Consent for storage in the National Genomic Research Library: not given.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Primary Sample &middot; Specimen</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Primary Sample</div>
<p style="margin:2px 0 10px;">Peripheral blood (EDTA). Collected 30-Sep-2026, received 01-Oct-2026.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Patient Clinical Information &middot; Condition, Observation</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Patient Clinical Information</div>
<p style="margin:2px 0 10px;">Colorectal adenocarcinoma at age 42; tumour immunohistochemistry showed loss of MLH1 and PMS2 with no <i>MLH1</i> promoter hypermethylation.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">Miscellaneous &middot; ServiceRequest.note</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Miscellaneous</div>
<p style="margin:2px 0 10px;">None.</p>
<div style="border:2px dashed #c00; padding:6px 10px; margin:14px 0 6px;">
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">no clinical heading defined - results, interpretation, recommendations, methodology</div>
<div style="font-size:17px; font-weight:bold; color:#c00;">(No heading)</div>
<p style="margin:2px 0 10px;"><b>Pathogenic <i>MLH1</i> variant detected. This result confirms a diagnosis of Lynch syndrome.</b></p>
<table style="width:100%; font-size:14px; border-collapse:collapse; margin:4px 0 10px;">
<tr style="background:#eee;"><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Gene</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Variant (HGVS)</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Zygosity</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Inheritance</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Classification</th></tr>
<tr><td style="padding:3px 6px; border:1px solid #ccc;"><i>MLH1</i></td><td style="padding:3px 6px; border:1px solid #ccc;">NM_000249.4:c.350C&gt;T p.(Thr117Met)</td><td style="padding:3px 6px; border:1px solid #ccc;">Heterozygous</td><td style="padding:3px 6px; border:1px solid #ccc;">Germline</td><td style="padding:3px 6px; border:1px solid #ccc;"><b>Pathogenic</b> (class 5)</td></tr>
</table>
<p style="margin:2px 0 10px;">Predictive testing is available for at-risk relatives through Clinical Genetics.</p>
</div>
</div>

Questions for discussion:

1. Is this the common layout of a NW GLH (and NHS England) genomic report, and in this order?
2. Should the sections be the same for germline (rare disease), somatic (cancer) and
   pharmacogenomic reports, or should each have its own layout?
3. Should the sections be one level (as above), or two levels as `Composition-eu-lab` allows - for
   example a top-level *Genetics* study section with these as sub-sections?
4. Which section codes should be used? LOINC has few document section codes for genomics; the
   alternatives are SNOMED CT or a local CodeSystem.
5. Should the referral and specimen details be sections, or only in the Composition header and
   the DiagnosticReport (`basedOn`, `specimen`)?
6. Should the report repeat the NHS England clinical headings of the test request (for example
   Patient Clinical Information, NGRL Consent, Fetus), and if so as sections or as entries in a
   Referral section?

### Domain Archetype

> **DRAFT FOR ELABORATION PURPOSES**

<figure style="overflow-x:auto;">
{%include LaboratoryReportComposition-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Laboratory Report - Map</p>
</figure>
<br clear="all">


#### Structured Report

<div class="alert alert-danger" role="alert">
This section is currently being elaborated and subject to change. It will include a modernisation to core FHIR concepts such as FHIR Workflow, FHIR Subscription and FHIR RESTful.
</div>


> **DRAFT FOR ELABORATION PURPOSES**

<!-- 
#### Somatic Reporting

[HL7 FHIR Genomics Reporting - Somatic Reporting](https://hl7.org/fhir/uv/genomics-reporting/pharmacogenomics.html)

is a mindmap 

#### Pharmacogenomic Reporting

[HL7 FHIR Genomics Reporting - Pharmacogenomic Reporting](https://hl7.org/fhir/uv/genomics-reporting/pharmacogenomics.html)

is a mindmap

#### HL7 v2 Genetic Variant Reporting (ORU_R01.txt)

> This is not included in the current phase and is for reference purposes. 

> [Master HL7 genetic variant reporting panel](https://fhir.nwgenomics.nhs.uk/R4/Questionnaire-81247-9.html)

-->


