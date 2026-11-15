Instance: LynchSyndrome
InstanceOf: ExampleScenario
Title:       "Lynch Syndrome"
Description: """
Lynch syndrome (LS) is a condition that runs in families and increases the risk of some cancers, mainly bowel (colon and rectal), womb (endometrial) and ovarian cancer. It is caused by an inherited variant in the MLH1, MSH2, MSH6 or PMS2 gene (less often EPCAM).

As [Macmillan Cancer Support describes](https://www.macmillan.org.uk/cancer-information-and-support/worried-about-cancer/causes-and-risk-factors/lynch-syndrome-ls), when someone is diagnosed with bowel or womb cancer, tests are first done on a sample of the cancer cells - immunohistochemistry (IHC) or microsatellite instability (MSI) testing. If these suggest the cancer may be linked to an inherited gene variant, a blood sample is tested for the gene variants that cause Lynch syndrome. This is **diagnostic testing**, and it is the part this guide covers: the genomic test order and report between the Trust and the North West GLH. The tests on the cancer cells are done by histopathology; here a copy of the pathology report is sent with the order. If a variant is found, other members of the family may be offered a genetic test for the same variant (**predictive testing**), through a genetics clinic.

In this example Ned Liverpool has bowel (colon) cancer, and tumour IHC shows loss of MLH1 and PMS2. The Laboratory Report carries its results as `Observation`s (the variant, its diagnostic implication and the genomic study) and the report as a PDF, and is sent to the central repository as a FHIR Document that includes every `Observation` from the Laboratory Report. Finally the Order Placer refers the family to clinical genetics (`OMG^O19`) for genetic counselling and predictive testing. Intended as an end-to-end test of the order, report, document and referral. See [Suspected Lynch Syndrome - Clinical Workflow](ExampleScenario-ClinicalAndGenomicWorkflow.html) for the clinician's view.
"""
Usage: #definition

* status = #draft
* name = "LynchSyndrome"

* insert ActorEntity(placer, "Order Placer - Manchester University NHS FT", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The requesting clinician at Manchester University NHS Foundation Trust (R0A) ]])
* insert ActorEntity(glh, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0), which tests, interprets and reports ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])
* insert ActorEntity(referral, "Referral service - eRS or Genomics England", [[ The NHS e-Referral Service (eRS) or a Genomics England Limited application, which carries the referral to clinical genetics ]])
* insert ActorEntity(clingen, "Clinical Genetics - Manchester Centre for Genomic Medicine", [[ The clinical genetics service that receives the referral and sees the family ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R210.2 Inherited MMR deficiency (Lynch syndrome), for diagnostic testing, with the blood sample, the reason (bowel cancer), and a copy of the pathology report (tumour IHC) as `ServiceRequest.supportingInfo` ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-LynchSyndrome, [[ Laboratory Order for Ned Liverpool ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. Its results are the [Variant](StructureDefinition-Variant.html), [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) and [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html) `Observation`s, and the report is also a PDF (`presentedForm` and a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchSyndrome, [[ Laboratory Report for Ned Liverpool ]])
* insert Instance_Empty(Document, Bundle, "Laboratory Report - FHIR Document", [[ The Laboratory Report as a [FHIR Document](StructureDefinition-Composition-GenomicReport.html). It includes every `Observation` from the R01 Laboratory Report, and the tumour immunohistochemistry result ]])
* insert InstanceVersion(1, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle2, [[ FHIR Document for Ned Liverpool ]])
* insert Instance_Empty(Referral, Bundle, "Referral to clinical genetics", [[ Clinical referral (`OMG^O19`) of the family to clinical genetics, for genetic counselling and predictive testing. The subject is the family, a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html) of Ned Liverpool and his son, and the testing done is referenced as supporting information: the Genomic Report document held on the central registry (a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message O19", GenomicsReferralMessage-LynchSyndrome, [[ Referral of the Liverpool family to the Manchester Centre for Genomic Medicine ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "Tumour IHC suggests the bowel cancer may be linked to an inherited gene variant, so the clinician orders R210.2 diagnostic testing on a blood sample. The order goes to the North West GLH through the RIE."
  * insert ProcessCreateEvent(1, "Send Laboratory Order", placer, glh, Order, 1, [[ See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "2. Laboratory Report (LAB-3)"
  * description = "The North West GLH tests and interprets, and sends the Laboratory Report, with its results and the report PDF, to the requesting clinician."
  * insert ProcessCreateEvent(2, "Send Laboratory Report", glh, placer, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])

* process[+]
  * title = "3. Send to the central repository"
  * description = "The Laboratory Report is sent to the central repository as a FHIR Document, through the RIE. The document includes every Observation from the R01 Laboratory Report."
  * insert ProcessCreateEvent(3, "Send FHIR Document", glh, ugr, Document, 1, [[ ]])

* process[+]
  * title = "4. Referral to clinical genetics (O19)"
  * description = "The Laboratory Report shows a pathogenic germline variant, so the Order Placer refers the family to clinical genetics for genetic counselling and predictive testing of other members of the family for the same variant, via eRS or a Genomics England Limited application. The subject of the referral is the family."
  * insert ProcessCreateEvent(4, "Send referral", placer, referral, Referral, 1, [[ See [Genetic Clinical Referral](StructureDefinition-GeneticClinicalReferral.html) ]])
  * insert ProcessCreateEvent(5, "Route referral", referral, clingen, Referral, 1, [[ ]])
