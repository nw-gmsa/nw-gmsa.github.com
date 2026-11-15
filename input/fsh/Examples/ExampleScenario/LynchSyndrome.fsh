Instance: LynchSyndrome
InstanceOf: ExampleScenario
Title:       "Lynch Syndrome"
Description: """
Germline testing for inherited mismatch repair (MMR) deficiency (Lynch syndrome, clinical indication R210.2), as a closed-loop order and report between a Trust and the North West GLH, with the report then sent to a central repository as a FHIR Document.

The Laboratory Report carries its results as `Observation`s (the variant, its diagnostic implication and the genomic study) and the report as a PDF. The FHIR Document includes every `Observation` from the Laboratory Report, together with the tumour immunohistochemistry result from histopathology. Finally the Order Placer refers the family to clinical genetics (`OMG^O19`) so other members of the family can be tested. Intended as an end-to-end test of the order, report, document and referral.
"""
Usage: #definition

* status = #draft
* name = "LynchSyndrome"

* insert ActorEntity(placer, "Order Placer - Manchester University NHS FT", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The requesting clinician at Manchester University NHS Foundation Trust (R0A) ]])
* insert ActorEntity(glh, "Order Filler - North West GLH", [[ [Order Filler](ActorDefinition-OrderFiller.html). The North West GLH (699X0), which tests, interprets and reports ]])
* insert ActorEntity(ugr, "Central Repository - UGR", [[ NHS England Unified Genomic Record. A central repository of genomic reports for each patient ]])
* insert ActorEntity(referral, "Referral service - eRS or Genomics England", [[ The NHS e-Referral Service (eRS) or a Genomics England Limited application, which carries the referral to clinical genetics ]])
* insert ActorEntity(clingen, "Clinical Genetics - Manchester Centre for Genomic Medicine", [[ The clinical genetics service that receives the referral and sees the family ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ LAB-1 order for R210.2 Inherited MMR deficiency (Lynch syndrome), with the blood sample, the patient's colorectal cancer, and a copy of the pathology report (tumour MMR immunohistochemistry) as `ServiceRequest.supportingInfo` ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-LynchSyndrome, [[ Laboratory Order for Ned Liverpool ]])
* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html), `basedOn` the Laboratory Order by its Order Placer Number. Its results are the [Variant](StructureDefinition-Variant.html), [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) and [Genomic Study Panel](StructureDefinition-GenomicStudyPanel.html) `Observation`s, and the report is also a PDF (`presentedForm` and a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchSyndrome, [[ Laboratory Report for Ned Liverpool ]])
* insert Instance_Empty(Document, Bundle, "Laboratory Report - FHIR Document", [[ The Laboratory Report as a [FHIR Document](StructureDefinition-Composition-GenomicReport.html). It includes every `Observation` from the R01 Laboratory Report, and the tumour immunohistochemistry result ]])
* insert InstanceVersion(1, "HL7 FHIR Document", FHIRDocumentGeneticReportBundle2, [[ FHIR Document for Ned Liverpool ]])
* insert Instance_Empty(Referral, Bundle, "Referral to clinical genetics", [[ Clinical referral (`OMG^O19`) of the family to clinical genetics, for cascade testing. The subject is the family, a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html) of Ned Liverpool and his son, and the testing done is referenced as supporting information: the Genomic Report document held on the central registry (a `DocumentReference`) ]])
* insert InstanceVersion(1, "HL7 FHIR Message O19", GenomicsReferralMessage-LynchSyndrome, [[ Referral of the Liverpool family to the Manchester Centre for Genomic Medicine ]])

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

* process[+]
  * title = "4. Referral to clinical genetics (O19)"
  * description = "The Laboratory Report shows a pathogenic germline variant, so the Order Placer refers the family to clinical genetics for genetic counselling and cascade testing of other members of the family, via eRS or a Genomics England Limited application. The subject of the referral is the family."
  * insert ProcessCreateEvent(4, "Send referral", placer, referral, Referral, 1, [[ See [Genetic Clinical Referral](StructureDefinition-GeneticClinicalReferral.html) ]])
  * insert ProcessCreateEvent(5, "Route referral", referral, clingen, Referral, 1, [[ ]])
