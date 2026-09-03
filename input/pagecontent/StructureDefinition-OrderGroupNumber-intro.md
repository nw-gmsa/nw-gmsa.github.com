## NHS Data Dictionary and Model

No NHS Data Dictionary entry - a v2/FHIR technical grouping identifier, not a
nationally-defined data item.

**Ubiquitous terms:** Order Group Number, Placer Group Number, Panel/Batch
Number (the number linking several individual orders placed together, e.g. a
test panel or a single specimen requesting several tests).

## Mapping

| Ubiquitous Term    | HL7 FHIR                       | HL7 v2                          | OID  | Notes |
|----------------------|-----------------------------------|-----------------------------------|------|-------|
| Order Group Number   | ServiceRequest.requisition (type = PGN) | Placer Group Number (ORC-4) | none - locally assigned | Groups several ServiceRequests placed together |
{:.grid}

## Examples

### HL7 v2 EI

```aiignore
1001166717^699X0^^255^ISO
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "PGN"
      }
    ]
  },
  "value": "1001166717",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "699X0"
    }
  }
}
```
