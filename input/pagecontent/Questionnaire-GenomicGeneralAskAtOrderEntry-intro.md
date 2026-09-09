
## Order Entry Questions

<span class="badge badge-primary">Diagnostic Genomics</span>

| Name                                                                   | Code System            | Answer ValueSet                      | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | HL7 FHIR Resource (Message + RESTful)                                    |
|------------------------------------------------------------------------|------------------------|--------------------------------------|-------------|------------------------|------------------|--------------------------------------------------------------------------|
| High Infection Risk?                                                   | SNOMED 281269004       | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| High infection Risk Details                                           | NWGMSA InfectionRiskDetails |                                 | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
| Consent                                                                |                        |                                      |             |                        |                  |                                                                            |
| - Has consent has been obtained for tests (Y/N)                       | LOINC 19826-7          | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - Has consent has been obtained for DNA storage (Y/N)                 | LOINC 75520-7          | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - ROD attached or to follow                                           | NWGMSA RODToFollow     | Yes/No/Unknown                      | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
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
| Related Individual (NK1)                                              |                        |                                      | 0..*        | [NK1](hl7v2.html#nk1)  |                  | [RelatedPerson](StructureDefinition-RelatedPerson.html)                  |
| - Role (Consultand or Proband)                                        | NWGMSA RelatedIndividualRole |                              | 1..1        |                        | CE               | n/a (discriminator only)                                                  |
| - Name                                                                 |                        |                                      | 1..1        | NK1-2                  | XPN              | RelatedPerson.name                                                        |
| - Relationship                                                        |                        | [UKCore-PersonRelationshipType](https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType) | 1..1 | NK1-3 | CE | RelatedPerson.relationship |
| - Administrative Sex                                                   |                        | [AdministrativeGender](http://hl7.org/fhir/ValueSet/administrative-gender) | 0..1 | NK1.15 | CE | RelatedPerson.gender |
| - Date of Birth                                                        |                        |                                      | 0..1        | NK1-16                 | DT               | RelatedPerson.birthDate                                                   |
| - NHS Number (if known)                                                | LOINC 89061-6          |                                      | 0..1        | NK1-33                 | CX               | RelatedPerson.identifier:nhsNumber                                        |
| - Hospital Number (if known)                                           | LOINC 76435-7          |                                      | 0..1        | NK1-33                 | CX               | RelatedPerson.identifier:MedicalRecordNumber                              |
| - This order's own Patient                                             |                        |                                      | 1..1        |                        |                  | RelatedPerson.patient                                                     |
{:.grid}

**Role** is what generalises this group beyond Genetic Clinical Referral's
own Consultand: a **Consultand** is a relative referenced from this order's
own proband; a **Proband** is the reverse - used when this order's own
Patient is itself a family member (e.g. [WGS Local Test
Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s Family Member
pathway, `NOS/Proband`), and this group names the original proband instead.
See [GMS WGS
Rare Disease](Questionnaire-GMSWGSRareDisease.html#summary)'s own repeating
Family Members group for the same shape used inline on a Questionnaire that
doesn't extend this one directly.

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
none of the items below normally apply to it.

| Item/Group                                                       | Cancer | WGS | Rare and Inherited Disease | Chimerism |
|--------------------------------------------------------------------|--------|-----|------------------------------|-----------|
| G Number (Pedigree Number)                                       | -      | ✓ (Rare and Inherited Disease WGS only) | ✓ | - |
| Related Individual (NK1)                                         | -      | ✓   | ✓                             | -         |
| Patient is from consanguineous union?                            | -      | ✓   | ✓                             | -         |
| Confirm that a pathology report will be provided alongside the sample | ✓ | -   | -                             | -         |
| Neonatal/Prenatal/Neither? (and the Pregnant sub-group)           | -      | ✓ (where prenatal) | ✓ (where prenatal) | -   |
| Is this test for a pregnancy loss? / a deceased infant?           | -      | ✓ (where prenatal) | ✓ (where prenatal) | -   |
| Consent group                                                     | ✓      | ✓   | ✓                             | -         |
| ROD attached or to follow                                         | ✓      | ✓   | ✓                             | -         |
| Reason For Variant Re-Interpretation Request                     | ✓      | ✓   | ✓                             | -         |
| High Infection Risk? / High infection Risk Details                | ✓      | ✓   | ✓                             | -         |
{:.grid}

### Related Individual: Consultand vs Proband, and Mother/Baby-Fetus Orders

Give particular attention to `Related Individual` and `Patient` when the
order's own **Patient** is a baby or fetus, not the person the family
history is actually about:

- **Mother/baby-fetus orders** - the order's own `Patient` is expected to be
  the baby/fetus, and the mother is named as the `Related Individual` (Role
  = Consultand, Relationship = mother) - not the other way round. This is
  the same shape [Genetic Clinical Referral -
  Consultand](Questionnaire-GeneticClinicalReferral.html) generalises from.
- **For Whole Genome Sequencing (WGS)** orders specifically, `Related
  Individual` shows the family relationship, and Role may be either
  **Consultand** (the usual case - this order's own `Patient` is the
  proband, and the group names a relative of theirs) or **Proband** (the
  reverse - this order's own `Patient` is actually a family member, e.g.
  [WGS Local Test
  Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s Family
  Member pathway, and the group instead names the original proband the
  family member is being tested alongside).
- **G Number (Pedigree Number)** is only applicable to Rare and Inherited
  Disease WGS orders - see [Whole Genome Sequencing (WGS) - The Reverse
  Direction](WholeGenomicSequence.html#the-reverse-direction-what-the-generic-order-path-doesnt-cover)
  for how it relates to (and is distinct from) a genuine Order Group Number
  (`ServiceRequest.requisition`).
