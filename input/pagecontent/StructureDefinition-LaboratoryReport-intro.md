<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

A clinically validated report, sent by the Order Filler to the Order Placer ([LAB-3](LTW.html#laboratory-report-lab-3)), or by a Subcontractor to the Requestor for a sub-order ([LAB-36](ILW.html#sub-order-results-delivery-lab-36)).

- `basedOn` is the Laboratory Order (`order` or `reflex-order`) for LAB-3, or the sub-order (`filler-order`) for LAB-36.
- `status` is `final`, `amended` or `corrected` once clinically validated.
- `resultsInterpreter` is the clinical scientist who authorised the report.
- `result` is optional. A narrative report MAY instead link to the [Test Results](StructureDefinition-TestResults.html) (LAB-5) it is based on using the `supportingInfo` extension, referenced by identifier. When the report is merged into a FHIR Document, `result` lists the Test Results' `Observation`s.

See [Test Results or Laboratory Report](StructureDefinition-DiagnosticReport.html#test-results-or-laboratory-report) for how this differs from Test Results.
