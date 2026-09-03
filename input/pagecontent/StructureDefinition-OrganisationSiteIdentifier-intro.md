## NHS Data Dictionary and Model

[ORGANISATION SITE IDENTIFIER](https://www.datadictionary.nhs.uk/attributes/organisation_site_identifier.html) -
identifies a physical site (e.g. a hospital building) belonging to an
[Organisation Code](StructureDefinition-OrganisationCode.html), issued by NHS
England's Organisation Data Service (ODS).

**Ubiquitous terms:** Site Code, ODS Site Code.

## Mapping

| Ubiquitous Term | HL7 FHIR              | HL7 v2           | OID  | Notes |
|-------------------|--------------------------|--------------------|------|-------|
| Site Code          | Location.identifier      | Facility (PL.5)   | Shares the ODS branch used by [Organisation Code](StructureDefinition-OrganisationCode.html) (`2.16.840.1.113883.2.1.3.2.4.18.48`) - a distinct, confirmed site-specific OID leaf was not found | The site code **SHALL** belong to (start with) its parent Organisation Code, e.g. site `R0A09` under organisation `R0A` |
{:.grid}

## Examples

### HL7 v2 PL

```aiignore
R0A09
```

### HL7 FHIR Identifier

```json
{
  "system": "https://fhir.nhs.uk/Id/ods-site-code",
  "value": "R0A09"
}
```
