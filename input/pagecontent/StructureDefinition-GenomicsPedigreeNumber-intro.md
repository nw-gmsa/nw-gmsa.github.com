### NHS Data Dictionary and Model

No NHS Data Dictionary entry - this identifier is specific to genomics family
studies and is not a nationally-defined NHS data item. See also [Medical Record
Number](StructureDefinition-MedicalRecordNumber.html) for the
individual-patient identifier. The Pedigree Number is **not** a patient
identifier: it identifies the family as a whole ([Family Genetic
Group](StructureDefinition-FamilyGeneticGroup.html)) and is used as the Order Group
Number on each family member's order.

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

**Ubiquitous terms:** Pedigree Number, Family Id, Kindred Number.

### Mapping

| Ubiquitous Term | HL7 FHIR             | HL7 v2                            | OID  | Notes |
|-------------------|--------------------------|--------------------------------------|------|-------|
| Pedigree Number    | FamilyGeneticGroup.identifier:PedigreeNumber, ServiceRequest.requisition (type = PGN) | Placer Group Number (ORC-4) | none - locally assigned, system fixed to `https://fhir.nhs.uk/Id/genomics-pedigree-number` | Identifies a family/pedigree tested together, e.g. related [Distributed WGS (dWGS)](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/dWGS.md) participants. Not a patient identifier |
{:.grid}

### Examples

#### HL7 v2 EI

```aiignore
PED-2026-0042^R0A
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
