Instance: ReportableVariantResultPanel
InstanceOf: NWQuestionnaire
Title: "Reportable Variant Result Panel"
Description: """
Result panel for a [Variant (Reportable Variant)](StructureDefinition-Variant.html)
`Observation`, structured around the HL7 v2 [Lab Results Interface (LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)'s
own **Discrete Variant Panel** (LOINC `81250-3`, LRI Chapter 5 Table 5-2, plus the
Structural Variant Addenda in Table 5-3) - the same panel the NTHL1 and CFTR examples
are based on. LRI already defines this as a single panel covering both simple and
structural variants; this Questionnaire follows that same single-panel structure
rather than iGene's separate per-variant-type field sets, mapping each item to both
its LRI `OBX` row and its corresponding component in the HL7 Genomics Reporting IG's
[Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html)
profile. See [OMICS DSS Result Integration](reportable-variants.html) for the full
LRI/FHIR/iGene three-way mapping table.

`item.definition`/`item.code` are cross-checked against this IG's current `Variant`
examples: [Variant - NTHL1](Observation-8385c2fd-313d-4fd5-b98e-d5ea4bae6f99.html) and
[Variant - CFTR](Observation-bca547c1-78a5-41be-8cfc-03c05805ac85.html) (both based on
LRI examples), `Observation-EGFR-Variant-ctDNA`, `Observation-BRCA1`, and the four
`Variant` Observations (a small variant, an intragenic CNV, a multi-gene CNV and a
structural variant) in
[Bundle-ctdna9737383222-testresults](Bundle-ctdna9737383222-testresults.html), plus
iGene's own custom field spec for variants (`NotGit/iGene Custom Fields Master
Dataset - Updated 13-Aug-26.xlsx`, "Variant Level Data" sheet) - only elements
genuinely populated by at least one of these is modelled, since these are the only
elements needed for the iGene feed. See [OMICS DSS Result Integration - Result
Panel: Elements Not Included](reportable-variants.html#result-panel-elements-not-included)
for the LRI/FHIR elements deliberately left out because no current example populates
them.

**Known gaps between iGene, LRI and the FHIR profile, not yet resolved:**
- **Loss of Heterozygosity** is one of iGene's five variant types, but has **no
  corresponding row anywhere in LRI's Discrete Variant Panel** - LRI's closest concept,
  Allelic State (`53034-5`, row B.23), does not offer an LOH answer option. No current
  FHIR example produces LOH data either.
- **Coordinate System [Type]** (`92822-6`) and **Origin of Germline Genetic Variant
  [Type]** (`94186-4`), both used by the ctDNA Bundle examples, have **no row in LRI's
  Discrete Variant Panel** - LRI's closest concept to the latter is Allelic Phase
  (`82120-7`, row B.26), a different LOINC code whose answer list happens to include
  Maternal/Paternal as two of several "sets of variants in cis" options, not a
  dedicated parent-of-origin field.
- **Structural Variant**: iGene expects a single `Complex variant HGVS name` field
  (LOINC `81262-8` - itself an LRI Complex Variant Panel code, row C.2, not part of the
  Discrete Variant Panel at all), but the ctDNA Bundle's structural-variant Observation
  does not populate `81262-8` - it uses several Discrete Variant Panel components
  instead (Genomic Reference Sequence, Coordinate System, Genomic Ref/Alt Allele, DNA
  Change Type, Genomic DNA Change).
"""
Usage:  #definition

* title = "Reportable Variant Result Panel"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/ReportableVariantResultPanel"
* code[+] = $loinc#69548-6 "Genetic variant assessment"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "DiscreteVariantPanel"
  * code[+] = $loinc#81250-3 "Discrete genetic variant panel"
  * text = "Discrete Variant Panel"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"
  * repeats = true
  * item[+]
    * linkId = "DiscreteVariantPanel-designNote"
    * type = #display
    * text = "LRI Table 5-2 row B - repeats for each discrete variant reported (OBX-4 sub-ID \"2a\", incrementing per repeat)."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Transcript Specification (LRI B.3-B.8)

  * item[+]
    * type = #group
    * linkId = "TranscriptSpecification"
    * text = "Transcript Specification"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

    * item[+]
      * type = #choice
      * linkId = "LRI/B.3"
      * code[+] = $loinc#48018-6 "Gene studied [ID]"
      * text = "Gene Studied"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.3-designNote"
        * type = #display
        * text = """
        LRI row B.3, OBX type CWE, R/O/C = C, [0..1]. FHIR Variant profile: this IG's
        own `gene-studied` addition (not one of the international profile's named
        slices). iGene: rolled into the free-text Description field (SEQV/ICNV) or the
        Gene(s) field (LOH). Used by NTHL1, CFTR, EGFR-ctDNA, and the ctDNA Bundle's
        small-variant and intragenic-CNV Observations.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "LRI/B.4"
      * code[+] = $loinc#51958-7 "Transcript reference sequence [ID]"
      * text = "Transcript Reference Sequence"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.4-designNote"
        * type = #display
        * text = """
        LRI row B.4, OBX type CWE, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `representative-transcript-ref-seq`. iGene: rolled into the free-text
        Description field (SEQV/ICNV). Used by NTHL1, CFTR and the ctDNA Bundle's
        small-variant Observation.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "LRI/B.5"
      * code[+] = $loinc#48004-6 "DNA change (c.HGVS)"
      * text = "DNA Change (c.HGVS)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.5-designNote"
        * type = #display
        * text = """
        LRI row B.5, OBX type CWE, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `representative-coding-hgvs`. iGene: rolled into the free-text Description
        field (SEQV/ICNV). Used by EGFR-ctDNA, BRCA1 and the ctDNA Bundle's
        small-variant Observation.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "LRI/B.6"
      * code[+] = $loinc#48005-3 "Amino acid change (pHGVS)"
      * text = "Amino Acid Change (pHGVS)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.6-designNote"
        * type = #display
        * text = """
        LRI row B.6, OBX type CWE, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `representative-protein-hgvs`. iGene: rolled into the free-text Description
        field (SEQV only - ICNV's Description omits this). Used only by the ctDNA
        Bundle's small-variant Observation.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "LRI/B.7"
      * code[+] = $loinc#48019-4 "DNA change [Type]"
      * text = "DNA Change Type"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.7-designNote"
        * type = #display
        * text = """
        LRI row B.7, OBX type CWE, R/O/C = O, [0..1]. FHIR Variant profile slice:
        `coding-change-type`. Not a discrete iGene field - summarised within iGene's
        free-text Description/Genomic_coordinates fields. Used by every current
        example (Sequence Ontology or LOINC answer coding, e.g. duplication,
        deletion, substitution, copy_number_variation).
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Genomic Specification (LRI B.9-B.13)

  * item[+]
    * type = #group
    * linkId = "GenomicSpecification"
    * text = "Genomic Specification"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

    * item[+]
      * type = #choice
      * linkId = "LRI/B.9"
      * code[+] = $loinc#48013-7 "Genomic reference sequence [ID]"
      * text = "Genomic Reference Sequence"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.9-designNote"
        * type = #display
        * text = """
        LRI row B.9, OBX type CWE, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `genomic-ref-seq`. iGene: rolled into the free-text Genomic_coordinates field
        (all four variant types). Used by NTHL1 and all four ctDNA Bundle
        Observations.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "LRI/B.10"
      * code[+] = $loinc#81290-9 "Genomic DNA change (gHGVS)"
      * text = "Genomic DNA Change (gHGVS)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.10-designNote"
        * type = #display
        * text = """
        LRI row B.10, OBX type CWE, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `genomic-hgvs`. iGene: rolled into the free-text Genomic_coordinates field
        (all four variant types). Used by all four ctDNA Bundle Observations - not by
        NTHL1/CFTR, where it is commented out pending a confirmed mapping.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "LRI/B.11"
      * code[+] = $loinc#69547-8 "Genomic ref allele [ID]"
      * text = "Genomic Ref Allele"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"
      * item[+]
        * linkId = "LRI/B.11-designNote"
        * type = #display
        * text = """
        LRI row B.11, OBX type ST, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `ref-allele`. Not a discrete iGene field - summarised within iGene's
        Genomic_coordinates field. Used by NTHL1, CFTR and all four ctDNA Bundle
        Observations.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "LRI/B.12"
      * code[+] = $loinc#81254-5 "Genomic allele start-end"
      * text = "Genomic Allele Start-End"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueRange"
      * item[+]
        * linkId = "LRI/B.12-designNote"
        * type = #display
        * text = """
        LRI row B.12, OBX type NR, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `exact-start-end`. Not a discrete iGene field. Used only by the ctDNA
        Bundle's small-variant Observation - a Range with only the low bound
        populated.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "LRI/B.13"
      * code[+] = $loinc#69551-0 "Genomic alt allele [ID]"
      * text = "Genomic Alt Allele"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"
      * item[+]
        * linkId = "LRI/B.13-designNote"
        * type = #display
        * text = """
        LRI row B.13, OBX type ST, R/O/C = C, [0..1]. FHIR Variant profile slice:
        `alt-allele`. Not a discrete iGene field - summarised within iGene's
        Genomic_coordinates field. Used by the ctDNA Bundle's intragenic-CNV,
        multi-gene-CNV and structural-variant Observations (as symbolic ALT alleles,
        e.g. "<DEL>") - not by the small-variant Observation, NTHL1 or CFTR.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Other possible attributes (LRI B.17-B.18)

  * item[+]
    * type = #group
    * linkId = "OtherAttributes"
    * text = "Other Attributes"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

    * item[+]
      * type = #string
      * linkId = "LRI/B.17"
      * code[+] = $loinc#48001-2 "Cytogenetic (chromosome) location"
      * text = "Cytogenetic (Chromosome) Location"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.17-designNote"
        * type = #display
        * text = """
        LRI row B.17, OBX type CWE, R/O/C = O, [0..1]. Not one of the international
        FHIR Variant profile's named component slices (its closest named slice,
        Cytogenomic Nomenclature 81291-7, is actually a different LRI field - Table
        5-1 row A.11, part of the report-level Master Panel, not this Discrete
        Variant Panel) - captured here as an open-slice addition, consistent with
        GenomicObservation's open component slicing. iGene: this is the sole field
        for the Multigenic CNV Description, and part of the Genomic_coordinates
        field for the other three variant types. Used only by the ctDNA Bundle's
        multi-gene-CNV Observation (e.g. "Xq22.1-q28").
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "LRI/B.18"
      * code[+] = $loinc#48002-0 "Genomic source class [Type]"
      * text = "Genomic Source Class"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.18-designNote"
        * type = #display
        * text = """
        LRI row B.18, OBX type CNE, R/O/C = R (required when present), [0..*]. FHIR
        Variant profile slice: `genomic-source-class`. Not a discrete iGene field.
        Used by NTHL1, CFTR, EGFR-ctDNA and the ctDNA Bundle's small-variant,
        intragenic-CNV and multi-gene-CNV Observations (Germline or Somatic) - not
        by the structural-variant Observation.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Interpretations (LRI B.20)

  * item[+]
    * type = #group
    * linkId = "Interpretations"
    * text = "Interpretations"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

    * item[+]
      * type = #choice
      * linkId = "LRI/B.20"
      * code[+] = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
      * text = "Classification"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.20-designNote"
        * type = #display
        * text = """
        LRI row B.20 (LRI names it "Genetic sequence variation clinical
        significance"), OBX type CNE, R/O/C = O, [0..1]. FHIR Variant profile: not
        one of the profile's own component slices (the profile relies on the generic
        `Observation.interpretation`/`valueCodeableConcept` pattern for this) -
        modelled here as an open-slice component to match how every current example
        actually carries it. iGene: this is the Classification field for all four
        variant types. Used by all four ctDNA Bundle Observations (e.g.
        "Pathogenic").
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Allelic State/Phase Information (LRI B.23-B.24)

  * item[+]
    * type = #group
    * linkId = "AllelicStatePhase"
    * text = "Allelic State/Phase Information"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

    * item[+]
      * type = #choice
      * linkId = "LRI/B.23"
      * code[+] = $loinc#53034-5 "Allelic state"
      * text = "Allelic State"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "LRI/B.23-designNote"
        * type = #display
        * text = """
        LRI row B.23, OBX type CNE, R/O/C = C, [0..1], answer list LL381-5
        (Heteroplasmic/Homoplasmic/Homozygous/Heterozygous/Hemizygous - no "Loss of
        Heterozygosity" option). FHIR Variant profile slice: `allelic-state`. iGene:
        the Zygosity/Copy-number state field for all five variant types (iGene's LOH
        "State" field has no LOINC code and is a different concept - LRI has no LOH
        answer here). Used by NTHL1, CFTR, BRCA1 and the ctDNA Bundle's small-variant
        Observation (Heterozygous).
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #decimal
      * linkId = "LRI/B.24"
      * code[+] = $loinc#81258-6 "Allelic Frequency [NFr]"
      * text = "Allelic Frequency"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
      * item[+]
        * linkId = "LRI/B.24-designNote"
        * type = #display
        * text = """
        LRI row B.24 (LRI names it "Allelic Frequency [NFr]", the FHIR profile and
        our examples call it "Sample variant allelic frequency [NFr]" - same LOINC
        code, slightly different display text), OBX type NM, R/O/C = C, [0..1]. FHIR
        Variant profile slice: `sample-allelic-frequency`. iGene: the Level (VAF %)
        field for the four variant types that have one (not LOH). Used by EGFR-ctDNA
        (as a percentage) and all four ctDNA Bundle Observations (as a decimal
        fraction) - the units differ between the two sources.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Structural Variant Addenda (LRI Table 5-3, B.28 and B.32)

  * item[+]
    * type = #group
    * linkId = "StructuralVariantAddenda"
    * code[+] = $loinc#81297-4 "Structural variant addendum panel"
    * text = "Structural Variant Addenda"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "StructuralVariantAddenda-designNote"
      * type = #display
      * text = "LRI Table 5-3 - part of the same Discrete Variant Panel in the HL7 v2 message, shown as a separate table in LRI purely for visual separation of structural-variant-only attributes."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #decimal
      * linkId = "LRI/B.28"
      * code[+] = $loinc#82155-3 "Genomic structural variant copy number"
      * text = "Genomic Structural Variant Copy Number"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
      * item[+]
        * linkId = "LRI/B.28-designNote"
        * type = #display
        * text = """
        LRI row B.28, OBX type NM, R/O/C = O, [0..1], OBX-4 sub-ID "2a.1". FHIR
        Variant profile slice: `copy-number`. Not a discrete iGene field - the
        closest iGene concept is the Copy-number state dropdown (Allelic State,
        B.23), which is a category not a number. Used by the ctDNA Bundle's
        intragenic-CNV and multi-gene-CNV Observations - not the structural-variant
        (translocation-style) Observation, where a copy number doesn't apply.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "LRI/B.32"
      * code[+] = $loinc#81302-2 "Structural variant inner start and end"
      * text = "Structural Variant Inner Start-End"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueRange"
      * item[+]
        * linkId = "LRI/B.32-designNote"
        * type = #display
        * text = """
        LRI row B.32, OBX type NR, R/O/C = O, [0..1], OBX-4 sub-ID "2a.1". FHIR
        Variant profile slice: `inner-start-end`. Not a discrete iGene field -
        summarised within iGene's Genomic_coordinates field. Used by the ctDNA
        Bundle's intragenic-CNV, multi-gene-CNV and structural-variant Observations.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// FHIR/iGene concepts with no LRI Discrete Variant Panel row at all

  * item[+]
    * type = #group
    * linkId = "NoLRIEquivalent"
    * text = "FHIR/iGene Elements With No LRI Discrete Variant Panel Row"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "NoLRIEquivalent-designNote"
      * type = #display
      * text = "These are used by a current FHIR example and/or iGene, but have no row anywhere in LRI's Discrete Variant Panel (Table 5-2/5-3) - see the Description's gap notes."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "FHIR/CoordinateSystem"
      * code[+] = $loinc#92822-6 "Genomic coordinate system [Type]"
      * text = "Coordinate System"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "FHIR/CoordinateSystem-designNote"
        * type = #display
        * text = """
        No LRI row. FHIR Variant profile slice: `coordinate-system`. Not a discrete
        iGene field - summarised within iGene's Genomic_coordinates field. Used by
        all four ctDNA Bundle Observations (1-based character counting).
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #choice
      * linkId = "FHIR/OriginOfGermlineVariant"
      * code[+] = $loinc#94186-4 "Origin of germline genetic variant [Type]"
      * text = "Origin of Germline Genetic Variant"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "FHIR/OriginOfGermlineVariant-designNote"
        * type = #display
        * text = """
        No dedicated LRI row - the closest LRI concept is Allelic Phase (82120-7, row
        B.26), whose answer list happens to include Maternal/Paternal among several
        "set of variants in cis" options, not a dedicated parent-of-origin field.
        FHIR Variant profile slice: `variant-inheritance`. iGene: this is the
        Inheritance field for the four variant types that have one (not LOH), though
        iGene's own spec gives it no LOINC code. Used by the ctDNA Bundle's
        small-variant, intragenic-CNV and multi-gene-CNV Observations (Maternal) -
        not the structural-variant Observation.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Loss of Heterozygosity - iGene-only concept, no LRI or current FHIR example support

  * item[+]
    * type = #group
    * linkId = "LossOfHeterozygosity"
    * text = "Loss of Heterozygosity (iGene fields, mapped to a separate Molecular Consequence Observation)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"
    * item[+]
      * linkId = "LossOfHeterozygosity-designNote"
      * type = #display
      * text = """
      One of iGene's five variant types (`LOH1`-`LOH2`), with no corresponding row
      anywhere in LRI's Discrete Variant Panel. Decided: this IG models LOH as a
      separate [Molecular Consequence](StructureDefinition-MolecularConsequence.html)
      Observation, `derivedFrom` the `Variant` it accompanies, with a
      `functional-effect` component coded `SO_0001786 loss_of_heterozygosity` -
      see [Observation-ctdna9737383222-seqv1-loh](Observation-ctdna9737383222-seqv1-loh.html)
      for a worked example - rather than as items directly on this Discrete Variant
      Panel. The two items below describe iGene's own flat fields for reference, not
      how this IG models them.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "iGene/LOH_Description"
      * code[+] = $loinc#48018-6 "Gene studied [ID]"
      * text = "Gene(s)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"

    * item[+]
      * type = #choice
      * linkId = "iGene/LOH_State"
      * text = "Loss of Heterozygosity (LOH)"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
      * item[+]
        * linkId = "iGene/LOH_State-designNote"
        * type = #display
        * text = "No LOINC code in iGene's own spec (\"None\"); iGene example value \"Significant LOH\". Not a value LRI's Allelic State (B.23) answer list supports."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
