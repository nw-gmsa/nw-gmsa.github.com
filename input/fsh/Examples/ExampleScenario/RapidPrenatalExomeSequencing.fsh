Instance: RapidPrenatalExomeSequencing
InstanceOf: ExampleScenario
Title:       "Rapid Prenatal Exome Sequencing"
Description: """
Rapid prenatal exome sequencing for fetal anomalies with a likely genetic cause (clinical indication R21). Only two Genomic Laboratory Hubs (GLHs) in England are testing GLHs for this test. The other GLHs, including the North West, act as home GLHs: they do the first-line tests, prepare the trio's DNA and send a sub-order to a testing GLH.

This is the one inter-GLH flow with published evidence. The time pressure is what makes it important: a pregnancy can't wait, and each hand-off adds days. The published turnaround from the sample arriving at the testing GLH is about 15 days, and about a quarter of referrals were not accepted by the testing GLH, so a declined sub-order is a realistic path too. Today the sub-order is probably made with forms and sample transport; the NHS England Genomic Order Management Service (GOMS) is shown here as the route for it.

For testing, the testing GLH is assumed to be North Thames GLH (hosted by Great Ormond Street Hospital, GOSH). The North West GLH and North Thames GLH are both onboarded to GOMS for testing. Which testing GLH the North West GLH uses in live service is to be confirmed.
"""
Usage: #definition

* status = #draft
* name = "RapidPrenatalExomeSequencing"

* insert ActorEntity(fmu, "Fetal Medicine Unit - Manchester University NHS FT", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The fetal medicine unit at St Mary's Hospital, Manchester University NHS Foundation Trust (R0A), that finds the fetal anomaly on scan. A multidisciplinary team of fetal medicine and clinical genetics agrees the case is eligible ]])
* insert ActorEntity(homeglh, "Home GLH - North West", [[ [Order Filler](ActorDefinition-OrderFiller.html) of the Laboratory Order and [Requestor](ActorDefinition-Requestor.html) of the sub-order. Does the first-line tests and prepares the trio's DNA ]])
* insert ActorEntity(goms, "Genomic Order Management Service", [[ NHS England GOMS. An [Intermediary](ActorDefinition-Intermediary.html) that routes the sub-order and its status and results between the GLHs ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])
* insert ActorEntity(testglh, "Testing GLH - North Thames", [[ [Subcontractor](ActorDefinition-Subcontractor.html). North Thames GLH, one of the two national testing GLHs for rapid prenatal exome sequencing. Sequences, interprets and reports ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R21. The fetus is the subject, with the mother linked to the fetus. Samples for the fetus and both parents are sent to the home GLH ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-RPX, [[ Laboratory Order for Fetus Wigan, with the trio's samples ]])
* insert Instance_Empty(FirstLine, Binary, "First-line tests", [[ QF-PCR aneuploidy screen (R21.1) and chromosomal microarray (R21.3), then cell culture where needed and DNA extraction for the trio. Internal to the home GLH ]])
* insert Instance_Empty(EarlyReport, Bundle, "Laboratory Report - first-line result", [[ LAB-3 report when QF-PCR or microarray finds the cause, so exome sequencing does not go ahead ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-RPX-FirstLine, [[ QF-PCR finds the cause ]])
* insert Instance_Empty(SubOrder, Bundle, "Sub-order", [[ LAB-35 sub-order with the trio's DNA. `intent` = `filler-order` and `basedOn` the Laboratory Order. The requester (home GLH) and performer (testing GLH) organisations differ ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsSubOrderMessage-RPX, [[ Sub-order to North Thames GLH with the trio's DNA ]])
* insert Instance_Empty(Accept, Bundle, "Sub-order accepted", [[ Order status: the testing GLH accepts the sub-order. In FHIR a `Task` with `status` = `accepted`; in HL7 v2 OSU^O51 ]])
* insert InstanceVersion(1, "HL7 FHIR Message O51", GenomicOrderStatusMessage-RPX-Accepted, [[ North Thames GLH accepts the sub-order ]])
* insert Instance_Empty(Decline, Bundle, "Sub-order declined", [[ Order status: the testing GLH declines the sub-order, for example because it does not meet the eligibility criteria. In FHIR a `Task` with `status` = `rejected` and a `statusReason` ]])
* insert InstanceVersion(1, "HL7 FHIR Message O51", GenomicOrderStatusMessage-RPX-Declined, [[ North Thames GLH declines the sub-order ]])
* insert Instance_Empty(SubOrderReport, Bundle, "Sub-order Laboratory Report", [[ LAB-36 [Laboratory Report](StructureDefinition-LaboratoryReport.html) from the testing GLH, `basedOn` the sub-order ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsSubOrderReportMessage-RPX, [[ North Thames GLH's report, based on the sub-order ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html) to the requesting clinician, `basedOn` the Laboratory Order. It may include the testing GLH's report ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-RPX, [[ The North West GLH's report, based on the Laboratory Order ]])
* insert Instance_Empty(ReportDocument, Binary, "Laboratory Report document", [[ HL7 v2 `MDM^T02` with the Laboratory Report as a PDF, base64 encoded in OBX-5 (`ED`). A FHIR Document may replace the PDF later ]])
* insert Instance_Empty(Cancel, Bundle, "Order status - not tested", [[ The home GLH tells the requesting clinician the exome sequencing was not done ]])
* insert InstanceVersion(1, "HL7 FHIR Message O51", GenomicOrderStatusMessage-RPX-NotTested, [[ Rapid prenatal exome sequencing not done ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The fetal medicine unit finds a fetal anomaly on scan. Once the multidisciplinary team agrees the case is eligible, the R21 order goes to the Trust's own GLH."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", fmu, homeglh, Order, 1, [[ Routed by the RIE. See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "2. First-line tests at the home GLH"
  * description = "The home GLH does QF-PCR and chromosomal microarray first. Exome sequencing only goes ahead if both are negative. It does any cell culture and extracts DNA for the trio."
  * insert ProcessCreateEvent(2, "Perform first-line tests", homeglh, homeglh, FirstLine, , [[ Internal to the home GLH ]])

* process[+]
  * title = "2a. Alternative: cause found by first-line tests"
  * description = "If QF-PCR or microarray finds the cause, the home GLH reports it and no sub-order is sent."
  * insert ProcessCreateEvent(3, "Send Laboratory Report", homeglh, fmu, EarlyReport, 1, [[ ]])

* process[+]
  * title = "3. Sub-order to the testing GLH (LAB-35)"
  * description = "The home GLH sends the sub-order through GOMS and the trio's DNA by sample transport. The sub-order points back to the Laboratory Order, and its requester and performer organisations differ."
  * insert ProcessCreateEvent(4, "Send sub-order", homeglh, goms, SubOrder, 1, [[ ]])
  * insert ProcessCreateEvent(5, "Route sub-order", goms, testglh, SubOrder, 1, [[ ]])

* process[+]
  * title = "4. Sub-order accepted"
  * description = "The testing GLH accepts the sub-order. The turnaround of about 15 days is counted from when the sample arrives at the testing GLH."
  * insert ProcessCreateEvent(6, "Send order status - accepted", testglh, goms, Accept, 1, [[ ]])
  * insert ProcessCreateEvent(7, "Route order status", goms, homeglh, Accept, 1, [[ ]])

* process[+]
  * title = "4a. Alternative: sub-order declined"
  * description = "About a quarter of referrals were not accepted by the testing GLH. The home GLH tells the requesting clinician, who may need to decide what to do next quickly."
  * insert ProcessCreateEvent(8, "Send order status - declined", testglh, goms, Decline, 1, [[ With the reason in `Task.statusReason` ]])
  * insert ProcessCreateEvent(9, "Route order status", goms, homeglh, Decline, 1, [[ ]])
  * insert ProcessCreateEvent(10, "Tell the requesting clinician", homeglh, fmu, Cancel, 1, [[ ]])

* process[+]
  * title = "5. Sub-order results (LAB-36)"
  * description = "The testing GLH sequences, interprets and reports, and the report goes back to the home GLH through GOMS."
  * insert ProcessCreateEvent(11, "Send sub-order Laboratory Report", testglh, goms, SubOrderReport, 1, [[ ]])
  * insert ProcessCreateEvent(12, "Route sub-order Laboratory Report", goms, homeglh, SubOrderReport, 1, [[ ]])

* process[+]
  * title = "6. Laboratory Report (LAB-3)"
  * description = "The home GLH sends the result to the requesting clinician at the Trust."
  * insert ProcessCreateEvent(13, "Send Laboratory Report", homeglh, fmu, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])

* process[+]
  * title = "7. Send to the central repository"
  * description = "The home GLH's Laboratory Report is sent to the NHS England Unified Genomic Record (UGR) through the RIE."
  * insert ProcessCreateEvent(14, "Send Laboratory Report document", homeglh, ugr, ReportDocument, , [[ HL7 v2 `MDM^T02` with the report as a PDF ]])
