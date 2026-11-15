Instance: BreastCancer
InstanceOf: ExampleScenario
Title:       "Inherited Breast Cancer (BRCA)"
Description: """
BRCA1 and BRCA2 are genes everyone has. Changes (variants) in a BRCA gene can cause a higher risk of several cancers, including breast, ovarian, prostate and pancreatic cancer. As [Macmillan Cancer Support describes](https://www.macmillan.org.uk/cancer-information-and-support/worried-about-cancer/causes-and-risk-factors/brca-gene), a blood test for a BRCA variant may be offered to someone with breast cancer at an unusually young age, certain types of breast cancer such as triple-negative breast cancer at a young age, certain types of ovarian cancer, a strong family history, or a relative with a BRCA variant. [Someone with triple-negative breast cancer](https://www.macmillan.org.uk/cancer-information-and-support/breast-cancer) may be offered genetic testing even if they have no family history.

The person who has had cancer is tested first - **diagnostic testing**, the part this guide covers: the genomic test order (R208.1 Inherited breast cancer and ovarian cancer) and report between the Trust and the North West GLH. Other testing, such as the oestrogen receptor, progesterone receptor and HER2 tests on the cancer cells, is done by histopathology; here a copy of the pathology report is sent with the order. If a variant is found, relatives can be tested for the same variant (**predictive testing**) through a genetics clinic or family cancer clinic; each child of someone with a BRCA variant has a 1 in 2 chance of inheriting it.

In this example Margaery Congleton has triple-negative breast cancer at 44, with no known family history. The Laboratory Report finds a pathogenic BRCA1 variant, carries its results as `Observation`s and the report as a PDF, and is sent to the central repository as a FHIR Document that includes every `Observation` from the Laboratory Report. The breast surgeon then refers the family to clinical genetics (`OMG^O19`) so her sister can have predictive testing. Intended as an end-to-end test of the order, report, document and referral.
"""
Usage: #definition

* status = #draft
* name = "BreastCancer"

* insert ActorEntity(placer, "Order Placer - East Cheshire NHS Trust", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The breast surgeon at East Cheshire NHS Trust (RJN) ]])
* insert ActorEntity(glh, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0), which tests, interprets and reports ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])
* insert ActorEntity(referral, "Referral service - eRS or Genomics England", [[ The NHS e-Referral Service (eRS) or a Genomics England Limited application, which carries the referral to clinical genetics ]])
* insert ActorEntity(clingen, "Clinical Genetics - Manchester Centre for Genomic Medicine", [[ The clinical genetics service (family cancer clinic) that receives the referral and sees the family ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R208.1 Inherited breast cancer and ovarian cancer (diagnostic testing), with the blood sample, the reasons (R208 and triple-negative breast cancer) and a copy of the pathology report as `ServiceRequest.supportingInfo` ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-BreastCancer, [[ Laboratory Order for Margaery Congleton ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. Its results are the [Variant](StructureDefinition-Variant.html) and [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) `Observation`s, and the report is also a PDF (`presentedForm` and a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-BreastCancer, [[ Laboratory Report for Margaery Congleton ]])
* insert Instance_Empty(Document, Bundle, "Laboratory Report - FHIR Document", [[ The Laboratory Report as a [FHIR Document](StructureDefinition-Composition-GenomicReport.html). It includes every `Observation` from the R01 Laboratory Report, and the pathology report ]])
* insert InstanceVersion(1, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle-BreastCancer, [[ FHIR Document for Margaery Congleton ]])
* insert Instance_Empty(Referral, Bundle, "Referral to clinical genetics", [[ Clinical referral (`OMG^O19`) of the family to clinical genetics, for genetic counselling and predictive testing. The subject is the family, a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html) of Margaery Congleton and her sister, and the testing done is referenced as supporting information: the Genomic Report document held on the central registry (a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message O19", GenomicsReferralMessage-BreastCancer, [[ Referral of the Congleton family to the Manchester Centre for Genomic Medicine ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "Triple-negative breast cancer at a young age, so the breast surgeon offers genetic testing and orders R208.1 diagnostic testing on a blood sample. The order goes to the North West GLH through the RIE."
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
  * description = "A pathogenic BRCA1 variant is found, so the breast surgeon refers the family to clinical genetics for genetic counselling and predictive testing of relatives for the same variant, via eRS or a Genomics England Limited application. The subject of the referral is the family."
  * insert ProcessCreateEvent(4, "Send referral", placer, referral, Referral, 1, [[ See [Genetic Clinical Referral](StructureDefinition-GeneticClinicalReferral.html) ]])
  * insert ProcessCreateEvent(5, "Route referral", referral, clingen, Referral, 1, [[ ]])
