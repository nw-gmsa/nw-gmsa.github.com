
## Order Entry Questions

<span class="badge badge-primary">Diagnostic Genomics</span>

| Name                                                                   | Code System            | Answer ValueSet                      | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | HL7 FHIR Resource (Message + RESTful)                                    |
|------------------------------------------------------------------------|------------------------|--------------------------------------|-------------|------------------------|------------------|--------------------------------------------------------------------------|
| High Infection Risk?                                                   | SNOMED 281269004       | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| High infection Risk Details                                           | NWGMSA InfectionRiskDetails |                                 | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
| Consent                                                                |                        |                                      |             |                        |                  |                                                                            |
| - Has consent has been obtained for tests (Y/N)                       | LOINC 19826-7          | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - Has consent has been obtained for DNA storage (Y/N)                 | LOINC 75520-7          | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| G Number (Pedigree Number)                                             | LOINC 74027-4          |                                       | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
| Patient is from consanguineous union?                                  | SNOMED 842009          | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Confirm that a pathology report will be provided alongside the sample. | SNOMED 74996004        | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Neonatal/Prenatal/Neither?                                             | SNOMED 118185001       | [Pregnancy](ValueSet-Pregnancy.html) | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Pregnant                                                               |                        |                                      |             |                        |                  |                                                                            |
| - Does this test relate to a pregnancy with > 1 fetus?                 | SNOMED 370386005       | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - Patient expected delivery date                                       | SNOMED 161714006       |                                      | 0..1        | [OBX](hl7v2.html#obx)  | DT               | [Observation](StructureDefinition-Observation.html).valueDateTime        |
| - Patient gestation                                                    | SNOMED 598151000005105 |                                      | 0..1        | [OBX](hl7v2.html#obx)  | NM               | [Observation](StructureDefinition-Observation.html).valueQuantity        |
| Is this test for a pregnancy loss?                                     | SNOMED 17369002        | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |   
| Is this test for a deceased infant?                                    | SNOMED 419099009       | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |                         
| Reason For Variant Re-Interpretation Request                          | NWGMSA VariantReinterpretationReason |                        | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
{:.grid}

`Related Individual (NK1)` and `Record of Discussion attached or to follow`
used to live here, but have moved to [WGS Test Additional Ask At Order
Entry Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) -
they are only genuinely relevant to Whole Genome Sequencing orders, not
every order/test type this Questionnaire covers.

## Guidance by Order Type

<div class="alert alert-info" role="alert">
This Questionnaire does not gate any of these questions by order/test type via
<code>enableWhen</code> - every item is technically available on every order,
regardless of type. The guidance below is about which questions are actually
expected to be completed for a given order type, not a technical constraint.
</div>

Today, this Generic Ask At Order Entry Questionnaire is the one actually used
for **Cancer**, **Whole Genome Sequencing (WGS)** and **Rare and Inherited
Disease** orders placed through the generic order path (see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions)) -
**Chimerism** (and Histocompatibility and Immunogenetics generally) instead
uses its own dedicated Ask At Order Entry Questionnaires - [Chimerism Testing
Blood (PB)](Questionnaire-ChimerismTestingAskAtOrderEntry.html), [HLA Tests -
Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) - so almost
none of the items below normally apply to it. WGS orders also combine in
[WGS Test Additional Ask At Order Entry
Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) alongside
this Questionnaire - see that Questionnaire's own guidance for the items
specific to it.

| Item/Group                                                       | Cancer | WGS | Rare and Inherited Disease | Chimerism |
|--------------------------------------------------------------------|--------|-----|------------------------------|-----------|
| G Number (Pedigree Number)                                       | -      | ✓ (Rare and Inherited Disease WGS only) | ✓ | - |
| Patient is from consanguineous union?                            | -      | ✓   | ✓                             | -         |
| Confirm that a pathology report will be provided alongside the sample | ✓ | -   | -                             | -         |
| Neonatal/Prenatal/Neither? (and the Pregnant sub-group)           | -      | ✓ (where prenatal) | ✓ (where prenatal) | -   |
| Is this test for a pregnancy loss? / a deceased infant?           | -      | ✓ (where prenatal) | ✓ (where prenatal) | -   |
| Consent group                                                     | ✓      | ✓   | ✓                             | -         |
| Reason For Variant Re-Interpretation Request                     | ✓      | ✓   | ✓                             | -         |
| High Infection Risk? / High infection Risk Details                | ✓      | ✓   | ✓                             | -         |
{:.grid}

### G Number (Pedigree Number)

**G Number (Pedigree Number)** is only applicable to Rare and Inherited
Disease WGS orders - see [Whole Genome Sequencing (WGS) - The Reverse
Direction](WholeGenomicSequence.html#the-reverse-direction-what-the-generic-order-path-doesnt-cover)
for how it relates to (and is distinct from) a genuine Order Group Number
(`ServiceRequest.requisition`). See [WGS Test Additional Ask At Order Entry
Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) for
`Related Individual` and the Consultand/Proband/mother-baby-fetus guidance
that goes with it, now that both have moved there.

### Known Gaps (from a Live WGS Order-Entry Screen)

A real NHS Trust EPR order-entry screen for Rare and Inherited Disease WGS
orders surfaces several fields with no equivalent anywhere in this
Questionnaire, [WGS Test Additional Ask At Order Entry
Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) or
[Genomic Test Order](Questionnaire-GenomicTestOrder.html) - consistent
with, and extending, the same gap analysis in [Whole Genome Sequencing
(WGS)](WholeGenomicSequence.html#the-reverse-direction-what-the-generic-order-path-doesnt-cover):

- **Family/test structure (Singleton/Duo/Trio/Tumour/Germline)** - a
  required field selecting which WGS family structure or sample type the
  order is for. This Questionnaire has no equivalent; [Distributed WGS
  (dWGS)](dWGS.html) is the only place in this IG with a comparable concept
  (`FamilyStructure`/`ParticipantType` on `dWGSAskAtOrderEntry`), and that is
  a different Questionnaire for a different pathway.
- **Previously stored DNA ID number** - a reference to an existing stored
  DNA sample from a prior test, as an alternative to submitting a fresh
  specimen. No equivalent field exists on this Questionnaire or the common
  core's own [Specimen](Questionnaire-GenomicTestOrder.html#specimen) group.
- **Specialist Test Group**, used on this live screen as a required
  selector alongside the Test Code itself (e.g. "WGS" for a WGS order) -
  this is the same [Genomic Test Code](CodeSystem-GenomicTestCode.html)
  `specialist-test-group` property already modelled as CodeSystem metadata
  in this IG, but not yet as its own submitted Ask At Order Entry answer.
