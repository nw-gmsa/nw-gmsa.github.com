## NHS Data Dictionary and Model

[LOCAL PATIENT IDENTIFIER](https://www.datadictionary.nhs.uk/data_elements/local_patient_identifier__extended_.html) -
the same underlying NHS Data Dictionary concept as [Medical Record
Number](StructureDefinition-MedicalRecordNumber.html). This profile is a more
generic (v2 type `PI`) fallback; [NHS England's Canonical Data
Model](https://future.nhs.uk/DataArchitecture/groupHome) states it is **not
applicable** and that [Medical Record
Number](StructureDefinition-MedicalRecordNumber.html) (type `MR`) should be
used instead - this profile is retained here only for completeness/legacy
interoperability.

**Ubiquitous terms:** Patient ID, Local ID (generic terms; prefer "MRN"/
"Hospital Number" per [Medical Record
Number](StructureDefinition-MedicalRecordNumber.html) in new development).

## Mapping

| Ubiquitous Term  | HL7 FHIR                     | HL7 v2                            | OID  | Notes |
|--------------------|---------------------------------|--------------------------------------|------|-------|
| Patient ID / Local ID | Patient.identifier (type = PI) | Patient Identifier List (PID-3) | none - locally assigned | See [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) - prefer that profile |

- **IHE XDS** sourcePatientId and patientId

## Examples

### HL7 v2 CX

```aiignore
12067204^^^R0A^PI
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "PI"
      }
    ]
  },
  "value": "12067204",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "R0A"
    }
  }
}
```
