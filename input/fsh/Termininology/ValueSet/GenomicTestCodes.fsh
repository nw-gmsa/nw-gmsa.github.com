ValueSet: GenomicTestCodes
Id: GenomicTestCodes
Title: "Genomic Test Codes"
Description: """
- See NHS England [Genomic Test Directory](https://www.england.nhs.uk/publication/national-genomic-test-directories)
"""
* ^experimental  = false

* include codes from system $GTD
* include codes from system $DGTS
* include codes from system NWTestCode
* include codes from system Histotrac
