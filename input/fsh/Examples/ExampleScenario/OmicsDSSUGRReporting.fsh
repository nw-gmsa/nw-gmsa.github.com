Instance: OmicsDSSUGRReporting
InstanceOf: ExampleScenario
Title:       "OMICS DSS and UGR Reporting"
Description: """
A genomic test order is fulfilled by two laboratory systems in the same laboratory. Lab 1 places a work order with Lab 2, which uses a Decision Support System (DSS) to produce the test results. Lab 1 writes the narrative Laboratory Report, and the RIE combines that report with the test results into a FHIR Document for a central registry, such as the NHS England Unified Genomic Record (UGR).

There are two `DiagnosticReport`s: the test results from Lab 2 (LAB-5) and the narrative Laboratory Report from Lab 1 (LAB-3). The Laboratory Report links to the test results using the `supportingInfo` extension.
"""
Usage: #definition

* status = #draft
* name = "OmicsDSSUGRReporting"

* insert ActorEntity(placer, "Order Placer/Electronic Patient Record", [[ [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(lab1, "Lab 1 - Order Filler LIMS", [[ [Order Filler](ActorDefinition-OrderFiller.html) that receives the Laboratory Order and writes the Laboratory Report ]])
* insert ActorEntity(lab2, "Lab 2 - Automation Manager LIMS", [[ [Automation Manager](ActorDefinition-AutomationManager.html) that performs the work order and uses the DSS to produce the test results ]])
* insert ActorEntity(dss, "Decision Support System", [[ [Genomic Analysis and Interpretation](ActorDefinition-GenomicAnalysisAndInterpretation.html) that produces the variants ]])
* insert ActorEntity(rie, "Regional Integration Engine", [[ [Intermediary](ActorDefinition-Intermediary.html) that routes messages and builds the FHIR Document ]])
* insert ActorEntity(repo, "FHIR Repository", [[ [Resource Access Provider](ActorDefinition-ResourceAccessProvider.html) that stores copies of the messages the RIE routes using [$process-message](OperationDefinition-ProcessMessage.html) ]])
* insert ActorEntity(ugr, "Central Registry", [[ For example the NHS England Unified Genomic Record ]])

* insert Instance_Empty(Request1, Bundle, "HL7 FHIR Message O21 - Laboratory Order", [[ LAB-1 Laboratory Order ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-ctDNA, [[ ctDNA Laboratory Order for test M4.14 ]])

* insert Instance_Empty(Request2, ServiceRequest, "Work Order", [[ LAB-4 work order with `intent` = `instance-order`. `performer` is the Lab 2 system referenced by identifier ]])
* insert InstanceVersion(2, "Work Order", ServiceRequest-ctDNA-DLIMS-WorkOrder, [[ Work order for the DSS analysis ]])

* insert Instance_Empty(Request3, ServiceRequest, "Processing request", [[ Internal to Lab 2 ]])
* insert InstanceVersion(3, "Processing request", ServiceRequest-ctDNA-OmicsDSS-WorkOrder, [[ Request for the DSS to process the data ]])

* insert Instance_Empty(Request4, Bundle, "HL7 FHIR Message R01 - Test Results", [[ LAB-5 test results. The `DiagnosticReport` and `Observation`s are `preliminary` and `basedOn` the work order. `Observation.device` identifies the DSS ]])
* insert InstanceVersion(4, "HL7 FHIR Message R01 - Test Results", TestResultsMessage-ctDNA-OmicsDSS, [[ Test Results with one EGFR variant ]])

* insert Instance_Empty(Request5, Bundle, "HL7 FHIR Message R01 - Laboratory Report", [[ LAB-3 narrative Laboratory Report. The `DiagnosticReport` is `final` and has no `result`. It links to the test results using the `supportingInfo` extension ]])
* insert InstanceVersion(5, "HL7 FHIR Message R01 - Laboratory Report", ReportMessage-ctDNA-iGene-NarrativeReport, [[ Narrative Laboratory Report ]])

* insert Instance_Empty(Request6, Binary, "Search FHIR Repository", [[ Retrieve the Laboratory Report by its identifier. Then retrieve the test results it links to with `GET [base]/DiagnosticReport?identifier=[system]|[value]&_include=DiagnosticReport:result` ]])
* insert Instance_Empty(Reply6, Bundle, "Search results", [[ The Laboratory Report and the test results with their `Observation`s ]])

* insert Instance_Empty(Request7, Bundle, "HL7 FHIR Document - Genomic Report", [[ The Laboratory Report merged with the test results: its `result` lists the test results `Observation`s ]])
* insert InstanceVersion(7, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle-ctDNA-OmicsDSS, [[ Laboratory Report merged with the Test Results ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The Order Placer sends the Laboratory Order to Lab 1."
  * insert ProcessCreateEvent(1, "Send Laboratory Order O21", placer, lab1, Request1, , [[ Routed by the RIE. See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "2. Work Order (LAB-4)"
  * description = "Lab 1 places a work order with Lab 2. Lab 2 sends the data to the DSS for processing."
  * insert ProcessCreateEvent(2, "Send Work Order", lab1, lab2, Request2, , [[ Lab 2 can find its work orders by searching on `ServiceRequest.performer` with the `:identifier` modifier ]])
  * insert ProcessCreateEvent(3, "Request DSS processing", lab2, dss, Request3, , [[ Internal to Lab 2 and not exchanged regionally ]])

* process[+]
  * title = "3. Test Results (LAB-5)"
  * description = "Lab 2 returns the test results to Lab 1. The RIE also sends a copy to the FHIR Repository."
  * insert ProcessCreateEvent(4, "Send Test Results R01", lab2, rie, Request4, , [[ ]])
  * insert ProcessCreateEvent(5, "Send Test Results R01", rie, lab1, Request4, , [[ ]])
  * insert ProcessCreateEvent(6, "Send copy of Test Results using $process-message", rie, repo, Request4, , [[ The FHIR Repository stores the test results so they can be combined with the Laboratory Report in step 5 ]])

* process[+]
  * title = "4. Laboratory Report (LAB-3)"
  * description = "Lab 1 clinically validates the test results and writes the narrative Laboratory Report, which is sent to the Order Placer. The RIE also sends a copy to the FHIR Repository."
  * insert ProcessCreateEvent(7, "Send Laboratory Report R01", lab1, rie, Request5, , [[ ]])
  * insert ProcessCreateEvent(8, "Send Laboratory Report R01", rie, placer, Request5, , [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])
  * insert ProcessCreateEvent(9, "Send copy of Laboratory Report using $process-message", rie, repo, Request5, , [[ ]])

* process[+]
  * title = "5. FHIR Document to Central Registry"
  * description = "The RIE retrieves the Laboratory Report and the test results it links to from the FHIR Repository. It merges them by adding the test results Observations to the Laboratory Report result, builds a FHIR Document and sends it to the central registry."
  * insert ProcessSearch(10, "Retrieve Laboratory Report and Test Results", rie, repo, Request6, Reply6, [[ ]])
  * insert ProcessCreateEvent(11, "Send FHIR Document", rie, ugr, Request7, , [[ The Result summary section contains the merged Laboratory Report. The Results section contains the `Observation`s. The test results are also in the Results from other laboratories section ]])
