
## Order Entry Questions

<span class="badge badge-primary">Diagnostic Genomics</span>

| Name                                                                   | Code System            | Answer ValueSet                      | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | HL7 FHIR Resource (Message + RESTful)                                    |
|------------------------------------------------------------------------|------------------------|--------------------------------------|-------------|------------------------|------------------|--------------------------------------------------------------------------|
| Patient is from consanguineous union?                                  | SNOMED 842009          | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Confirm that a pathology report will be provided alongside the sample. | SNOMED 74996004        | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Neonatal/Prenatal/Neither?                                             | SNOMED 118185001       | [Pregnancy](ValueSet-Pregnancy.html) | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Pregnant                                                               |                        |                                      |             |                        |                  |                                                                            |
| - Does this test relate to a pregnancy with > 1 fetus?                 | SNOMED 370386005       | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - Patient expected delivery date                                       | SNOMED 161714006       |                                      | 0..1        | [OBX](hl7v2.html#obx)  | DT               | [Observation](StructureDefinition-Observation.html).valueDateTime        |
| - Patient gestation                                                    | SNOMED 598151000005105 |                                      | 0..1        | [OBX](hl7v2.html#obx)  | NM               | [Observation](StructureDefinition-Observation.html).valueQuantity        |
| Is this test for a pregnancy loss?                                     | SNOMED 17369002        | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |   
| Is this test for a deceased infant?                                    | SNOMED 419099009       | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |                         
| Consent                                                                |                        |                                      |             |                        |                  |                                                                            |
| - Has consent has been obtained for tests (Y/N)                       | LOINC 19826-7          | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - Has consent has been obtained for DNA storage (Y/N)                 | LOINC 75520-7          | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - ROD attached or to follow                                           | NWGMSA RODToFollow     | Yes/No/Unknown                      | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Reason For Variant Re-Interpretation Request                          | NWGMSA VariantReinterpretationReason |                        | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
| High Infection Risk?                                                   | SNOMED 281269004       | Yes/No                              | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| High infection Risk Details                                           | NWGMSA InfectionRiskDetails |                                 | 0..1        | [OBX](hl7v2.html#obx)  | ST               | [Observation](StructureDefinition-Observation.html).valueString          |
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
