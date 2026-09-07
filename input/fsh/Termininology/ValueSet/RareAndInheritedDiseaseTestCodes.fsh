ValueSet: RareAndInheritedDiseaseTestCodes
Id: RareAndInheritedDiseaseTestCodes
Title: "Genomic Rare and Inherited Disease Test Directory"
Description: """
- See **National genomic test directory for rare and inherited disease** (v9) on [Genomic Test Directory](https://www.england.nhs.uk/publication/national-genomic-test-directories)
- All `category = rare-and-inherited-disease` codes from `EnglandTestCode` (`CodeSystem-GenomicTestCode`), checked/refreshed 2026-09-05.
"""
* ^experimental  = false

* include codes from system $GTD where category = #rare-and-inherited-disease
