## Questions Summary

<span class="badge badge-primary">Histocompatibility and Immunogenetics</span>

| Question         | LinkId                     | Cardinality | Answer Options                                                                                  | FHIR Field                            |
|-------------------|-----------------------------|-------------|---------------------------------------------------------------------------------------------------|-----------------------------------------|
| Patient Test(s)   | `HistoIG/patient_test`      | 0..*        | HLA Typing + Antibody Screening, HLA Antibody Screening, HLA Type Recipient, DSA, HLA Auto XM    | `ServiceRequest.orderDetail`            |
| HLA Type          | `HistoIG/hla_type`          | 1..1        | Patient, Donor                                                                                    | `Observation.valueCodeableConcept`      |
| Patient Type      | `HistoIG/patient_type`      | 0..1        | Stem cell, Renal, Thoracic                                                                        | `Observation.valueCodeableConcept`      |
| Organ             | `HistoIG/organ`             | 0..1        | Kidney, Pancreas, Islets, Simultaneous Pancreas/Kidney, Simultaneous Islet/Kidney                | `Specimen.collection.bodySite`          |
| Specimen Source   | `HistoIG/specimen_source`   | 0..1        | Blood, Buccal, Other                                                                               | `Specimen.type`                         |
{:.grid}

HLA Type and Patient Type are carried as `Observation`s referenced from
`ServiceRequest.supportingInfo`; Patient Test(s) maps directly to
`ServiceRequest.orderDetail`; Organ maps to `Specimen.collection.bodySite`, the
body site the specimen was collected from - see [Ask At Order Entry
Questions](HistocompatibilityAndImmunogenetics.html#hla-tests-transplant-ask-at-order-entry)
for the worked example this Questionnaire was extracted from, and each item's own
design/reference notes below for why every answer option is coded locally against the
`NWGMSA` CodeSystem rather than a national code system.
