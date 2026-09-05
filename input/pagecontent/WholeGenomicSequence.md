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

All four `derivedFrom`/extend [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
directly (none extends another in this list), so Order Placer Number, Order Group
Number, Medical Record Number and Account Number are inherited unchanged from the
common core in every case - none of the four overrides or re-declares them. The
differences are all in `RelatedPerson`, Consent and High Risk Sample:

| Field | [Genomic General](Questionnaire-GenomicGeneralAskAtOrderEntry.html) | [WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) | [GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html) | [GMS WGS Cancer](Questionnaire-GMSWGSCancerAskAtOrderEntry.html) |
|---|---|---|---|---|
| Order Placer Number (`LN/106194-4`, `ServiceRequest.identifier:OrderIdentifier`) | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged |
| Order Group Number (`pedigreeNumber`, `Patient.identifier:PedigreeNumber`) | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged - see below | Inherited, unchanged |
| Medical Record Number (`LN/76435-7`, `Patient.identifier:MedicalRecordNumber`, required) | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged |
| Account Number / Hospital Spell (`LN/56797-4`, `ServiceRequest.encounter.identifier.value`) | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged | Inherited, unchanged |
| RelatedPerson | `NOS/RelatedIndividual` - canonical group, Role = Consultand or Proband | `NOS/Proband` - same group, Role fixed to Proband, Family Member pathway only | `FamilyMembers` - own inline repeating group, same shape | Not present |
| Consent | `Consent` group - consent for testing (`LN/19826-7`) + DNA storage (`LN/75520-7`) + ROD attached/to follow (`NOS/RODToFollow`) | Not present | Not present - only "Record of Discussion (ROD) attached, or to follow" (Attached/To follow), no consent-for-testing/DNA-storage item | Not present - only its own "Record of Discussion (ROD) attached, or to follow" item, same as Rare Disease |
| High Risk Sample | `SNM/281269004` "High Infection Risk?" + `NOS/InfectionRiskDetails` | Not present | Not present | Not present |
{:.grid}

**GMS WGS Rare Disease can represent a collection of orders, not one order.** As
[GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html#practical-issues-one-form-multiple-orders)'s
own "Practical Issues" section describes, a single completed form names the proband
plus, for a Duo/Trio or larger family test, one or more family members - each of whom
needs their own `Patient`/`Specimen`/`ServiceRequest`. Rather than one order literally
containing multiple patients, this would typically be implemented as **separate
singular orders** - one per person, each shaped like the other three Questionnaires in
this comparison - **connected to each other via a shared Order Group Number**
(`pedigreeNumber`, already inherited from the common core above) rather than by
nesting them inside a single submission. This is exactly the decomposition [WGS Local
Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s Family Member
pathway already models one instance of.

## Outstanding Issues

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


