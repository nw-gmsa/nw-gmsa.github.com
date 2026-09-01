Instance: ReportableVariantResultPanel
InstanceOf: NWQuestionnaire
Title: "Reportable Variant Result Panel"
Description: """
Result panel for a [Variant (Reportable Variant)](StructureDefinition-Variant.html)
`Observation`, following the HL7 Genomics Reporting IG's
[Variant](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-variant.html)
profile, the [HL7 Lab Results Interface (LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
examples it is based on, and iGene's own custom field spec for variants
(`NotGit/iGene Custom Fields Master Dataset - Updated 13-Aug-26.xlsx`, "Variant Level
Data" sheet) - see [OMICS DSS Result Integration](reportable-variants.html).

iGene models five variant types, each as a fixed, repeating set of custom fields
(`SEQV1`-`SEQV10` for sequence variants, `ICNV1`-`ICNV3` for intragenic copy number
variants, `MCNV1`-`MCNV3` for multigenic copy number variants, `SV1`-`SV3` for
structural variants, `LOH1`-`LOH2` for loss of heterozygosity) - this panel models
each variant type's field set once; the `N` suffix is iGene's own repetition scheme
for "up to N variants of this type per report", not a distinct concept the panel needs
to repeat.

`item.definition`/`item.code` are inferred from iGene's own LOINC crosswalk for each
field, cross-checked against this IG's current `Variant` examples: [Variant -
NTHL1](Observation-8385c2fd-313d-4fd5-b98e-d5ea4bae6f99.html) and [Variant -
CFTR](Observation-bca547c1-78a5-41be-8cfc-03c05805ac85.html) (both based on HL7 LRI
examples), `Observation-EGFR-Variant-ctDNA`, `Observation-BRCA1`, and the four
`Variant` Observations (a small variant, an intragenic CNV, a multi-gene CNV and a
structural variant) in
[Bundle-ctdna9737383222-testresults](Bundle-ctdna9737383222-testresults.html) - only
elements genuinely populated by at least one of these examples are modelled, since
these are the only elements needed for the iGene feed. See [OMICS DSS Result
Integration - Result Panel: Elements Not
Included](reportable-variants.html#result-panel-elements-not-included) for the
HL7 Genomics Reporting Variant profile elements deliberately left out because no
current example populates them.

**Two known gaps, not yet resolved:**
- **Loss of Heterozygosity** is one of iGene's five variant types, but no current
  example produces LOH result data at all - its two fields are modelled here from the
  iGene spec alone, unconfirmed against any FHIR example.
- **Structural Variant**: iGene expects a single `Complex variant HGVS name` field
  (LOINC `81262-8`), but the current worked example
  (`Bundle-ctdna9737383222-testresults`'s structural-variant Observation) does not
  populate `81262-8` at all - it instead spreads the same information across several
  discrete components (`48013-7`, `92822-6`, `69547-8`, `69551-0`, `48019-4`,
  `81290-9`). This panel models iGene's own field, but the mapping from the example
  data to it is not yet confirmed.
"""
Usage:  #definition

* title = "Reportable Variant Result Panel"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/ReportableVariantResultPanel"
* code[+] = $loinc#69548-6 "Genetic variant assessment"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

// Sequence Variant (iGene SEQV1-SEQV10) - confirmed against NTHL1, CFTR, EGFR-ctDNA, BRCA1, ctDNA Bundle small-variant example

* item[+]
  * type = #group
  * linkId = "SequenceVariant"
  * text = "Sequence Variant"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"

  * item[+]
    * type = #string
    * linkId = "iGene/SEQV_Description"
    * code[+] = $loinc#51958-7 "Transcript reference sequence [ID]"
    * code[+] = $loinc#48018-6 "Gene studied [ID]"
    * code[+] = $loinc#48004-6 "DNA change (c.HGVS)"
    * code[+] = $loinc#48005-3 "Amino acid change (pHGVS)"
    * text = "HGVS description"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "iGene/SEQV_Description-designNote"
      * type = #display
      * text = """
      iGene's single free-text field (e.g. "NM_007294.3(BRCA1):c.68_69del
      p.(Glu23ValfsTer17)") covers four separate FHIR Variant components at once:
      Reference Transcript (51958-7), Gene Studied (48018-6), DNA Change c.HGVS
      (48004-6) and Amino Acid Change pHGVS (48005-3). NTHL1/CFTR populate the first
      two; the ctDNA Bundle's small-variant Observation populates all four
      individually - this field is the concatenation iGene expects.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/SEQV_State"
    * code[+] = $loinc#53034-5 "Allelic state"
    * text = "Zygosity"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/SEQV_State-designNote"
      * type = #display
      * text = "Used by NTHL1, CFTR, BRCA1 and the ctDNA Bundle's small-variant Observation (Heterozygous)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/SEQV_Inheritance"
    * text = "Inheritance"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/SEQV_Inheritance-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec (\"None\"). Modelled in the ctDNA Bundle's small-variant Observation as Origin of Germline Genetic Variant (LOINC 94186-4, e.g. Maternal)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #decimal
    * linkId = "iGene/SEQV_Level"
    * code[+] = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
    * text = "VAF (%)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
    * item[+]
      * linkId = "iGene/SEQV_Level-designNote"
      * type = #display
      * text = "Used by EGFR-ctDNA (as a percentage) and the ctDNA Bundle's small-variant Observation (as a decimal fraction) - the units differ between the two sources."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/SEQV_Genomic_coordinates"
    * code[+] = $loinc#48001-2 "Cytogenetic (chromosome) location"
    * code[+] = $loinc#81290-9 "Genomic DNA change (gHGVS)"
    * text = "Genomic coordinates"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "iGene/SEQV_Genomic_coordinates-designNote"
      * type = #display
      * text = """
      iGene's single free-text field (e.g. "Chr17(GRCh37):g.41276047_41276048del")
      covers both a cytogenetic chromosome reference and the gHGVS genomic DNA change
      (81290-9) - the ctDNA Bundle's small-variant Observation populates 81290-9
      directly, plus Genomic Reference Sequence (48013-7), Coordinate System
      (92822-6), Genomic Ref/Alt Allele (69547-8/69551-0) and Genomic Allele
      Start-End (81254-5) as separate components this single iGene field summarises.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/SEQV_Classification"
    * code[+] = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
    * text = "Classification"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/SEQV_Classification-designNote"
      * type = #display
      * text = "Used by all four ctDNA Bundle Observations (e.g. Pathogenic)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/SEQV_Evidence"
    * text = "Classification Evidence"
    * item[+]
      * linkId = "iGene/SEQV_Evidence-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec, and not populated by any current example - free text summary of the evidence behind the Classification above."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Intragenic Copy Number Variant (iGene ICNV1-ICNV3) - confirmed against ctDNA Bundle intragenic-CNV example

* item[+]
  * type = #group
  * linkId = "IntragenicCNV"
  * text = "Intragenic Copy Number Variant"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"

  * item[+]
    * type = #string
    * linkId = "iGene/ICNV_Description"
    * code[+] = $loinc#51958-7 "Transcript reference sequence [ID]"
    * code[+] = $loinc#48018-6 "Gene studied [ID]"
    * code[+] = $loinc#48004-6 "DNA change (c.HGVS)"
    * text = "Description"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "iGene/ICNV_Description-designNote"
      * type = #display
      * text = "iGene's free-text field (e.g. \"NM_000138.4(FBN1):exon 13 to exon 15del\") covers the same three components as the Sequence Variant Description, minus Amino Acid Change - confirmed against the ctDNA Bundle's intragenic-CNV Observation."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/ICNV_State"
    * code[+] = $loinc#53034-5 "Allelic state"
    * text = "Copy-number state"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/ICNV_State-designNote"
      * type = #display
      * text = "iGene example value \"Single-copy loss (1 copy)\" - not yet confirmed against a populated Allelic State component in the ctDNA Bundle's intragenic-CNV Observation, which does not carry this component."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/ICNV_Inheritance"
    * text = "Inheritance"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/ICNV_Inheritance-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec. Modelled in the ctDNA Bundle's intragenic-CNV Observation as Origin of Germline Genetic Variant (94186-4)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #decimal
    * linkId = "iGene/ICNV_Level"
    * code[+] = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
    * text = "VAF (%)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
    * item[+]
      * linkId = "iGene/ICNV_Level-designNote"
      * type = #display
      * text = "Used by the ctDNA Bundle's intragenic-CNV Observation (as a decimal fraction)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/ICNV_Genomic_coordinates"
    * code[+] = $loinc#48001-2 "Cytogenetic (chromosome) location"
    * code[+] = $loinc#81290-9 "Genomic DNA change (gHGVS)"
    * text = "Genomic coordinates"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "iGene/ICNV_Genomic_coordinates-designNote"
      * type = #display
      * text = "Same combined field as Sequence Variant - the ctDNA Bundle's intragenic-CNV Observation populates 81290-9 directly, plus Genomic Reference Sequence, Coordinate System, Ref/Alt Allele and Structural Variant Inner Start-End (81302-2) as separate components."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/ICNV_Classification"
    * code[+] = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
    * text = "Classification"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/ICNV_Classification-designNote"
      * type = #display
      * text = "Used by the ctDNA Bundle's intragenic-CNV Observation (Pathogenic)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/ICNV_Evidence"
    * text = "Classification Evidence"
    * item[+]
      * linkId = "iGene/ICNV_Evidence-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec, and not populated by any current example."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Multigenic Copy Number Variant (iGene MCNV1-MCNV3) - confirmed against ctDNA Bundle multi-gene-CNV example

* item[+]
  * type = #group
  * linkId = "MultigenicCNV"
  * text = "Multigenic Copy Number Variant"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"

  * item[+]
    * type = #string
    * linkId = "iGene/MCNV_Description"
    * code[+] = $loinc#48001-2 "Cytogenetic (chromosome) location"
    * text = "Cytogenetic location"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/MCNV_Description-designNote"
      * type = #display
      * text = "Unlike Sequence Variant/Intragenic CNV, this field maps to a single component (chromosome band, e.g. \"Xq22.1-q28\") since a multigenic CNV isn't anchored to one gene/transcript - confirmed against the ctDNA Bundle's multi-gene-CNV Observation, the only example to populate 48001-2 as a standalone component."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/MCNV_State"
    * code[+] = $loinc#53034-5 "Allelic state"
    * text = "Copy-number state"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/MCNV_State-designNote"
      * type = #display
      * text = "iGene example value \"Single-copy loss (1 copy)\" - not yet confirmed against a populated Allelic State component in the ctDNA Bundle's multi-gene-CNV Observation, which does not carry this component."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/MCNV_Inheritance"
    * text = "Inheritance"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/MCNV_Inheritance-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec. Modelled in the ctDNA Bundle's multi-gene-CNV Observation as Origin of Germline Genetic Variant (94186-4)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #decimal
    * linkId = "iGene/MCNV_Level"
    * code[+] = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
    * text = "VAF (%)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
    * item[+]
      * linkId = "iGene/MCNV_Level-designNote"
      * type = #display
      * text = "Used by the ctDNA Bundle's multi-gene-CNV Observation (as a decimal fraction)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/MCNV_Genomic_coordinates"
    * code[+] = $loinc#48001-2 "Cytogenetic (chromosome) location"
    * code[+] = $loinc#81290-9 "Genomic DNA change (gHGVS)"
    * text = "Genomic coordinates"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "iGene/MCNV_Genomic_coordinates-designNote"
      * type = #display
      * text = "The ctDNA Bundle's multi-gene-CNV Observation populates 81290-9 directly, plus Genomic Reference Sequence, Coordinate System, Ref/Alt Allele and Structural Variant Inner Start-End (81302-2) as separate components."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/MCNV_Classification"
    * code[+] = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
    * text = "Classification"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/MCNV_Classification-designNote"
      * type = #display
      * text = "Used by the ctDNA Bundle's multi-gene-CNV Observation (Pathogenic)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/MCNV_Evidence"
    * text = "Classification Evidence"
    * item[+]
      * linkId = "iGene/MCNV_Evidence-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec, and not populated by any current example."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Structural Variant (iGene SV1-SV3) - iGene expects a single HGVS field (81262-8) not yet confirmed against any example

* item[+]
  * type = #group
  * linkId = "StructuralVariant"
  * text = "Structural Variant"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"

  * item[+]
    * type = #string
    * linkId = "iGene/SV_Description"
    * code[+] = $loinc#81262-8 "Complex variant HGVS name"
    * text = "HGVS description"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/SV_Description-designNote"
      * type = #display
      * text = """
      Not yet confirmed against any current example: the ctDNA Bundle's
      structural-variant Observation does not populate 81262-8, instead carrying
      Genomic Reference Sequence (48013-7), Coordinate System (92822-6), Genomic
      Ref/Alt Allele (69547-8/69551-0) and DNA Change Type (48019-4) as separate
      components. See the Description's "Structural Variant" gap note.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/SV_State"
    * code[+] = $loinc#53034-5 "Allelic state"
    * text = "Copy-number state"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/SV_State-designNote"
      * type = #display
      * text = "Not populated by the ctDNA Bundle's structural-variant Observation, which carries no Allelic State component."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #decimal
    * linkId = "iGene/SV_Level"
    * code[+] = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
    * text = "VAF (%)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
    * item[+]
      * linkId = "iGene/SV_Level-designNote"
      * type = #display
      * text = "Used by the ctDNA Bundle's structural-variant Observation (as a decimal fraction)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/SV_Genomic_coordinates"
    * code[+] = $loinc#48001-2 "Cytogenetic (chromosome) location"
    * code[+] = $loinc#81290-9 "Genomic DNA change (gHGVS)"
    * text = "Genomic coordinates"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
    * item[+]
      * linkId = "iGene/SV_Genomic_coordinates-designNote"
      * type = #display
      * text = "The ctDNA Bundle's structural-variant Observation populates 81290-9 directly, plus Genomic Reference Sequence, Coordinate System, Ref/Alt Allele and Structural Variant Inner Start-End (81302-2) as separate components."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/SV_Classification"
    * code[+] = $loinc#53037-8 "Genetic variation clinical significance [Imp]"
    * text = "Classification"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/SV_Classification-designNote"
      * type = #display
      * text = "Used by the ctDNA Bundle's structural-variant Observation (Pathogenic)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "iGene/SV_Evidence"
    * text = "Classification Evidence"
    * item[+]
      * linkId = "iGene/SV_Evidence-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec, and not populated by any current example."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Loss of Heterozygosity (iGene LOH1-LOH2) - no current FHIR example produces this variant type at all

* item[+]
  * type = #group
  * linkId = "LossOfHeterozygosity"
  * text = "Loss of Heterozygosity"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"

  * item[+]
    * type = #string
    * linkId = "iGene/LOH_Description"
    * code[+] = $loinc#48018-6 "Gene studied [ID]"
    * text = "Gene(s)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/LOH_Description-designNote"
      * type = #display
      * text = "No current example produces Loss of Heterozygosity result data - modelled from iGene's own spec alone, unconfirmed against any FHIR example."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "iGene/LOH_State"
    * text = "Loss of heterozygosity (LOH)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
    * item[+]
      * linkId = "iGene/LOH_State-designNote"
      * type = #display
      * text = "No LOINC code in iGene's own spec (\"None\"); iGene example value \"Significant LOH\". No current example produces this."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
