<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

Test results returned by an Automation Manager to the Order Filler for a work order ([LAB-5](LTW.html#test-results-management-lab-5)). The Order Filler clinically validates them and writes the [Laboratory Report](StructureDefinition-LaboratoryReport.html) (LAB-3).

- `basedOn` is the work order (`ServiceRequest.intent` = `instance-order`), normally referenced by identifier.
- `status` SHOULD be `preliminary`.
- `result` holds the test results. Each `Observation` SHOULD identify the system that produced it in `Observation.device`, referenced by identifier as a [Laboratory Information System](StructureDefinition-LaboratoryInformationSystem.html).
- `resultsInterpreter`, `conclusion` and `conclusionCode` are not used.

See [Test Results or Laboratory Report](StructureDefinition-DiagnosticReport.html#test-results-or-laboratory-report) for how this differs from a Laboratory Report.
