CodeSystem: Histotrac
Id: Histotrac
Title: "Histotrac Test Codes"
Description: """
Local test-order codes from **Histotrac**, the Histocompatibility and
Immunogenetics LIMS - see [Histocompatibility and
Immunogenetics](HistocompatibilityAndImmunogenetics.html), [HLA Tests -
Transplant Ask At Order Entry](Questionnaire-HLATestsTransplantAskAtOrderEntry.html)
and [Chimerism Testing Blood (PB) Ask At Order
Entry](Questionnaire-ChimerismTestingAskAtOrderEntry.html). Sourced as HL7
v2 CE (coded element)-style `code^text^codingSystem` strings, both from the
`HISTOTRACEAP` coding system:

- `XTRANSPX_HLAAS^HLA ANTIBODY SCREENING^HISTOTRACEAP`
- `CHIMBTP^CHIMERISM TESTING - PERFORMABLE^HISTOTRACEAP`

These are the raw LIMS test-order codes, distinct from the local `NWGMSA`
answer options (e.g. `HLAAntibodyScreening`, `ChimerismPeripheralBlood`)
used on the Ask At Order Entry Questionnaires' own order-entry choice
items - those model the order-entry UI selection, these are what Histotrac
itself calls the resulting order.
"""

* ^name = "Histotrac"
* ^content = #fragment
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^version = "0.1.0"
* ^date = "2026-09-04"

* ^property[+].code = #category
* ^property[=].uri = "https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory#category"
* ^property[=].description = "Which part of the National Genomic Test Directory this code belongs to - reuses the same category values as CodeSystem-GenomicTestCode/CodeSystem-DigitalGenomicTestServices, plus histocompatibility-immunogenetics for codes outside that scheme"
* ^property[=].type = #code

* #XTRANSPX_HLAAS "HLA ANTIBODY SCREENING"
  * ^property[+].code = #category
  * ^property[=].valueCode = #histocompatibility-immunogenetics
* #CHIMBTP "CHIMERISM TESTING - PERFORMABLE"
  * ^property[+].code = #category
  * ^property[=].valueCode = #chimerism
