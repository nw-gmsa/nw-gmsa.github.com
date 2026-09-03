## NHS Data Dictionary and Model

No NHS Data Dictionary entry - this identifier is specific to genomics family
studies and is not a nationally-defined NHS data item. See also [Medical Record
Number](StructureDefinition-MedicalRecordNumber.html) for the equivalent
individual-patient identifier this complements.

The underlying concept - numbering a family/pedigree as a unit, distinct from
numbering each individual - is rooted in general clinical genetics/genetic
counselling practice, standardised by the [National Society of Genetic
Counselors' pedigree
nomenclature](https://www.researchgate.net/publication/23257568_Standardized_Human_Pedigree_Nomenclature_Update_and_Assessment_of_the_Recommendations_of_the_National_Society_of_Genetic_Counselors),
not invented by any single genomics programme.

**Is this a Genomics England concept specifically?** Genomics England's own
100,000 Genomes Project / National Genomic Research Library data model does use
a "Pedigree ID"/"Family ID" - e.g. its `denovo_cohort_information` table
records "participant ID, sex, affection status, family ID, pedigree ID" per
trio, and a separate `rare_diseases_pedigree_member` table records each
participant's relationship to their family's proband. So the concept is
real and used by Genomics England, but it is an application of the wider
clinical genetics convention above, not a Genomics-England-specific invention.

**Ubiquitous terms:** Pedigree Number, Family ID, Kindred Number.

## Mapping

| Ubiquitous Term | HL7 FHIR             | HL7 v2                            | OID  | Notes |
|-------------------|--------------------------|--------------------------------------|------|-------|
| Pedigree Number    | Patient.identifier (type = PI) | Patient Identifier List (PID-3) | none - locally assigned, system fixed to `https://fhir.nhs.uk/Id/genomics-pedigree-number` | Identifies a family/pedigree group across related [Distributed WGS (dWGS)](dWGS.html) participants - a "Patient internal identifier" (PI), not the patient's own medical record number (MR) |
{:.grid}

## Examples

### HL7 v2 CX

```aiignore
PED-2026-0042^^^R0A^PI
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
