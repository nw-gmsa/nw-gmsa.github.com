## NHS Data Dictionary and Model

No NHS Data Dictionary entry - this identifier is specific to genomics family
studies and is not a nationally-defined data item. See also [Medical Record
Number](StructureDefinition-MedicalRecordNumber.html) for the equivalent
individual-patient identifier this complements.

**Ubiquitous terms:** Pedigree Number, Family ID, Kindred Number.

## Mapping

| Ubiquitous Term | HL7 FHIR             | HL7 v2                            | OID  | Notes |
|-------------------|--------------------------|--------------------------------------|------|-------|
| Pedigree Number    | Patient.identifier       | Patient Identifier List (PID-3)     | none - locally assigned, system fixed to `https://fhir.nhs.uk/Id/genomics-pedigree-number` | Identifies a family/pedigree group across related [Distributed WGS (dWGS)](dWGS.html) participants |
{:.grid}

## Examples

### HL7 v2 CX

```aiignore
PED-2026-0042^^^R0A^MR
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "MR"
      }
    ]
  },
  "system": "https://fhir.nhs.uk/Id/genomics-pedigree-number",
  "value": "PED-2026-0042",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "R0A"
    }
  }
}
```
