Profile:        LaboratoryReport
Parent:         DiagnosticReport
Id:             LaboratoryReport
Title:          "Laboratory Report"
Description:    """
`Diagnostic - Laboratory Report (LAB-3, LAB-36)`

A clinically validated report, sent by the Order Filler to the Order Placer (IHE LTW LAB-3), or by a Subcontractor to the Requestor for a sub-order (IHE ILW LAB-36). It MAY be based on [Test Results](StructureDefinition-TestResults.html) (LAB-5) or a Subcontractor's Laboratory Report (LAB-36), which are linked using the `supportingInfo` extension.
"""

* basedOn 1..*
* basedOn ^short = "The Laboratory Order (`order` or `reflex-order`, LAB-3) or the sub-order (`filler-order`, LAB-36) this report is for"

* status ^short = "`final` (or `amended`/`corrected`) once clinically validated. `preliminary` only for an interim report"

* resultsInterpreter 1..*
* resultsInterpreter ^short = "The clinical scientist who authorised the report"

* conclusionCode MS
* conclusionCode ^short = "The report outcome"
* conclusion MS
* presentedForm ^short = "The narrative report (e.g. PDF)"

* extension[supportingInfoR5] MS
* extension[supportingInfoR5] ^short = "Test Results (LAB-5) or a Subcontractor's Laboratory Report (LAB-36) this report is based on, referenced by identifier"
