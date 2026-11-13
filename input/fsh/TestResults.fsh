Profile:        TestResults
Parent:         DiagnosticReport
Id:             TestResults
Title:          "Test Results"
Description:    """
`Diagnostic - Test Results (LAB-5)`

Test results returned by an Automation Manager to the Order Filler for a work order (IHE LTW LAB-5). The results have not been clinically validated: the Order Filler does that and writes the [Laboratory Report](StructureDefinition-LaboratoryReport.html) (LAB-3).
"""

* basedOn 1..*
* basedOn ^short = "The work order (`ServiceRequest.intent` = `instance-order`) these results are for"

* status ^short = "SHOULD be `preliminary`: the results have not yet been clinically validated by the Order Filler"

* result 1..* MS
* result ^short = "The test results (Observations). Each SHOULD identify the system that produced it in `Observation.device`"

* resultsInterpreter 0..0
* resultsInterpreter ^short = "Not used: test results are not clinically interpreted. See Laboratory Report"
* conclusion 0..0
* conclusion ^short = "Not used: test results are not clinically interpreted. See Laboratory Report"
* conclusionCode 0..0
* conclusionCode ^short = "Not used: test results are not clinically interpreted. See Laboratory Report"
