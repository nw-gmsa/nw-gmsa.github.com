<div class="alert alert-danger">
<b>Workaround - identifier type <code>AN</code> is not technically correct.</b>
Hospital Provider Spell is an NHS concept with no equivalent in HL7: v2 Table 0203 has no identifier type code for a spell.
This profile uses <code>AN</code> (Account number) as an interim workaround. Strictly, <code>AN</code> identifies an
account (HL7 v2 <code>PID-18</code> Patient Account Number, FHIR <code>Account.identifier</code>) rather than an encounter.
The closest encounter-level code, <code>VN</code> (Visit number), is already used by
<a href="StructureDefinition-VisitNumber.html">Visit Number</a>. Expect this identifier type to change once a better code is agreed.
</div>

### NHS Data Dictionary and Model

[HOSPITAL PROVIDER SPELL IDENTIFIER](https://www.datadictionary.nhs.uk/data_elements/hospital_provider_spell_identifier.html) -
a unique identifier for a period of care under one Trust (admission to
discharge), assigned by the PAS/EPR. No national OID; each Trust assigns its
own.

**Ubiquitous terms:** Spell Number, Account Number, Episode Number, Encounter
Number, Visit Number (informally, though [Visit
Number](StructureDefinition-VisitNumber.html) is a related but distinct v2
identifier type - see that page).

### Mapping

| Ubiquitous Term  | HL7 FHIR                                              | HL7 v2                                                                                                                                | OID  | Notes |
|-------------------|--------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|------|-------|
| Spell/Account Number | Encounter.identifier and EpisodeOfCare.identifier (type = AN) | Visit Number (PV1-19). See [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) PV1 documentation. | none - locally assigned by the Trust's PAS/EPR | Assigning organisation is the Trust ODS Code |
{:.grid}

### Examples

#### HL7 v2 CX

```aiignore
1001166717^^^R0A^AN
```

#### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "AN"
      }
    ]
  },
  "value": "1001166717",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "R0A"
    }
  }
}
```
