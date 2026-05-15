Profile:        MolecularBiomarker
Parent:         LaboratoryAnalyteResult
Id:             molecular-biomarker
Title:          "Molecular Biomarker"
Description:    """
`Diagnostic - Genomics Reporting`
"""
* derivedFrom only Reference(Variant)


* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains
    gene-studied 0..* and
    biomarker-category 0..*

* component[gene-studied] ^short = "Gene Studied"
* component[gene-studied] ^definition = "The gene(s) directly or indirectly assessed by the biomarker."
* component[gene-studied].code = $LNC#48018-6
* component[gene-studied].code ^short = "48018-6"
//* component[gene-studied].value[x] only CodeableConcept
* component[gene-studied].value[x] ^short = "The HGNC gene symbol is to be used as display text and the HGNC gene ID used as the code. If no HGNC code issued for this gene yet, NCBI gene IDs SHALL be used."
* component[gene-studied].value[x] 1..1
* component[gene-studied].value[x] from $HGNCVS (extensible)

* component[biomarker-category] ^short = "Biomarker Category"
* component[biomarker-category] ^definition = "A categorization of a given biomarker observation."
* component[biomarker-category] ^comment = """
Component biomarker-category is an optional and repeating field that provides for a categorization of a given biomarker observation. The example 'molecular biomarker ontology' value set provides a categorization of biomarkers along several axes. A given lab test can be associated with more than one category within more than one axis. For example, LOINC code 85337-4 represents Estrogen receptor antigen in tissue by immune stain. It can be categorized by physiologic role of cell receptor and antigen; by molecule type of protein; and by method of immune stain.
"""
* component[biomarker-category].code = $TbdCodesCS#biomarker-category
//* component[biomarker-category].value[x] only CodeableConcept
* component[biomarker-category].value[x] 1..1
* component[biomarker-category].value[x] ^short = "cell receptor | antigen | protein | immune stain"
* component[biomarker-category].value[x] from $MolecularBiomarkerCategoryVS (example)
