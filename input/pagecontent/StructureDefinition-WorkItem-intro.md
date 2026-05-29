<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

| Name                                                                  | FHIR | Optionality               | HL7 v2                  | iGene          | StarLIMS |
|-----------------------------------------------------------------------|------|---------------------------|-------------------------|----------------|----------|
| [NHS Number](StructureDefinition-NHSIdentifier.html)                  |      | 0..1                      | PID-3                   |                |          |
| [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) |      | 1..1                      | PID-2                   | Patient Number |          |
| [Order Number](StructureDefinition-OrderIdentifier.html)              |      | 1..1                      | ORC-2 Order Number      |                |          |
| Date / Time of the order                                              |      | 1..1                      | ORC-9 Order Date/Time   |                |          |
| [Test Code](ValueSet-GenomicTestCodes.html)                           |      | 0..1 (probably mandatory) | OBR-4 Universal Test ID |                |          |
| Comment                                                               |      | 0..*                      | NTE-3 Comment           |                |          |
| Specimen Number (Order Placer)                                        |      | 1..1                      | SPM-2 Specimen ID       |                |          |
| [Specimen Type](ValueSet-specimen-type.html)                          |      | 1..1                      | SPM-4 Specimen Type     |                |          |  
{:.grid}
