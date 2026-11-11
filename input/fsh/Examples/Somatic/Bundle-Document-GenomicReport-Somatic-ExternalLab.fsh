// Somatic (cancer) report that restates a result from another laboratory, received as a PDF.
// The EML4-ALK fusion was reported by a laboratory in Germany when the patient was diagnosed there;
// the NW GLH panel on a later biopsy finds an ALK resistance mutation, and the interpretation covers
// both results (ACGS 2.5.14, 2.5.16).
// Fictitious example: the German laboratory, variants, allele frequency, treatment and dates are illustrative only.

Instance: Composition-GenomicsReport-Somatic-ExternalLab
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Somatic with a result from a laboratory in Germany"
Description: "Composition - Genomics Report Somatic (M4.1 Non-Small Cell Lung Cancer) that restates an EML4-ALK fusion result received as a PDF from a laboratory in Germany"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:89782eb3-1235-4844-847f-68b475d7639b"

* identifier
  * value = "a7d3c915-somatic-m4-external"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
* type.coding[+] = $GTD#M4.1
* type.coding[+] = $sct#1054161000000101 "Genetic report"

* date = "2026-10-20T11:15:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "NW GLH"
* attester[+].mode = #legal
* attester[=].time = "2026-10-20T11:15:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Somatic Non-Small Cell Lung Cancer (result from Germany)"

* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"

* section[+]
  * title = "Referral"
  * code = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M4 Non-Small Cell Lung Cancer. ALK-positive lung adenocarcinoma, diagnosed in Germany in 2025, now progressing on alectinib. Testing for resistance mechanisms on a new biopsy.</p></div>"

* section[+]
  * title = "Specimen"
  * code = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Formalin-fixed paraffin-embedded (FFPE) lung biopsy. Estimated tumour content 50%. Collected 05-Oct-2026, received 06-Oct-2026.</p></div>"

* section[+]
  * title = "Result summary"
  * code = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ALK p.(Gly1202Arg) resistance mutation detected, in a tumour with a known EML4-ALK fusion.</p></div>"
  * entry[+].reference = "urn:uuid:89782eb3-1235-4844-847f-68b475d7639b"

* section[+]
  * title = "Results"
  * code = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>One somatic sequence variant detected.</p></div>"
  * section[+]
    * title = "Simple variants"
    * code = $loinc#81250-3
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ALK NM_004304.5:c.3604G&gt;A p.(Gly1202Arg), somatic, variant allele frequency 18%.</p></div>"
    * entry[+].reference = "urn:uuid:e4529ca6-f3e5-4ba7-bf6b-70f58be5cd98"

* section[+]
  * title = "Results from other laboratories"
  * code = GenomicReportSection#other-laboratory-results
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>RNA-based NGS fusion analysis of the diagnostic lung biopsy, Institut für Molekularpathologie, Musterstadt, Germany (report dated 12-Mar-2025, received as a PDF): EML4-ALK fusion detected (EML4 exon 13 :: ALK exon 20, variant 1). Result transcribed from the attached report.</p></div>"
  * entry[+].reference = "urn:uuid:03f0995b-1592-4578-8128-53ec8c16061c"

* section[+]
  * title = "Interpretation"
  * code = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>ALK p.(Gly1202Arg) is a solvent-front mutation in the ALK kinase domain. Together with the EML4-ALK fusion reported by the laboratory in Germany, it is consistent with acquired resistance to alectinib. Lorlatinib may retain activity against this mutation.</p></div>"
  * entry[+].reference = "urn:uuid:34872adc-5e60-4a62-8e8e-9ff8c9d3b3f5"

* section[+]
  * title = "Recommendations"
  * code = $loinc#62385-0 "Recommendation [Interpretation] Document"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Discuss treatment with lorlatinib at the lung cancer multidisciplinary team meeting.</p></div>"

* section[+]
  * title = "Methodology and limitations"
  * code = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Targeted next generation sequencing of EGFR, ALK, BRAF, KRAS and MET hotspots in tumour DNA. Variants below 5% allele frequency may not be detected. ALK fusions are not detected by this test; the fusion result is from the laboratory in Germany.</p></div>"
  * entry[+].reference = "urn:uuid:eb655b7c-800e-4cae-95ed-49f9fdc16174"


Instance: DiagnosticReport-GenomicsReport-Somatic-ExternalLab
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example - Somatic ALK resistance (with a result from Germany)"
Description: "Tommen Birmingham Non-Small Cell Lung Cancer somatic multi-target NGS panel"
Usage: #inline

* extension[DiagnosticReportCompositionR5].valueReference.reference = "urn:uuid:014c8f1b-9aa5-4253-8e50-069a37b2054f"
* identifier[ReportIdentifier]
  * value = "a7d3c915-somatic-m4-external"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "71455"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M4.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383249"
* effectiveDateTime = "2026-10-05T10:00:00+00:00"
* issued = "2026-10-20T11:15:00+00:00"
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
* conclusion = "ALK p.(Gly1202Arg) resistance mutation detected."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* result[+].reference = "urn:uuid:e4529ca6-f3e5-4ba7-bf6b-70f58be5cd98"
* result[+].reference = "urn:uuid:34872adc-5e60-4a62-8e8e-9ff8c9d3b3f5"
* result[+].reference = "urn:uuid:eb655b7c-800e-4cae-95ed-49f9fdc16174"


Instance: Variant-Somatic-ALK-G1202R
InstanceOf: Variant
Title: "Variant - ALK p.(Gly1202Arg) (Somatic)"
Description: "Fictitious example: somatic ALK solvent-front resistance mutation"
Usage: #inline

* identifier[+].value = "e4529ca6-f3e5-4ba7-bf6b-70f58be5cd98"
* status = #final
* effectiveDateTime = "2026-10-20T11:15:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#69548-6 "Genetic variant assessment"
* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* method.text = "Targeted next generation sequencing (tumour DNA)"
* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:427 "ALK"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_004304.5
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_004304.5:c.3604G>A
* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#NP_004295.2:p.(Gly1202Arg)
* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6684-0 "Somatic"
* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity = 0.18 '1'


Instance: TherapeuticImplication-Somatic-ALK-Lorlatinib
InstanceOf: TherapeuticImplication
Title: "Therapeutic Implication - ALK p.(Gly1202Arg) lorlatinib"
Description: "Fictitious example: ALK resistance mutation, with lorlatinib predicted to retain activity"
Usage: #inline

* identifier[+].value = "34872adc-5e60-4a62-8e8e-9ff8c9d3b3f5"
* status = #final
* effectiveDateTime = "2026-10-20T11:15:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* derivedFrom.reference = "urn:uuid:e4529ca6-f3e5-4ba7-bf6b-70f58be5cd98"
* component[+].code = $loinc#51963-7
* component[=].valueCodeableConcept.text = "Lorlatinib"
* component[+].code = $loinc#51961-1
* component[=].valueCodeableConcept.text = "Responsive"
* component[+].code = $TbdCodesCS#conclusion-string
* component[=].valueString = "ALK p.(Gly1202Arg), in a tumour with an EML4-ALK fusion, is consistent with acquired resistance to alectinib. Lorlatinib may retain activity against this mutation."


Instance: GenomicStudyPanel-Somatic-ExternalLab
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - Non-Small Cell Lung Cancer resistance testing"
Description: "Fictitious example: overall study variables for the M4.1 multi-target NGS panel"
Usage: #inline

* identifier[+].value = "eb655b7c-800e-4cae-95ed-49f9fdc16174"
* status = #final
* effectiveDateTime = "2026-10-20T11:15:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#81306-3 "Variables that apply to the overall study"
* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* component[+]
  * code = $loinc#51967-8 "Genetic disease assessed [ID]"
  * valueCodeableConcept = $GCC#M4 "Non-Small Cell Lung Cancer"
* component[+]
  * code = $loinc#48018-6 "Gene studied [ID]"
  * valueCodeableConcept = $genenames#HGNC:427 "ALK"
* component[+]
  * code = $loinc#48018-6 "Gene studied [ID]"
  * valueCodeableConcept = $genenames#HGNC:3236 "EGFR"
* component[+]
  * code = $loinc#81293-3
  * valueString = "Hotspot regions of EGFR, ALK, BRAF, KRAS and MET"


Instance: DiagnosticReport-ExternalLab-Germany-EML4-ALK
InstanceOf: http://hl7.org/fhir/StructureDefinition/DiagnosticReport
Title: "Diagnostic Report - EML4-ALK fusion (laboratory in Germany, PDF)"
Description: "Fictitious example: a molecular pathology report from a laboratory in Germany, received as a PDF (in English). The result is transcribed into conclusion; the PDF is presentedForm."
Usage: #inline

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Molecular pathology report (RNA fusion analysis), Institut für Molekularpathologie, Musterstadt, Germany, 12-Mar-2025. EML4-ALK fusion detected (EML4 exon 13 :: ALK exon 20, variant 1).</p></div>"
* identifier[+].system = "https://molekularpathologie.musterstadt.example.de/befund"
* identifier[=].value = "MP-2025-004711"
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.text = "RNA-based NGS fusion analysis"
* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* effectiveDateTime = "2025-03-04"
* issued = "2025-03-12T00:00:00+01:00"
* performer[+].reference = "urn:uuid:93b5dcc3-a90f-4099-94e7-7abebb94c899"
* performer[=].display = "Institut für Molekularpathologie, Musterstadt"
* conclusion = "EML4-ALK fusion detected (EML4 exon 13 :: ALK exon 20, variant 1)."
* presentedForm[+]
  * contentType = #application/pdf
  * language = #en
  * url = "urn:uuid:d7d2682b-50c2-4baf-80b5-d64a5848b0bb"
  * title = "Molecular pathology report - RNA fusion analysis"
  * creation = "2025-03-12"


Instance: Organization-ExternalLab-Germany
InstanceOf: http://hl7.org/fhir/StructureDefinition/Organization
Title: "Organization - Institut für Molekularpathologie, Musterstadt (Germany)"
Description: "Fictitious example: a molecular pathology laboratory in Germany (Musterstadt is the German placeholder town name)"
Usage: #inline

* active = true
* name = "Institut für Molekularpathologie Musterstadt"
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* address.line = "Musterstraße 1"
* address.city = "Musterstadt"
* address.postalCode = "12345"
* address.country = "DE"


Instance: FHIRDocumentGeneticReportBundle-Somatic-ExternalLab
InstanceOf: BundleDocument
Title: "Bundle `Document` - Genomics Report Somatic with a result from a laboratory in Germany"
Description: "FHIR Document Genomics Report (Somatic, M4.1 Non-Small Cell Lung Cancer) for Tommen Birmingham. An EML4-ALK fusion reported as a PDF by a laboratory in Germany is restated in the Results from other laboratories section, and the interpretation covers it together with the ALK resistance mutation found by NW GLH."
Usage: #example
* insert DocumentBundle("6f1b2c8d-3e4a-4b5c-8d9e-0a1b2c3d4e5f", "2026-10-20T11:15:00+00:00")
* insert EntryDocument("urn:uuid:014c8f1b-9aa5-4253-8e50-069a37b2054f", Composition-GenomicsReport-Somatic-ExternalLab)
* insert EntryDocument("urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c", Patient-Birmingham)
* insert EntryDocument("urn:uuid:89782eb3-1235-4844-847f-68b475d7639b", DiagnosticReport-GenomicsReport-Somatic-ExternalLab)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:e4529ca6-f3e5-4ba7-bf6b-70f58be5cd98", Variant-Somatic-ALK-G1202R)
* insert EntryDocument("urn:uuid:34872adc-5e60-4a62-8e8e-9ff8c9d3b3f5", TherapeuticImplication-Somatic-ALK-Lorlatinib)
* insert EntryDocument("urn:uuid:eb655b7c-800e-4cae-95ed-49f9fdc16174", GenomicStudyPanel-Somatic-ExternalLab)
// Result from the laboratory in Germany, with its PDF
* insert EntryDocument("urn:uuid:03f0995b-1592-4578-8128-53ec8c16061c", DiagnosticReport-ExternalLab-Germany-EML4-ALK)
* insert EntryDocument("urn:uuid:93b5dcc3-a90f-4099-94e7-7abebb94c899", Organization-ExternalLab-Germany)
* insert EntryDocument("urn:uuid:d7d2682b-50c2-4baf-80b5-d64a5848b0bb", Binary-Sample)
