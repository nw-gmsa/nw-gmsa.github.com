## NHS Data Dictionary and Model

No distinct, confirmed NHS Data Dictionary entry for "Visit Number" itself -
closely related to [Hospital Provider Spell
Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html)
([HOSPITAL PROVIDER SPELL IDENTIFIER](https://www.datadictionary.nhs.uk/data_elements/hospital_provider_spell_identifier.html)),
which this v2 field is often used to carry in practice.

**Ubiquitous terms:** Visit Number, Encounter Number, Attendance Number.

## Mapping

| Ubiquitous Term | HL7 v2                                                                                                                                | OID  | Notes |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------|------|-------|
| Visit Number       | Visit Number (PV1-19). See [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) PV1 documentation. | none - locally assigned | See [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html) for the FHIR-side mapping this v2 field is normally paired with |
{:.grid}

## Examples

### HL7 v2 CX

```aiignore
12345^^^R0A^VN
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "VN"
      }
    ]
  },
  "value": "12345",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "R0A"
    }
  }
}
```
