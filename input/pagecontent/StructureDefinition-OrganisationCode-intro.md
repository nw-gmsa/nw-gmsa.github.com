## NHS Data Dictionary and Model

[ORGANISATION CODE](https://www.datadictionary.nhs.uk/attributes/organisation_code.html) -
issued by NHS England's [Organisation Data Service
(ODS)](https://digital.nhs.uk/services/organisation-data-service), unique and
never reused for the lifetime of the organisation.

**Ubiquitous terms:** ODS Code, Trust Code, Organisation Code.

## Mapping

| Ubiquitous Term | HL7 FHIR             | HL7 v2                                                                                     | OID                                    | Notes |
|-------------------|-------------------------|------------------------------------------------------------------------------------------------|-------------------------------------------|-------|
| ODS Code           | Organization.identifier | Extended Composite Name and Identification Number for Organizations (XON.3) and Assigning Authority For Location (PL.11) | `2.16.840.1.113883.2.1.3.2.4.18.48`      | The value itself is the ODS code (e.g. `R0A`) carried as the OID extension |
{:.grid}

- **IHE XDS** author

## Examples

### HL7 v2 XON

```aiignore
MANCHESTER UNIVERSITY NHS FOUNDATION TRUST^^R0A^^^ODS
```

### HL7 FHIR Identifier

```json
{
  "system": "https://fhir.nhs.uk/Id/ods-organization-code",
  "value": "R0A"
}
```
