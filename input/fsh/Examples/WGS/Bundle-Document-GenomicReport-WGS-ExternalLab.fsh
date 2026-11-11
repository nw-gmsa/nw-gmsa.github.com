// Whole Genome Sequencing (rare disease) report that restates a result from another laboratory,
// received only as a PDF and carried as a DocumentReference (no DiagnosticReport for it).
// Short-read WGS does not reliably detect repeat expansions, so the earlier repeat expansion testing
// by the other laboratory is part of the interpretation (ACGS 2.5.14, 2.5.16).
// Fictitious example: the other laboratory, results and dates are illustrative only.

Instance: Composition-GenomicsReport-WGS-ExternalLab
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Whole Genome Sequencing with a result from another laboratory"
Description: "Composition - Genomics Report Whole Genome Sequencing (R54.3 Hereditary ataxia with onset in adulthood) that restates repeat expansion testing received as a PDF from another laboratory"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:2f62e254-7879-4cc4-9bd8-6c9709aa10ad"

* identifier
  * value = "f4b8e2a6-wgs-r54-external"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
* type.coding[+] = $GTD#R54.3
* type.coding[+] = $sct#1054161000000101 "Genetic report"

* date = "2026-11-06T13:20:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "NW GLH"
* attester[+].mode = #legal
* attester[=].time = "2026-11-06T13:20:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Whole Genome Sequencing (result from another laboratory)"

* subject.reference = "urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f"
* subject.display = "Robert BLACKBURN"

// Sections in reading order. SUSHI pre-fills the profile's required section slices at the first
// positions, so each section sets code.coding[0] (replacing the pre-filled code) rather than
// code (which would add a second coding and match two slices).
* section[+]
  * title = "Referral"
  * code.coding[0] = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R54.3 Hereditary ataxia with onset in adulthood (WGS). Progressive cerebellar ataxia from age 55, no family history.</p></div>"
  * entry[+].reference = "urn:uuid:d975fa86-c754-48e6-935b-d2aa1e822ba9"

* section[+]
  * title = "Specimen"
  * code.coding[0] = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Peripheral blood (EDTA). Collected 12-Aug-2026, received 13-Aug-2026.</p></div>"
  * entry[+].reference = "urn:uuid:3767ac32-ead0-4d95-9793-1a4559822666"

* section[+]
  * title = "Result summary"
  * code.coding[0] = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No genetic cause found. RFC1 repeat expansion testing is recommended.</p></div>"
  * entry[+].reference = "urn:uuid:2f62e254-7879-4cc4-9bd8-6c9709aa10ad"

* section[+]
  * title = "Results"
  * code.coding[0] = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No reportable sequence, copy number or structural variants were detected in the R54 Hereditary ataxia with onset in adulthood panel.</p></div>"
  * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

* section[+]
  * title = "Results from other laboratories"
  * code.coding[0] = GenomicReportSection#other-laboratory-results
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Repeat expansion testing, Regional Neurogenetics Laboratory (report dated 14-May-2024, received as a PDF): SCA1, SCA2, SCA3, SCA6, SCA7, SCA17, DRPLA and FXN (Friedreich ataxia) alleles all within the normal range. Result transcribed from the attached report.</p></div>"
  * entry[+].reference = "urn:uuid:9b9d3ca4-fd96-42ff-9eef-308be79bf214"

* section[+]
  * title = "Interpretation"
  * code.coding[0] = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No genetic cause for the ataxia was found by whole genome sequencing. The common spinocerebellar ataxia and Friedreich ataxia repeat expansions were excluded by the earlier testing at the Regional Neurogenetics Laboratory. Biallelic RFC1 repeat expansions (CANVAS) are a common cause of late-onset ataxia and are not reliably detected by this test, so have not been excluded.</p></div>"

* section[+]
  * title = "Recommendations"
  * code.coding[0] = $loinc#62385-0 "Recommendation [Interpretation] Document"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>RFC1 repeat expansion testing is recommended. The whole genome sequence can be reanalysed if new clinical information becomes available. Support is available from Clinical Genetics.</p></div>"

* section[+]
  * title = "Methodology and limitations"
  * code.coding[0] = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Whole genome sequencing, analysed against the R54 Hereditary ataxia with onset in adulthood virtual gene panel, with copy number and structural variant calling. Short tandem repeat expansions, including RFC1, are not reliably detected. Variants outside the panel are not reported.</p></div>"
  * entry[+].reference = "urn:uuid:95613cf5-45e5-4053-9a30-e95a93b7d6db"


Instance: DiagnosticReport-GenomicsReport-WGS-ExternalLab
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example - Whole Genome Sequencing ataxia (with a result from another laboratory)"
Description: "Robert Blackburn Whole Genome Sequencing (R54.3 Hereditary ataxia with onset in adulthood)"
Usage: #inline

* extension[DiagnosticReportCompositionR5].valueReference.reference = "urn:uuid:c531d733-207b-4364-83b0-7dcf9c488857"
* identifier[ReportIdentifier]
  * value = "f4b8e2a6-wgs-r54-external"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "71502"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
  * reference = "urn:uuid:d975fa86-c754-48e6-935b-d2aa1e822ba9"
* specimen[+].reference = "urn:uuid:3767ac32-ead0-4d95-9793-1a4559822666"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R54.3
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f"
* subject.display = "Robert BLACKBURN"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383370"
* effectiveDateTime = "2026-08-12T10:00:00+00:00"
* issued = "2026-11-06T13:20:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"
* conclusion = "No genetic cause found. RFC1 repeat expansion testing is recommended."
* conclusionCode[+] = $GTOC#313 "GENETIC CAUSE WAS NOT FOUND"
* result[+].reference = "urn:uuid:95613cf5-45e5-4053-9a30-e95a93b7d6db"


Instance: GenomicStudyPanel-WGS-ExternalLab
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - Whole Genome Sequencing ataxia"
Description: "Fictitious example: overall study variables for the R54.3 Whole Genome Sequencing analysis"
Usage: #inline

* identifier[+].value = "95613cf5-45e5-4053-9a30-e95a93b7d6db"
* status = #final
* effectiveDateTime = "2026-11-06T13:20:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#81306-3 "Variables that apply to the overall study"
* subject.reference = "urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f"
* subject.display = "Robert BLACKBURN"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* component[+]
  * code = $loinc#51967-8 "Genetic disease assessed [ID]"
  * valueCodeableConcept.text = "Hereditary ataxia with onset in adulthood"
* component[+]
  * code = $loinc#81293-3
  * valueString = "Whole genome, analysed against the R54 Hereditary ataxia with onset in adulthood virtual gene panel"
* component[+]
  * code = $loinc#62374-4
  * valueCodeableConcept = $loinc#LA26806-2 "GRCh38"


Instance: DocumentReference-ExternalLab-RepeatExpansion
InstanceOf: http://hl7.org/fhir/StructureDefinition/DocumentReference
Title: "Document Reference - repeat expansion testing (another laboratory, PDF)"
Description: "Fictitious example: a repeat expansion testing report from another laboratory, received only as a PDF. There is no DiagnosticReport for it; the result is summarised in description and transcribed into the genomic report."
Usage: #inline

// Hand-written narrative: a generated one links content.attachment.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Repeat expansion testing report, Regional Neurogenetics Laboratory, 14-May-2024 (PDF). SCA1, SCA2, SCA3, SCA6, SCA7, SCA17, DRPLA and FXN alleles all within the normal range.</p></div>"
* identifier[+].system = "https://neurogenetics.example.org/report"
* identifier[=].value = "NG24-01873"
* status = #current
* docStatus = #final
* type = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f"
* subject.display = "Robert BLACKBURN"
* date = "2024-05-14T00:00:00+00:00"
* author[+].display = "Regional Neurogenetics Laboratory"
* description = "Repeat expansion testing for SCA1, SCA2, SCA3, SCA6, SCA7, SCA17, DRPLA and FXN: all alleles within the normal range."
* content[+].attachment
  * contentType = #application/pdf
  * language = #en
  * url = "urn:uuid:1f3593f8-0309-4cb2-9424-dae7129841a2"
  * title = "Neurogenetics report - repeat expansion testing"
  * creation = "2024-05-14"


Instance: FHIRDocumentGeneticReportBundle-WGS-ExternalLab
InstanceOf: BundleDocument
Title: "Bundle `Document` - Genomics Report Whole Genome Sequencing with a result from another laboratory"
Description: "FHIR Document Genomics Report (Whole Genome Sequencing, R54.3 Hereditary ataxia with onset in adulthood) for Robert Blackburn. Repeat expansion testing received as a PDF from another laboratory is restated in the Results from other laboratories section, carried as a DocumentReference with no DiagnosticReport."
Usage: #example
* insert DocumentBundle("3d352f1c-26d8-41f0-8dda-eff6ddb85d79", "2026-11-06T13:20:00+00:00")
* insert EntryDocument("urn:uuid:c531d733-207b-4364-83b0-7dcf9c488857", Composition-GenomicsReport-WGS-ExternalLab)
* insert EntryDocument("urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f", Patient-Blackburn)
// Order (also in the order message GenomicsOrderMessage-WGS-ExternalLab): ServiceRequest, requester and Specimen
* insert EntryDocument("urn:uuid:d975fa86-c754-48e6-935b-d2aa1e822ba9", ServiceRequest-WGS-ExternalLab)
* insert EntryDocument("urn:uuid:0a9b29d6-b81b-4747-9045-2aca50e861d7", PractitionerRole-Requester-Neurology-RM3)
* insert EntryDocument("urn:uuid:3767ac32-ead0-4d95-9793-1a4559822666", Specimen-WGS-ExternalLab)
* insert EntryDocument("urn:uuid:2f62e254-7879-4cc4-9bd8-6c9709aa10ad", DiagnosticReport-GenomicsReport-WGS-ExternalLab)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:95613cf5-45e5-4053-9a30-e95a93b7d6db", GenomicStudyPanel-WGS-ExternalLab)
// Result from another laboratory: DocumentReference and its PDF, no DiagnosticReport
* insert EntryDocument("urn:uuid:9b9d3ca4-fd96-42ff-9eef-308be79bf214", DocumentReference-ExternalLab-RepeatExpansion)
* insert EntryDocument("urn:uuid:1f3593f8-0309-4cb2-9424-dae7129841a2", Binary-ExternalLab-RepeatExpansion)
