## NHS Data Dictionary and Model

No NHS Data Dictionary entry - this is GS1's own global standard, not an
NHS-specific data item. See [GS1 Serial Shipping Container Code
(SSCC)](https://www.gs1.org/standards/id-keys/sscc) and [GS1
Pathology](https://gs1hospital.gs1.org/pathology/). The generic, non-GS1
equivalent already used elsewhere in this IG is [Shipment Tracking
Number](StructureDefinition-ShipmentTrackingNumber.html).

**Ubiquitous terms:** SSCC, Shipping Container Code, Tracking Number.

## Mapping

| Ubiquitous Term | HL7 FHIR             | HL7 v2                                                | OID (GS1 Application Identifier 00) | Notes |
|-------------------|--------------------------|------------------------------------------------------------|------------------------------------------|-------|
| SSCC               | Specimen.identifier      | Diagnostic Workflow - Identifier Type **STN** Shipment Tracking Number | `2.51.2`                                | GS1's standard identifier for a logistic unit (the shipping package) |
{:.grid}

## Examples

### HL7 v2 ST

```aiignore
006141411234567890
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "STN"
      }
    ]
  },
  "system": "urn:oid:2.51.2",
  "value": "006141411234567890"
}
```
