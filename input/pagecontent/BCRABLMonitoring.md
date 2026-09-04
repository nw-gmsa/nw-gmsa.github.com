<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## References

1. [Laboratory Analyte Result - Data Mapping](StructureDefinition-LaboratoryAnalyteResult.html#data-mapping)
2. [Test Results Management (LAB-5)](LTW.html#test-results-management-lab-5)
3. [69380-4](https://loinc.org/69380-4/) t(9;22)(q34.1;q11)(ABL1,BCR) b2a2+b3a2 fusion transcript/control transcript (International Scale) [# Ratio] in Blood or Tissue by Molecular genetics method

## Clinical Pathway Overview

### What is being tested

BCR-ABL1 fusion transcript (Philadelphia chromosome) quantification is used to
monitor how well a patient with Chronic Myeloid Leukaemia (CML) is responding to
tyrosine kinase inhibitor (TKI) treatment. The result is reported as a ratio on the
International Scale (%IS), so results from different laboratories can be compared
directly.

### The end-to-end clinical journey

1. **Patient on treatment** - a patient diagnosed with CML is established on TKI therapy and needs regular monitoring of their response.
2. **Sample taken** - a blood sample is collected at the scheduled monitoring interval.
3. **Order sent** - the requesting clinician's EPR sends the monitoring request to the laboratory.
4. **Testing performed** - the sample is analysed on a Cepheid GeneXpert analyser. *(`LAB-5`, Automation Manager → Order Filler.)*
5. **Result reported** - the %IS result reaches the requesting clinician. *(`LAB-3`.)*
6. **Clinical decision** - the clinician tracks the %IS trend over successive tests to confirm the treatment is working, or to detect early signs of resistance/relapse and consider a change of therapy.

```mermaid
flowchart LR
    A[Patient established<br/>on TKI treatment] --> B[Sample taken at<br/>monitoring interval]
    B --> C[Order sent to<br/>laboratory]
    C --> D[BCR-ABL1<br/>quantification]
    D --> E[%IS result reported<br/>to clinician]
    E --> F[Trend reviewed -<br/>continue or<br/>change treatment]
```

### Why this matters for developers

- The result is a %IS ratio (LOINC `69380-4`), carried as a [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html) `Observation`, not a plain numeric value on its own - see [Result Detail](#result-detail) below for how the underlying `BCR-ABL`/`BCR-ABL Ct`/`ABL`/`%MR` components map onto it.
- Because clinicians compare each result against previous ones to judge the trend, consistent mapping of the %IS value (rather than raw Ct/control values) is what actually drives the clinical decision.

## Actors

| IHE Actor                                          | Role                                    | System                          |
|--------------------------------------------------------|---------------------------------------|--------------------------------------|
| [Automation Manager](ActorDefinition-AutomationManager.html) | Performs the analytical phase (testing) | Cepheid GeneXpert (ASTM-communicating) |
| [Intermediary](ActorDefinition-Intermediary.html)          | Converts Cepheid's ASTM result to the NW Standard, routes it, and converts it to a CSV for iGene's import | Regional Integration Engine (RIE)  |
| [Order Filler](ActorDefinition-OrderFiller.html)           | Laboratory Information Management System | iGene                              |
| [Order Placer](ActorDefinition-OrderPlacer.html)           | Requesting clinician (treatment response monitoring) | Requesting Trust EPR       |
{:.grid}

## Transactions

| Transaction | Description                                   |
|-------------|------------------------------------------------|
| `LAB-5`     | Automation Manager → Order Filler (analytical result), via the RIE (ASTM → HL7 v2 `R32` NW Standard → FHIR Message `R32` → CSV) |
| `LAB-3`     | Order Filler → Order Placer (validated report)  |
{:.grid}

## Current Process

<div class="alert alert-info" role="alert">
<b>Domain Archetype:</b> <a href="StructureDefinition-LaboratoryAnalyteResult.html" _target="_blank">Laboratory Analyte Result</a>
</div>

<div class="alert alert-info" role="alert">
<b>FHIR Questionnaire (Result Panel):</b> <a href="Questionnaire-BCRABLResultPanel.html">BCR-ABL Monitoring Result Panel</a>
</div>

> BCR-ABL1 concentration testing is used to monitor the amount of the fusion gene (Philadelphia chromosome) in chronic myeloid leukemia (CML) patients, with results typically reported on an International Scale (%IS) to measure treatment response.

This use case reflects BCR-ABL1 quantification performed on an ASTM-communicating
analyser (e.g. Cepheid GeneXpert) with results ultimately consumed by iGene,
following the generic Analytical/Post-Analytical phases below.

```mermaid
graph

analysis["Analytical Phase (Testing)"]
report["Post-Analytical Phase (Interpretation & Reporting)"]
placer[Order Placer]

analysis --> |Laboratory Analyte Result| report
report --> |Genomic Report| placer  

  classDef green fill:#D5E8D4;
  class placer green
```

### Technical Process (Cepheid to iGene)

Between the analyser and iGene, the Regional Integration Engine (RIE) converts
and routes the result:

1. Cepheid sends an ASTM Result message to the RIE.
2. The RIE converts this to an HL7 v2 `R32` message (NW Standard).
3. The RIE transforms this into a FHIR Message `R32`.
4. The RIE routes the message.
5. The RIE's Cepheid handler converts this into a CSV file for iGene to import.

```mermaid
sequenceDiagram
    participant Cepheid as Cepheid GeneXpert<br/>Automation Manager
    participant RIE as Regional Integration Engine (RIE)<br/>Intermediary
    participant iGene as iGene<br/>Order Filler

    Cepheid ->> RIE: ASTM Result message
    RIE ->> RIE: Convert to HL7 v2 R32 message (NW Standard)
    RIE ->> RIE: Transform to FHIR Message R32
    RIE ->> RIE: Route message
    RIE ->> RIE: Cepheid handler converts to CSV
    RIE ->> iGene: CSV import
```

### Analytical Phase (Testing)

This is the core stage where the targeted substance (analyte) is actually measured.
- Calibration & Quality Control (QC): Before testing patient samples, laboratory technicians calibrate the instrument and run Quality Control materials with known values to ensure the equipment is operating perfectly.
- Analysis: The processed sample is placed into an automated analyzer. Depending on the analyte, the machine uses techniques like mass spectrometry, chromatography, or colorimetric spectroscopy to quantify or detect the substance.
- Validation: The instrument produces raw data which is processed and mathematically converted into a meaningful concentration.

Output: [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html)

### Post-Analytical Phase (Interpretation & Reporting)

Once the analyzer generates a value, the results must be evaluated and distributed to the requesting physician or client.
- Verification: The laboratory scientist reviews the result against the laboratory's reference ranges (what is considered "normal") and validates the data quality.
- Reporting: The final validated result is transmitted to the clinician's health record or client file.
- Critical Action: If the analyte is at a dangerously abnormal level, immediate protocols (e.g., direct calls to the doctor) are enacted.

Output: [Genomic Test Report](Questionnaire-GenomicTestReport.html)
Process Flow: [Test Results Management (LAB-5)](LTW.html#test-results-management-lab-5)

## Future Process

No distinct future-state changes are currently defined for this pathway - this
section will be populated as further Cepheid/ASTM analyser integrations are
brought onto the same pattern.

## Data Models

- [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html) - the `Observation` this use case populates
- [Genomic Test Report](Questionnaire-GenomicTestReport.html) - the validated report returned to the Order Placer
- [BCR-ABL Monitoring Result Panel](Questionnaire-BCRABLResultPanel.html) - the result panel Questionnaire, `item.definition`/`item.code` inferred from this IG's own `Observation-BCRABL-Valid`/`Observation-BCRABL-Invalid` examples

### Result Detail

See [Laboratory Analyte Result - Data Mapping](StructureDefinition-LaboratoryAnalyteResult.html#data-mapping)
for the full field mapping (openEHR / HL7 v2 / LOINC-SNOMED / FHIR / iGene) this use
case populates. These entries are expressed in `Observation.component`, structured as
the [BCR-ABL Monitoring Result Panel](Questionnaire-BCRABLResultPanel.html)
Questionnaire - its `item.definition`/`item.code` values are inferred directly from
this IG's own `Observation-BCRABL-Valid`/`Observation-BCRABL-Invalid` examples.

#### BCRABL

| Data Element     | Local Code    | LOINC | SNOMED | iGene                      | Data Type | Unit    | Example |
|------------------|---------------|-------|--------|----------------------------|-----------|---------|---------|
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

## Examples

| Example                              | Description                                                    |
|------------------------------------------|------------------------------------------------------------------|
| [Observation-BCRABL-Valid](Observation-BCRABL-Valid.html)   | A normal result - `valueQuantity` populated                     |
| [Observation-BCRABL-Invalid](Observation-BCRABL-Invalid.html) | An out-of-range result - `dataAbsentReason` populated instead of `valueQuantity` |
{:.grid}

## Security Considerations

Includes:

- OAuth2 Standard for [Authorisation](api-security.html#authorisation---oauth2)
  - including use of JWT access tokens and future support for [SMART-on-FHIR Scopes](api-security.html#scopes)
- FHIR AuditEvent/IHE BALP for [Audit Logging](api-security.html#audit-logging)
- TLS for [Transport Security/Encryption](api-security.html#encryption)

## Developer Guides

No [Developer Guides](DeveloperGuides.html) notebook covers this use case yet.
