Profile:        GenomicsPedigreeNumber
Parent:         CorrelationIdentifier
Id:             GenomicsPedigreeNumber
Title:          "Genomics Pedigree Number"
Description:     """
TODO
"""

* ^purpose = """
| Standard | Data Type | Value |
|----------|-------|-------|
| NHS Data Dictionary | | - |

"""

* type = $v2-0203#MR (exactly)
* system = "https://fhir.nhs.uk/Id/genomics-pedigree-number"
* assigner ^short = "Assigning Facility"
* assigner.identifier.system = $ods-code



