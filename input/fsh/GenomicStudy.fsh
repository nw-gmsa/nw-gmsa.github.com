Profile:        GenomicStudy
Parent:         Procedure
Id:             GenomicStudy
Title:          "Genomic Study (Procedure)"
Description:    """
`Diagnostic - Genomics Reporting`
"""

//* ^keyword[+] = #archetype "Domain Analysis Model"
//* ^keyword[+] = #genomics "Genomics"

* reasonCode 1..* MS
* reasonCode from GenomicClinicalIndicationCodes (preferred)

* outcome MS
* outcome from GenomicTestOutcomeCodes
