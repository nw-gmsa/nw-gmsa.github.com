Instance: Pharmacogenomics
InstanceOf: ExampleScenario
Title:       "Gene Test Before Starting a Medicine (Pharmacogenomics)"
Description: """
Pharmacogenomic testing before a medicine is started: CYP2C19 genotyping before mavacamten (clinical indication R454.1), as a closed-loop order and report between a Trust and the North West GLH, with the report then sent to a central repository as a FHIR Document.

The Laboratory Report carries its results as `Observation`s (the genotype, haplotype, therapeutic implication and genomic study) and the report as a PDF. The FHIR Document includes every `Observation` from the Laboratory Report. Intended as an end-to-end test of the order, report and document.
"""
Usage: #definition

* status = #draft
* name = "Pharmacogenomics"

* insert ActorEntity(placer, "Order Placer - Liverpool Heart and Chest Hospital", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The requesting cardiologist at Liverpool Heart and Chest Hospital NHS Foundation Trust (RBQ) ]])
* insert ActorEntity(glh, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0), which tests, interprets and reports ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R454.1 CYP2C19 genotyping before mavacamten, with the blood sample ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-Pharmacogenomics, [[ Laboratory Order for Mace Northwich ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. Its results are the [Genotype](StructureDefinition-Genotype.html), [Haplotype](StructureDefinition-Haplotype.html), [Therapeutic Implication](StructureDefinition-TherapeuticImplication.html) and [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html) `Observation`s, and the report is also a PDF (`presentedForm` and a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-Pharmacogenomics, [[ Laboratory Report for Mace Northwich ]])
* insert Instance_Empty(Document, Bundle, "Laboratory Report - FHIR Document", [[ The Laboratory Report as a [FHIR Document](StructureDefinition-Composition-GenomicReport.html), following HL7 Genomics Reporting Pharmacogenomic Reporting. It includes every `Observation` from the R01 Laboratory Report ]])
* insert InstanceVersion(1, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle-Pharmacogenomics, [[ FHIR Document for Mace Northwich ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The cardiologist orders R454.1 CYP2C19 genotyping before starting mavacamten. The order goes to the North West GLH through the RIE."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", placer, glh, Order, 1, [[ See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "2. Laboratory Report (LAB-3)"
  * description = "The North West GLH genotypes CYP2C19 and sends the Laboratory Report, with its results and the report PDF, to the requesting clinician, who uses it to choose the mavacamten dosing."
  * insert ProcessCreateEvent(2, "Send Laboratory Report", glh, placer, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])

* process[+]
  * title = "3. Send to the central repository"
  * description = "The Laboratory Report is sent to the central repository as a FHIR Document, through the RIE. The document includes every Observation from the R01 Laboratory Report."
  * insert ProcessCreateEvent(3, "Send FHIR Document", glh, ugr, Document, 1, [[ ]])
