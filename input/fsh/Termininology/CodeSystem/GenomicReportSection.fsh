CodeSystem: GenomicReportSection
Id: GenomicReportSection
Title: "Genomic Report Section"
Description: """
Section codes for the [Composition Genomic Report](StructureDefinition-Composition-GenomicReport.html) where no LOINC document section code was found. Draft - see [Document Layout](StructureDefinition-Composition-GenomicReport.html#document-layout).
"""

* ^name = "GenomicReportSection"
* ^content = #complete
* ^caseSensitive = true
* ^experimental = true
* ^status = #draft
* ^version = "0.0.1"
* ^date = "2026-11-04"
* ^url = "https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicReportSection"

* #interpretation "Interpretation" "The clinical scientist's interpretation of the results, including diagnostic and therapeutic implications"
* #other-laboratory-results "Results from other laboratories" "Results from other laboratories (for example tumour immunohistochemistry or histopathology) that the interpretation of the genomic results depends on"
* #methodology "Methodology and limitations" "The genes or regions studied, the technology used, coverage, and the limitations of the test"
