// Applied to each genomic Observation profile, which takes its Parent from HL7 FHIR Genomics Reporting (GR).
// GR provides the genomic structure (category laboratory + GE, conclusion-string and the other component slices);
// imposeProfile requires every instance to also conform to HL7 Europe Laboratory Report, which remains the core IG.
RuleSet: GenomicObservation
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile"
* ^extension[=].valueCanonical = "http://hl7.eu/fhir/laboratory/StructureDefinition/Observation-resultslab-eu-lab"

* code ^short = "Indicates archetype/FHIR Profile"

* component 1..*
