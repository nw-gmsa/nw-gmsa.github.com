## Questions at a Glance

<span class="badge badge-primary">Histocompatibility and Immunogenetics</span>

| Question         | LinkId                    | Cardinality | Answer Options                                                                                    | FHIR Field                         |
|-------------------|----------------------------|-------------|-------------------------------------------------------------------------------------------------------|---------------------------------------|
| Specimen Source   | `ChimIG/specimen_source`  | 0..1        | Blood (PB), Bone Marrow (BM)                                                                          | `Specimen.type`                       |
| Patient Test(s)   | `ChimIG/patient_test`     | 0..*        | Chimerism Peripheral Blood, Chimerism CD3, Chimerism CD15, Chimerism CD19, Chimerism Lineage Other   | `ServiceRequest.code`                 |
{:.grid}

Specimen Source is asked before Patient Test(s) here, the reverse of [HLA Tests -
Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) - see [Chimerism
Testing Ask At Order
Entry](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry)
for the worked example this Questionnaire was extracted from, and each item's own
design/reference notes below for why every answer option is coded locally against the
`NWGMSA` CodeSystem rather than a national code system.
