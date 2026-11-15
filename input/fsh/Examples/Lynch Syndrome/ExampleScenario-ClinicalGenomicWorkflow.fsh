Instance: ClinicalAndGenomicWorkflow
InstanceOf: ExampleScenario
Title:       "Suspected Lynch Syndrome - Clinical Workflow"
Description: """
The consultant's view of [Lynch Syndrome](ExampleScenario-LynchSyndrome.html). Ned Liverpool has bowel (colon) cancer, and tests on the cancer cells (tumour immunohistochemistry) show loss of MLH1 and PMS2. The consultant suspects Lynch syndrome, records it on the problem list as suspected, and asks for genomic diagnostic testing. If the test comes back positive, the consultant updates the Condition to confirmed. If it comes back negative, the Condition would instead be updated to refuted (not shown).

The genomic test order, Laboratory Report and FHIR Document are covered in the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario; this scenario shows where they fit in the clinical workflow. When the diagnosis is confirmed, the family is referred to clinical genetics for genetic counselling and predictive testing. The family history the genetics service takes may be recorded in another system, such as the National Disease Registration Service (NDRS); recording it is not covered by this guide.
"""
Usage: #definition

* status = #draft
* name = "ClinicalAndGenomicWorkflow"

* insert ActorEntity(consultant, "Consultant", [[ The secondary care consultant (for example a colorectal surgeon or oncologist) at Manchester University NHS Foundation Trust - the [Order Placer](ActorDefinition-OrderPlacer.html) ]])
* insert ActorEntity(epr, "Electronic Patient Record", [[ The Trust's EPR, which holds the patient's problem list - a [Provider Information Source](ActorDefinition-ProviderInformationSource.html) ]])
* insert ActorEntity(glh, "Genomic Diagnostic Testing - North West GLH", [[ The [Order Filler](ActorDefinition-OrderFiller.html) that tests, interprets and reports. See [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) ]])
* insert ActorEntity(clingen, "Clinical Genetics", [[ The clinical genetics service (Manchester Centre for Genomic Medicine) that sees the family for genetic counselling and predictive testing ]])
* insert ActorEntity(familyhistory, "Family history system - for example NDRS", [[ Another system where family history may be recorded, such as the National Disease Registration Service (NDRS). Not covered by this guide ]])

* insert Instance_Empty(Condition, Condition, "Condition - Lynch syndrome", [[ Lynch syndrome on the patient's problem list ]])
* insert InstanceVersion(1, "Suspected - provisional", Condition-LynchSyndrome-Provisional, [[ Recorded as suspected, evidenced by the pathology report ]])
* insert InstanceVersion(2, "Confirmed", c8f82825-e4cb-4e1f-b728-3fd2808e93db, [[ Updated to confirmed, evidenced by the genomic diagnostic implication ]])

* insert Instance_Empty(Order, Bundle, "Laboratory Order", [[ Genomic diagnostic testing for R210.2 Inherited MMR deficiency (Lynch syndrome). See [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) ]])
* insert InstanceVersion(1, "HL7 FHIR Message O21", GenomicsOrderMessage-LynchSyndrome, [[ Laboratory Order for Ned Liverpool ]])

* insert Instance_Empty(Report, Bundle, "Laboratory Report", [[ The result: a heterozygous pathogenic germline MLH1 variant. See [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) ]])
* insert InstanceVersion(1, "HL7 FHIR Message R01", GenomicsReportMessage-LynchSyndrome, [[ Laboratory Report for Ned Liverpool ]])

* insert Instance_Empty(Referral, Bundle, "Referral to clinical genetics", [[ Referral of the family for genetic counselling and predictive testing. See [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) ]])
* insert InstanceVersion(1, "HL7 FHIR Message O19", GenomicsReferralMessage-LynchSyndrome, [[ Referral of the Liverpool family ]])

* insert Instance_Empty(FamilyMember1, FamilyMemberHistory, "Family history - son", [[ Family history taken by clinical genetics. Illustrative only: may be recorded in another system such as NDRS ]])
* insert InstanceVersion(1, "Rob LEEDS - son", 074ea905-8d91-452c-af3c-15b5b860fdb2, [[ Son ]])

* insert Instance_Empty(FamilyMember2, FamilyMemberHistory, "Family history - mother", [[ Family history taken by clinical genetics. Illustrative only: may be recorded in another system such as NDRS ]])
* insert InstanceVersion(1, "Lyarra NOTTINGHAM - mother - deceased", c76b8bc2-ec36-4ce1-a2ea-8c57215115e2, [[ Mother ]])

* process[+]
  * title = "1. Suspect Lynch syndrome"
  * description = "The consultant suspects Lynch syndrome and records it on the problem list as provisional."
  * preConditions = "Bowel (colon) cancer diagnosed. Tests on the cancer cells (immunohistochemistry) show loss of MLH1 and PMS2."
  * insert ProcessCreate(1, "Record suspected Lynch syndrome", consultant, epr, Condition, 1, [[ Usually entered by the consultant in the EPR ]])

* process[+]
  * title = "2. Request genomic diagnostic testing"
  * description = "The consultant requests genomic diagnostic testing for Lynch syndrome (R210.2) on a blood sample, with a copy of the pathology report. Covered by the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario."
  * insert ProcessCreateEvent(2, "Send Laboratory Order", consultant, glh, Order, 1, [[ ]])

* process[+]
  * title = "3. Receive the Laboratory Report"
  * description = "The North West GLH reports a heterozygous pathogenic germline MLH1 variant. Covered by the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario."
  * insert ProcessCreateEvent(3, "Send Laboratory Report", glh, consultant, Report, 1, [[ ]])

* process[+]
  * title = "4. Confirm Lynch syndrome"
  * description = "The test is positive, so the consultant updates the Condition to confirmed, evidenced by the genomic result. If the test were negative, the Condition would be updated to refuted."
  * preConditions = "The Laboratory Report finds a pathogenic variant in a Lynch syndrome gene."
  * insert ProcessUpdate(4, "Update Lynch syndrome to confirmed", consultant, epr, Condition, 2, [[ ]])

* process[+]
  * title = "5. Refer the family to clinical genetics"
  * description = "The consultant refers the family to clinical genetics for genetic counselling and predictive testing of other members of the family. Covered by the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario."
  * insert ProcessCreateEvent(5, "Send referral", consultant, clingen, Referral, 1, [[ Via eRS or a Genomics England Limited application ]])

* process[+]
  * title = "6. Record family history"
  * description = "Clinical genetics takes the family history. It may be recorded in another system, such as the National Disease Registration Service (NDRS). Not covered by this guide."
  * insert ProcessCreate(6, "Record family history - son", clingen, familyhistory, FamilyMember1, 1, [[ Not covered by this guide ]])
  * insert ProcessCreate(7, "Record family history - mother", clingen, familyhistory, FamilyMember2, 1, [[ Not covered by this guide ]])
