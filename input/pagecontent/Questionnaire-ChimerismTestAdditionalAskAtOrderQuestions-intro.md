## Questions Summary

<span class="badge badge-primary">Histocompatibility and Immunogenetics</span>

Used for these [Digital Genomic Test
Services](CodeSystem-DigitalGenomicTestServices.html) tests:

| Code     | Test                                                          |
|----------|----------------------------------------------------------------|
| `GT1335` | Chimerism by STR Testing - Post Solid Organ Transplant          |
| `GT1336` | Chimerism by XY FISH - Post Solid Organ Transplant              |
{:.grid}

| Question            | LinkId                        | Cardinality | HL7 v2 OML_O21 Message                              | OBX-2 Value Type | Answer Options                                                                                        | FHIR Field                                                     |
|----------------------|--------------------------------|-------------|-------------------------------------------------------|-------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| Specimen            | `ChimIG/specimen`             | 0..*        | [SPM](hl7v2.html#spm)                                 | -                 | -                                                                                                      | `Specimen` (repeating group - one `SPM` segment per instance)    |
| Specimen Source     | `ChimIG/specimen_source`      | 0..1        | [SPM](hl7v2.html#spm)-4                               | CWE               | Blood (PB) → `119297000` Blood specimen, Bone Marrow (BM) → `119359002` Bone marrow specimen          | `Specimen.type`                                                  |
| Specimen Identifier | `ChimIG/specimen_identifier`  | 0..1        | [SPM](hl7v2.html#spm)-2                               | ST                | -                                                                                                      | `Specimen.identifier`                                            |
| Patient Test(s)     | `ChimIG/patient_test`         | 0..*        | [OBX](hl7v2.html#obx) (restating [OBR](hl7v2.html#obr)-4/[OBR](hl7v2.html#obr)-46) | CWE | `C1-Post-PB` Chimerism Peripheral Blood (PB), `C2-Post-CD3` Chimerism CD3, `C3-Post-CD15` Chimerism CD15, `C5-Post-BM` Chimerism Bone Marrow (BM) | `ServiceRequest.orderDetail`                                     |
{:.grid}

Specimen (Specimen Source and Specimen Identifier, grouped as a single repeating
`Specimen` item - one per specimen, matching one `SPM` segment each) is asked before
Patient Test(s) here, the reverse of [HLA Tests -
Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) - see [Chimerism
Testing Ask At Order
Entry](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry)
for the worked example this Questionnaire was extracted from (including the `OML_O21`
version showing `SPM` and coded `OBX` in place of the original order's free-text `NTE`
segments), and each item's own design/reference notes below for the reasoning behind
its coding. Specimen Source is coded against SNOMED CT (the [Specimen
Type](ValueSet-specimen-type.html) value set's own generic codes), and Patient Test(s)'
restated value is coded against the [Histotrac](CodeSystem-Histotrac.html) CodeSystem -
bound via [HistotracOrderDetail](ValueSet-HistotracOrderDetail.html) on
`ServiceRequest.orderDetail` - rather than the local `NWGMSA` codes the Hive
order-entry UI's own checkboxes use for the order-entry *selection* itself. Patient
Test(s) only offers four of the Hive checklist's five values as a result: `Chimerism
CD19` and `Chimerism Lineage Other` have no confirmed Histotrac equivalent yet - see
`ChimIG/patient_test`'s own reference note for why.
