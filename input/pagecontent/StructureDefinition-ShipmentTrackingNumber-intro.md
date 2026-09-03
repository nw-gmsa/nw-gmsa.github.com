## NHS Data Dictionary and Model

No NHS Data Dictionary entry - a courier/logistics identifier, not a
nationally-defined NHS data item. See also [Specimen Transportation and
Management](SpecimenTransportationAndManagement.html#barcoding-gs1-uk-healthcare)
for the GS1 barcoding context this identifier is normally carried in, and [GS1
Serial Shipping Container Code (SSCC)](StructureDefinition-GS1SSCC.html) for
the GS1-standardised equivalent of this same concept.

**Ubiquitous terms:** Tracking Number, Courier Reference, Waybill Number,
Consignment Number.

## Mapping

| Ubiquitous Term  | HL7 FHIR                                | HL7 v2                    | OID  | Notes |
|--------------------|--------------------------------------------|------------------------------|------|-------|
| Tracking Number     | Specimen.identifier (type = STN)           | Accession ID (SPM-32)       | none - assigned by the courier/logistics provider | See [GS1 SSCC](StructureDefinition-GS1SSCC.html) (OID `2.51.2`) for the GS1-standardised equivalent |

- **IHE XDS** nil

## Examples

### HL7 v2 ST

```aiignore
UK3096580215
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
  "value": "UK3096580215"
}
```
