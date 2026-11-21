Instance: LynchSyndrome
InstanceOf: ExampleScenario
Title:       "Lynch Syndrome"
Description: """
Lynch syndrome (LS) is a condition that runs in families and increases the risk of some cancers, mainly bowel (colon and rectal), womb (endometrial) and ovarian cancer. It is caused by an inherited variant in the MLH1, MSH2, MSH6 or PMS2 gene (less often EPCAM).

As [Macmillan Cancer Support describes](https://www.macmillan.org.uk/cancer-information-and-support/worried-about-cancer/causes-and-risk-factors/lynch-syndrome-ls), when someone is diagnosed with bowel or womb cancer, tests are first done on a sample of the cancer cells - immunohistochemistry (IHC) or microsatellite instability (MSI) testing. If these suggest the cancer may be linked to an inherited gene variant, a blood sample is tested for the gene variants that cause Lynch syndrome. This is **diagnostic testing**, and it is the part this guide covers. It starts in pathology: when the tumour IHC shows loss of MLH1, the pathology laboratory reflexes a test for **MLH1 promoter hypermethylation** to the North West GLH, which tells a change found only in the tumour from a possible inherited cause - see [Pathology to Genomics Reflex](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md). If it is not found, the clinician orders germline testing between the Trust and the North West GLH, with a copy of the pathology report. If a variant is found, other members of the family may be offered a genetic test for the same variant (**predictive testing**), through a genetics clinic.

In this example a colonoscopy biopsy shows that Ned Liverpool has bowel (caecal) cancer, and tumour IHC shows loss of MLH1 and PMS2. The Manchester Royal Infirmary laboratory (690S0) orders M1.5 MLH1 promoter hypermethylation from the North West GLH as a reflex order (LAB-35), sending the pathology report, its discrete results and its tumour assessment of the block as prior results. Hypermethylation is not found (LAB-36). The pathology laboratory reports to the clinician, including the genomic result, and the North West GLH also sends the Trust a copy of its report (an unsolicited LAB-3). The clinician then orders R210.2 germline testing. The reflex order and report are converted from the original HL7 v2 OML^O21 and ORU^R01 messages in the [Testing](https://github.com/nw-gmsa/Testing/tree/main/Input/Scenarios/LynchSyndrome) repository, which are linked from each step. The germline Laboratory Report carries the report as a PDF, and is sent to the central repository as a FHIR Document with the discrete results (the variant, its diagnostic implication and the genomic study). Before the FHIR Document is built, the RIE looks up the discrete results in the FHIR Repository and adds them to the Laboratory Report - see [Measurable Residual Disease (MRD) Monitoring](ExampleScenario-MRDMonitoring.html) for this enhancement. Finally the Order Placer refers the family to clinical genetics (`OMG^O19`) for genetic counselling and predictive testing. Intended as an end-to-end test of the order, report, document and referral. See [Suspected Lynch Syndrome - Clinical Workflow](ExampleScenario-ClinicalAndGenomicWorkflow.html) for the clinician's view.
"""
Usage: #definition

* status = #draft
* name = "LynchSyndrome"

* insert ActorEntity(placer, "Order Placer - Manchester University NHS FT", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The requesting clinician at Manchester University NHS Foundation Trust (R0A) ]])
* insert ActorEntity(pathology, "Order Filler and Requestor - Manchester Royal Infirmary laboratory", [[ [Order Filler](ActorDefinition-OrderFiller.html) for the pathology order and [Requestor](ActorDefinition-Requestor.html) for the genomic reflex order. The pathology laboratory (690S0) and its LIMS ]])
* insert ActorEntity(rie, "Regional Integration Engine", [[ [Intermediary](ActorDefinition-Intermediary.html) that routes the messages ]])
* insert ActorEntity(glh, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0), which tests, interprets and reports ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])
* insert ActorEntity(scr, "Regional Shared Care Record", [[ The regional shared care record, for example the Greater Manchester Care Record (GMCR), which receives the report PDF and makes it available to other care settings, including the patient's GP. See [Regional Shared Care Records](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/RegionalSharedCareRecords.md) ]])
* insert ActorEntity(referral, "Referral service - eRS or Genomics England", [[ The NHS e-Referral Service (eRS) or a Genomics England Limited application, which carries the referral to clinical genetics ]])
* insert ActorEntity(clingen, "Clinical Genetics - Manchester Centre for Genomic Medicine", [[ The clinical genetics service that receives the referral and sees the family ]])

* insert Instance_Empty(PathologyOrder, ServiceRequest, "Pathology Order", [[ LAB-1 histopathology order for the colonoscopy biopsy, from Manchester University NHS Foundation Trust (R0A) to the Manchester Royal Infirmary laboratory (690S0). Shown as the ServiceRequest; the pathology order interface is not part of this guide ]])
* insert InstanceVersion(1, "ServiceRequest", ServiceRequest-LynchReflex-OriginalOrder, [[ Histopathology order for Ned Liverpool ]])
* insert Instance_Empty(PathologyReport, DiagnosticReport, "Pathology Report - supplementary", [[ LAB-3 pathology report to the Order Placer, issued again (status appended) once the reflex result is back, so the MLH1 promoter hypermethylation result is in its narrative and results ]])
* insert InstanceVersion(1, "DiagnosticReport", DiagnosticReport-LynchReflex-Histopathology-Supplementary, [[ Supplementary histopathology report for Ned Liverpool ]])
* insert Instance_Empty(ReflexReportCopy, Bundle, "Genomic Report - copy to the original Order Placer", [[ The North West GLH's LAB-36 report, copied directly to Manchester University NHS Foundation Trust. An unsolicited LAB-3: R0A did not place the reflex order, so it matches the report by the patient and the pathology order ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchReflex-Copy, [[ Genomic Report (MLH1 promoter hypermethylation) for Ned Liverpool - copy to R0A ]])
* insert Instance_Empty(ReflexOrder, Bundle, "Genomic Reflex Order", [[ LAB-35 order for M1.5 Colorectal Carcinoma, MLH1 promoter hypermethylation, from the pathology laboratory, with the original pathology report (PDF, primary site, the LOINC 77753-2 Tumor morphology panel and the MMR immunohistochemistry) and the tumour assessment of block A1 as prior results ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-LynchReflex, [[ Genomic Reflex Order for Ned Liverpool ]])
* insert Instance_Empty(ReflexReport, Bundle, "Genomic Report - reflex", [[ LAB-36 [Laboratory Report](StructureDefinition-LaboratoryReport.html) for the reflex order: the report as a PDF, with MLH1 promoter hypermethylation not detected as a discrete result ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchReflex, [[ Genomic Report (MLH1 promoter hypermethylation) for Ned Liverpool ]])
* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R210.2 Inherited MMR deficiency (Lynch syndrome), for diagnostic testing, with the blood sample, the reason (bowel cancer), and a copy of the pathology report (tumour IHC) as `ServiceRequest.supportingInfo` ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-LynchSyndrome, [[ Laboratory Order for Ned Liverpool ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. It carries the report as a PDF (`presentedForm`, a `DocumentReference` and a `Binary`), not the discrete results ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchSyndrome, [[ Laboratory Report for Ned Liverpool ]])
* insert Instance_Empty(ReportDocument, Bundle, "Laboratory Report document", [[ HL7 v2 `MDM^T02` with the Laboratory Report as a PDF, base64 encoded in OBX-5 (`ED`), sent to the regional shared care record. See [Sharing Laboratory Reports (Document)](HIE.html#sharing-laboratory-reports-document-iti-105-and-mdm_t02) In FHIR this is a T02 FHIR Message ([Document and Document Notification](MessageDefinition-original-document.html)) carrying a `DocumentReference` and the PDF as a `Binary` - see the [example](Bundle-OriginalDocumentMessage.html). ]])
* insert InstanceVersion(1, "HL7 FHIR Message T02", DocumentMessage-LynchSyndrome, [[ Laboratory Report PDF for Ned Liverpool ]])
* insert Instance_Empty(Document, Bundle, "Laboratory Report - FHIR Document", [[ The Laboratory Report as a [FHIR Document](StructureDefinition-Composition-GenomicReport.html). The Laboratory Report with its discrete results, the [Variant](StructureDefinition-Variant.html), [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) and [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html) `Observation`s looked up in the FHIR Repository, and the tumour immunohistochemistry result ]])
* insert InstanceVersion(1, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle2, [[ FHIR Document for Ned Liverpool ]])
* insert Instance_Empty(Referral, Bundle, "Referral to clinical genetics", [[ Clinical referral (`OMG^O19`) of the family to clinical genetics, for genetic counselling and predictive testing. The subject is the family, a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html) of Ned Liverpool and his son, and the testing done is referenced as supporting information: the Genomic Report document held on the central registry (a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message O19", GenomicsReferralMessage-LynchSyndrome, [[ Referral of the Liverpool family to the Manchester Centre for Genomic Medicine ]])

* process[+]
  * title = "1. Pathology Order (LAB-1)"
  * description = "A colonoscopy finds a mass in the caecum. The clinician at Manchester University NHS Foundation Trust sends the biopsy to the Manchester Royal Infirmary laboratory with a histopathology order."
  * insert ProcessCreateEvent(1, "Send Pathology Order", placer, pathology, PathologyOrder, 1, [[ IHE LTW LAB-1, between the Trust and its pathology laboratory - not part of this guide ]])

* process[+]
  * title = "2. Pathology to Genomics Reflex (LAB-35, LAB-36)"
  * description = "Histopathology reports adenocarcinoma on the colonoscopy biopsy, and MMR immunohistochemistry shows loss of MLH1 and PMS2. The pathologist selects block A1, estimates its tumour cell content, and orders MLH1 promoter hypermethylation from the North West GLH as a reflex order - no clinician request is needed. The North West GLH reports that hypermethylation is not found, so Lynch syndrome is still possible."
  * insert ProcessCreateEvent(2, "Send Genomic Reflex Order O21", pathology, rie, ReflexOrder, 1, [[ The original pathology report is a prior result, keeping the original order and the clinician and Trust that placed it. HL7 v2: [OML^O21](https://github.com/nw-gmsa/Testing/blob/main/Input/Scenarios/LynchSyndrome/V2/O21/02-690S0-OML_O21.txt) ]])
  * insert ProcessCreateEvent(3, "Send Genomic Reflex Order O21", rie, glh, ReflexOrder, 1, [[ ]])
  * insert ProcessCreateEvent(4, "Send Genomic Report R01", glh, rie, ReflexReport, 1, [[ HL7 v2: [ORU^R01](https://github.com/nw-gmsa/Testing/blob/main/Input/Scenarios/LynchSyndrome/V2/R01/04-699X0-ORU_R01.txt) ]])
  * insert ProcessCreateEvent(5, "Send Genomic Report R01", rie, pathology, ReflexReport, 1, [[ LAB-36, back to the pathology laboratory that placed the reflex order ]])

* process[+]
  * title = "3. Pathology Report (LAB-3)"
  * description = "The pathology laboratory reports to the clinician who ordered the biopsy. Its first report (adenocarcinoma, loss of MLH1 and PMS2) may already have gone back; here it is issued again as a supplementary report once the reflex result is back, so the genomic result is in its narrative. The North West GLH also sends a copy of its report directly to the Trust - an unsolicited report for R0A, which did not place the reflex order."
  * insert ProcessCreateEvent(6, "Send Pathology Report", pathology, placer, PathologyReport, 1, [[ IHE LTW LAB-3, between the pathology laboratory and the Trust - not part of this guide ]])
  * insert ProcessCreateEvent(7, "Send copy of Genomic Report R01", glh, placer, ReflexReportCopy, 1, [[ An unsolicited LAB-3: R0A matches it by the patient and the pathology order (the reflex order's parent), not by an order number of its own. See [Who receives the genomic report?](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/PathologyToGenomicsReflex.md#who-receives-the-genomic-report) ]])

* process[+]
  * title = "4. Laboratory Order (LAB-1)"
  * description = "Tumour IHC suggests the bowel cancer may be linked to an inherited gene variant, and MLH1 promoter hypermethylation was not found, so the clinician orders R210.2 diagnostic testing on a blood sample. The order goes to the North West GLH through the RIE."
  * insert ProcessCreateEvent(8, "Send Laboratory Order", placer, glh, Order, 1, [[ See [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) ]])

* process[+]
  * title = "5. Laboratory Report (LAB-3)"
  * description = "The North West GLH tests and interprets, and sends the Laboratory Report, with the report PDF, to the requesting clinician. The report PDF is also sent to the regional shared care record, where the patient's GP can see it."
  * insert ProcessCreateEvent(9, "Send Laboratory Report", glh, placer, Report, 1, [[ See [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) ]])
  * insert ProcessCreateEvent(10, "Send Laboratory Report document", glh, scr, ReportDocument, 1, [[ HL7 v2 `MDM^T02` or a T02 FHIR Message with the report as a PDF, which the patient's GP can see in the shared care record ]])

* process[+]
  * title = "6. Send to the central repository"
  * description = "The Laboratory Report is sent to the central repository as a FHIR Document, through the RIE. The R01 Laboratory Report triggers a lookup of its discrete results in the FHIR Repository, which are added to the Laboratory Report in the document."
  * insert ProcessCreateEvent(11, "Send FHIR Document", glh, ugr, Document, 1, [[ ]])

* process[+]
  * title = "7. Referral to clinical genetics (O19)"
  * description = "The Laboratory Report shows a pathogenic germline variant, so the Order Placer refers the family to clinical genetics for genetic counselling and predictive testing of other members of the family for the same variant, via eRS or a Genomics England Limited application. The subject of the referral is the family."
  * insert ProcessCreateEvent(12, "Send referral", placer, referral, Referral, 1, [[ See [Genetic Clinical Referral](StructureDefinition-GeneticClinicalReferral.html) ]])
  * insert ProcessCreateEvent(13, "Route referral", referral, clingen, Referral, 1, [[ ]])
