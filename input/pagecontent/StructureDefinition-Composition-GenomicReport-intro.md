### References

- Association for Clinical Genomic Science (ACGS) [General Genetic Laboratory Reporting Recommendations](https://www.acgs.uk.com/media/11649/acgs-general-genetic-laboratory-reporting-recommendations-2020-v1-1.pdf) (2020, version 1.1) - the reporting rules this profile follows
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
| ACGS [General Genetic Laboratory Reporting Recommendations](https://www.acgs.uk.com/media/11649/acgs-general-genetic-laboratory-reporting-recommendations-2020-v1-1.pdf) (2020, v1.1) | **The rules this profile follows**: what a UK genetic laboratory report must and should contain. It sets content, not a section layout - see [ACGS Reporting Recommendations](#acgs-reporting-recommendations) |
| [NHS England Genomics Test Reporting Specification](https://www.england.nhs.uk/publication/genomics-testing-reporting-specification/) | The headings a UK genomic report is expected to show - to be confirmed against the published specification |
| [Master HL7 genetic variant reporting panel](https://loinc.org/81247-9) (LOINC `81247-9`), as used by the [HL7 v2.5.1 LRI Clinical Genomics chapter](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) | The HL7 v2 grouping of results: overall study, overall interpretation, simple, structural and complex variants, pharmacogenomics, haplotypes - see [Alternative Layout](#alternative-layout-hl7-v2-genetic-variant-panel) |
| NHS England [FHIR Genomics Implementation Guide - Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings?version=0.6.2) | Headings from the Genomics Minimum Dataset for the test request - see [Alternative Layout](#alternative-layout-nhs-england-clinical-headings) |
{:.grid}

#### ACGS Reporting Recommendations

This profile follows the ACGS [General Genetic Laboratory Reporting Recommendations](https://www.acgs.uk.com/media/11649/acgs-general-genetic-laboratory-reporting-recommendations-2020-v1-1.pdf)
(2020, version 1.1). In that document *must* is a requirement and *should* is a recommendation. It
says what a report has to contain, but not in which sections, so the table below shows where each
requirement is carried in the FHIR Document. Requirements about the printed page (pagination,
patient identifiers on every page), report distribution, archiving and turnaround times are not
about the document's content and are left out.

| ACGS | Requirement | Where in the FHIR Document | Profile |
|---|---|---|---|
| 2.1 | The overall result or conclusion **must** be clearly visible | Result summary section (LOINC `51968-6`), and `DiagnosticReport.conclusion` / `conclusionCode` | Met - Result summary required (1..1) |
| 2.2 | Name, contact details and referral unit of the requesting clinician, and of any copy recipients, **must** be shown | Referral section entry ServiceRequest (`requester`); copy recipients in the `informationRecipient` extension (from `Composition-eu-lab`) | Referral required (1..1); `requester` and contact details not required |
| 2.3 | The issuing laboratory **must** be clearly identified, with full contact details; the report **should** have a title and date of issue | `Composition.custodian` and `author` (Organization), `Composition.title`, `Composition.date` | `custodian` is optional; contact details are not required |
| 2.3 | The accreditation status of the test **should** be indicated | Methodology and limitations section text | No coded element |
| 2.4 | At least two patient identifiers (e.g. full name and date of birth), plus a laboratory number and/or NHS number, **must** be shown | `Composition.subject` (Patient name, `birthDate`, NHS number), `Composition.identifier` | Met |
| 2.4 | For prenatal samples it **must** be clear that the result is from the fetus, and which fetus | `Composition.subject` is the fetus (see [Patient - Fetus](Patient-Patient-FetusLondon.html)) | Not checked |
| 2.4 | The type of primary sample and its date of receipt **must** be recorded | Specimen section entry Specimen (`type`, `receivedTime`) | Met - Specimen required (1..1); the Specimen entry is optional |
| 2.5 | Sequence variants **must** be classified using the ACMG guidelines | Interpretation section entry Diagnostic Implication (`clinical-significance`, LOINC `53037-8`) | Met |
| 2.5.1 | HGVS or ISCN nomenclature; a reference sequence or genome build **must** be given with any coordinates | Variant components (`48004-6`, `51958-7`, `81290-9`, `81291-7`) and the genome build (`62374-4`) on the Genomic Study Panel | Not required by the Variant profile |
| 2.5.2 | The clinical question **must** be restated, with any relevant referral information | Referral section (LOINC `42349-1`) | Met - Referral required (1..1) |
| 2.5.3, 2.5.6 | A clear description of the genetic abnormality and a full clinical interpretation **must** be given | Results section (and sub-sections) and Interpretation section | Met - Results (1..\*) and Interpretation (1..1) required |
| 2.5.4 | The associated syndrome, disease or prognosis is included where relevant | Diagnostic Implication `predicted-phenotype` (LOINC `81259-4`) | Met |
| 2.5.5 | The test methodology, its sensitivity and resolution, and whether testing was incomplete **must** be stated | Methodology and limitations section | Met - Methodology required (1..1) |
| 2.5.6.4 | For tumours, results **should** be linked to the proportion of neoplastic cells; a normal result without it **must** be qualified | Specimen section text (tumour content) and Methodology and limitations | No coded element |
| 2.5.7 | Family studies: a table, a pedigree where complex, and a pedigree or family number | [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html), [Genomics Pedigree Number](StructureDefinition-GenomicsPedigreeNumber.html) | No section |
| 2.5.8 | Carrier and recurrence risks, and implications for other family members, **should** be stated | Interpretation or Recommendations section | Met (text) |
| 2.5.11 | Referral for genetic counselling **should** be recommended; all reports **should** state that support is available from Clinical Genetics | Recommendations section (LOINC `62385-0`) | Optional (0..1) - *should* only |
| 2.5.12 | Further tests, or that no further testing is planned | Recommendations section | Met |
| 2.5.14, 2.5.16 | Results from another laboratory may be restated; an integrated report **must** have an overarching interpretation | Results from other laboratories section (`performer` is the other laboratory), with the Interpretation section covering all results | Met - optional section |
| 3 | The report **must** indicate that it has been authorised | `Composition.attester` (mode `legal`), `DiagnosticReport.resultsInterpreter` | Met - `attester` required (1..\*) |
| 4 | Interim or preliminary reports **should** be clearly marked as such | `Composition.status` = `preliminary` | Met |
| 5 | A revised report **must** be stand-alone, refer to the original report, and state whether it replaces or supersedes it | `Composition.status` = `amended` or `corrected`, `Composition.relatesTo` (`replaces`) | Met |
| 6 | No disclaimers are required | Annotations section only where appropriate | Met |
| 7 | Selected references, where published data are key to the interpretation | Interpretation section text, or the `relatedArtifact` extension on the implication | No section |
{:.grid}

The Referral, Specimen, Result summary, Results, Interpretation and Methodology and limitations
sections, and `attester`, are required because they carry an ACGS *must*. Recommendations stays
optional, as ACGS only says *should* for its content. The *Profile* column shows the remaining gaps,
where an ACGS *must* is carried in text but not enforced by the profile.

A PDF report is not generally part of the FHIR Document. Where one exists it is exchanged
separately, as a [DocumentReference](StructureDefinition-DocumentReference.html) (see
[Report Types](ReportTypes.html)).

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
        S4["Section: Results<br/>variant table, optional sub-sections<br/><i>text + Variant, Genomic Study Analysis,<br/>Molecular Consequence</i>"]
        S8["Section: Results from other laboratories<br/>e.g. tumour immunohistochemistry<br/><i>text + Observation, DiagnosticReport</i>"]
        S5["Section: Interpretation<br/><i>text + Diagnostic and<br/>Therapeutic Implication</i>"]
        S6["Section: Recommendations<br/>family testing, further tests<br/><i>text + recommended actions</i>"]
        S7["Section: Methodology and limitations<br/>genes/regions studied, coverage<br/><i>text + Genomic Study Panel,<br/>Genomic Study, Genomic Study Analysis</i>"]
        S9["Section: Annotations<br/><i>comments - text only</i>"]
        DR["DiagnosticReport<br/><i>result: the same Observations</i>"]
    end

    COMP --> S1
    COMP --> S2
    COMP --> S3
    COMP --> S4
    COMP --> S8
    COMP --> S5
    COMP --> S6
    COMP --> S7
    COMP --> S9
    COMP <-->|"extension diagnosticReport /<br/>DiagnosticReport composition"| DR
```

| Section (slice) | Code | Content (entries) | Notes |
|---|---|---|---|
| Referral (`Referral`) | LOINC `42349-1` Reason for referral (narrative) | Text; entries [ServiceRequest](StructureDefinition-ServiceRequest.html), [Condition](StructureDefinition-Condition.html) | Clinical indication and the [National Genomic Test Directory](https://www.england.nhs.uk/publication/national-genomic-test-directories/) test requested. Required: ACGS 2.5.2 |
| Specimen (`Specimen`) | SNOMED CT `123038009` Specimen | Text; entry [Specimen](StructureDefinition-Specimen.html) | No LOINC document section code found; as used by the [ctDNA UGR example](Bundle-ctdna9737383222-eulab-document.html) |
| Result summary (`ResultSummary`) | LOINC `51968-6` Discrete variation analysis overall interpretation | Text; entry [DiagnosticReport](StructureDefinition-DiagnosticReport.html) | The headline result shown first on the report |
| Results (`Results`) | LOINC `69548-6` Genetic variant assessment | Text (the variant table); entries [Variant](StructureDefinition-Variant.html), [Genomic Study Analysis](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html), [Molecular Consequence](StructureDefinition-MolecularConsequence.html) | Optional sub-sections, one per `81247-9` panel group that applies - see [Results Sub-sections](#results-sub-sections) |
| Results from other laboratories (`OtherLaboratoryResults`) | [Genomic Report Section](CodeSystem-GenomicReportSection.html) `other-laboratory-results` (local) | Text; entries Observation, DiagnosticReport, with the other laboratory as `performer` | Optional. Results the interpretation depends on, for example tumour immunohistochemistry from Histopathology (ACGS 2.5.14, 2.5.16) |
| Interpretation (`Interpretation`) | [Genomic Report Section](CodeSystem-GenomicReportSection.html) `interpretation` (local) | Text; entries [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html), [Therapeutic Implication](StructureDefinition-TherapeuticImplication.html) | Is this separate from the result summary? |
| Recommendations (`Recommendations`) | LOINC `62385-0` Recommendation | Text; entries follow-up and medication recommendations (Task) | For example testing of relatives. LOINC `18783-1` Study recommendation is an alternative |
| Methodology and limitations (`Methodology`) | [Genomic Report Section](CodeSystem-GenomicReportSection.html) `methodology` (local) | Text; entries [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html), [Genomic Study](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study.html), [Genomic Study Analysis](https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-genomic-study-analysis.html) (regions studied) | Genes or regions studied, technology, coverage, limitations |
| Annotations (`annotations`) | LOINC `48767-8` Annotation comment | Text only, no entries | Inherited from `Composition-eu-lab` |
{:.grid}

##### Results Sub-sections

The Results section can be split into sub-sections (the second level allowed by
`Composition-eu-lab`), one for each group of the HL7 v2 [Master HL7 genetic variant reporting panel](Questionnaire-81247-9.html)
that applies to the test - see [Alternative Layout](#alternative-layout-hl7-v2-genetic-variant-panel).
Results holds what was found. What it means, including the medication implications of a
pharmacogenomic genotype, belongs in the Interpretation section, so a Therapeutic Implication
appears only once.

| Sub-section (slice) | Code | Content (entries) |
|---|---|---|
| Simple variants (`SimpleVariants`) | LOINC `81250-3` | [Variant](StructureDefinition-Variant.html) - single nucleotide changes, small insertions and deletions |
| Structural variants (`StructuralVariants`) | LOINC `81297-4` | [Variant](StructureDefinition-Variant.html) - copy number changes, with their ISCN or HGVS name |
| Complex variants (`ComplexVariants`) | LOINC `81251-1` | [Variant](StructureDefinition-Variant.html) - compound heterozygous variants, haplotypes |
| Pharmacogenomics (`Pharmacogenomics`) | LOINC `82118-1` | [Genotype](StructureDefinition-Genotype.html) - medication implications go in Interpretation |
| Haplotype definitions (`HaplotypeDefinitions`) | LOINC `83011-7` | [Haplotype](StructureDefinition-Haplotype.html) |
{:.grid}

##### FHIR Document Examples

These FHIR Document examples use this profile, including the Results sub-sections. All are
fictitious.

| Example | Kind of report | Test | Results sub-sections | Based on |
|---|---|---|---|---|
| [Lynch syndrome](Bundle-FHIRDocumentGeneticReportBundle2.html) | Germline (rare disease) | R210.2 Inherited MMR deficiency (Lynch syndrome) | Simple variants; also a Results from other laboratories section (tumour immunohistochemistry) | HL7 v2 LRI Example 3 |
| [Whole Genome Sequencing](Bundle-FHIRDocumentGeneticReportBundle-WGS.html) | Germline (rare disease), trio | R27.3 Paediatric disorders (WGS), for the [dWGS Trio](Bundle-dWGS-Trio-r26000000203-p26000000104.html) referral r26000000203 | Simple variants, Structural variants (none detected) | |
| [Somatic](Bundle-FHIRDocumentGeneticReportBundle-Somatic.html) | Somatic (cancer) | M4.1 Non-Small Cell Lung Cancer, multi-target NGS panel - small variant | Simple variants | HL7 Genomics Reporting [Somatic Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/somatics.html) |
| [Pharmacogenomics](Bundle-FHIRDocumentGeneticReportBundle-Pharmacogenomics.html) | Pharmacogenomic | R454.1 Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy (CYP2C19) | Pharmacogenomics, Haplotype definitions | HL7 Genomics Reporting [Pharmacogenomic Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/pharmacogenomics.html) |
{:.grid}

Older examples that do not use the Results sub-sections:
[ctDNA](Bundle-FHIRDocumentGeneticReportBundle-ctDNA.html) and
[Targeted Variant](Bundle-FHIRDocumentGeneticReportBundle.html).

##### What the Reader Sees (Inferred Layout)

A viewer shows each section's narrative in order, like the pages of a printed report. The mock below
is a fictitious germline (Lynch syndrome) report laid out this way, as the report looks today. The
small grey labels show which
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
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Results from other laboratories &middot; GenomicReportSection#other-laboratory-results &middot; entry Observation</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Results from other laboratories</div>
<p style="margin:2px 0 10px;">Tumour mismatch repair immunohistochemistry (Histopathology): loss of MLH1 and PMS2 expression; MSH2 and MSH6 retained. No <i>MLH1</i> promoter hypermethylation.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Interpretation &middot; GenomicReportSection#interpretation &middot; entries Diagnostic Implication</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Interpretation</div>
<p style="margin:2px 0 10px;">This variant has been reported in many individuals with Lynch syndrome and is classified as pathogenic. It is consistent with the loss of MLH1 and PMS2 seen in the tumour.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Recommendations &middot; LOINC 62385-0 &middot; entries recommended actions (Task)</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Recommendations</div>
<p style="margin:2px 0 10px;">Predictive testing is available for at-risk relatives through Clinical Genetics. Management should follow national guidance for Lynch syndrome.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Methodology and limitations &middot; GenomicReportSection#methodology &middot; entries Genomic Study Panel, Genomic Study, Genomic Study Analysis</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Methodology and limitations</div>
<p style="margin:2px 0 10px;">Next generation sequencing of the coding regions and exon-intron boundaries of <i>MLH1</i>, <i>MSH2</i>, <i>MSH6</i>, <i>PMS2</i> and <i>EPCAM</i>, with copy number analysis. Deep intronic variants and low-level mosaicism may not be detected.</p>
</div>


##### What the Reader Sees (Inferred Layout with Results Sub-sections)

The same fictitious report, using the [Results sub-sections](#results-sub-sections) of this profile.
The Results section is split by kind of variant: the sequence variant under Simple variants, and the
copy number analysis under Structural variants. Sub-sections that do not apply to this germline
report (complex variants, pharmacogenomics, haplotype definitions) are left out.

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
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Results &middot; LOINC 69548-6</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Results</div>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">sub-section Simple variants &middot; LOINC 81250-3 &middot; entries Variant</div>
<div style="font-size:15px; font-weight:bold; margin:8px 0 4px;">Simple variants</div>
<table style="width:100%; font-size:14px; border-collapse:collapse; margin:4px 0 10px;">
<tr style="background:#eee;"><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Gene</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Variant (HGVS)</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Zygosity</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Inheritance</th><th style="text-align:left; padding:3px 6px; border:1px solid #ccc;">Classification</th></tr>
<tr><td style="padding:3px 6px; border:1px solid #ccc;"><i>MLH1</i></td><td style="padding:3px 6px; border:1px solid #ccc;">NM_000249.4:c.350C&gt;T p.(Thr117Met)</td><td style="padding:3px 6px; border:1px solid #ccc;">Heterozygous</td><td style="padding:3px 6px; border:1px solid #ccc;">Germline</td><td style="padding:3px 6px; border:1px solid #ccc;"><b>Pathogenic</b> (class 5)</td></tr>
</table>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">sub-section Structural variants &middot; LOINC 81297-4 &middot; entries Variant</div>
<div style="font-size:15px; font-weight:bold; margin:8px 0 4px;">Structural variants</div>
<p style="margin:2px 0 10px;">No copy number variants (exon deletions or duplications) detected.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Results from other laboratories &middot; GenomicReportSection#other-laboratory-results &middot; entry Observation</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Results from other laboratories</div>
<p style="margin:2px 0 10px;">Tumour mismatch repair immunohistochemistry (Histopathology): loss of MLH1 and PMS2 expression; MSH2 and MSH6 retained. No <i>MLH1</i> promoter hypermethylation.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Interpretation &middot; GenomicReportSection#interpretation &middot; entries Diagnostic Implication</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Interpretation</div>
<p style="margin:2px 0 10px;">This variant has been reported in many individuals with Lynch syndrome and is classified as pathogenic. It is consistent with the loss of MLH1 and PMS2 seen in the tumour.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Recommendations &middot; LOINC 62385-0 &middot; entries recommended actions (Task)</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Recommendations</div>
<p style="margin:2px 0 10px;">Predictive testing is available for at-risk relatives through Clinical Genetics. Management should follow national guidance for Lynch syndrome.</p>
<div style="font-family:Arial,sans-serif; font-size:11px; color:#888;">section Methodology and limitations &middot; GenomicReportSection#methodology &middot; entries Genomic Study Panel, Genomic Study, Genomic Study Analysis</div>
<div style="font-size:17px; font-weight:bold; border-bottom:1px solid #999; margin:14px 0 6px;">Methodology and limitations</div>
<p style="margin:2px 0 10px;">Next generation sequencing of the coding regions and exon-intron boundaries of <i>MLH1</i>, <i>MSH2</i>, <i>MSH6</i>, <i>PMS2</i> and <i>EPCAM</i>, with copy number analysis. Deep intronic variants and low-level mosaicism may not be detected.</p>
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

#### Alternative Layout: HL7 v2 Genetic Variant Panel

The [HL7 Version 2.5.1 Lab Results Interface (LRI) Clinical Genomics chapter](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
reports a genetic test as one OBR, using the LOINC [Master HL7 genetic variant reporting panel](Questionnaire-81247-9.html)
(`81247-9`). The OBX segments are grouped by OBX-4 sub-ID into the panel's groups. Treating
each group as a document section gives a third possible layout. It describes the **result**,
the opposite of the NHS England clinical headings, which describe the request. Every section has a
LOINC code, and the result groups fit the second level of `Composition-eu-lab`:

```mermaid
flowchart TB
    COMP["<b>Composition</b><br/>Genomic report<br/>type: LOINC 81247-9 / 51969-4"]
    G1["Overall study<br/>LOINC 81306-3<br/><i>reason for study, genes and regions studied,<br/>reference sequence versions</i>"]
    G2["Overall interpretation<br/>LOINC 51968-6<br/><i>DiagnosticReport</i>"]
    RES["Results<br/><i>sub-sections</i>"]
    G3["Simple variants<br/>LOINC 81250-3<br/><i>Variant</i>"]
    G4["Structural variants<br/>LOINC 81297-4<br/><i>Variant</i>"]
    G5["Complex variants<br/>LOINC 81251-1<br/><i>Variant (compound het, haplotype)</i>"]
    G6["Pharmacogenomics<br/>LOINC 82118-1<br/><i>Genotype, Therapeutic Implication</i>"]
    G7["Haplotype definitions<br/>LOINC 83011-7<br/><i>Haplotype</i>"]
    G8["Narrative report<br/>LOINC 51969-4<br/><i>DocumentReference, Binary</i>"]
    COMP --> G1
    COMP --> G2
    COMP --> RES
    RES --> G3
    RES --> G4
    RES --> G5
    RES --> G6
    RES --> G7
    COMP --> G8
```

| Panel group | LOINC | Content (v2 OBX group) | Compared with the inferred layout |
|---|---|---|---|
| Overall study | `81306-3` Overall study variables | Reason for study (`53577-3`), disease assessed (`51967-8`), medication assessed (`51963-7`), genes studied (`48018-6`), mutations tested (`36908-2`), regions examined (`51959-5`, `81293-3`), reference assembly (`62374-4`) and HGVS, dbSNP, COSMIC and ClinVar versions | Referral and Methodology combined |
| Overall interpretation | `51968-6` Discrete variation analysis overall interpretation (`83006-7` for deletion/duplication) | The headline result | Result summary |
| Simple variants | `81250-3` Discrete genetic variant panel | One group per variant: HGVS, transcript, allelic state (`53034-5`), sample VAF (`81258-6`), genomic source class (`48002-0`), classification (`53037-8`) | Results (sub-section) |
| Structural variants | `81297-4` Structural variant panel | Copy number, length, outer and inner start-end ranges, ISCN name | Results (sub-section) |
| Complex variants | `81251-1` Complex variant panel | Compound heterozygous or haplotype, with the simple variants that make it up | Results (sub-section) |
| Pharmacogenomics | `82118-1` Pharmacogenomics result panel | Genotype (`84413-4`), drug metabolism and efficacy interpretation, medication usage implications (`82117-3`) | Results (sub-section) and Interpretation (therapeutic) |
| Haplotype definitions | `83011-7` Haplotype definition panel | Haplotype name and its defining variants | Not in the inferred layout |
| Narrative report | `51969-4` Genetic analysis report | The narrative or PDF report | Not in the inferred layout - a PDF report is exchanged separately (DocumentReference) |
| - | - | Specimen, Recommendations, Annotations: **no panel group** (in v2 these are carried by the SPM and NTE segments) | Specimen, Recommendations, Annotations |
{:.grid}

Germline, somatic and pharmacogenomic reports share this layout: groups that do not apply are
left out, and the genomic source class (germline, somatic, prenatal) is recorded on each variant
rather than by the layout.

Questions for discussion:

1. Is this the common layout of a NW GLH (and NHS England) genomic report, and in this order?
2. Should the sections be the same for germline (rare disease), somatic (cancer) and
   pharmacogenomic reports, or should each have its own layout?
3. Should the sections be one level (as above), or two levels as `Composition-eu-lab` allows - for
   example a top-level *Genetics* study section with these as sub-sections?
4. Which section codes should be used? LOINC has few document section codes for genomics; the
   alternatives are SNOMED CT or a local CodeSystem.
5. *Answered.* The referral and specimen details are sections, because ACGS requires the report to
   restate the clinical question (2.5.2) and record the sample type and date of receipt (2.4).
6. Should the report repeat the NHS England clinical headings of the test request (for example
   Patient Clinical Information, NGRL Consent, Fetus), and if so as sections or as entries in a
   Referral section?
7. Are the Results sub-sections, taken from the HL7 v2 panel groups (simple, structural and
   complex variants, pharmacogenomics, haplotypes), the right split, and should they be required
   where they apply?
