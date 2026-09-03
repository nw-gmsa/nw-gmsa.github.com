## NHS Data Dictionary and Model

[GS1 SERVICE RELATION INSTANCE NUMBER](https://www.datadictionary.nhs.uk/attributes/gs1_service_relation_instance_number.html) -
the GS1-standardised equivalent of an account/visit number, under the NHS
Scan4Safety programme. See also [GS1 Pathology](https://gs1hospital.gs1.org/pathology/).

**Ubiquitous terms:** SRIN, GS1 Account/Visit Number.

## Mapping

| Ubiquitous Term | HL7 FHIR                 | HL7 v2                                            | OID (GS1 code 8019) | Notes |
|-------------------|------------------------------|-------------------------------------------------------|-------------------------|-------|
| SRIN               | Encounter.identifier         | Patient Administration - Identifier Type **AN/VN** Account/Visit number | `2.51.1.2.8019` | Instance of a service relation - i.e. one visit/account under a [GSRN](StructureDefinition-GS1GSRN.html) |
{:.grid}

## Examples

### HL7 v2 CX

```aiignore
1234567890123^^^^SNO
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "SNO"
      }
    ]
  },
  "system": "urn:oid:2.51.1.2.8019",
  "value": "1234567890123"
}
```
