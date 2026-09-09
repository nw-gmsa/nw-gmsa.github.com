## Questions Summary

<span class="badge badge-primary">Diagnostic Genomics</span>

Used **alongside** [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
(the common core) **and** [Ask At Order Entry Questions
Common](Questionnaire-GenomicGeneralAskAtOrderEntry.html) for Whole Genome
Sequencing orders specifically - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). A WGS
order therefore combines **three** Questionnaires, not the usual two.

| Name                                        | Code System         | Answer ValueSet | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | HL7 FHIR Resource (Message + RESTful)                                    |
|----------------------------------------------|----------------------|------------------|-------------|------------------------|------------------|--------------------------------------------------------------------------|
| WGS participant type?                        | NWGMSA WGSParticipantTypeProband / WGSParticipantTypeFamilyMember | Proband/Family Member | 1..1 | [OBX](hl7v2.html#obx) | CE | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| ROD attached or to follow                    | NWGMSA RODToFollow   | Yes/No/Unknown   | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Related Individual (NK1)                     |                      |                  | 0..*        | [NK1](hl7v2.html#nk1)  |                  | [RelatedPerson](StructureDefinition-RelatedPerson.html)                  |
| - Role (Consultand or Proband)               | NWGMSA RelatedIndividualRole |          | 1..1        |                        | CE               | n/a (discriminator only)                                                  |
| - Name                                       |                      |                  | 1..1        | NK1-2                  | XPN              | RelatedPerson.name                                                        |
| - Relationship                               | [UKCore-PersonRelationshipType](https://fhir.hl7.org.uk/ValueSet/UKCore-PersonRelationshipType) | | 1..1 | NK1-3 | CE | RelatedPerson.relationship |
| - Administrative Sex                         | [AdministrativeGender](http://hl7.org/fhir/ValueSet/administrative-gender) | | 0..1 | NK1.15 | CE | RelatedPerson.gender |
| - Date of Birth                              |                      |                  | 0..1        | NK1-16                 | DT               | RelatedPerson.birthDate                                                   |
| - NHS Number (if known)                      | LOINC 89061-6        |                  | 0..1        | NK1-33                 | CX               | RelatedPerson.identifier:nhsNumber                                        |
| - Hospital Number (if known)                 | LOINC 76435-7        |                  | 0..1        | NK1-33                 | CX               | RelatedPerson.identifier:MedicalRecordNumber                              |
| - This order's own Patient                   |                      |                  | 1..1        |                        |                  | RelatedPerson.patient                                                     |
{:.grid}

**WGS participant type** states which role *this order's own Patient* plays
in the family study (Proband or Family Member) - distinct from, and
complementary to, `Related Individual`'s own **Role**, which describes the
*named relative's* role (Consultand or Proband) relative to this order's
Patient, not the Patient's own role directly. Give particular attention to
both when the order's own Patient is a baby or fetus, not the person the
family history is actually about - the order's own Patient is expected to
be the baby/fetus, and the mother is named as the `Related Individual`
(Role = Consultand, Relationship = mother), not the other way round. See
[WGS Local Test Order](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html)'s
own `NOS/WGSPathway` item for a related but distinct four-value field (WGS
pathway + participant type combined) used by that specific local paper
form, not this generic path.

This Questionnaire was split out of [Ask At Order Entry Questions
Common](Questionnaire-GenomicGeneralAskAtOrderEntry.html): `Related
Individual` and `Record of Discussion attached or to follow` are only
genuinely relevant to WGS orders, not every order/test type that
Questionnaire covers - see that Questionnaire's own [Guidance by Order
Type](Questionnaire-GenomicGeneralAskAtOrderEntry.html#guidance-by-order-type)
section. A real NHS Trust WGS order-entry screen confirms Record of
Discussion is specifically required "if requesting whole genome sequencing
or rapid whole genome sequencing (R14)", and surfaces `WGS participant
type` as a required field with no prior equivalent anywhere in this IG.
