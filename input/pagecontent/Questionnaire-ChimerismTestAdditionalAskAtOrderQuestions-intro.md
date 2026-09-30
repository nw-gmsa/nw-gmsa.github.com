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
|----------------------|--------------------------------|-------------|---------------------------------------------------------|-------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| Specimen Source     | `ChimIG/specimen_source`      | 0..1        | [SPM](hl7v2.html#spm)-4                               | CWE               | Blood (PB) → `119297000` Blood specimen, Bone Marrow (BM) → `119359002` Bone marrow specimen          | `Specimen.type`                                                  |
{:.grid}

Specimen Source is now the only Ask At Order Entry question this Questionnaire asks -
Specimen Identifier (a speculative future `SPM-2` addition) and Patient Test(s) have
both since been dropped. See [Chimerism Testing Ask At Order
Entry](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HistocompatibilityAndImmunogenetics.md#chimerism-testing-ask-at-order-entry)
for the worked example this Questionnaire was extracted from (including the `OML_O21`
version showing `SPM` in place of the original order's free-text `NTE` segments), and
the item's own design/reference notes below for the reasoning behind its coding.
Specimen Source is coded against SNOMED CT (the [Specimen
Type](ValueSet-specimen-type.html) value set's own generic codes).
