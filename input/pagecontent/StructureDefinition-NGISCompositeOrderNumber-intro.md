### NHS Data Dictionary and Model

No NHS Data Dictionary entry. For [Distributed WGS
(dWGS)](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/dWGS.md), TOMS (Test Order Management System,
Genomics England) returns two identifiers when the RGL enters the order: `referral_id` (the family/referral) and
`patient_ngis_id` (the participant). Joined with a hyphen, they give a unique order number for each participant's
sub-order.

Both parts are assigned by Genomics England Limited (ODS `8J834`). It is not known whether
`patient_ngis_id` is Genomics England's primary patient key (an MRN) or a system-specific patient identifier.

**Ubiquitous terms:** NGIS Order Number, `referral_id-patient_ngis_id`.

### Mapping

| Ubiquitous Term | HL7 FHIR | HL7 v2 | OID | Notes |
|-----------------|----------|--------|-----|-------|
| NGIS Composite Order Number | ServiceRequest.identifier (type = FILL) | Filler Order Number (ORC-3) | none | `referral_id` + `-` + `patient_ngis_id`, assigned by Genomics England (ODS `8J834`) |
{:.grid}

The `referral_id` part on its own identifies the family - see [NGIS Referral Id](StructureDefinition-NGISReferralId.html).

### Examples

#### HL7 v2 EI

```aiignore
r2026000203-p2026000104^8J834
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
  "value": "r2026000203-p2026000104",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "8J834"
    }
  }
}
```
