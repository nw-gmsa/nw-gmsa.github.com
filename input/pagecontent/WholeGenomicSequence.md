<div class="alert alert-danger" role="alert">
This is a proposed use case, not an active or planned project. It is not yet part of
[iGene Orders and Reports (Alder Hey, MFT, Liverpool)](RegionalOrdersAndReports.html)
itself - the two pages may be combined later once this is settled.
</div>

A supplement to [iGene Orders and Reports (Alder Hey, MFT,
Liverpool)](RegionalOrdersAndReports.html), exploring what it would take for Alder
Hey, MFT or Liverpool Women's to place a **Whole Genome Sequencing** order directly
with NW Genomics - using the national [GMS WGS Rare
Disease](Questionnaire-GMSWGSRareDisease.html)/[GMS WGS
Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) order-entry shape, rather than
the generic [Genomic Test Order](Questionnaire-GenomicTestOrder.html) common core
[iGene Orders and Reports](RegionalOrdersAndReports.html) otherwise describes.

## References

1. [iGene Orders and Reports (Alder Hey, MFT, Liverpool)](RegionalOrdersAndReports.html) - the use case this page supplements
2. [GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html)
3. [GMS WGS Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html)
4. [Genomic Test Order](Questionnaire-GenomicTestOrder.html)

<div class="alert alert-info" role="alert">
<b>Not to be confused with:</b> <a href="dWGS.html">Distributed WGS (dWGS)</a> - a
different pathway entirely. dWGS is a <code>LAB-35</code> sub-order an external
Requesting Genomic Laboratory sends onward to NW Genomics once a national GMS
referral has already been accepted; this page is about Alder Hey/MFT/Liverpool
ordering directly with NW Genomics, the same as every other test <a
href="RegionalOrdersAndReports.html">iGene Orders and Reports</a> covers, just using
the national WGS forms' shape rather than the generic common core. Nothing here
touches the <code>LAB-35</code> manifest.
</div>


## Data Models

Three Questionnaires already model the Proband/family-member (`RelatedPerson`) side of
this proposed pathway:

- [Genomic General Ask At Order Entry](Questionnaire-GenomicGeneralAskAtOrderEntry.html) -
  the canonical NK1-shaped `NOS/RelatedIndividual` group (Name/Relationship/Sex/
  DOB/NHS Number/Hospital Number, plus a Role of Consultand or Proband) every other
  Questionnaire below reuses. Alongside `RelatedPerson`, this is also the only one of
  the four with its own explicit Consent and High Infection Risk items - it represents
  a **singular order** (one Patient, one `ServiceRequest`), the same as [WGS Local Test
  Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) and [GMS WGS
  Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) below.
- [WGS Local Test Order Ask At Order Entry](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) -
  reuses that same group as `NOS/Proband` (Role fixed to Proband) on its Family Member
  ordering pathway - the closest existing precedent for a WGS order naming a second
  individual this way.
- [GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html) - its own repeating
  `FamilyMembers` group carries the same `ServiceRequest.supportingInfo` ->
  `RelatedPerson` shape, inline rather than via the shared group.

[GMS WGS Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) does not currently
use `RelatedPerson` at all - a cancer WGS order is germline+tumour on one patient, not
a family test - so it isn't part of this particular data model, despite being the
other national WGS form.

### Field Comparison

[Genomic General Ask At Order Entry](Questionnaire-GenomicGeneralAskAtOrderEntry.html)
isn't tied to any one paper form - its Consent/High Infection Risk/RelatedPerson items
were originally part of the [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
common core itself, extracted into this default fallback Questionnaire for order/test
types that don't have their own dedicated Ask At Order Entry Questionnaire. All three
WGS-specific Questionnaires below **do** have their own dedicated Questionnaire, so
Genomic General isn't used alongside them in practice - it's included here only to
show where these fields originally came from.

For the three real paper forms, checked directly against the source PDFs rather than
assumed from what each Questionnaire's FSH happens to declare:

| Field | [WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) | [GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html)                                                                                                | [GMS WGS Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) |
|---|---|-------------------------------------------------------------------------------------------------------------------------------------------------------------|---|
| Order Placer Number | Not on the paper form | Not on the paper form                                                                                                                                       | Not on the paper form |
| Order Group Number | Not on the paper form | Not on the paper form - see Outstanding Issues below<br/>It is believed a Order Filler Group Number is created on submission of the form                    | Not on the paper form |
| Medical Record Number | "Hospital number" - present | "Hospital number" - present                                                                                                                                 | "Hospital number" - present |
| Account Number / Hospital Spell | Not on the paper form | Not on the paper form                                                                                                                                       | Not on the paper form |
| RelatedPerson | "Family Member (please provide below the Name & DoB of the Proband)" - present, modelled as `NOS/Proband` | "Family members to be tested" table - present, modelled as `FamilyMembers`                                                                                  | Not on the paper form |
| Consent | "Consent Statement" note ("A complete Patient Choice form must be received by the laboratory before WGS can be initiated") - present, modelled as `SNM/74996004-patient-choice-form` | Only "Record of Discussion" attached/to-follow tick - present, modelled as its own item; no consent-for-testing/DNA-storage question like Genomic General's | Same Record of Discussion tick as Rare Disease |
| High Risk Sample | "High Infection Risk? Yes/No" - present, modelled as `SNM/281269004` + `NOS/InfectionRiskDetails` | Not on the paper form                                                                                                                                       | Not on the paper form |
{:.grid}

Order Placer Number, Order Group Number and Account Number are all still structurally
present on all three Questionnaires (inherited, unchanged, from the
[Genomic Test Order](Questionnaire-GenomicTestOrder.html) common core - none of the
three overrides or re-declares them) - the table above is about what the *paper form*
itself actually asks for, which is narrower than what the FHIR Questionnaire
structurally allows.

### The Reverse Direction: What the Generic Order Path Doesn't Cover

The comparison above starts from each WGS-specific Questionnaire and checks the paper
form. Going the other way - starting from each paper form's own distinctive fields and
checking whether [Genomic Test Order](Questionnaire-GenomicTestOrder.html) plus
[Genomic General Ask At Order
Entry](Questionnaire-GenomicGeneralAskAtOrderEntry.html) (the generic combination
[iGene Orders and Reports](RegionalOrdersAndReports.html) actually uses today) already
has an equivalent - is what would decide whether Alder Hey/MFT/Liverpool could order
WGS through the existing generic path at all, rather than needing this proposed
WGS-specific one. Of the fields on all three paper forms, only a handful already have
a genuine or partial match:

| Paper form field | Which form(s) | Generic combo equivalent |
|---|---|---|
| Hospital Number (MRN) | All three | `LN/76435-7` - exact match |
| Proband / Family Member(s) named | WGS Local, GMS Rare Disease | `NOS/RelatedIndividual` (`repeats = true`, Consultand/Proband role) - matches the *shape*, but has no nested Specimen sub-group per repetition the way GMS Rare Disease's `FamilyMembers` does |
| High Infection Risk? | WGS Local | `SNM/281269004` - exact match, and now used by `WGSLocalTestOrderAskAtOrderEntry` itself |
| Record of Discussion attached/to follow | GMS Rare Disease, GMS Cancer | `NOS/RODToFollow` (inside the `Consent` group) - exact match |
| Consent Statement (references a separate Patient Choice form) | WGS Local | `Consent` group's "Has consent been obtained for tests (Y/N)" - related concept, not the same mechanism |
| Reason for urgency | GMS Rare Disease | `Priority` (`LN/82768-3`) - a coded urgency level, not free-text reason |
| Requesting organisation / GMS-GLH laboratory (two org fields) | GMS Rare Disease, GMS Cancer | `HL7/ORC-21` "Referring Organisation ODS Code / Ordering Facility" - one field, not the same two-organisation split |
| Test Directory Clinical Indication & code | GMS Rare Disease, GMS Cancer | `HL7/OBR-4-r`/`-h`/`-c` Test Code branches - present for Rare and Inherited Disease/Haemoglobinopathy/Cancer, but none of the three covers WGS specifically |
| Additional clinical information | GMS Cancer | `HL7/NTE-1` "Relevant clinical information and family history" - close match |
| Histopathology/SIHMDS Lab ID | GMS Cancer | `LN/80398-1-ODS` "Pathology Laboratory Hospital/Trust ID" - adjacent concept (identifies the lab), not the same specific field |
| Life status (Alive/Deceased) | GMS Rare Disease | `LN/81954-0` "Date of death" - implies deceased status, doesn't capture "Alive" explicitly |
{:.grid}

Everything else - WGS test type itself, Family test type (Singleton/Trio/Other),
Reason NHS Number not available, Reason for diagnostic test (patient
management/reproductive/predictive tick boxes), Additional panel(s), Proband's age at
onset, specific rare disease suspected/confirmed, **HPO Terms**, Main contact,
Presentation status, Tumour presentation type/topography/morphology, Haemato-oncology
liquid tumour type, % malignant nuclei/blasts, Nucleated cell count, and Neoplastic
cell content - has **no equivalent at all** in Genomic Test Order or Genomic General
Ask At Order Entry. HPO Terms in particular is a mandatory field on GMS WGS Rare
Disease with nothing resembling it anywhere in the generic combo. This is a fairly
direct answer to what motivates this whole proposed use case: the generic order path
[iGene Orders and Reports](RegionalOrdersAndReports.html) uses today could not capture
a WGS order's own clinically-necessary detail without the WGS-specific Questionnaires'
shape.

## Outstanding Issues

**Histopathology/SIHMDS Lab ID hints that a cancer WGS order may originate as a reflex
from an existing pathology order, which should itself have its own Order Placer
Number this order doesn't carry forward.** GMS WGS Cancer's Histopathology Lab ID and
SIHMDS Lab ID fields (see the Reverse Direction table above) only make sense if a
pathology sample/report already exists before the genomic order is raised - the same
pathology-to-genomics reflex pattern already modelled as its own use case in
[Cheshire and Merseyside (Pathology to Genomics
Reflex)](CheshireAndMerseysidePathology.html), where a pathology `LAB-1`/`LAB-3` can
reflex on to a genomic order (`LAB-35`/`LAB-36`, or a separate `LAB-1`). If that's what
GMS WGS Cancer's Lab ID fields are really referencing, the *original* pathology order
should itself have had its own Order Placer Number (`ServiceRequest.identifier:OrderIdentifier`,
per [Genomic Test Order - Diagnostic
Workflow](Questionnaire-GenomicTestOrder.html#diagnostic-workflow)) - but neither Lab
ID field on the GMS WGS Cancer paper form is modelled as that Order Placer Number, or
as any other structured reference back to the originating pathology order; they're
both free text (`Specimen.accessionIdentifier.assigner.identifier.value`), which
identifies the pathology *lab*, not the pathology *order*. [Haemoglobinopathy Genetic
Ask At Order Entry](Questionnaire-HaemoglobinopathyGeneticAskAtOrderEntry.html) is the
closest existing precedent for a genetic order form carrying content from an original
report - its own `LaboratoryResults` group carries actual FBC/haemoglobinopathy screen
values (Hb, RBC, HbA2%, HbF%, etc.) forward from a prior report - but even that
precedent carries the prior report's *values*, not a link back to the prior report's
own Order Placer Number either. So this remains a genuinely open question, not one
this IG has already answered elsewhere.

**GMS WGS Rare Disease's one-form-names-several-people shape looks like a data-entry
convenience (from many EPR and LIMS perspective), not a genuine single order - the individual orders it implies must be
linked by Order Group Number for electronic exchange.** The paper form itself has no
Order Group Number field at all (see Field Comparison above), which is consistent with
it being designed as a single physical document a clinician fills in once per family,
not as something that maps directly onto one electronic order. In practice, each named
person - proband plus every family member - needs their own `Patient`/`Specimen`/
`ServiceRequest`, so electronic exchange of this form's answers requires decomposing
it into **separate singular orders**, one per person, each shaped like the other two
national/local WGS Questionnaires in the comparison above. Those separate orders
should/must then be tied back together by a shared **Order Group Number**
(`pedigreeNumber`, already inherited from the common core, but - like the paper
form itself - not populated by anything on the form) rather than the family
relationship being reconstructable only via the composite submission. [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s Family Member pathway
already models one instance of exactly this decomposition.

**The HPO Terms guide list and the Test Directory Clinical Indication guide list
overlap semantically, but aren't cross-checked.** [GMS WGS Rare
Disease](Questionnaire-GMSWGSRareDisease.html) asks for both HPO Terms (bound to
[GMS WGS Guide HPO Terms](ValueSet-GMSWGSGuideHPOTermsVS.html), 38 phenotypes
transcribed from the form's own guide list) and a Test Directory Clinical Indication
(bound to [GMS WGS Guide Test Codes](ValueSet-GMSWGSGuideTestCodesVS.html), the 37
`$GTD` `R*` codes whose display text names WGS) as two separate items, answering two
different questions - HPO Terms is the observed phenotype on this patient, Test
Directory Clinical Indication is which coded test is being ordered. Comparing the two
guide lists directly shows 10 of the 38 guide HPO phenotypes correspond to a named
clinical indication in the Test Codes guide list:

| HPO guide term | Matching `R*` WGS test code |
|---|---|
| Cardiomyopathy / Hypertrophic cardiomyopathy / Dilated cardiomyopathy | `R135.2` Paediatric or syndromic cardiomyopathy |
| Cataract | `R31.3` Bilateral congenital or childhood onset cataracts |
| Ataxia / Cerebellar atrophy / Cerebellar hypoplasia | `R54.3`/`R55.4` Hereditary ataxia (adult/childhood onset) |
| Dystonia / Chorea | `R56.3`/`R57.5` Adult/childhood onset dystonia, chorea or related movement disorder |
| Spasticity | `R60.3`/`R61.4` Adult/childhood onset hereditary spastic paraplegia |
| Microcephaly | `R88.3` Severe microcephaly |
| Generalized hypotonia | `R69.5` Hypotonic infant |
| Peripheral neuropathy | `R78.4` Hereditary neuropathy or pain disorder |
| Abnormality of metabolism/homeostasis | `R98.2` Likely inborn error of metabolism |
| Skeletal dysplasia | `R104.3` Skeletal dysplasia |
| Multiple renal cysts / Hepatic cysts | `R193.4` Cystic renal disease |
{:.grid}


## Examples

No example exists yet in this IG for the proposed direct-order pathway itself, but ten
examples from NHS England's own [GOMS FHIR Implementation
Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/home) - built
from the same underlying Test Order Form Bundle shape our national GMS WGS forms
follow - are already vendored into this IG's own `input/resources/` and published
here, each cross-referenced back to its NHS England source in `sushi-config.yaml`.
Confusingly, nine of the ten are titled **Non-WGS**, even though they share the same
Bundle structure as the one WGS-titled example - "Non-WGS" here means "this order
form, used for a test that isn't WGS", not "unrelated to WGS":

| This IG's Example | NHS England GOMS FHIR IG Source | HL7 v2 | Note |
|---|---|---|---|
| [Bundle-WGSTestOrderForm-Example](Bundle-WGSTestOrderForm-Example.html) | [Bundle-WGSTestOrderForm-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-WGSTestOrderForm-Example) | - | The one example actually titled WGS |
| [Bundle-NonWGSTestOrderForm-Example](Bundle-NonWGSTestOrderForm-Example.html) | [Bundle-NonWGSTestOrderForm-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSTestOrderForm-Example) | - | Same Bundle shape as the WGS example, non-WGS rare disease test |
| [Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example](Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example.html) | [Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example) | [Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSTestOrderForm-CancerSolidTumor-Example.txt) | Cancer solid tumour order |
| [Bundle-NonWGSTestOrderForm-Reanalysis-Example](Bundle-NonWGSTestOrderForm-Reanalysis-Example.html) | [ServiceRequest-NonWGSTestOrderForm-ReAnalysis-Example-duplicate-2](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/ServiceRequest?version=0.4.3#ServiceRequest-NonWGSTestOrderForm-ReAnalysis-Example-duplicate-2) | - | Reanalysis order - sourced from an older IG version (0.4.3) at `ServiceRequest` level, not the current `Bundle` example set |
| [Bundle-NonWGSTestOrderForm-FetalScenario-Example](Bundle-NonWGSTestOrderForm-FetalScenario-Example.html) | [Bundle-NonWGSTestOrderForm-FetalScenario-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSTestOrderForm-FetalScenario-Example) | - | Fetal order |
| [Bundle-NonWGSScenario3-FetusAsProband-Example-FetusA](Bundle-NonWGSScenario3-FetusAsProband-Example-FetusA.html) | [Bundle-NonWGSScenario3-FetusAsProband-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSScenario3-FetusAsProband-Example) | [Bundle-NonWGSScenario3-FetusAsProband-Example-FetusA.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSScenario3-FetusAsProband-Example-FetusA.txt) | Fetus as the Proband |
| [Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-FetusA](Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-FetusA.html) / [-FetusB](Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-FetusB.html) | [Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example) | [-FetusA.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-FetusA.txt) / [-FetusB.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-FetusB.txt) | One GEL scenario (proband with multiple fetuses), split here into one participant Bundle per fetus |
| [Bundle-NonWGSScenario5-ProductsofConception-Example](Bundle-NonWGSScenario5-ProductsofConception-Example.html) | [Bundle-NonWGSScenario5-ProductsofConception-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSScenario5-ProductsofConception-Example) | [Bundle-NonWGSScenario5-ProductsofConception-Example.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSScenario5-ProductsofConception-Example.txt) | Products of conception |
| [Bundle-NonWGSTestOrderFormQRPatientExtensions-Example](Bundle-NonWGSTestOrderFormQRPatientExtensions-Example.html) | [Bundle-NonWGSTestOrderFormQRPatientExtensions-Example](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Examples/Bundle#Bundle-NonWGSTestOrderFormQRPatientExtensions-Example) | - | `QuestionnaireResponse`/`Patient` extension variant |
{:.grid}

The HL7 v2 `OML^O21` messages above (built by the same
[nw-gmsa/Testing](https://github.com/nw-gmsa/Testing) notebook series as this IG's own
[dWGS examples](dWGS.html#examples)) are the HL7 v2 counterpart of the FHIR Bundle in
the same row - useful for comparing the same order in both formats. Two further HL7 v2
fixtures in that same
[Output/V2/O21](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/O21) folder -
[Bundle-NonWGSScenario3-FetusAsProband-Example-Mother.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSScenario3-FetusAsProband-Example-Mother.txt)
and
[Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-Mother.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/Bundle-NonWGSScenario4-ProbandWithMultipleFetus-Example-Mother.txt) -
don't have a corresponding FHIR Bundle example vendored in this IG; only the fetus
participants were carried over.


