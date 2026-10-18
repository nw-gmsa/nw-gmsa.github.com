### NHS Data Dictionary and Model

No NHS Data Dictionary entry. The `referral_id` is returned by TOMS (Test Order Management System, Genomics England)
for a [Distributed WGS (dWGS)](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/dWGS.md) referral. Every
participant tested together in that referral shares it, so it identifies the family
([Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html)) and can be used as the Order Group Number.

**Ubiquitous terms:** NGIS Referral Id, `referral_id`, Referral ID.

### Mapping

| Ubiquitous Term | HL7 FHIR | HL7 v2 | OID | Notes |
|-----------------|----------|--------|-----|-------|
| NGIS Referral Id | FamilyGeneticGroup.identifier:ReferralId, ServiceRequest.requisition (type = PGN) | Placer Group Number (ORC-4) | none | Shared by all participants in the referral |
{:.grid}

Combined with the participant's `patient_ngis_id` it forms the per-participant [NGIS Composite Order
Number](StructureDefinition-NGISCompositeOrderNumber.html).

### Examples

#### HL7 v2 EI

```aiignore
r2026000203^8J834
```

#### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "PGN"
      }
    ]
  },
  "system": "https://fhir.nwgenomics.nhs.uk/Identifier/NGIS-ReferralIdentifier",
  "value": "r2026000203",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "8J834"
    }
  }
}
```
