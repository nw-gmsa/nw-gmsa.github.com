Instance: Composition-GenomicsReport-LynchSyndrome
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report LynchSyndrome"
Description: "Composition - Genomics Report LynchSyndrome"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80"

* identifier
  * value = "98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
//* type = $sct#1054161000000101 "Genetic report"
* type.coding[+] = $GTD#R210.2
* type.coding[+] = $sct#1054161000000101 "Genetic report"
//* type.coding[+] = $sct#4241000179101 "Laboratory report"

//* meta.versionId = 3
* date = "2024-10-13T10:33:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "R0A"
* author.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* attester[+].mode = #legal
* attester[=].time = "2024-10-13T10:33:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Lynch Syndrome"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"

* encounter.identifier
  * value = "66717"
  * system = "http://www.acme.org/encounter/identifiers/RBS"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBS"

// Sections in reading order. SUSHI pre-fills the profile's required section slices at the first
// positions, so each section sets code.coding[0] (replacing the pre-filled code) rather than
// code (which would add a second coding and match two slices).
* section[+]
  * title = "Referral"
  * code.coding[0] = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R210 Inherited MMR deficiency (Lynch syndrome). History of carcinoma.</p></div>"
  * entry[+].reference = "urn:uuid:c0627dab-6f98-4846-beba-d9412ed3a60e"
  * entry[+].reference = "urn:uuid:d6c19529-a64e-476b-b896-303abec26a79"

* section[+]
  * title = "Specimen"
  * code.coding[0] = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Peripheral blood (EDTA). Received 08-Sep-2023.</p></div>"
  * entry[+].reference = "urn:uuid:635eaecb-a9c9-488e-978b-f63b12ce52b1"

* section[+]
  * title = "Result summary"
  * code.coding[0] = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Lynch syndrome: detected.</p></div>"
  * entry[+].reference = "urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80"

* section[+]
  * title = "Results"
  * code.coding[0] = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>One sequence variant detected.</p></div>"
  * section[+]
    * title = "Simple variants"
    * code = $loinc#81250-3
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>NTHL1 germline heterozygous duplication.</p></div>"
    * entry[+].reference = "urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99"

* section[+]
  * title = "Results from other laboratories"
  * code.coding[0] = GenomicReportSection#other-laboratory-results
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Tumour mismatch repair immunohistochemistry (Histopathology, Manchester University NHS Foundation Trust): loss of MLH1 and PMS2 expression; MSH2 and MSH6 retained. No MLH1 promoter hypermethylation.</p></div>"
  * entry[+].reference = "urn:uuid:9541381a-ba5f-4e4c-a748-507fd7f701f7"

* section[+]
  * title = "Interpretation"
  * code.coding[0] = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Pathogenic. Inherited MMR deficiency (Lynch syndrome).</p></div>"
  * entry[+].reference = "urn:uuid:6beb613f-d303-42af-b025-86e8e0872061"

* section[+]
  * title = "Methodology and limitations"
  * code.coding[0] = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R210 Inherited MMR deficiency (Lynch syndrome).</p></div>"
  * entry[+].reference = "urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa"
  * entry[+].reference = "urn:uuid:f0036554-cd1a-463c-ac8a-d891ca409af9"


Instance: FHIRDocumentGeneticReportBundle2
InstanceOf: BundleDocument
Title:       "Bundle `Document` - Genomics Report Inherited MMR deficiency (Lynch syndrome)"
Description:  "FHIR Document Genomics Report for Ned Liverpool"
Usage: #example
* insert DocumentBundle("e51f87e6-f43f-4c7a-b475-23b784e2b852", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:c55a7dc6-9b29-4cd6-ab8f-9aea594aabde", Composition-GenomicsReport-LynchSyndrome)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
// Order (also in the order message GenomicsOrderMessage-LynchSyndrome): ServiceRequest, requester and Specimen
* insert EntryDocument("urn:uuid:c0627dab-6f98-4846-beba-d9412ed3a60e", ServiceRequest-LynchSyndrome)
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
* insert EntryDocument("urn:uuid:635eaecb-a9c9-488e-978b-f63b12ce52b1", Specimen-LynchSyndrome)
* insert EntryDocument("urn:uuid:c64139e7-f02d-409c-bf34-75e8bf23bc80", DiagnosticReportGenomicsReportLS)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:6beb613f-d303-42af-b025-86e8e0872061", 6beb613f-d303-42af-b025-86e8e0872061)
* insert EntryDocument("urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa", 0878c5de-c22f-4e31-841a-a82ad31c93aa)
* insert EntryDocument("urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99", 8385c2fd-313d-4fd5-b98e-d5ea4bae6f99)
* insert EntryDocument("urn:uuid:9541381a-ba5f-4e4c-a748-507fd7f701f7", Observation-LynchSyndrome-MMR-IHC)
// Procedure
* insert EntryDocument("urn:uuid:f0036554-cd1a-463c-ac8a-d891ca409af9", f0036554-cd1a-463c-ac8a-d891ca409af9)
// Condition
* insert EntryDocument("urn:uuid:d6c19529-a64e-476b-b896-303abec26a79", d6c19529-a64e-476b-b896-303abec26a79)
