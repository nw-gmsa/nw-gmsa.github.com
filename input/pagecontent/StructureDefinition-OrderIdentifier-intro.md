## NHS Data Dictionary and Model

No NHS Data Dictionary entry - a laboratory order identifier is a local
Placer/Filler concept defined by HL7 v2/FHIR, not a nationally-defined data
item.

**Ubiquitous terms:** Order Number, Requisition Number, Placer Order Number
(the referring system's own number) / Filler Order Number (the receiving
laboratory's own number).

## Mapping

| Ubiquitous Term       | HL7 FHIR                              | HL7 v2                        | OID  | Notes |
|-------------------------|-----------------------------------------|--------------------------------|------|-------|
| Order Number (Placer)   | ServiceRequest.identifier (type = PLAC) | Placer Order Number (ORC-2)   | none - locally assigned | Assigned by the ordering (Order Placer) system |
| Order Number (Filler)   | ServiceRequest.identifier (type = FILL) | Filler Order Number (ORC-3)   | none - locally assigned | Assigned by the receiving (Order Filler) system |
{:.grid}

## Examples

### HL7 v2 EI

```aiignore
1601737^R0A^150^L
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "PLAC"
      }
    ]
  },
  "value": "1601737",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "R0A"
    }
  }
}
```
