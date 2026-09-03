Profile:        SpecimenAccessionNumber
Parent:         CorrelationIdentifier
Id:             SpecimenAccessionNumber
Title:          "Specimen Accession Number"
Description:     """
Uniquely identifies a Specimen across multiple laboratory systems.
"""

//* ^keyword[+] = #NHSDataDictionary "NHS Data Dictionary"

* type = $v2-0203#ACSN
* system ^short = "uri should be defined and unique supplying organisation."
* value 1..1
* assigner 1..1
