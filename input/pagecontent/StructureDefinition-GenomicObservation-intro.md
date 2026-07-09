```mermaid
erDiagram

Variant
DiagnosticImplication
TherapeuticImplication
GenomicStudy
Genotype
Halotype

DiagnosticImplication ||--|{ Variant : "hasMember"
TherapeuticImplication ||--|{ Variant : "hasMember"

Genotype ||--|{ Halotype : "derivedFrom"
Halotype ||--|{ Variant : "derivedFrom"
```

| Type      | Name                                                                     |
|-----------|--------------------------------------------------------------------------|
| Finding   | [Variant](StructureDefinition-Variant.html)                              | 
|           | Halotype                             |
|           | [Genotype](StructureDefinition-Genotype.html)                            |
| Anotation | [DiagnosticImplication](StructureDefinition-DiagnosticImplication.html)  | 
|           | [TherapeuticImplication](StructureDefinition-TherapeuticImplication.html) | 
{:.grid}
