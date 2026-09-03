## NHS Data Dictionary and Model

No NHS Data Dictionary entry - a laboratory report identifier is a local
Filler concept defined by HL7 v2/FHIR, not a nationally-defined data item.

**Ubiquitous terms:** Filler Number, Report Number. Note: laboratories
sometimes informally call this an "accession number" too - don't confuse it
with [Specimen Accession
Number](StructureDefinition-SpecimenAccessionNumber.html), which identifies
the specimen rather than the report/order.

## Mapping

| Ubiquitous Term | HL7 FHIR                                                    | HL7 v2                       | OID  | Notes |
|-------------------|----------------------------------------------------------------|---------------------------------|------|-------|
| Report Number      | DiagnosticReport.identifier (type = FILL) and ServiceRequest.identifier | Filler Order Number (OBR-3) | none - locally assigned by the laboratory | Assigned by the Order Filler (laboratory) system |
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
        "code": "FILL"
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
