CodeSystem: NHSEngland-DigitalGenomicTestServices
Id: DigitalGenomicTestServices
Title: "NHS England Digital Genomic Test Services"
Description: """
The **digital** National Genomic Test Directory codes, rolled out as the
Test Directory itself went digital - replacing the legacy R-code/M-code
style codes in [NHS England Genomic Test
Code](CodeSystem-GenomicTestCode.html) (`$GTD`,
`England-GenomicTestDirectory`) for new/migrated indications. Two code
types share this one system, distinguished by prefix:

- **TP (Test Package)** codes replace the old clinical-indication concept -
  a package of related genomic tests grouped by clinical condition. For
  example, 12 separate B-cell lymphoma clinical indications were
  consolidated into a single TP code.
- **GT (Genomic/Genetic Test)** codes identify a single specific laboratory
  investigation (e.g. one BRCA gene test, one WGS test). For example, 17
  separate DPYD test entries were consolidated into a single GT code.

Both code types already appear together in this IG's own [WGS Test Order
Form example](Bundle-WGSTestOrderForm-Example.html) -
`ServiceRequest-WGSTestOrderForm-Example` carries `GT497` "Cystic renal
disease - WGS" on `ServiceRequest.code` and `TP171` "Cystic renal disease"
on `ServiceRequest.reasonCode` - confirming both share this same NHS
England system (`https://fhir.nhs.uk/CodeSystem/England-DigitalGenomicTestServices`)
rather than being modelled as two separate CodeSystems. This CodeSystem
currently carries only those two codes as a starting fragment, not the
complete digital Test Directory.
"""

* ^name = "DigitalGenomicTestServices"
* ^content = #fragment
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^version = "0.1.0"
* ^date = "2026-09-04"
* ^url = "https://fhir.nhs.uk/CodeSystem/England-DigitalGenomicTestServices"

// Test Package (TP) - clinical-indication-level grouping

* #TP171 "Cystic renal disease"

// Genomic/Genetic Test (GT) - specific laboratory investigation

* #GT497 "Cystic renal disease - WGS"
