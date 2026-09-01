
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
{:.grid}
