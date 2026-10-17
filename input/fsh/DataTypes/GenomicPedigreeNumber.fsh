Profile:        GenomicsPedigreeNumber
Parent:         OrderGroupNumber
Id:             GenomicsPedigreeNumber
Title:          "Genomics Pedigree Number"
Description:    """
Pedigree Number (Family Id). Identifies a family tested together and is used as the Order Group Number
(`ServiceRequest.requisition`, HL7 v2 ORC-4 Placer Group Number) - not a patient identifier.
"""

* . ^alias[+] = "Family Id"
* system = "https://fhir.nhs.uk/Id/genomics-pedigree-number" (exactly)
* assigner ^short = "Assigning Facility"
* assigner.identifier.system = $ods-code
