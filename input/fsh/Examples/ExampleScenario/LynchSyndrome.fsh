Instance: LynchSyndrome
InstanceOf: ExampleScenario
Title:       "Lynch Syndrome"
Description: """
Germline testing for inherited mismatch repair (MMR) deficiency (Lynch syndrome, clinical indication R210.2), as a closed-loop order and report between a Trust and the North West GLH, with the report then sent to a central repository as a FHIR Document.

The Laboratory Report carries its results as `Observation`s (the variant, its diagnostic implication and the genomic study) and the report as a PDF. The FHIR Document includes every `Observation` from the Laboratory Report, together with the tumour immunohistochemistry result from histopathology. Intended as an end-to-end test of the order, report and document.
"""
Usage: #definition

* status = #draft
* name = "LynchSyndrome"

* insert ActorEntity(placer, "Order Placer - Manchester University NHS FT", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The requesting clinician at Manchester University NHS Foundation Trust (R0A) ]])
* insert ActorEntity(glh, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0), which tests, interprets and reports ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R210.2 Inherited MMR deficiency (Lynch syndrome), with the blood sample and the patient's colorectal cancer ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-LynchSyndrome, [[ Laboratory Order for Ned Liverpool ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. Its results are the [Variant](StructureDefinition-Variant.html), [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) and [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html) `Observation`s, and the report is also a PDF (`presentedForm` and a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchSyndrome, [[ Laboratory Report for Ned Liverpool ]])
* insert Instance_Empty(Document, Bundle, "Laboratory Report - FHIR Document", [[ The Laboratory Report as a [FHIR Document](StructureDefinition-Composition-GenomicReport.html). It includes every `Observation` from the R01 Laboratory Report, and the tumour immunohistochemistry result ]])
* insert InstanceVersion(1, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle2, [[ FHIR Document for Ned Liverpool ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The clinician orders R210.2 testing. The order goes to the North West GLH through the RIE."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", placer, glh, Order, 1, [[ See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "2. Laboratory Report (LAB-3)"
  * description = "The North West GLH tests and interprets, and sends the Laboratory Report, with its results and the report PDF, to the requesting clinician."
  * insert ProcessCreateEvent(2, "Send Laboratory Report", glh, placer, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])

* process[+]
  * title = "3. Send to the central repository"
  * description = "The Laboratory Report is sent to the central repository as a FHIR Document, through the RIE. The document includes every Observation from the R01 Laboratory Report."
  * insert ProcessCreateEvent(3, "Send FHIR Document", glh, ugr, Document, 1, [[ ]])
