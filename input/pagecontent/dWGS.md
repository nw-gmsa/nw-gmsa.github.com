<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## References

1. [Inter-Laboratory Workflow (ILW) - Sub-orders LAB-35 and LAB-36](ILW.html#sub-orders-lab-35-and-lab-36)
2. [laboratory-order MessageDefinition](MessageDefinition-laboratory-order.html)
3. [HL7 v2 Standards](hl7v2.html)
4. NHS England `RGL to SGL SOP` (37-field national digital manifest, Appendix 3) - referenced by name only, not publicly linked

## Clinical Pathway Overview

### What is being tested

Whole Genome Sequencing (WGS) is used to look for the genetic cause of a suspected
rare or inherited condition. Rather than testing one gene at a time, WGS reads a
patient's entire genome, so it can find variants anywhere - useful when the clinical
picture doesn't point to one specific gene, or when a targeted test has already come
back negative. Testing one or more close relatives alongside the patient (the
**Proband**) makes it much easier to tell which variants are relevant:

| Family Structure | Clinical purpose |
|---|---|
| Singleton | Used when relatives' samples aren't available, or aren't expected to help interpretation |
| Duo | Comparing against one relative (usually a parent) narrows down candidate variants |
| Trio | Comparing against both biological parents can directly identify a *de novo* (new, not inherited) variant - the strongest design for rare/inherited disease |
{:.grid}

### The end-to-end clinical journey

1. **Patient identified** - a clinician suspects a rare or inherited genetic condition and decides WGS is the right test, including whether parental/relative samples should be tested alongside the patient.
2. **Samples taken** - a blood/DNA sample is taken from the patient (proband) and, for a Duo or Trio, from the relevant relatives too.
3. **Referral submitted** - the Requesting Genomic Laboratory (RGL) submits the sample(s) and a digital manifest to whichever Sequencing Genomic Laboratory (SGL) is doing the sequencing - which may be a different region's laboratory. *(This is the `LAB-35` sub-order in the technical process below.)*
4. **Sequencing performed** - the SGL sequences the sample(s) and returns the result to the RGL. *(`LAB-36`.)*
5. **Report issued** - the RGL's report reaches the original ordering clinician. *(`LAB-3`/`LAB-5`.)*
6. **Clinical decision** - the clinical/genetics team interprets any variants found, discusses the result with the patient and family, and may refer relatives for genetic counselling or cascade testing.

```mermaid
flowchart LR
    A[Patient/family<br/>identified for WGS] --> B[Samples taken -<br/>proband +/- relatives]
    B --> C[Referral to SGL<br/>for sequencing]
    C --> D[Sequencing<br/>performed]
    D --> E[Report reaches<br/>ordering clinician]
    E --> F[Clinical review -<br/>may lead to genetic<br/>counselling referral]
```

### Why this matters for developers

- **Family Structure**/**Participant Type** are what distinguish a Singleton, Duo or Trio referral - see [Singleton, Duo and Trio testing](#singleton-duo-and-trio-testing) below for how these are represented.
- Each participant is submitted as their own **separate** sub-order (own `Patient`, `Specimen`, `ServiceRequest`) - not combined into one message - linked together only by a shared requisition number.
- Family Structure/Participant Type are asked at order entry precisely so the SGL knows, before sequencing starts, how many samples to expect for one referral and how to interpret them together.

## Actors

| IHE Actor (ILW)                                     | Role in dWGS                                    | System (worked examples)             |
|-------------------------------------------------------|----------------------------------------------------|------------------------------------------|
| [Requestor](ActorDefinition-Requestor.html) (Order Placer) | Requesting Genomic Laboratory (RGL)             | NE&Y Genomics                            |
| [Subcontractor](ActorDefinition-Subcontractor.html) (Order Filler) | Sequencing Genomic Laboratory (SGL)     | NW Genomics (iGene)                      |
{:.grid}

## Transactions

| Transaction | Description                          | Direction         |
|-------------|-----------------------------------------|------------------------|
| `LAB-1`     | Laboratory Order (original clinical order, upstream of this sub-order) | Test Ordering Entity → RGL |
| `LAB-35`    | Sub-order Management (sample + digital manifest) | RGL → SGL          |
| `LAB-36`    | Sub-order Results Delivery (sequencing result)   | SGL → RGL          |
| `LAB-3` / `LAB-5` | Laboratory Report (downstream of this sub-order) | RGL → Test Ordering Entity |
{:.grid}

## Current Process

Whole Genome Sequencing (WGS) for rare and inherited disease is being moved by NHS
England from a single centralised laboratory to a **distributed model (dWGS)**: each
NHS Genomic Medicine Service (GMS) geography's own laboratory acts as a
**Requesting Genomic Laboratory (RGL)**, submitting DNA samples and a digital manifest
directly to whichever laboratory is acting as **Sequencing Genomic Laboratory (SGL)**
for that sample - which may be another GMS's laboratory rather than the RGL's own.

Where the RGL and SGL are different organisations, this is a **sub-contracted order**:
in NW-GMSA's own [Inter-Laboratory Workflow (ILW)](ILW.html#sub-orders-lab-35-and-lab-36)
terms, the RGL is the *Order Placer* sending a `LAB-35` sub-order to the SGL (the
*Order Filler*), with the sequencing result returned as `LAB-36`. That sub-order can be
sent as either a FHIR `Bundle` (`POST [base]/$process-message`, the
[laboratory-order `MessageDefinition`](MessageDefinition-laboratory-order.html)) or
HL7 v2 `OML^O21` (see [HL7 v2 Standards](hl7v2.html)) - both follow the same underlying
NW-GMSA order model, so the choice is purely about what the sending system can produce.

```mermaid
flowchart TD
    OP["Order Placer<br/>Test Ordering Entity"]
    OF["Order Filler<br/>Requesting Genomic Laboratory (RGL)"]
    SC["Sub Contractor<br/>Sequencing Genomic Laboratory (SGL)"]

    OP -- "LAB-1<br/>laboratory order" --> OF
    OF -- "LAB-35<br/>sub-order + manifest" --> SC
    SC -- "LAB-36<br/>sequencing result" --> OF
    OF -- "LAB-3 / LAB-5<br/>laboratory report" --> OP
```

### Singleton, Duo and Trio testing

A WGS referral tests one or more people together as a single family group, so that
variants found in the person affected by the suspected condition (the **Proband**) can
be interpreted in the context of their close relatives. NW-GMSA's dWGS examples use two
"ask at order" data items to describe this, carried as `Observation` resources
referenced from `ServiceRequest.supportingInfo`:

- **Family Structure** - how many people are being tested together as part of this
  referral: `Singleton`, `Duo` or `Trio`.
- **Participant Type** - this individual's role within that family structure:
  `Proband` or `Family Member`.

| Family Structure | Participants tested                          | Typical use                                                                                       |
|-------------------|-----------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Singleton         | Proband only                                   | No parental samples available, or a family structure isn't expected to aid interpretation           |
| Duo               | Proband + one Family Member (usually a parent) | Narrows candidate variants by comparing against one relative                                        |
| Trio              | Proband + two Family Members (usually both parents) | The strongest common design for rare/inherited disease - directly identifies *de novo* (new, not inherited) variants by comparing the Proband against both biological parents |
{:.grid}

Each participant in a Duo or Trio is sequenced and submitted as their own **separate**
sub-order (their own `Patient`, `Specimen` and `ServiceRequest`, each with their own
NGIS participant identifier), not combined into one message. What ties the participants
of the same referral together is a **shared referral/requisition number**
(`ServiceRequest.requisition`), assigned by the RGL - every sub-order from the same
family structure carries the same requisition value, distinguished by each participant's
own identifier.

<div class="alert alert-info" role="alert">
<b>FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html">ServiceRequest</a>
</div>

Each example also demonstrates identifying the **specimen container** separately from
the specimen itself, using the local `ZCID` "Container Identifier" code from
[NW IdentifierType](ValueSet-NWIdentifierType.html) on `Specimen.container.identifier.type`
- see the [Container Identifier note](hl7v2.html#spm) on the HL7 v2 SPM segment page for
why this is only needed as a type code on the HL7 v2 side.

## Future Process

No distinct future-state changes are currently defined for this pathway beyond what
`RGL to SGL SOP v0.4` and the worked examples above already describe - this section
will be populated as NHS England's national dWGS rollout matures.

## Data Models

- [ServiceRequest](StructureDefinition-ServiceRequest.html) - the `LAB-35` sub-order, `requisition` shared across a family's participants
- [Specimen](StructureDefinition-Specimen.html) - primary and dispatched specimen identifiers on a single resource
- [Patient](StructureDefinition-Patient.html) - NHS number and NGIS participant identifier
- [dWGS Sub-Order Manifest](Questionnaire-dWGSSubOrder.html) - the CSV manifest description (all 42 fields)
- [dWGS Ask At Order Entry Questions](Questionnaire-dWGSAskAtOrderEntry.html) - the Ask At Order Entry Questionnaire, `derivedFrom`/extending [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
- [NW IdentifierType](ValueSet-NWIdentifierType.html) - the `ZCID` container identifier type code

### Ask at Order Entry: the dWGS digital manifest

<div class="alert alert-info" role="alert">
<b>FHIR Questionnaire:</b> <a href="Questionnaire-dWGSAskAtOrderEntry.html">dWGS Ask At Order Entry Questions</a> (Ask At Order Entry) and <a href="Questionnaire-dWGSSubOrder.html">dWGS Sub-Order Manifest</a> (CSV manifest description)
</div>

A `LAB-35` sub-order like the worked examples above is built from a **digital
manifest**: NHS England's `RGL to SGL SOP` defines 37 national manifest fields
(Appendix 3), and a Requesting Genomic Laboratory may add further local-extension
fields for the Sequencing Genomic Laboratory's benefit - the worked examples on this
page add 5. This IG models the manifest as **two** separate Questionnaires, not one:

- **[dWGS Sub-Order Manifest](Questionnaire-dWGSSubOrder.html)** - a **CSV manifest
  description**, not an Ask At Order Entry Questionnaire. It documents all 42 fields
  the RGL actually sends, including several also asked by the [core Genomic Test
  Order](Questionnaire-GenomicTestOrder.html#order-entry-questions) form (Patient
  name/DOB/NHS number, Specimen Type, Specimen Collection Date) - correctly, since it
  describes the complete manifest structure rather than an incremental set of
  order-entry questions layered on top of the core form.
- **[dWGS Ask At Order Entry Questions](Questionnaire-dWGSAskAtOrderEntry.html)** -
  the genuinely additional questions, `derivedFrom`/extending [Genomic Test
  Order](Questionnaire-GenomicTestOrder.html) the same way every other Ask At Order
  Entry Questionnaire does (see [Order Entry
  Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions)). It carries
  every manifest field **except** the six that duplicate the common core exactly -
  see [Field mapping](#field-mapping-csv--hl7-v2--fhir) below for which is which, and
  [Outstanding Issues (resolved by this split)](#outstanding-issues-resolved-by-this-split)
  for why the manifest previously declared `derivedFrom` itself and the confusion that
  caused.

The two fields specific to dWGS - **Family Structure** and **Participant Type** (see
[Singleton, Duo and Trio testing](#singleton-duo-and-trio-testing) above) - are
`dWGS Ask At Order Entry Questions`' main Ask at Order Entry questions: enumerated-string
answers with no NW-GMSA-confirmed coding system, carried as
`Observation.valueCodeableConcept` (text only) referenced from
`ServiceRequest.supportingInfo`. Unlike [Genetic Clinical Referral -
Consultand](Questionnaire-GeneticReferralConsultand.html), which references a
*second* individual (the consultand) from the proband's own `ServiceRequest`, a Duo
or Trio's Family Member is **not** referenced from the Proband's sub-order at all -
each participant (Proband and every Family Member) is submitted as their own
completely separate sub-order, tied together only by a shared requisition number
(see [The end-to-end clinical journey](#the-end-to-end-clinical-journey) above). There
is no equivalent here to Consultand's `RelatedPerson`/`ServiceRequest.supportingInfo`
cross-reference - see [Comparison with WGS Local Test
Order](#comparison-with-wgs-local-test-order) below for a closer relative that *does*
use that pattern.

#### Field mapping: CSV → HL7 v2 → FHIR

The table below is the full 42-field mapping (37 national fields plus 5 local
extension fields). The **Modelled In** column shows which Questionnaire(s) each field
appears in: every field is part of [dWGS Sub-Order
Manifest](Questionnaire-dWGSSubOrder.html) (the complete manifest description); most
are also part of [dWGS Ask At Order
Entry](Questionnaire-dWGSAskAtOrderEntry.html), except the six marked **Genomic Test
Order (base)**, which duplicate a common-core item exactly (same `linkId` and code)
and so are asked once, by the core form, rather than repeated in the Ask At Order
Entry Questionnaire. Where the `FHIR Field` column is blank, the field is carried in
the manifest but has no confirmed FHIR mapping yet - a genuine open question for a
future pass, not an oversight.

| CSV Field | Common Name | Cardinality | Type | HL7 v2 Field | FHIR Field | Modelled In |
|-----------|-------------|-------------|------|--------------|------------|-------------|
| `referral_id` | Original Order Placer Group Number | MUST | String | OBX-5 (OBX-3=NGIS_REFERRAL_ID) | ServiceRequest.requisition | dWGS Ask At Order Entry |
| `clinical_indication_test_type_id` | Test Code | OPTIONAL | String | OBR-4.1 | ServiceRequest.code.coding (England-GenomicTestDirectory) | dWGS Ask At Order Entry |
| `patient_nhs_number` | NHS Number | OPTIONAL | String | PID-3 (NH) | Patient.identifier (NHS number) | **Genomic Test Order (base)** |
| `patient_ngis_id` | Patient Identifier | MUST | String | PID-3 (NGIS) | Patient.identifier.assigner (Genomics England, ODS 8J834) | dWGS Ask At Order Entry |
| `patient_date_of_birth` | Date Of Birth | OPTIONAL | Date | PID-7.1 | Patient.birthDate | **Genomic Test Order (base)** |
| `ordering_entity_id` | Original Ordering Facility Code | OPTIONAL | Code (ODS Code) | ORC-21 | Specimen.identifier (as received) assigner | dWGS Ask At Order Entry |
| `glh_laboratory_id` | Filler Order Ordering Facility Code | MUST | Code (ODS Code) | ORC-21 | ServiceRequest.requester / requisition assigner / Specimen.identifier (LIMS) assigner | dWGS Ask At Order Entry |
| `primary_sample_received_date` | Sample Received Date | OPTIONAL | Date | SPM-18 (primary SPM) | Specimen.receivedTime (primary specimen) | dWGS Ask At Order Entry |
| `primary_sample_id_as_received_by_glh` | Received Sample Identifier | OPTIONAL | String | SPM-2.1 (primary SPM) | Specimen.identifier (as received) | dWGS Ask At Order Entry |
| `primary_sample_id_in_glh_lims` | LIMS Sample Identifier | OPTIONAL | String | SPM-2.2 (primary SPM) | Specimen.identifier (GLH LIMS) | dWGS Ask At Order Entry |
| `primary_sample_type` | Sample Type | MUST | Code (Specimen Type SNOMED CT) | SPM-11 (primary SPM, low confidence) | Specimen.type / extension (germline vs tumour, low confidence) | dWGS Ask At Order Entry |
| `primary_sample_state` | Sample Material Type | MUST | Code (Specimen Type SNOMED CT) | SPM-4.1 (primary SPM) | Specimen.type (SNOMED CT coding) | **Genomic Test Order (base)** |
| `received_sample_topography` | Sample Topography | MUST (cancer only) | String | SPM-8 (primary SPM, cancer only) | Specimen.bodySite (cancer only) | dWGS Ask At Order Entry |
| `received_sample_morphology` | Sample Morphology | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `received_sample_tumour_content_%` | Tumour Content | MUST (cancer only) | Number | - | - | dWGS Ask At Order Entry |
| `received_sample_comments` | Sample Comments | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `received_sample_collection_date` | Specimen Collection Date | OPTIONAL | Date | SPM-17 | Specimen.collection.collectedDateTime | **Genomic Test Order (base)** |
| `dispatched_sample_id_in_glh_lims` | Dispatched Sample Identifier | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `dispatched_sample_lsid` | Specimen Barcode | MUST | String | SPM-2.1 (type=ZCID) and OBX-5 (OBX-3=DISPATCHED_SAMPLE_LSID) | Specimen.container.identifier | dWGS Ask At Order Entry |
| `dispatched_sample_type` | Dispatched Sample Type | MUST | Code (Specimen Type SNOMED CT) | - | - | dWGS Ask At Order Entry |
| `dispatched_sample_state` | Dispatched Material Type | MUST | Code (Specimen Type SNOMED CT) | SPM-4.1 (dispatched SPM, not built in this worked example) | Specimen.type (not built - single Specimen only carries primary_sample_state) | dWGS Ask At Order Entry |
| `dispatched_sample_volume_(ul)` | Sample Volume | OPTIONAL | Number | SPM-12 | Specimen.collection.quantity | dWGS Ask At Order Entry |
| `laboratory_remaining_volume_banked_(ul)` | Remaining Banked Volume | OPTIONAL | Number | - | - | dWGS Ask At Order Entry |
| `glh_concentration_(ng/ul)` | DNA Concentration | OPTIONAL | Number | - | - | dWGS Ask At Order Entry |
| `glh_od260/280` | DNA Purity | OPTIONAL | Number | - | - | dWGS Ask At Order Entry |
| `glh_din_value` | DNA Integrity Number | OPTIONAL | Number | - | - | dWGS Ask At Order Entry |
| `glh_percentage_DNA_over_23kb` | DNA Fragment Size | OPTIONAL | Number | - | - | dWGS Ask At Order Entry |
| `glh_qc_status` | QC Status | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `glh_sample_dispatch_date` | Dispatch Date | OPTIONAL | Date | - | - | dWGS Ask At Order Entry |
| `glh_sample_consignment_number` | Consignment Number | OPTIONAL | String | SPM-32 | Specimen.identifier (type=STN) | dWGS Ask At Order Entry |
| `plating_organisation` | Plating Organisation | OPTIONAL | Enum | - | - | dWGS Ask At Order Entry |
| `gmc_rack_id` | Rack Identifier | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `gmc_rack_well` | Rack Well Position | OPTIONAL | String (pattern) | - | - | dWGS Ask At Order Entry |
| `dna_extraction_protocol` | DNA Extraction Method | OPTIONAL | String | SPM-7 | Specimen.collection.method | dWGS Ask At Order Entry |
| `prolonged_sample_storage` | Sample Storage Method | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `retrospective_sample` | Retrospective Sample Flag | OPTIONAL | Enum | (no clean v2 field) | ServiceRequest.intent (reflex-order when Retrospective) | dWGS Ask At Order Entry |
| `approved_by` | Approved By | OPTIONAL | String | - | - | dWGS Ask At Order Entry |
| `patient_forename` | Forename | MUST | String | PID-5.2 | Patient.name.given | **Genomic Test Order (base)** |
| `patient_surname` | Surname | MUST | String | PID-5.1 | Patient.name.family | **Genomic Test Order (base)** |
| `family_structure` | Family Structure | MUST | Enumerated string | OBX-5 (OBX-3=FAMILY_STRUCTURE) | Observation (via ServiceRequest.supportingInfo) | dWGS Ask At Order Entry |
| `participant_type` | Participant Type | MUST | Enumerated string | OBX-5 (OBX-3=PARTICIPANT_TYPE) | Observation (via ServiceRequest.supportingInfo) | dWGS Ask At Order Entry |
| `clinical_information` | Clinical Information | OPTIONAL | String | NTE-3 | ServiceRequest.note | dWGS Ask At Order Entry |
{:.grid}

**Two specimens, not one**: `primary_sample_*` fields describe the specimen as
originally received at the GLH (blood/tissue, before extraction); `dispatched_sample_*`
describes the extracted DNA sent onward. The worked examples below carry both as
identifiers/values on a single `Specimen` resource rather than two linked resources.

#### Comparison with WGS Local Test Order

[WGS Local Test Order Ask At Order
Entry](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) is the closest relative
to `dWGS Ask At Order Entry` in this IG - both structure a WGS-specific order beyond
the common core, and both distinguish a Proband from a Family Member. They model
genuinely different pathways, though, not the same one twice:

| Aspect | dWGS Ask At Order Entry | WGS Local Test Order Ask At Order Entry |
|---|---|---|
| Source | NHS England `RGL to SGL SOP` digital manifest (Appendix 3) | NW GLH paper [Genetic Testing Request Form - WGS](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html#summary) |
| Pathway | **Sub-contracted**: a Requesting Genomic Laboratory sends the sample onward to a different Sequencing Genomic Laboratory (`LAB-35`) | **Local**: samples sent directly to a NW GLH site, no cross-laboratory sub-contracting implied |
| Proband/Family Member representation | Each participant is a wholly **separate** sub-order (own `Patient`, `Specimen`, `ServiceRequest`), linked only by a shared requisition number - no direct reference between them | A **single** sub-order whose own Patient group is completed for whichever individual's specimen is being sent; only the Family Member pathway adds a `ServiceRequest.supportingInfo` reference to the pre-existing Proband |
| Family Structure (Singleton/Duo/Trio) | Explicit, structured field (`NOS/FamilyStructure`) | Not captured - the paper form only distinguishes Proband vs Family Member, not how many participants make up the referral |
| Specimen model | **Two** specimens per participant (primary as received + dispatched extracted DNA), both on one `Specimen` resource | **One** specimen per participant |
| Cancer WGS fields | Sample Topography, Sample Morphology, Tumour Content (%) | Neoplastic Cell Content (%) only - see the [design note](Questionnaire-dWGSAskAtOrderEntry.html) on `dWGS/received_sample_tumour_content_pct` |
| Laboratory QC/logistics fields | Extensive - DNA concentration/purity/integrity/fragment size, rack position, plating organisation, consignment tracking | None - a local order form has no equivalent, since NW Genomics is both the referring and the testing laboratory |
{:.grid}

Both ultimately request the same underlying test (Whole Genome Sequencing for rare
and inherited disease or cancer), so a future harmonisation could reasonably ask
whether NW GLH's local paper pathway should adopt some of the digital manifest's
structure (Family Structure, in particular) rather than remaining two independently
evolved Questionnaires - noted here as an open question, not a decision.

#### Outstanding Issues (resolved by this split)

Until this split, `dWGSSubOrder` declared `derivedFrom` [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) with derivation type `extends`, but
checking it against the base Questionnaire raised open questions about whether it was
a clean extension. Recorded here for the design history, followed by how the split
into [dWGS Sub-Order Manifest](Questionnaire-dWGSSubOrder.html) (manifest
description, no `derivedFrom`) and [dWGS Ask At Order
Entry](Questionnaire-dWGSAskAtOrderEntry.html) (the genuine extension) resolves each:

1. **Duplicated patient identifiers.** `dWGSSubOrder` re-declared its own
   `Patient` group with `patient_forename`/`patient_surname`/NHS number/date of
   birth, using the **same** `linkId`s and LOINC codes as the equivalent items
   already in the base Questionnaire (e.g. `LN/45392-8`, `LN/45394-4`,
   `LN/89061-6`). **Resolved**: `dWGSSubOrder` keeps these (it is a complete
   manifest description, not an incremental form), but `dWGSAskAtOrderEntry`
   omits them entirely - see the six fields marked **Genomic Test Order (base)**
   in the [field mapping](#field-mapping-csv--hl7-v2--fhir) above.
2. **Two different "Order Group Number" concepts.** The base Questionnaire's
   `pedigreeNumber` item is labelled "G Number (Pedigree Number) - **Order Group
   Number**" and maps to `Patient.identifier:PedigreeNumber`. `dWGSSubOrder`'s
   `referral_id` item is labelled "Original Order Placer **Group Number** (Referral
   ID)" and maps to `ServiceRequest.requisition` instead. **Not fully resolved** -
   both terms still appear, and no relationship between the two values is stated;
   `dWGSAskAtOrderEntry`'s own `referral_id` item now carries a design note flagging
   this explicitly rather than leaving it implicit.
3. **Test codes don't exist in the base Questionnaire's Test Code lists.**
   The base Questionnaire's Test Code item only appears via three
   `enableWhen`-gated branches, each tied to a Test Category answer
   (`RareAndInheritedDiseasesGeneticTesting`, `HaemoglobinopathyGeneticTesting`,
   `CancerGeneticTesting` - see [OrderCategory](ValueSet-order-category.html)), and
   there is no Test Category option for Whole Genome Sequencing/dWGS at all.
   **Resolved by framing, not by adding a WGS category**: `dWGSAskAtOrderEntry`'s
   `clinical_indication_test_type_id` item is documented as deliberately filling
   that gap against the broader [GenomicTestCodes](ValueSet-GenomicTestCodes.html)
   value set, rather than silently presenting as a peer of the base's three
   category-gated branches.

## Examples

The dWGS example Bundles cover one referral of each family structure, sent as `LAB-35`
sub-orders from a Requesting Genomic Laboratory to NW Genomics acting as Sequencing
Genomic Laboratory:

| Referral       | Family Structure | Participants                                                                                                                                                                          |
|----------------|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `r2026000201`  | Singleton         | Proband (`p2026000101`) - [Bundle-dWGS-Singleton-r2026000201](Bundle-dWGS-Singleton-r2026000201.html)                                                                                  |
| `r2026000202`  | Duo               | Proband (`p2026000102`) - [Bundle-dWGS-Duo-r2026000202-p2026000102](Bundle-dWGS-Duo-r2026000202-p2026000102.html) <br/> Family Member (`p2026000103`) - [Bundle-dWGS-Duo-r2026000202-p2026000103](Bundle-dWGS-Duo-r2026000202-p2026000103.html) |
| `r2026000203`  | Trio              | Proband (`p2026000104`) - [Bundle-dWGS-Trio-r2026000203-p2026000104](Bundle-dWGS-Trio-r2026000203-p2026000104.html) <br/> Family Member (`p2026000105`) - [Bundle-dWGS-Trio-r2026000203-p2026000105](Bundle-dWGS-Trio-r2026000203-p2026000105.html) <br/> Family Member (`p2026000106`) - [Bundle-dWGS-Trio-r2026000203-p2026000106](Bundle-dWGS-Trio-r2026000203-p2026000106.html) |
{:.grid}

Each row of the source manifest (`Input/dWGS.csv`) gives one referral participant,
shown below in three forms: the `QuestionnaireResponse` answering [dWGS Sub-Order
Manifest](Questionnaire-dWGSSubOrder.html), the `LAB-35` sub-order `Bundle` it was
extracted into (same referrals and participants as the table above), and the HL7 v2
`OML^O21` equivalent of that same Bundle (from
[nw-gmsa/Testing](https://github.com/nw-gmsa/Testing/tree/main/Output/V2/O21)):

| Referral       | Participant                    | QuestionnaireResponse                                                                                                             | FHIR Laboratory Order Message                                                             | HL7 v2 Example                                                                                                        |
|----------------|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| `r2026000201`  | Proband (`p2026000101`)         | [QuestionnaireResponse-dWGS-Singleton-r2026000201-p2026000101](QuestionnaireResponse-dWGS-Singleton-r2026000201-p2026000101.html)   | [Bundle-dWGS-Singleton-r2026000201](Bundle-dWGS-Singleton-r2026000201.html)                    | [dWGS_r2026000201.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/dWGS_r2026000201.txt)                 |
| `r2026000202`  | Proband (`p2026000102`)         | [QuestionnaireResponse-dWGS-Duo-r2026000202-p2026000102](QuestionnaireResponse-dWGS-Duo-r2026000202-p2026000102.html)               | [Bundle-dWGS-Duo-r2026000202-p2026000102](Bundle-dWGS-Duo-r2026000202-p2026000102.html)         | [dWGS_r2026000202_p2026000102.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/dWGS_r2026000202_p2026000102.txt) |
| `r2026000202`  | Family Member (`p2026000103`)   | [QuestionnaireResponse-dWGS-Duo-r2026000202-p2026000103](QuestionnaireResponse-dWGS-Duo-r2026000202-p2026000103.html)               | [Bundle-dWGS-Duo-r2026000202-p2026000103](Bundle-dWGS-Duo-r2026000202-p2026000103.html)         | [dWGS_r2026000202_p2026000103.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/dWGS_r2026000202_p2026000103.txt) |
| `r2026000203`  | Proband (`p2026000104`)         | [QuestionnaireResponse-dWGS-Trio-r2026000203-p2026000104](QuestionnaireResponse-dWGS-Trio-r2026000203-p2026000104.html)             | [Bundle-dWGS-Trio-r2026000203-p2026000104](Bundle-dWGS-Trio-r2026000203-p2026000104.html)       | [dWGS_r2026000203_p2026000104.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/dWGS_r2026000203_p2026000104.txt) |
| `r2026000203`  | Family Member (`p2026000105`)   | [QuestionnaireResponse-dWGS-Trio-r2026000203-p2026000105](QuestionnaireResponse-dWGS-Trio-r2026000203-p2026000105.html)             | [Bundle-dWGS-Trio-r2026000203-p2026000105](Bundle-dWGS-Trio-r2026000203-p2026000105.html)       | [dWGS_r2026000203_p2026000105.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/dWGS_r2026000203_p2026000105.txt) |
| `r2026000203`  | Family Member (`p2026000106`)   | [QuestionnaireResponse-dWGS-Trio-r2026000203-p2026000106](QuestionnaireResponse-dWGS-Trio-r2026000203-p2026000106.html)             | [Bundle-dWGS-Trio-r2026000203-p2026000106](Bundle-dWGS-Trio-r2026000203-p2026000106.html)       | [dWGS_r2026000203_p2026000106.txt](https://github.com/nw-gmsa/Testing/blob/main/Output/V2/O21/dWGS_r2026000203_p2026000106.txt) |
{:.grid}

## Security Considerations

Includes:

- OAuth2 Standard for [Authorisation](api-security.html#authorisation---oauth2)
  - including use of JWT access tokens and future support for [SMART-on-FHIR Scopes](api-security.html#scopes)
- FHIR AuditEvent/IHE BALP for [Audit Logging](api-security.html#audit-logging)
- TLS for [Transport Security/Encryption](api-security.html#encryption)

## Developer Guides

- [08 - Subcontracted Laboratory Order from an External GLH](https://github.com/nw-gmsa/Testing/blob/main/notebooks/08-subcontracted-laboratory-order-from-external-glh.ipynb) - builds a `LAB-35` sub-order manifest and Bundle for a distributed WGS referral from an external Requesting Genomic Laboratory, the source of the examples above
- [11 - Order Entry Forms: Questionnaire to a FHIR O21](https://github.com/nw-gmsa/Testing/blob/main/notebooks/11-order-entry-forms-questionnaire-to-fhir-o21.ipynb) - builds a FHIR Message `O21` `Bundle` from a completed `QuestionnaireResponse` answering [dWGS Sub-Order Manifest](Questionnaire-dWGSSubOrder.html), and explains how the same extracted answers become an HL7 v2 `O21` instead

See [Developer Guides](DeveloperGuides.html) for the full notebook series.
