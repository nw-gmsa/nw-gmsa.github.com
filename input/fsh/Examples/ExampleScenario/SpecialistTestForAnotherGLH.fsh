Instance: SpecialistTestForAnotherGLH
InstanceOf: ExampleScenario
Title:       "Specialist Test for Another GLH"
Description: """
The reverse of [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html): the North West GLH is the testing GLH. It is a designated national provider for some specialist tests, for example monogenic hearing loss (R67) and retinal disorders (R32), so another region's GLH may send it a sub-order for one of its own patients. For testing, the other region is North Thames: Great Ormond Street Hospital (GOSH) places the order with North Thames GLH, which sends a sub-order to the North West GLH. Both GLHs are onboarded to GOMS for testing.

**Not confirmed:** which tests the North West GLH receives from other GLHs is to be checked with the North West GLH.
"""
Usage: #definition

* status = #draft
* name = "SpecialistTestForAnotherGLH"

* insert ActorEntity(placer, "Order Placer - GOSH", [[ [Order Placer](ActorDefinition-OrderPlacer.html). Great Ormond Street Hospital for Children NHS Foundation Trust, in the North Thames region ]])
* insert ActorEntity(reqglh, "Requesting GLH - North Thames", [[ North Thames GLH. [Order Filler](ActorDefinition-OrderFiller.html) of the Laboratory Order and [Requestor](ActorDefinition-Requestor.html) of the sub-order ]])
* insert ActorEntity(goms, "Genomic Order Management Service", [[ NHS England GOMS. An [Intermediary](ActorDefinition-Intermediary.html) that routes the sub-order and its status and results between the GLHs ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])
* insert ActorEntity(nwglh, "North West GLH", [[ [Subcontractor](ActorDefinition-Subcontractor.html). The national provider for the specialist test ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order to the requesting GLH, for example R67 monogenic hearing loss ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-SPT, [[ Laboratory Order from GOSH for Oliver Camden ]])
* insert Instance_Empty(SubOrder, Bundle, "Sub-order", [[ LAB-35 sub-order. `intent` = `filler-order` and `basedOn` the Laboratory Order. The requester is the requesting GLH and the performer the North West GLH ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsSubOrderMessage-SPT, [[ Sub-order to the North West GLH ]])
* insert Instance_Empty(Accept, Bundle, "Sub-order accepted", [[ Order status: the North West GLH accepts the sub-order ]])
* insert InstanceVersion(1, "HL7 FHIR Message O51", GenomicOrderStatusMessage-SPT-Accepted, [[ The North West GLH accepts the sub-order ]])
* insert Instance_Empty(Decline, Bundle, "Sub-order declined", [[ Order status: the North West GLH declines the sub-order, for example because it does not meet the eligibility criteria ]])
* insert InstanceVersion(1, "HL7 FHIR Message O51", GenomicOrderStatusMessage-SPT-Declined, [[ The North West GLH declines the sub-order ]])
* insert Instance_Empty(LaterDecline, Bundle, "Sub-order declined after acceptance", [[ Order status: the sample turns out to be unsuitable after the sub-order was accepted ]])
* insert InstanceVersion(1, "HL7 FHIR Message O51", GenomicOrderStatusMessage-SPT-LaterDeclined, [[ The North West GLH declines the sub-order after acceptance ]])
* insert Instance_Empty(SubOrderReport, Bundle, "Sub-order Laboratory Report", [[ LAB-36 [Laboratory Report](StructureDefinition-LaboratoryReport.html) from the North West GLH, `basedOn` the sub-order ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsSubOrderReportMessage-SPT, [[ The North West GLH's report, based on the sub-order ]])
* insert Instance_Empty(ReportDocument, Binary, "Laboratory Report document", [[ HL7 v2 `MDM^T02` with the Laboratory Report as a PDF, base64 encoded in OBX-5 (`ED`). A FHIR Document may replace the PDF later ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html) to the requesting clinician ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-SPT, [[ North Thames GLH's report, based on the Laboratory Order ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "GOSH orders the specialist test from its own GLH, North Thames."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", placer, reqglh, Order, 1, [[ ]])

* process[+]
  * title = "2. Sub-order to the North West GLH (LAB-35)"
  * description = "The requesting GLH sends the sub-order through GOMS and the sample by sample transport."
  * insert ProcessCreateEvent(2, "Send sub-order", reqglh, goms, SubOrder, 1, [[ ]])
  * insert ProcessCreateEvent(3, "Route sub-order", goms, nwglh, SubOrder, 1, [[ ]])

* process[+]
  * title = "3. Sub-order accepted"
  * description = "The North West GLH accepts the sub-order."
  * insert ProcessCreateEvent(4, "Send order status - accepted", nwglh, goms, Accept, 1, [[ ]])
  * insert ProcessCreateEvent(5, "Route order status", goms, reqglh, Accept, 1, [[ ]])

* process[+]
  * title = "3a. Alternative: sub-order declined"
  * description = "The North West GLH declines the sub-order, or declines it after acceptance because the sample is unsuitable."
  * insert ProcessCreateEvent(6, "Send order status - declined", nwglh, goms, Decline, 1, [[ ]])
  * insert ProcessCreateEvent(7, "Send order status - declined after acceptance", nwglh, goms, LaterDecline, 1, [[ ]])

* process[+]
  * title = "4. Sub-order results (LAB-36)"
  * description = "The North West GLH tests and reports, and the report goes back to the requesting GLH through GOMS."
  * insert ProcessCreateEvent(8, "Send sub-order Laboratory Report", nwglh, goms, SubOrderReport, 1, [[ ]])
  * insert ProcessCreateEvent(9, "Route sub-order Laboratory Report", goms, reqglh, SubOrderReport, 1, [[ ]])

* process[+]
  * title = "5. Laboratory Report (LAB-3)"
  * description = "The requesting GLH sends the result to the requesting clinician."
  * insert ProcessCreateEvent(10, "Send Laboratory Report", reqglh, placer, Report, 1, [[ ]])

* process[+]
  * title = "6. Send to the central repository"
  * description = "The North West GLH's Laboratory Report is sent to the NHS England Unified Genomic Record (UGR) through the RIE."
  * insert ProcessCreateEvent(11, "Send Laboratory Report document", nwglh, ugr, ReportDocument, , [[ HL7 v2 `MDM^T02` with the report as a PDF ]])
