<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

This profile holds the rules common to all genomic `DiagnosticReport`s. Use one of the two profiles derived from it, depending on which transaction the report is sent in:

- [Test Results](StructureDefinition-TestResults.html) - results that have not been clinically validated, returned for a work order (LAB-5).
- [Laboratory Report](StructureDefinition-LaboratoryReport.html) - a clinically validated report (LAB-3, LAB-36).

### Test Results or Laboratory Report

The difference is whether the sender clinically validates the results, not which organisation or system sends them.

| | Test Results | Laboratory Report | Laboratory Report |
|---|---|---|---|
| Transaction | [LAB-5](LTW.html#test-results-management-lab-5) | [LAB-3](LTW.html#laboratory-report-lab-3) | [LAB-36](ILW.html#sub-order-results-delivery-lab-36) |
| Sent by | Automation Manager | Order Filler | Subcontractor |
| Sent to | Order Filler | Order Placer | Requestor |
| `basedOn` intent | `instance-order` (work order) | `order` or `reflex-order` | `filler-order` (sub-order) |
| Clinically validated | No - the Order Filler validates and reports on them | Yes | Yes, by the Subcontractor |
| `status` | `preliminary` | `final`, `amended` or `corrected` (`preliminary` for an interim report) | `final`, `amended` or `corrected` |
| `resultsInterpreter`, `conclusion`, `conclusionCode` | Not used | Required (`resultsInterpreter`) | Required (`resultsInterpreter`) |
| `result` | Required | Optional | Optional |
| `Observation.device` | SHOULD identify the system that produced each result | Optional | Optional |
| `supportingInfo` extension | Not used | Links to the Test Results it is based on | Links to the Test Results it is based on |
{:.grid}

A Laboratory Report built from Test Results does not need to repeat them in `result` when it is sent (LAB-3): a narrative Laboratory Report links to the Test Results by identifier using the `supportingInfo` extension. When the RIE builds a FHIR Document, it merges the two:

- the Laboratory Report's `result` lists the Test Results' `Observation`s, and its `supportingInfo` resolves to the Test Results in the document;
- the Composition's Results section holds the `Observation`s, and the Test Results MAY also be placed in the Results from other laboratories section.

See [OMICS DSS and UGR Reporting](ExampleScenario-OmicsDSSUGRReporting.html).

Both profiles are sent in the same [Unsolicited Observation](MessageDefinition-unsolicited-observation.html) (`R01`) FHIR Message.
