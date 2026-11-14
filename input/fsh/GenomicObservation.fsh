// Applied to each genomic Observation profile, which takes its Parent from HL7 FHIR Genomics Reporting (GR).
// GR provides the genomic structure (category laboratory + GE, conclusion-string and the other component slices);
// imposeProfile requires every instance to also conform to the NW Observation profile, which derives from
// HL7 Europe Laboratory Report Observation-resultslab-eu-lab (the core IG) and is what DiagnosticReport.result targets.
RuleSet: ImposeNWObservation
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "https://fhir.nwgenomics.nhs.uk/StructureDefinition/Observation"

RuleSet: GenomicObservation
* insert ImposeNWObservation

* code ^short = "Indicates archetype/FHIR Profile"

*   component 1..*
