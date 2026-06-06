<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference

1. [openEHR Laboratory analyte result](https://ckm.openehr.org/ckm/archetypes/1013.1.2881)

## Use Case

> BCR-ABL1 concentration testing is used to monitor the amount of the fusion gene (Philadelphia chromosome) in chronic myeloid leukemia (CML) patients, with results typically reported on an International Scale (%IS) to measure treatment response.

> [Designing an interoperable solution to support pharmacogenomic-guided prescribing in primary care: an implementer report](https://informatics.bmj.com/content/bmjhci/32/1/e101163.full.pdf)

## Process Flow 

See [Test Results Management (LAB-5)](LTW.html#test-results-management-lab-5)

## Data Mapping

### Result

| Data Element                                              | HL7 v2 R32                              | LOINC / SNOMED | openEHR                  | HL7 FHIR                                                               | iGene              | Example                           |
|-----------------------------------------------------------|-----------------------------------------|----------------|--------------------------|------------------------------------------------------------------------|--------------------|-----------------------------------|
| [Patient Identifier](StructureDefinition-PatientIdentifier.html) | PID-3 Patient Identifier                |                |                          |                                                                        | P-Number           |                                   | 
| Specimen Number (Order Filler)                            | SPM-2 Specimen ID                       |                | Specimen                 | DiagnosticReport.specimen                                              | S-Number           |                                   |
| [Report Identifier](StructureDefinition-ReportIdentifier.html) |                                         |                |                          | DiagnosticReport.identifier[PlacerNumber]                              | T-Number           |                                   |
| [Order Number](StructureDefinition-OrderIdentifier.html)  | ORC-2 Placer Order Number               |                |                          | DiagnosticReport.basedOn.identifier                                    | R-Number           |                                   |  
| [Test Code](ValueSet-GenomicTestCodes.html)               | OBR-4 Universalserviceidentifier        | Recommended    |                          | DiagnosticReport.code                                                  |                    | BCRABL                            |   
| Result Status                                             | OBR-25 ResultStatus                     |                | Result Status            | DiagnosticReport.status                                                |                    | F                                 |
| **Result**                                                |                                         |                |                          | DiagnosticReport.result referencing Observation                        |                    |                                   |
| - Variant                                                 |                                         |                |                          | Observation.derivedFrom(Variant) - BCR::ABL Major (e14a2/e13a2)        |                    |                                   |
| - Test Start DateTime                                     | TQ1-7 Startdatetime                     |                | Analysis performed time  | Observation.effectivePeriod.start and DiagnosticReport.effectivePeriod |                    |                                   |
| - Test End DateTime                                       | TQ1-8 Enddatetime                       |                | Analysis performed time  | Observation.effectivePeriod.end and DiagnosticReport.effectivePeriod   |                    |                                   |
| - Performer                                               | OBX-16 ResponsibleObserver              |                |                          | Observation.performer                                                  |                    |                                   |
| - Status                                                  | 
| - Code                                                    | OBX-3 ObservationIdentifier             | Recommended    | Analyte name             | Observation.code                                                       |                    | BCRABL                            |
| - Reference Range                                         | OBX-7 ReferenceRange                    |                | Reference range guidance | Observation.referenceRange                                             |                    | 0.0030-55.00                      |
| - Value                                                   | OBX-5 Observation Value                 |                | Analyte result           | Observation.valueQuantity.value                                        | (IS)               | 0.011                             |
| - Value Absent                                            | OBX-5 Observation Value                 |                |                          | Observation.dataAbsentReason.text                                      | (Test Description) | INVALID [Too high ABL transcript] |
| - Unit                                                    | OBX-6 Units                             |                |                          | Obsevation.valueQuantity.unit                                          |                    | % (IS)                            |
| - Result Detail Code (see below)                          | OBX-4 ObservationSubID (when populated) | Recommended    | Analyte result detail    | Observation.component                                                  |                    | MR                                |                                                              
| - Device Identifier                                       | ?? OBX-18 EquipmentInstanceIdentifier   |                |                          | Observation.device                                                     |                    |                                   |
{:.grid}


### Result Detail

These entries are expressed in Observation.component

#### BCRABL

Possible LOINC Codes for BCR-ABL:

- [69380-4](https://loinc.org/69380-4/) t(9;22)(q34.1;q11)(ABL1,BCR) b2a2+b3a2 fusion transcript/control transcript (International Scale) [# Ratio] in Blood or Tissue by Molecular genetics method

| Analyte | Data Element     | Local Code    | LOINC | SNOMED | iGene                      | Data Type | Unit    | Example |
|---------|------------------|---------------|-------|--------|----------------------------|-----------|---------|---------|
| MR                         | MR               |       |        | MR                         | String    |      | 4.52    |
| ABL_Analyte_Result         | ??               |       |        | ABL_Analyte_Result         | String    |      | ?? PASS |
| ABL_Ct                     | ABL&Ct           |       |        | ABL_Ct                     | String    |      | 12.2    |
| ABL_EndPt                  | ABL&EndPt        |       |        | ABL_EndPt                  | String    |      | 434     |
| ABL_Probe_Check_Result     | ABL&             |       |        | ABL_Probe_Check_Result     | String    |      | PASS    |
| BCR-ABL_Analyte_Result     | BCR-ABL&         |       |        | BCR-ABL_Analyte_Result     | String    |      | POS     |
| BCR-ABL_Ct                 | BCR-ABL&Ct       |       |        | BCR-ABL_Ct                 | String    |      | 30.3    |
| BCR-ABL_EndPt              | BCR-ABL&EndPt    |       |        | BCR-ABL_EndPt              | String    |      | 164     |
| BCR-ABL_Probe_Check_Result | ??               |       |        | BCR-ABL_Probe_Check_Result | String    |      | ?? PASS     |
| BCR-ABL_Target_Delta_Ct    | BCR-ABL&Delta Ct |       |        | BCR-ABL_Target_Delta_Ct    | String    |      | -18.1        |
{:.grid}
