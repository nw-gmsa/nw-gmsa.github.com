<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference

1. [openEHR Laboratory analyte result](https://ckm.openehr.org/ckm/archetypes/1013.1.2881)

## Overview

A Laboratory Analyte Result carries a single measured/detected substance (analyte)
from the analytical phase of testing through to the `Observation` referenced by
`DiagnosticReport.result`. See [BCR-ABL Monitoring](BCRABLMonitoring.html) for a
worked use case of this profile - BCR-ABL1 quantification for chronic myeloid
leukaemia (CML) monitoring, from a Cepheid-class ASTM-communicating analyser through
to iGene.

## Data Mapping

<figure>
{%include LaboratoryAnalyteResult-mindmap.svg%}
</figure>


### Laboratory Analyte Result

Rows marked with `↳` in the Data Element column are sub-elements of the **Result** row above them, i.e. they map to fields on the `Observation` referenced by `DiagnosticReport.result`.

| openEHR                  | Data Element                                                     | HL7 v2 R32                              | LOINC / SNOMED    | HL7 FHIR                                                               | iGene                                     | Example            |
|--------------------------|--------------------------------------------------------------------|-----------------------------------------|-------------------|--------------------------------------------------------------------------|--------------------------------------------|--------------------|
|                          | [Patient Identifier](StructureDefinition-PatientIdentifier.html) | PID-3 Patient Identifier                |                   |                                                                        |                                            P-Number           |                                   | 
| Specimen                 | Specimen Number (Order Filler)                                   | SPM-2 Specimen ID                       |                   |                                                                         DiagnosticReport.specimen                 | S-Number           |                                   |
|                          | [Report Identifier](StructureDefinition-ReportIdentifier.html)   |                                         |                   |                                                                        DiagnosticReport.identifier[PlacerNumber] | T-Number           |                                   |
|                          | [Order Number](StructureDefinition-OrderIdentifier.html)         | ORC-2 Placer Order Number               |                   |                                                                         DiagnosticReport.basedOn.identifier       | R-Number           |                                   |  
|                          | [Test Code](ValueSet-GenomicTestCodes.html)                      | OBR-4 Universalserviceidentifier        | Recommended       |                                                                       DiagnosticReport.code                     |                    | BCRABL                            |   
| Result Status            | Result Status                                                    | OBR-25 ResultStatus                     |                   | DiagnosticReport.status                                                |                                           | F                  |
| **Result**               |                                                                  |                                         |                   | DiagnosticReport.result referencing Observation                        |                                           |                    |
| Analysis performed time  | ↳ Test Start DateTime                                            | TQ1-7 Startdatetime                     |                   | Observation.effectivePeriod.start and DiagnosticReport.effectivePeriod |                                           |                    |
| Analysis performed time  | ↳ Test End DateTime                                              | TQ1-8 Enddatetime                       |                   | Observation.effectivePeriod.end and DiagnosticReport.effectivePeriod   |                                           |                    |
|                          | ↳ Performer                                                      | OBX-16 ResponsibleObserver              |                   |                                                                         Observation.performer                     |                    |                                   |
|                          | ↳ Status                                                         |                                          |                   |                                                                         Observation.status                        |                    |                                   |
| Analyte name             | ↳ Code                                                           | OBX-3 ObservationIdentifier             | Recommended       | Observation.code                                                       |                                           | BCRABL             |
| Reference range guidance | ↳ Reference Range                                                | OBX-7 ReferenceRange                    |                   | Observation.referenceRange                                             |                                           | 0.0030-55.00       |
| Analyte result           | ↳ Value                                                          | OBX-5 Observation Value                 |                   | Observation.valueQuantity.value                                        | (IS)                                      | 0.011              |
|                          | ↳ Value Absent                                                   | OBX-5 Observation Value                 |                   |                                                                         Observation.dataAbsentReason.text         | (Test Description) | INVALID [Too high ABL transcript] |
|                          | ↳ Unit                                                           | OBX-6 Units                             |                   |                                                                         Obsevation.valueQuantity.unit             |                    | % (IS)                            |
| Analyte result detail    | ↳ **Result Detail** (see below)                                  | OBX-4 ObservationSubID (when populated) | Recommended       | Observation.component                                                  |                                           |                    |                                                              
|                          | ↳ Device Identifier                                              | ?? OBX-18 EquipmentInstanceIdentifier   |                   |                                                                         Observation.device                        |                    |                                   |
{:.grid}

### Result Detail

These entries are expressed in `Observation.component` - see [BCR-ABL
Monitoring](BCRABLMonitoring.html#result-detail) for a worked example.
