

## Entity Relationships

```mermaid
erDiagram

Variant
DiagnosticImplication
TherapeuticImplication
Genotype
Haplotype

DiagnosticImplication ||--|{ Variant : "derivedFrom"
TherapeuticImplication ||--|{ Variant : "derivedFrom"

Genotype ||--|{ Haplotype : "derivedFrom"
Genotype ||--|{ Variant : "derivedFrom"
Haplotype ||--|{ Variant : "derivedFrom"
```

| Type                | Name                                                                      |
|---------------------|---------------------------------------------------------------------------|
| Genomic Finding     | [Variant](StructureDefinition-Variant.html)                               | 
|                     | [Haplotype](StructureDefinition-Haplotype.html)                           |
|                     | [Genotype](StructureDefinition-Genotype.html)                             |
| Genomic Implication | [DiagnosticImplication](StructureDefinition-DiagnosticImplication.html)   | 
|                     | [TherapeuticImplication](StructureDefinition-TherapeuticImplication.html) | 
{:.grid}
