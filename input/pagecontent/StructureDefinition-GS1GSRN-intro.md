## NHS Data Dictionary and Model

[GS1 GLOBAL SERVICE RELATION NUMBER](https://www.datadictionary.nhs.uk/supporting_information/gs1_global_service_relation_number.html) -
identifies the patient as recipient of a service, under the NHS
[Scan4Safety](https://www.gs1uk.org/industries/healthcare) programme. See also
[GS1 Pathology](https://gs1hospital.gs1.org/pathology/).

**Ubiquitous terms:** GSRN, GS1 Patient ID, Global Service Relation Number.

## Mapping

| Ubiquitous Term | HL7 FHIR             | HL7 v2                                | OID              | Notes |
|-------------------|--------------------------|-------------------------------------------|----------------------|-------|
| GSRN               | Patient.identifier       | Patient Administration - Identifier Type **PN** Patient Identifier | `2.51.1.7` (GS1 Application Identifier 8018) | Printed on a GS1-compliant patient wristband |
{:.grid}

## Examples

### HL7 v2 CX

```aiignore
98765432109876543^^^^PN
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "PN"
      }
    ]
  },
  "system": "urn:oid:2.51.1.7",
  "value": "98765432109876543"
}
```
