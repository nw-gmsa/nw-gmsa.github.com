
## FHIR Validation

### Command Line Validation

See [Using the FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)

The FHIR Validator works best with individual FHIR Resources and this may be an easier why to start checking your FHIR is correct.
Due to API security requirements of the NHS England Ontology Service, this can not be used as a Terminology Server (the `-tx` parameter). This ig is configured to use the UK edition of SNOMED (83821000000107).

The FHIR Validator will work with FHIR Bundles, see **Validating a single resource in a bundle** on the link above.

### laboratory-order O21

```aiignore
 java -jar validator_cli.jar c:\temp\bundle.json -version 4.0.1 -ig nhs.mft.fhir#0.0.1-current -bundle ServiceRequest:0 https://hl7.mft.nhs.uk/StructureDefinition/ServiceRequest
```

### Unsolicited Observation R01

```aiignore
 java -jar validator_cli.jar c:\temp\bundle.json -version 4.0.1 -ig nhs.mft.fhir#0.0.1-current -bundle DiagnosticReport:0 https://hl7.mft.nhs.uk/StructureDefinition/DiagnosticReport
```
