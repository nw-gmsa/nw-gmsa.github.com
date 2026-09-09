## Questions Summary

<span class="badge badge-primary">Histocompatibility and Immunogenetics</span>

| Question         | LinkId                    | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | Answer Options                                                                                    | FHIR Field                         |
|-------------------|----------------------------|-------------|------------------------|-------------------|-------------------------------------------------------------------------------------------------------|---------------------------------------|
| Specimen Source   | `ChimIG/specimen_source`  | 0..1        | [SPM](hl7v2.html#spm)-4 | CWE               | Blood (PB), Bone Marrow (BM)                                                                          | `Specimen.type`                       |
| Patient Test(s)   | `ChimIG/patient_test`     | 0..*        | [OBR](hl7v2.html#obr)-46 | CWE             | Chimerism Peripheral Blood, Chimerism CD3, Chimerism CD15, Chimerism CD19, Chimerism Lineage Other   | `ServiceRequest.orderDetail`          |
{:.grid}

Specimen Source is asked before Patient Test(s) here, the reverse of [HLA Tests -
Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) - see [Chimerism
Testing Ask At Order
Entry](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry)
for the worked example this Questionnaire was extracted from, and each item's own
design/reference notes below for why every answer option is coded locally against the
`NWGMSA` CodeSystem rather than a national code system.
