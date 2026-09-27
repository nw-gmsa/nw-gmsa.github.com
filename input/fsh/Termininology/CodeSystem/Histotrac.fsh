CodeSystem: Histotrac
Id: Histotrac
Title: "Histotrac Test Codes"
Description: """
Local order-detail codes from **Histotrac**, the Histocompatibility and
Immunogenetics LIMS - see [Histocompatibility and
Immunogenetics](HistocompatibilityAndImmunogenetics.html), [HLA Tests -
Transplant Ask At Order Entry](Questionnaire-HLATestsTransplantAskAtOrderEntry.html)
and [Chimerism Test Additional Ask At Order Entry
Questions](Questionnaire-ChimerismTestAdditionalAskAtOrderQuestions.html).

Unlike the Test Code carried in OBR-4/`ServiceRequest.code` (a `$DGTS` Genomic/Genetic
Test (GT) code, or a local [NWTestCode](CodeSystem-NWTestCode.html) code for test
families with no national code), these concepts model the **Patient Test(s)**
order-detail restatement seen in the live Histotrac `ORM^O01`/`OML^O21` orders - the
value Histotrac itself carries alongside the Test Code to say which specific
lineage/panel or transplant test was ordered. Bound to `ServiceRequest.orderDetail`
via [HistotracOrderDetail](ValueSet-HistotracOrderDetail.html) - see
[GenomicTestCodes](ValueSet-GenomicTestCodes.html) for the separate `ServiceRequest.code`
binding these relate to via the `relatedTestCode` property below.

Sourced as HL7 v2 CE (coded element)-style `code^text^codingSystem` strings from the
`HISTOTRACEAP` coding system - see each concept's worked example
([HLA Tests - Transplant](HistocompatibilityAndImmunogenetics.html#hla-tests-transplant-ask-at-order-entry),
[Chimerism Testing](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry)).
These are distinct from the local `NWGMSA` answer options (e.g. `HLAAntibodyScreening`,
`ChimerismPeripheralBlood`) used on the Ask At Order Entry Questionnaires' own
order-entry choice items - those model the order-entry UI selection, these are what
Histotrac itself calls the resulting order.
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

* ^property[+].code = #relatedTestCode
* ^property[=].uri = "https://fhir.nwgenomics.nhs.uk/CodeSystem/Histotrac#relatedTestCode"
* ^property[=].description = "The Test Code (OBR-4 / ServiceRequest.code) this order-detail concept is ordered under - a $DGTS Genomic/Genetic Test (GT) code, or a local NWTestCode code"
* ^property[=].type = #code

* #C1-Post-PB "Chimerism Peripheral Blood (PB)"
  * ^property[+].code = #category
  * ^property[=].valueCode = #chimerism
  * ^property[+].code = #relatedTestCode
  * ^property[=].valueCode = #GT1368
* #C2-Post-CD3 "Chimerism CD3"
  * ^property[+].code = #category
  * ^property[=].valueCode = #chimerism
  * ^property[+].code = #relatedTestCode
  * ^property[=].valueCode = #GT1368
* #C3-Post-CD15 "Chimerism CD15"
  * ^property[+].code = #category
  * ^property[=].valueCode = #chimerism
  * ^property[+].code = #relatedTestCode
  * ^property[=].valueCode = #GT1368
* #C5-Post-BM "Chimerism Bone Marrow (BM)"
  * ^property[+].code = #category
  * ^property[=].valueCode = #chimerism
  * ^property[+].code = #relatedTestCode
  * ^property[=].valueCode = #GT1368
* #XTRANSPX_HLAAS "HLA ANTIBODY SCREENING (TRANSPLANT)"
  * ^property[+].code = #category
  * ^property[=].valueCode = #histocompatibility-immunogenetics
  * ^property[+].code = #relatedTestCode
  * ^property[=].valueCode = #XTRANSPX_HLAAS
