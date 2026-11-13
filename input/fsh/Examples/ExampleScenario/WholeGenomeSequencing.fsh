Instance: WholeGenomeSequencing
InstanceOf: ExampleScenario
Title:       "Whole Genome Sequencing"
Description: """
Whole Genome Sequencing (WGS) for rare and inherited disease, from an enterprise view. Many of these interactions are national or internal to a laboratory and are not covered by this guide; the steps that are not covered say so.

The clinician's referral is registered with Genomics England (through its Test Order Management System, TOMS), which assigns the NGIS referral and participant identifiers. The Requesting Genomic Laboratory (RGL) is responsible for the referral and the report back to the clinician, so it is the Order Filler of the Laboratory Order. The RGL sub-contracts the sequencing of each participant to a Sequencing Genomic Laboratory (SGL) as a separate sub-order. The sequencing results return to the RGL via Genomics England, which runs the bioinformatics pipeline, and the RGL interprets them and reports to the clinician.

Although Genomics England's Test Order Management System (TOMS), CIP-API and Interpretation Portal are not FHIR, the data that goes into them can be illustrated with this guide's FHIR resources: the CIP-API referral (`REFERRAL`) is the original order `ServiceRequest`, the pedigree (`PEDIGREE`) is the [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html), each pedigree member (`PEDIGREE_MEMBER`) is a `Patient` with a `FamilyMemberHistory` for their relationship to the Proband, each referral test (`REFERRAL_TEST`) is a participant's sub-order `ServiceRequest`, and each germline sample (`GERMLINE_SAMPLE`) is a `Specimen`.
"""
Usage: #definition

* status = #draft
* name = "WholeGenomeSequencing"

* insert ActorEntity(placer, "Order Placer - NHS Trust", [[ [Order Placer](ActorDefinition-OrderPlacer.html). The referring clinician or Test Ordering Entity ]])
* insert ActorEntity(gel, "Genomics England", [[ Registers the referral in its Test Order Management System (TOMS) and assigns the NGIS referral and participant identifiers, acting as an order management [Intermediary](ActorDefinition-Intermediary.html). Also the [Genomic Analysis and Interpretation](ActorDefinition-GenomicAnalysisAndInterpretation.html) actor that runs the bioinformatics pipeline and makes the results available to the RGL in the Interpretation Portal and CIP-API ]])
* insert ActorEntity(rgl, "Requesting Genomic Laboratory - RGL", [[ [Order Filler](ActorDefinition-OrderFiller.html) of the Laboratory Order and [Requestor](ActorDefinition-Requestor.html) of the sub-orders ]])
* insert ActorEntity(sgl, "Sequencing Genomic Laboratory - SGL", [[ [Subcontractor](ActorDefinition-Subcontractor.html) that sequences each participant. May be another GMS region's laboratory ]])
* insert ActorEntity(sequencer, "Sequencer", [[ [Automation Manager](ActorDefinition-AutomationManager.html) within the SGL ]])
* insert ActorEntity(rie, "Integration Engine", [[ [Intermediary](ActorDefinition-Intermediary.html) that retrieves each participant's results from the bioinformatics pipeline and assembles them into a FHIR Document ]])
* insert ActorEntity(registry, "Central Registry", [[ A central record of genomic results for each patient ]])

* insert Instance_Empty(Request1, ServiceRequest, "Laboratory Order - NGIS referral", [[ LAB-1 referral for the family. Illustrates the CIP-API `REFERRAL`. The original order (`intent` = `original-order`) has the family as its subject and the NGIS referral_id as its Order Filler Number. The clinical questions follow [GMS WGS Rare Disease](Questionnaire-GMSWGSRareDisease.html) ]])
* insert InstanceVersion(1, "Referral", ServiceRequest-dWGS-Trio-r26000000203-Referral, [[ The referral for the Trio family r26000000203 ]])

* insert Instance_Empty(Family, Group, "Family Genetic Group", [[ The family tested together and the subject of the referral. Illustrates the CIP-API `PEDIGREE` ]])
* insert InstanceVersion(1, "Family Genetic Group", FamilyGeneticGroup-dWGS-Trio-r26000000203, [[ The Trio family r26000000203 ]])

* insert Instance_Empty(FamilyMember1, FamilyMemberHistory, "Family member", [[ A family member's relationship to the Proband. Illustrates part of the CIP-API `PEDIGREE_MEMBER` ]])
* insert InstanceVersion(1, "Family member", FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000105, [[ First family member ]])

* insert Instance_Empty(FamilyMember2, FamilyMemberHistory, "Family member", [[ A family member's relationship to the Proband. Illustrates part of the CIP-API `PEDIGREE_MEMBER` ]])
* insert InstanceVersion(1, "Family member", FamilyMemberHistory-dWGS-Trio-r26000000203-p26000000106, [[ Second family member ]])

* insert Instance_Empty(Request2, Bundle, "Sub-order - Proband", [[ LAB-35 sub-order for one participant (`intent` = `filler-order`). The NGIS referral_id is the Order Group Number (`requisition`). Illustrates the CIP-API `REFERRAL_TEST` with its `Patient` and `Specimen` (`GERMLINE_SAMPLE`) ]])
* insert InstanceVersion(2, "HL7 FHIR Message O21", dWGS-Trio-r26000000203-p26000000104, [[ Trio sub-order for the proband ]])

* insert Instance_Empty(Request3, Bundle, "Sub-order - Family Member", [[ LAB-35 sub-order for a family member ]])
* insert InstanceVersion(3, "HL7 FHIR Message O21", dWGS-Trio-r26000000203-p26000000105, [[ Trio sub-order for the first family member ]])

* insert Instance_Empty(Request4, Bundle, "Sub-order - Family Member", [[ LAB-35 sub-order for a family member ]])
* insert InstanceVersion(4, "HL7 FHIR Message O21", dWGS-Trio-r26000000203-p26000000106, [[ Trio sub-order for the second family member ]])

* insert Instance_Empty(Request5, Binary, "Work Order", [[ LAB-4 work order to the sequencer. Internal to the SGL ]])
* insert Instance_Empty(Request6, Binary, "Sequence data", [[ Sequence data and quality metrics uploaded to Genomics England. Not exchanged using FHIR ]])
* insert Instance_Empty(Request7, Binary, "Sub-order results", [[ LAB-36 results for each participant, made available to the RGL in the Interpretation Portal and the CIP-API ]])
* insert Instance_Empty(Query1, Binary, "Retrieve participant results", [[ Query the CIP-API for a participant's bioinformatics results by the NGIS referral_id and participant id. Not FHIR ]])
* insert Instance_Empty(Reply1, Binary, "Participant results", [[ The bioinformatics pipeline results (variants) for the participant. Not FHIR ]])
* insert Instance_Empty(Request8, Bundle, "Participant results for the Central Registry", [[ Each participant's results assembled as a FHIR Document: the participant's `Patient`, `Specimen` and sub-order, and a [Test Results](StructureDefinition-TestResults.html) `DiagnosticReport` with the variants as [Variant](StructureDefinition-Variant.html) `Observation`s identifying the bioinformatics pipeline in `Observation.device`. See [UGR Full Pipeline](ExampleScenario-UGRFullPipeline.html) for how a FHIR Document for a central registry is built ]])
* insert Instance_Empty(Request9, Bundle, "Laboratory Report", [[ LAB-3 [Laboratory Report](StructureDefinition-LaboratoryReport.html) for the referral. Logically a report on the whole family with the family as its subject. See the [WGS FHIR Document](Bundle-FHIRDocumentGeneticReportBundle-WGS.html) for an illustration of a WGS report ]])

* process[+]
  * title = "1. Laboratory Order (LAB-1)"
  * description = "The clinician's referral is registered with Genomics England (TOMS), which assigns the NGIS referral_id and a participant id for each family member. The referral, family and family members illustrate the data that goes into the CIP-API and Interpretation Portal. Genomics England is not a laboratory here, so it routes the Laboratory Order to the RGL rather than placing a sub-order or work order. Not covered by this guide: the referral may be entered in TOMS by the clinician or by the RGL from a paper or electronic order."
  * insert ProcessCreateEvent(1, "Submit referral", placer, gel, Request1, , [[ The referral covers the whole family (Singleton or Duo or Trio) ]])
  * insert ProcessCreateEvent(2, "Route Laboratory Order", gel, rgl, Request1, , [[ The RGL is the Order Filler because it is responsible for the report back to the clinician ]])

* process[+]
  * title = "2. Sub-orders (LAB-35)"
  * description = "The RGL sub-contracts the sequencing to the SGL with one sub-order per participant, linked by the NGIS referral_id. The SGL is a laboratory accountable for its own sequencing results, so these are sub-orders and not work orders. Covered by this guide: see the sub-order examples."
  * insert ProcessCreateEvent(3, "Send sub-order - Proband", rgl, sgl, Request2, , [[ Sent with the sample and the digital manifest ]])
  * insert ProcessCreateEvent(4, "Send sub-order - Family Member", rgl, sgl, Request3, , [[ ]])
  * insert ProcessCreateEvent(5, "Send sub-order - Family Member", rgl, sgl, Request4, , [[ ]])

* process[+]
  * title = "3. Sequencing (LAB-4 and LAB-5)"
  * description = "The SGL sequences each sample and uploads the sequence data to Genomics England. Not covered by this guide: internal to the SGL and national."
  * insert ProcessCreateEvent(6, "Send Work Order", sgl, sequencer, Request5, , [[ ]])
  * insert ProcessCreateEvent(7, "Upload sequence data", sgl, gel, Request6, , [[ ]])

* process[+]
  * title = "4. Sub-order Results (LAB-36)"
  * description = "Logically the SGL returns the sub-order results to the RGL. In practice they go via Genomics England, which runs the bioinformatics pipeline on the sequence data and makes the results available to the RGL. Not covered by this guide."
  * insert ProcessCreateEvent(8, "Make results available", gel, rgl, Request7, , [[ Retrieved using the Interpretation Portal or the CIP-API by the NGIS referral_id and participant id ]])

* process[+]
  * title = "5. Participant Results to Central Registry"
  * description = "Once each participant's LAB-36 results are available, the integration engine retrieves them from the bioinformatics pipeline, assembles them into a FHIR Document and sends it to the central registry. Which system does this is to be confirmed."
  * insert ProcessSearch(9, "Retrieve participant results", rie, gel, Query1, Reply1, [[ From the CIP-API, once for each participant ]])
  * insert ProcessCreateEvent(10, "Send FHIR Document", rie, registry, Request8, , [[ One FHIR Document for each participant ]])

* process[+]
  * title = "6. Laboratory Report (LAB-3)"
  * description = "The RGL interprets the results for the family and sends the Laboratory Report to the clinician. Logically this is one report on the whole family, with the family as its subject. Out of scope for this guide."
  * insert ProcessCreateEvent(11, "Send Laboratory Report", rgl, placer, Request9, , [[ The report may instead be made available through GOMS ]])
