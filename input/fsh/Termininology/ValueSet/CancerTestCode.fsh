ValueSet: CancerTestCode
Id: CancerTestCode
Title: "Genomic Cancer Test Directory"
Description: """
- See **National genomic test directory for cancer** (non-CNS v16) on [Genomic Test Directory](https://www.england.nhs.uk/publication/national-genomic-test-directories)
- Includes CNS cancer (and one solid-tumour outlier, Fibrolamellar Hepatocellular
  Carcinoma) from the M* Haematological Oncology/Cancer CNS block that predates the
  digital TP/GT scheme - see `CodeSystem-GenomicTestCode` for detail. Haematological
  Oncology codes from that same block are instead in
  `ValueSet-HaematologicalOncologyTestCodes`, not here.
- All `category = cancer` codes from `EnglandTestCode` (`CodeSystem-GenomicTestCode`), checked/refreshed 2026-09-05.
"""
* ^experimental  = false

* include codes from system $GTD where category = #cancer
