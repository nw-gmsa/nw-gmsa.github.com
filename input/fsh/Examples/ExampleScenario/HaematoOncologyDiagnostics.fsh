Instance: HaematoOncologyDiagnostics
InstanceOf: ExampleScenario
Title:       "Suspected Blood Cancer - Haemato-Oncology Diagnostics"
Description: """
Blood cancers, such as leukaemia, follow a different diagnostic route from solid tumours: there is usually no imaging-guided biopsy, and the sample is blood or bone marrow. A single referral for a suspected blood cancer goes to haemato-oncology diagnostics, which coordinates the specialist tests. Here these are a cytogenetic assessment (karyotype), and then, where indicated by the cytogenetic findings, molecular genomic testing. The cytogenetic and genomic results identify the subtype of the blood cancer and guide treatment, and are brought together in one combined report to the requesting clinician.

The referring clinician places one order. Haemato-oncology diagnostics then places reflex sub-orders (LAB-35) with the cytogenetics laboratory and with the Genomic Laboratory Hub, as described in [Inter-Laboratory Workflow - Reflex Order](ILW.html#reflex-order). The decision to place the molecular genomic sub-order is made by haemato-oncology diagnostics, not by the referring clinician. The order is coded with the karyotype test (M80.3), as the order must carry a National Genomic Test Directory code.

In this example Hodor Tameside has suspected acute myeloid leukaemia (AML), and a bone marrow aspirate is sent. The karyotype shows trisomy 8 and a deletion of 7q, so a multi-target NGS panel (M80.2) is requested, which finds a pathogenic somatic TP53 variant. The reports carry their results as `Observation`s, and the combined report is also a PDF.

This is an illustrative future-state example. See [Haemato-Oncology Diagnostic Pathway](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HaematoOncologyPathway.md) for the use case, including which steps are electronic today.
"""
Usage: #definition

* status = #draft
* name = "HaematoOncologyDiagnostics"

* insert ActorEntity(placer, "Order Placer - Tameside and Glossop Integrated Care NHS FT", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The consultant haematologist who refers the suspected blood cancer ]])
* insert ActorEntity(hod, "Haemato-Oncology Diagnostics - Manchester University NHS FT", [[ [Order Filler](ActorDefinition-OrderFiller.html) of the Laboratory Order and [Requestor](ActorDefinition-Requestor.html) of the reflex sub-orders. Coordinates the specialist tests and writes the combined report ]])
* insert ActorEntity(cyto, "Cytogenetics Laboratory", [[ [Subcontractor](ActorDefinition-Subcontractor.html). Performs the karyotype and returns its own interpretive report ]])
* insert ActorEntity(glh, "Genomic Laboratory Hub - North West GLH", [[ [Subcontractor](ActorDefinition-Subcontractor.html). Performs the molecular genomic testing ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for a suspected blood cancer, with the bone marrow sample ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-HaematoOncology, [[ Laboratory Order for Hodor Tameside ]])
* insert Instance_Empty(CytoOrder, Bundle, "Sub-order - cytogenetics", [[ LAB-35 reflex sub-order for the karyotype (M80.3), `intent` = `filler-order` and `basedOn` the Laboratory Order ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsSubOrderMessage-HaematoOncology-Cytogenetics, [[ Cytogenetics reflex sub-order ]])
* insert Instance_Empty(CytoReport, Bundle, "Sub-order report - cytogenetics", [[ LAB-36 [Laboratory Report](StructureDefinition-LaboratoryReport.html) with the karyotype in ISCN as an `Observation` (LOINC 62356-1) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsSubOrderReportMessage-HaematoOncology-Cytogenetics, [[ Cytogenetic report ]])
* insert Instance_Empty(MolOrder, Bundle, "Sub-order - molecular genomic", [[ LAB-35 reflex sub-order for the AML multi-target NGS panel (M80.2), placed because of the cytogenetic findings ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsSubOrderMessage-HaematoOncology-Molecular, [[ Molecular genomic reflex sub-order ]])
* insert Instance_Empty(MolReport, Bundle, "Sub-order report - molecular genomic", [[ LAB-36 [Laboratory Report](StructureDefinition-LaboratoryReport.html) with the [Variant](StructureDefinition-Variant.html) and [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) `Observation`s ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsSubOrderReportMessage-HaematoOncology-Molecular, [[ Molecular genomic report ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report - combined", [[ LAB-3 combined [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number, with the karyotype, variant and diagnostic implication as results and the report as a PDF ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-HaematoOncology, [[ Combined haemato-oncology report ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The consultant haematologist refers a suspected blood cancer with a single order, and a bone marrow sample is sent."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", placer, hod, Order, 1, [[ ]])

* process[+]
  * title = "2. Cytogenetic assessment (LAB-35 and LAB-36)"
  * description = "Haemato-oncology diagnostics places a reflex sub-order for the karyotype with the cytogenetics laboratory, which returns its report."
  * insert ProcessCreateEvent(2, "Send cytogenetics sub-order", hod, cyto, CytoOrder, 1, [[ ]])
  * insert ProcessCreateEvent(3, "Send cytogenetic report", cyto, hod, CytoReport, 1, [[ ]])

* process[+]
  * title = "3. Molecular genomic testing, if indicated (LAB-35 and LAB-36)"
  * description = "Based on the cytogenetic findings, haemato-oncology diagnostics places a reflex sub-order for molecular genomic testing with the Genomic Laboratory Hub, which returns its report."
  * insert ProcessCreateEvent(4, "Send molecular genomic sub-order", hod, glh, MolOrder, 1, [[ ]])
  * insert ProcessCreateEvent(5, "Send molecular genomic report", glh, hod, MolReport, 1, [[ ]])

* process[+]
  * title = "4. Combined Laboratory Report (LAB-3)"
  * description = "Haemato-oncology diagnostics brings the cytogenetic and molecular genomic results together into one report to the requesting clinician. The haematology MDT then confirms the diagnosis and plans treatment (not covered by this guide)."
  * insert ProcessCreateEvent(6, "Send combined Laboratory Report", hod, placer, Report, 1, [[ ]])
