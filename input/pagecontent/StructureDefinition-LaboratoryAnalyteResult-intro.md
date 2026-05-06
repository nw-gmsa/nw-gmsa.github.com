<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference

1. [openEHR Laboratory analyte result](https://ckm.openehr.org/ckm/archetypes/1013.1.2881)

## Use Case

> BCR-ABL1 concentration testing is used to monitor the amount of the fusion gene (Philadelphia chromosome) in chronic myeloid leukemia (CML) patients, with results typically reported on an International Scale (%IS) to measure treatment response.

## Data Mapping

| Data Element                       | HL7 v2 R32                                    | LOINC / SNOMED | openEHR                  | HL7 FHIR                                                               | Example                           |
|------------------------------------|-----------------------------------------------|----------------|--------------------------|------------------------------------------------------------------------|-----------------------------------|
| Sample / Specimen (iGene S-Number) | SPM-2                                         |                | Specimen                 | DiagnosticReport.specimen                                              |                                   |
| Report Number (iGene T-Number)     |                                               |                |                          | DiagnosticReport.identifier[PlacerNumber]                              |                                   |                               
| Report/Test Code                   | OBR-4 Universalserviceidentifier              | Recommended    |            | DiagnosticReport.code                                                  | BCRABL                            |
| Result Status                      | OBR-25 ResultStatus                           |                | Result Status            | DiagnosticReport.status                                                | F                                 |
| Result                             |                                               |                |                          | DiagnosticReport.result referencing Observation                        |                                   |
| Variant                            |                                               |                |                          | Observation.derivedFrom(Variant) - BCR::ABL Major (e14a2/e13a2)        |                                   |
| Test Start DateTime                | TQ1-7 Startdatetime                           |                | Analysis performed time  | Observation.effectivePeriod.start and DiagnosticReport.effectivePeriod |                                   |
| Test End DateTime                  | TQ1-8 Enddatetime                             |                | Analysis performed time  | Observation.effectivePeriod.end and DiagnosticReport.effectivePeriod   |                                   |
| Performer                          | OBX-16 ResponsibleObserver                    |                |                          | Observation.performer                                                  |                                   |
| Result Status                      | 
| Result Code                        | OBX-3 ObservationIdentifier                   | Recommended    | Analyte name             | Observation.code                                                       |                                   |
| - Reference Range                  | OBX-7 ReferenceRange                          |                | Reference range guidance | Observation.referenceRange                                             | 0.0030-55.00                      |
| - Value                            | OBX-5 Observation Value                       |                | Analyte result           | Observation.valueQuantity.value                                        | 0.011                             |
| - Value Absent                     | OBX-5 Observation Value                       |                |                          | Observation.dataAbsentReason.text                                      | INVALID [Too high ABL transcript] |
| - Unit                             | OBX-6 Units                                   |                |                          | Obsevation.valueQuantity.unit                                          | % (IS)                            |
| Result Detail Code                 | OBX-4 ObservationSubID (when populated)       | Recommended    | Analyte result detail    | Observation.component.code                                             | MR                                |                                                              
| - Value                            | OBX-5 ObservationValue (when OBX-4 populated) |                |                          | Observation.component.valueQuantity.value                              | 3.96                              |
| Device Identifier                  | ?? OBX-18 EquipmentInstanceIdentifier         |                |                          | Observation.device                                                     |                                   |
{:.grid}

Key LOINC Codes for BCR-ABL:

- [174041-5](https://loinc.org/74041-5): BCR-ABL1 p210 Major Molecular Response [Presence] in Blood or Tissue.
- [21821-4](https://loinc.org/21821-4): BCR-ABL1 fusion transcript [Ratio] in Blood/Tissue.
- [46434-7](https://loinc.org/46434-7): t(9;22)(q34.1;q11)(ABL1,BCR) fusion transcript [Presence] in Blood/Tissue.
- [50195-7](https://loinc.org/50195-7): t(9;22)(q34.1;q11)(ABL1,BCR) fusion transcript [Ratio] in Blood or Tissue by Molecular genetics method.
