Instance: ChimerismMonitoring
InstanceOf: ExampleScenario
Title:       "Chimerism Monitoring After a Stem Cell Transplant"
Description: """
After an allogeneic haematopoietic stem cell transplant (HSCT) the patient's blood is made by the donor's stem cells. **Chimerism testing** measures how much of the patient's blood (or bone marrow) comes from the donor and how much from the recipient, at set points after the transplant or when relapse or graft failure is suspected. Full donor chimerism shows the graft has taken; falling donor chimerism (mixed chimerism) can be an early sign of relapse or graft failure. The test compares short tandem repeat (STR) markers that differ between donor and recipient (the informative markers, found from their DNA profiles before the transplant). It is done by the Histocompatibility and Immunogenetics (H&I) laboratory. See [Histocompatibility and Immunogenetics](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HistocompatibilityAndImmunogenetics.md).

The result is a measurement - the percentage of recipient (or donor) cells - not a variant or genotype, so the report follows the ordinary laboratory result pattern: a [Laboratory Report](StructureDefinition-LaboratoryReport.html) with [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html) `Observation`s coded with LOINC, as in the [Chimerism Testing Result Panel](Questionnaire-ChimerismResultPanel.html). H&I tests are not in the National Genomic Test Directory, so the test is coded with the Digital Genomic Test Services code GT1368 "Chimerism by STR Testing - Post Stem Cell Transplant".

In this example Ned Liverpool had a stem cell transplant on 10 January 2024. Thirty-one months later The Clatterbridge Cancer Centre orders chimerism testing on a peripheral blood sample, and the H&I laboratory (Histotrac) reports 0% recipient-derived cells - full donor chimerism. The FHIR Messages are converted from the HL7 v2 [OML^O21](https://github.com/nw-gmsa/Testing/blob/main/Input/Chimerism/Clatterbridge-REN-OML_O21.txt) and [ORU^R01](https://github.com/nw-gmsa/Testing/blob/main/Input/Chimerism/Clatterbridge-REN-ORU_R01.txt) in the Testing repository. Both go through the Clatterbridge TIE and the NW Genomics RIE.
"""
Usage: #definition

* status = #draft
* name = "ChimerismMonitoring"

* insert ActorEntity(placer, "Order Placer - The Clatterbridge Cancer Centre", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The haematologist at The Clatterbridge Cancer Centre NHS Foundation Trust (REN), ordering from the Meditech EPR ]])
* insert ActorEntity(lab, "Order Filler - Histotrac H&I laboratory", [[ [Order Filler](ActorDefinition-OrderFiller.html). The Histocompatibility and Immunogenetics laboratory (Histotrac), Manchester University NHS Foundation Trust (R0A), which tests and reports ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for GT1368 Chimerism by STR Testing - Post Stem Cell Transplant (LOINC 112449-4, without cell selection), on a peripheral blood sample ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-Chimerism, [[ Laboratory Order for Ned Liverpool ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. Its results are [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html) `Observation`s - recipient-derived cells (%), informative STR markers, cell type, months since transplant and date of transplant - and the report is also a PDF (`presentedForm` and a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-Chimerism, [[ Laboratory Report for Ned Liverpool ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "Thirty-one months after his stem cell transplant, the haematologist at The Clatterbridge Cancer Centre orders chimerism testing on a peripheral blood sample. The order goes from Meditech through the Clatterbridge TIE and the NW Genomics RIE to Histotrac."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", placer, lab, Order, 1, [[ See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "2. Laboratory Report (LAB-3)"
  * description = "The H&I laboratory analyses the sample by STR and reports 0% recipient-derived cells (full donor chimerism), with the informative markers, time since transplant and the report PDF, back through the RIE to Clatterbridge."
  * insert ProcessCreateEvent(2, "Send Laboratory Report", lab, placer, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])
