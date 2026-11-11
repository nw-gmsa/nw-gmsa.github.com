Instance: Composition-GenomicsReport-OctaviaCHISLETT
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Octavia CHISLETT"
Description: "Composition - Genomics Report Octavia CHISLETT"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f"

* identifier
  * value = "25edee2b-add8-4522-9fa2-1ee8f229bd75"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
//* type = $sct#1054161000000101 "Genetic report"
* type.coding[+] = $GTD#R240.1
* type.coding[+] = $sct#1054161000000101 "Genetic report"
//* type.coding[+] = $sct#4241000179101 "Laboratory report"

//* meta.versionId = 3
* date = "2024-10-13T10:33:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "R0A"
* author.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* attester[+].mode = #legal
* attester[=].time = "2024-10-13T10:33:00+00:00"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Octavia CHISLETT"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.identifier.system = $nhs-number
* subject.identifier.value = "9449305552"
* subject.display = "Octavia CHISLETT"

* encounter.identifier
  * value = "1001166717"
  * system = "http://www.acme.org/encounter/identifiers/R0A"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* section[+]
  * title = "Referral"
  * code = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R240.1 Diagnostic testing for known variant(s) (Targeted variant testing).</p></div>"

* section[+]
  * title = "Specimen"
  * code = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Peripheral blood (EDTA).</p></div>"

* section[+]
  * title = "Result summary"
  * code = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Known familial variant not detected. Normal - no action.</p></div>"
  * entry[+].reference = "urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f"

* section[+]
  * title = "Results"
  * code = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The known familial variant was not detected.</p></div>"

* section[+]
  * title = "Interpretation"
  * code = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>This result is normal. No further action is needed.</p></div>"

* section[+]
  * title = "Methodology and limitations"
  * code = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Targeted testing for the known familial variant(s).</p></div>"



Instance: FHIRDocumentGeneticReportBundle
InstanceOf: BundleDocument
Title:       "Bundle `Document` - Genomics Report Targeted Variant"
Description:  "FHIR Document Genomics Report for Jack Dawkins"
Usage: #example
* insert DocumentBundle("1d7155e8-b5b8-4406-adda-01a474d5ff6c", "2024-10-13T10:33:00+00:00")
* insert EntryDocument("urn:uuid:30551ce1-5a28-4356-b684-1e639094ad4d", Composition-GenomicsReport-OctaviaCHISLETT)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-OctaviaCHISLETT-9449305552)
* insert EntryDocument("urn:uuid:233ff41a-5067-46c4-b6aa-5d6f87719f5f", DiagnosticReportGenomicsReport)
// Practitioner Role - order creator
//* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
