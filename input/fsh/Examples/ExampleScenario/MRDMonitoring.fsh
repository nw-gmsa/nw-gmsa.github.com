Instance: MRDMonitoring
InstanceOf: ExampleScenario
Title:       "Measurable Residual Disease (MRD) Monitoring - BCR-ABL1"
Description: """
Measurable residual disease (MRD) monitoring measures the small amount of leukaemia that can remain during and after treatment, below the level that can be seen under the microscope. Regular MRD results show whether the treatment is working and give an early warning of relapse. In this scenario the MRD result is BCR-ABL1.

Patients with chronic myeloid leukaemia (CML), and some with Philadelphia-positive acute lymphoblastic leukaemia, have the BCR-ABL1 fusion gene. During treatment (for example with a tyrosine kinase inhibitor) the amount of BCR-ABL1 transcript in the blood is measured regularly to check the response to treatment and to spot relapse early. The result is a ratio of BCR-ABL1 to a control gene (ABL1), expressed on the **International Scale (IS)**, so results from different laboratories can be compared against the treatment milestones (for example major molecular response, BCR-ABL1 IS of 0.1% or less).

The result is a measurement, not a variant or genotype, so it follows the ordinary laboratory result pattern: a [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html) `Observation` coded with LOINC 69380-4, carried in a [Laboratory Report](StructureDefinition-LaboratoryReport.html). The order is coded with the National Genomic Test Directory test M84.2 (Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR). The test is run on an automated PCR analyser; the analyser's own assay readings (BCR-ABL1 and ABL1 detection, cycle threshold (Ct), end point and delta Ct) are kept as `Observation.component`s, and the analyser is referenced in `Observation.device`. The analyser's local codes are kept alongside the LOINC codes: LOINC 69380-4 with the analyser's code for the result, and LOINC 42714-6 (BCR-ABL1 fusion transcript presence) on the BCR-ABL1 detection component.

In this example Rob Leeds, on treatment for CML at Leeds Teaching Hospitals NHS Trust, has a routine monitoring blood sample sent to the North West GLH. The laboratory information management system (LIMS) sends a work order to the analyser, the analyser returns the result as an HL7 v2 ORU^R32 (shown here converted to a FHIR Message), a clinical scientist checks and authorises it, and the report is sent back to the requesting haematology team through the NW Genomics RIE.

The Laboratory Report (LAB-3) from the LIMS carries the report as a PDF (`DocumentReference` and `Binary`), not discrete results. The RIE stores a copy of the test results in the FHIR Repository as they pass through it. When the Laboratory Report arrives, the RIE looks up the discrete results in the FHIR Repository - the test results are `basedOn` the work order, whose number is also the Laboratory Report identifier - and sends Leeds Teaching Hospitals an enhanced R01 Laboratory Report with the discrete results. This shows that an HL7 v2 ORU^R01 can carry discrete results as well as the report PDF; the same lookup is used to add the discrete results to a FHIR Document.
"""
Usage: #definition

* status = #draft
* name = "MRDMonitoring"

* insert ActorEntity(placer, "Order Placer - Leeds Teaching Hospitals", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The haematology team at Leeds Teaching Hospitals NHS Trust (RR8) caring for the patient, ordering from the hospital EPR ]])
* insert ActorEntity(lab, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0) and its laboratory information management system (LIMS), which receives the order, authorises and reports the result ]])
* insert ActorEntity(analyser, "Automation Manager - PCR Analyser", [[ The automated real-time PCR analyser that measures BCR-ABL1 and ABL1 transcripts in the sample ]])
* insert ActorEntity(rie, "Regional Integration Engine", [[ [Intermediary](ActorDefinition-Intermediary.html) that routes messages and enhances the Laboratory Report with the discrete results ]])
* insert ActorEntity(repo, "FHIR Repository", [[ [Resource Access Provider](ActorDefinition-ResourceAccessProvider.html) that stores copies of the messages the RIE routes ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for M84.2 BCR-ABL1 MRD monitoring on a peripheral blood sample, from Leeds Teaching Hospitals NHS Trust ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-BCRABL, [[ Laboratory Order for Rob Leeds ]])
* insert Instance_Empty(WorkOrder, ServiceRequest, "Work Order", [[ LAB-4 work order with `intent` = `instance-order`, `basedOn` the Laboratory Order by its Order Placer Number. `performer` is the analyser, referenced by identifier as a [Laboratory Information System](StructureDefinition-LaboratoryInformationSystem.html) ]])
* insert InstanceVersion(1, "Work Order", ServiceRequest-BCRABL-Cepheid-WorkOrder, [[ Work order for M84.2 BCR-ABL1 RT-qPCR ]])
* insert Instance_Empty(TestResults, Bundle, "HL7 FHIR Message R32 - Test Results", [[ LAB-5 [Test Results](StructureDefinition-TestResults.html), converted from the analyser's HL7 v2 ORU^R32. The `DiagnosticReport` and `Observation` are `preliminary` and `basedOn` the work order; `Observation.device` identifies the analyser. `Observation.code` is LOINC 69380-4 and the BCR-ABL1 detection component is also coded with LOINC 42714-6 ]])
* insert InstanceVersion(1, "HL7 FHIR Message R32", TestResultsMessage-BCRABL-Cepheid, [[ BCR-ABL1 test results ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number, with the report as a PDF (`presentedForm`, a `DocumentReference` and a `Binary`) and no discrete results ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-BCRABL, [[ Laboratory Report for Rob Leeds ]])
* insert Instance_Empty(Search, Binary, "Search FHIR Repository", [[ Retrieve the discrete results by the Laboratory Report identifier, which is the work order number the test results are based on: `GET [base]/Observation?based-on:identifier=https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier|T26-61BC` ]])
* insert Instance_Empty(SearchResults, Bundle, "Search results", [[ The BCR-ABL1 test result `Observation` ]])
* insert Instance_Empty(EnhancedReport, Bundle, "Laboratory Report - enhanced with discrete results", [[ The LAB-3 Laboratory Report with the discrete results from the FHIR Repository added to `DiagnosticReport.result` and to the message, alongside the report PDF. The result is `final`, as the Laboratory Report authorises it, and `basedOn` the Laboratory Order ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-BCRABL-Enhanced, [[ Laboratory Report with discrete results for Rob Leeds ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The haematology team at Leeds Teaching Hospitals orders M84.2 BCR-ABL1 MRD monitoring on a peripheral blood sample. The order goes from the EPR through the NW Genomics RIE to the North West GLH LIMS."
  * insert ProcessCreateEvent(1, "Send Laboratory Order O21", placer, rie, Order, 1, [[ See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])
  * insert ProcessCreateEvent(2, "Send Laboratory Order O21", rie, lab, Order, 1, [[ ]])

* process[+]
  * title = "2. Work Order (LAB-4)"
  * description = "The LIMS places a work order with the PCR analyser. The analyser finds its work orders by querying for the sample when it is loaded."
  * insert ProcessCreateEvent(3, "Send Work Order", lab, analyser, WorkOrder, 1, [[ The analyser can find its work orders by searching on `ServiceRequest.performer` with the `:identifier` modifier ]])

* process[+]
  * title = "3. Test Results (LAB-5)"
  * description = "The analyser runs the sample and sends the BCR-ABL1 result (International Scale ratio and assay readings) as an R32 message, identifying itself as the device that produced it. The RIE routes it to the LIMS and stores a copy in the FHIR Repository."
  * insert ProcessCreateEvent(4, "Send Test Results R32", analyser, rie, TestResults, 1, [[ ]])
  * insert ProcessCreateEvent(5, "Send Test Results R32", rie, lab, TestResults, 1, [[ ]])
  * insert ProcessCreateEvent(6, "Send copy of Test Results using $process-message", rie, repo, TestResults, 1, [[ The FHIR Repository stores the discrete results so they can be added to the Laboratory Report in step 5 ]])

* process[+]
  * title = "4. Laboratory Report (LAB-3)"
  * description = "A clinical scientist checks the result against the previous results and treatment milestones and authorises it. The LIMS sends the Laboratory Report, with the report as a PDF, to the RIE."
  * insert ProcessCreateEvent(7, "Send Laboratory Report R01", lab, rie, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])

* process[+]
  * title = "5. Enhance the Laboratory Report with the discrete results"
  * description = "The RIE looks up the discrete results for the Laboratory Report in the FHIR Repository, adds them to the Laboratory Report and sends the enhanced R01 to the haematology team at Leeds Teaching Hospitals."
  * insert ProcessSearch(8, "Retrieve discrete results", rie, repo, Search, SearchResults, [[ ]])
  * insert ProcessCreateEvent(9, "Send enhanced Laboratory Report R01", rie, placer, EnhancedReport, 1, [[ The R01 carries the report PDF and the discrete results ]])
