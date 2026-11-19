Instance: PathologyReflexTumourBRCA
InstanceOf: ExampleScenario
Title:       "Pathology to Genomics Reflex - Ovarian Cancer Tumour BRCA"
Description: """
A genomic test ordered by a pathology laboratory on a cancer (somatic) tumour sample. For a tumour test the pathologist selects the most appropriate formalin-fixed paraffin-embedded (FFPE) tumour block, assesses its tumour (neoplastic) cell content on an H&E-stained section, and marks up the tumour area for the genomic laboratory. Today this is requested on paper forms, such as the NW GLH [HRD and Tumour BRCA test request form](https://mft.nhs.uk/app/uploads/2021/10/HRD-test-request-form-new.pdf). See [Pathology to Genomics Reflex](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md).

The order is an [IHE ILW](ILW.html) sub-order (LAB-35) from the pathology laboratory to the genomic laboratory. The pathology results are sent with it as **prior results** (`ServiceRequest.supportingInfo`, the HL7 v2 `OML_O21` PRIOR_RESULT group): the original pathology report, which keeps the original pathology order and who placed it, and the pathology laboratory's tumour assessment of the block. The genomic report is likely to be needed by the original order placer as well as the pathology laboratory.

In this example Selyse Burnley had surgery for advanced ovarian cancer at Lancashire Teaching Hospitals (RXN) in March 2025, and the Royal Blackburn Hospital laboratory (690D0) reported high-grade serous carcinoma. When her cancer relapses in 2026, the gynaecological oncologist requests a tumour BRCA test (M2.1). The pathologist selects block A3, estimates its tumour cell content at 60%, and orders the test from the North West GLH (699X0), which finds a pathogenic BRCA1 variant. The FHIR Messages are converted from the HL7 v2 OML^O21 and ORU^R01 in the [Testing](https://github.com/nw-gmsa/Testing/tree/main/Input/PathologyReflex) repository.
"""
Usage: #definition

* status = #draft
* name = "PathologyReflexTumourBRCA"

* insert ActorEntity(placer, "Order Placer - Lancashire Teaching Hospitals", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The gynaecological oncologist who ordered the original pathology test and requests the tumour BRCA test ]])
* insert ActorEntity(pathology, "Order Filler and Requestor - Royal Blackburn Hospital laboratory", [[ [Order Filler](ActorDefinition-OrderFiller.html) for the pathology order and [Requestor](ActorDefinition-Requestor.html) for the genomic reflex order. The pathology laboratory information management system (LIMS) ]])
* insert ActorEntity(rie, "Regional Integration Engine", [[ [Intermediary](ActorDefinition-Intermediary.html) that routes the messages ]])
* insert ActorEntity(glh, "Order Filler and Subcontractor - North West GLH", [[ [Subcontractor](ActorDefinition-Subcontractor.html). The North West GLH (699X0) and its LIMS, which tests and reports ]])

* insert Instance_Empty(OrderReportOnly, Bundle, "Genomic Reflex Order - pathology report only", [[ LAB-35 order for M2.1, with the original pathology report (PDF) as a prior result ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-PathologyReflex-ReportOnly, [[ Genomic Reflex Order for Selyse Burnley - pathology report only ]])
* insert Instance_Empty(Order, Bundle, "Genomic Reflex Order - with discrete pathology results", [[ LAB-35 order for M2.1, with the original pathology report (PDF, primary site and the LOINC 77753-2 Tumor morphology panel) and the tumour assessment of block A3 as prior results ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-PathologyReflex, [[ Genomic Reflex Order for Selyse Burnley - with discrete pathology results ]])
* insert Instance_Empty(Report, Bundle, "Genomic Report - PDF only", [[ LAB-36 [Laboratory Report](StructureDefinition-LaboratoryReport.html) for the reflex order, with the report as a PDF - the current capability ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-PathologyReflex, [[ Genomic Report for Selyse Burnley - PDF only ]])
* insert Instance_Empty(EnhancedReport, Bundle, "Genomic Report - enhanced", [[ LAB-36 Laboratory Report enhanced with the discrete results - the BRCA1 variant and its classification ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-PathologyReflex-Enhanced, [[ Genomic Report for Selyse Burnley - enhanced ]])

* process[+]
  * title = "1. Genomic Reflex Order (LAB-35)"
  * description = "The gynaecological oncologist asks the pathology laboratory holding the blocks for a tumour BRCA test. The pathologist selects block A3, rings the tumour area on the H&E guide slide, estimates the tumour cell content, and orders the test from the North West GLH. The sections and the marked H&E slide are sent separately. Two versions of the order are shown: the pathology report only, and with the discrete pathology results."
  * insert ProcessCreateEvent(1, "Send Genomic Reflex Order O21 - pathology report only", pathology, rie, OrderReportOnly, 1, [[ The original pathology report is a prior result, keeping the original order and the clinician and Trust that placed it ]])
  * insert ProcessCreateEvent(2, "Send Genomic Reflex Order O21 - with discrete pathology results", pathology, rie, Order, 1, [[ As step 1, with the primary site, the Tumor morphology panel and the tumour assessment of block A3 ]])
  * insert ProcessCreateEvent(3, "Send Genomic Reflex Order O21", rie, glh, Order, 1, [[ ]])

* process[+]
  * title = "2. Genomic Report (LAB-36)"
  * description = "The North West GLH macrodissects the ringed tumour area, runs the panel, and reports a pathogenic BRCA1 variant to the pathology laboratory. Two versions of the report are shown: the PDF only (the current capability), and the enhanced report with the discrete results. The report is also likely to be needed by the original order placer."
  * insert ProcessCreateEvent(4, "Send Genomic Report R01 - PDF only", glh, rie, Report, 1, [[ ]])
  * insert ProcessCreateEvent(5, "Send Genomic Report R01 - enhanced", glh, rie, EnhancedReport, 1, [[ ]])
  * insert ProcessCreateEvent(6, "Send Genomic Report R01", rie, pathology, EnhancedReport, 1, [[ Whether the report is also sent to the original order placer (Lancashire Teaching Hospitals) is an open question ]])
