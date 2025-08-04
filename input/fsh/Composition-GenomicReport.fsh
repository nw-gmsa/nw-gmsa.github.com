Profile:        Composition-GenomicReport
Parent:         Composition
Id:             Composition-GenomicReport
Title:          "Composition Genomic Report"
Description:    """
"""

* type.coding ^slicing.discriminator[0].type = #value
* type.coding ^slicing.discriminator[=].path = "system"
* type.coding ^slicing.ordered = false
* type.coding ^slicing.rules = #closed
* type.coding contains
    SNOMED 0..* MS and
    LOINC 0..*

* type.coding[SNOMED].system = $sct
* type.coding[SNOMED].code = #1054161000000101
* type.coding[LOINC].system = $loinc
* type.coding[LOINC].code = #51969-4


* section 1..* MS
* section.text 1..1 MS
* section.section ..0
* section.title 1..1
* section.code 1..1
* section.code from http://hl7.org/fhir/ValueSet/doc-section-codes
* section.code.coding 1..*
* section.code.coding.system 1..1
* section.code.coding.code 1..1

