ValueSet: HaematologicalOncologyTestCodes
Id: HaematologicalOncologyTestCodes
Title: "Genomic Haematological Oncology Test Directory"
Description: """
- Haematological Oncology test codes from the M* Haematological Oncology/Cancer CNS
  block that predates the digital TP/GT scheme - see `CodeSystem-GenomicTestCode` for
  detail and the DGTS GT-code replacements (`ConceptMap-GenomicTestCodeToDigitalGenomicTestServices`).
- CNS cancer codes from that same block are instead in `ValueSet-CancerTestCode`, not
  here.
- All `category = haematological-oncology` codes from `EnglandTestCode` (`CodeSystem-GenomicTestCode`), checked/refreshed 2026-09-05.
"""
* ^experimental  = false

* include codes from system $GTD where category = #haematological-oncology
