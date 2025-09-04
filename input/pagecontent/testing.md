The APIs are available on the [Health and Social Care Network (HSCN)](https://digital.nhs.uk/services/health-and-social-care-network)

## Environments

| Environment         | Service                                 | Base Url                                                                         | Capability Statement 'OAS'                                                                                                  |
|---------------------|-----------------------------------------|----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Development         |                                         |                                                                                  |                                                                                                                             |
|                     | Regional Integration Engine (RIE)       | https://10.165.194.216/gentiedev/ESB                                             | See [Placer Order Management [LAB-1]](LAB-1.html) and [CapabilityStatement](https://10.165.194.216/gentiedev/ESB/metadata)  |
|                     | Regional Clinical Data Repository (CDR) | https://10.165.194.216/irishealth/csp/healthshare/clinicaldatarepository/fhir/r4 | See [Query Existing Data [PCC-44]](PCC-44.html)                                                                             |
| Integration Testing |                                         |                                                                                  |                                                                                                                             |
|                     | Regional Integration Engine (RIE)       | https://10.165.194.217/gentietest/ESB                                            | See [Placer Order Management [LAB-1]](LAB-1.html) and [CapabilityStatement](https://10.165.194.217/gentietest/ESB/metadata) |
|                     | Regional OAuth2 Server                  | https://10.165.194.217/gentietest/oauth2                                         |                                                                                                                             | 

### Security and authorisation

This API has two access modes:

- Development - unrestricted access 
- Integration Testing - OAuth2 [client-credentials](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/)

## Integration Testing

It is recommended all systems should be compatible with [NHS England - Personal Demographics Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) and use the same test patients.

<div class="alert alert-success" role="alert">
Test Patients should be sourced from <a href="https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir/pds-fhir-api-test-data" _target="_blank">PDS FHIR API test data packs</a>
</div>

## FHIR Validation

For details see [FHIR Validation](https://hl7.org/fhir/R4/validation.html)

## Command Line Validation

See [Using the FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)

The FHIR Validator works best with individual FHIR Resources and this may be an easier why to start checking your FHIR is correct.
Due to API security requirements of the NHS England Ontology Service, this can not be used as a Terminology Server (the `-tx` parameter). This ig is configured to use the UK edition of SNOMED (83821000000107).

To use this Implementation Guide with the HL7 Validator, you will need to download this as a package (download link [package.tgz](package.tgz)) and then specify this NPM package file via the `-ig package.tgz` parameter.

The FHIR Validator defaults to validating individual FHIR resources (not FHIR Bundles), to validate FHIR resources in a Bundle see **Validating a single resource in a bundle** on the *Using the FHIR Validator* link above.

### Examples to Validate a Bundle

#### laboratory-order O21 Validation Example

```aiignore
 java -jar validator_cli.jar c:\temp\bundle.json -version 4.0.1 -ig package.tgz -bundle ServiceRequest:0 https://fhir.nwgenomics.nhs.uk/StructureDefinition/ServiceRequest -tx n/a
```

#### unsolicited-observation R01 Validation Example

```aiignore
 java -jar validator_cli.jar c:\temp\bundle.json -version 4.0.1 -ig package.tgz -bundle DiagnosticReport:0 https://fhir.nwgenomics.nhs.uk/StructureDefinition/DiagnosticReport -tx n/a
```

## Asking a FHIR Server

[validator.fhir.org](https://validator.fhir.org/) provides a web-based interface to the Validator CLI jar. This defaults to international FHIR and the options tab can be used to specify specific packages and SNOMED editions (this is listed as `UK - 999000041000000102`). This IG is not currently published to the registry and so `ukcore` should be used instead using the latest release





