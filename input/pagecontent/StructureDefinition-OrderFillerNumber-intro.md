### NHS Data Dictionary and Model

No NHS Data Dictionary entry - a laboratory order identifier is a local
Placer/Filler concept defined by HL7 v2/FHIR, not a nationally-defined data
item. The number assigned by the ordering system is the [Order Placer
Number](StructureDefinition-OrderPlacerNumber.html). On a `DiagnosticReport`
the laboratory's number is carried as the [Report
Identifier](StructureDefinition-ReportIdentifier.html).

**Ubiquitous terms:** Order Filler Number, Filler Order Number, Laboratory
Number, Accession Number (radiology).

### Mapping

| Ubiquitous Term                | HL7 FHIR                                                     | HL7 v2                            | OID                     | Notes |
|--------------------------------|--------------------------------------------------------------|-----------------------------------|-------------------------|-------|
| Order Filler Number            | ServiceRequest.identifier (type = FILL)                      | Filler Order Number (ORC-3 / OBR-3) | none - locally assigned | Assigned by the receiving (Order Filler) system. Is also the radiological accession number |
| Sub Order Filler Number        | ServiceRequest.identifier (type = FILL) of the sub-order     | Filler Order Number (ORC-3) of the sub-order | none - locally assigned | Assigned by the Subcontractor |
{:.grid}

### Obligations

From [Informatics Issues - Pathway identifiers](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/InformaticsIssues.md).

| Data Item               | Order Placer (LAB-1) | Order Filler (LAB-3) | Requestor (LAB-4/LAB-35) | Subcontractor (LAB-5/LAB-36) |
|-------------------------|----------------------|----------------------|--------------------------|------------------------------|
| Order Filler Number     | n/a                  | SHALL                | n/a                      | n/a                          |
| Sub Order Filler Number | n/a                  | n/a                  | SHALL                    | SHOULD (if known)            |
{:.grid}

### Examples

#### HL7 v2 EI

```aiignore
R25012345^699X0
```

#### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "FILL"
      }
    ]
  },
  "value": "R25012345",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "699X0"
    }
  }
}
```
