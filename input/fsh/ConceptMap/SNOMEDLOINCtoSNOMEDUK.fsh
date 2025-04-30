Instance: SNOMEDLOINCtoSNOMEDUK
InstanceOf: ConceptMap
Title: "ConceptMap for LOINC SNOMED edition to UK SNOMED edition"
Description: """
For demonstration purposes only.

For Implementation Guide see [SNOMED CT Implementation Guide for the LOINC Ontology](https://confluence.ihtsdotools.org/display/DOCLOINCSIG/1.+Introduction)
"""
Usage:  #example

* url = "https://nw-gmsa.github.io/ConceptMap/SNOMEDLOINCtoSNOMEDUK"
* version = "0.0.1"
* status = #draft

* sourceUri = "http://snomed.info/sct"
* targetUri = "http://snomed.info/sct"

* group.source = "http://snomed.info/sct"
* group.targetVersion = "http://snomed.info/sct/11010000107"
* group.target = "http://snomed.info/sct"
* group.targetVersion = "http://snomed.info/sct/83821000000107"

* group.element[+]
  * code = #612991010000106
  * target.code = #1022471000000107
  * target.equivalence = #equivalent
