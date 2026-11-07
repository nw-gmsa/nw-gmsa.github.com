### NHS Data Dictionary and Model

No NHS Data Dictionary entry - a laboratory order identifier is a local
Placer/Filler concept defined by HL7 v2/FHIR, not a nationally-defined data
item. The number assigned by the receiving system is the [Order Filler
Number](StructureDefinition-OrderFillerNumber.html).

**Ubiquitous terms:** Order Placer Number, Placer Order Number, Order Number,
Requisition Number.

### Mapping

| Ubiquitous Term                | HL7 FHIR                                                     | HL7 v2                            | OID                     | Notes |
|--------------------------------|--------------------------------------------------------------|-----------------------------------|-------------------------|-------|
| Order Placer Number            | ServiceRequest.identifier (type = PLAC)                      | Placer Order Number (ORC-2 / OBR-2) | none - locally assigned | Assigned by the ordering (Order Placer) system |
| Sub Order Placer Number        | ServiceRequest.identifier (type = PLAC) of the sub-order     | Placer Order Number (ORC-2) of the sub-order | none - locally assigned | Assigned by the Requestor - may be the original Order Filler Number |
{:.grid}

### Obligations

From [Informatics Issues - Pathway identifiers](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/InformaticsIssues.md).

| Data Item               | Order Placer (LAB-1) | Order Filler (LAB-3) | Requestor (LAB-4/LAB-35) | Subcontractor (LAB-5/LAB-36) |
|-------------------------|----------------------|----------------------|--------------------------|------------------------------|
| Order Placer Number     | SHALL                | SHOULD (if known)    | n/a                      | n/a                          |
| Sub Order Placer Number | n/a                  | n/a                  | SHALL                    | n/a                          |
{:.grid}

### Examples

#### HL7 v2 EI

```aiignore
1601737^R0A^150^L
```

#### HL7 FHIR Identifier

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
