CodeSystem: Chimerism
Id: Chimerism
Title: "CodeSystem for Chimerism Testing (OBX-3 local codes)"
Description: """
Local OBX-3 sub-identifier codes used by the Clatterbridge chimerism testing
payload - see [Histocompatibility and Immunogenetics - Chimerism Testing Result
Panel (Future?)](HistocompatibilityAndImmunogenetics.html#chimerism-testing-result-panel-future).
"""

* ^name = "Chimerism"
* ^content = #fragment
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^version = "0.1.0"
* ^date = "2026-08-30"

* #STR "Average % chimerism"
* #IM "Informative Markers"
* #RANGE "Range"
* #CV "CV"
* #EXT "Extraction Method"
* #PURE "% Purity"
* #POST "Time post transplant"
* #DTP "Date of transplant"
* #DID "Donor ID"
