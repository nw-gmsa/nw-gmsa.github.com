## Class Diagram

```mermaid
classDiagram

Observation <|-- GenomicStudy : implements
Observation <|-- GenomicObservation
GenomicObservation <|-- GenomicFinding 
GenomicObservation <|-- GenomicImplication

GenomicFinding <|-- Variant :implements
GenomicFinding <|-- Haplotype :implements
GenomicFinding <|-- Genotype :implements

GenomicImplication <|-- DiagnosticImplication :implements
GenomicImplication <|-- TherapeuticImplication :implements
```

## Entity Relationships


```mermaid
erDiagram

Variant
DiagnosticImplication
TherapeuticImplication
GenomicStudy
Genotype
Haplotype

DiagnosticImplication ||--|{ Variant : "hasMember"
TherapeuticImplication ||--|{ Variant : "hasMember"

Genotype ||--|{ Haplotype : "derivedFrom"
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
