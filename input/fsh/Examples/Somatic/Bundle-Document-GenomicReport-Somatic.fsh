// Somatic (cancer) report, following HL7 Genomics Reporting Somatic Reporting (somatics.html).
// Fictitious example: the variant, allele frequency, treatment and dates are illustrative only.

Instance: Composition-GenomicsReport-Somatic
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Somatic (Non-Small Cell Lung Cancer)"
Description: "Composition - Genomics Report Somatic (M4.1 Non-Small Cell Lung Cancer, multi-target NGS panel - small variant)"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:0dc1fe99-b0ff-41f6-954f-ad6aaf1adf33"

* identifier
  * value = "c2f4d9a0-somatic-m4"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
* type.coding[+] = $GTD#M4.1
* type.coding[+] = $sct#1054161000000101 "Genetic report"

* date = "2026-10-21T09:30:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "NW GLH"
* attester[+].mode = #legal
* attester[=].time = "2026-10-21T09:30:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Somatic Non-Small Cell Lung Cancer"

* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"

// Sections in reading order. SUSHI pre-fills the profile's required section slices at the first
// positions, so each section sets code.coding[0] (replacing the pre-filled code) rather than
// code (which would add a second coding and match two slices).
* section[+]
  * title = "Referral"
  * code.coding[0] = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>M4 Non-Small Cell Lung Cancer. Adenocarcinoma of the lung, stage IV, for first-line treatment selection.</p></div>"
  * entry[+].reference = "urn:uuid:5b5d3536-7a68-4631-8c9c-dcaf79c1798b"

* section[+]
  * title = "Specimen"
  * code.coding[0] = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Formalin-fixed paraffin-embedded (FFPE) lung biopsy. Estimated tumour content 40%. Received 10-Oct-2026.</p></div>"
  * entry[+].reference = "urn:uuid:fb300032-6854-4c9e-aa21-972a2e1fcb56"

* section[+]
  * title = "Result summary"
  * code.coding[0] = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>EGFR exon 21 p.(Leu858Arg) sensitising mutation detected.</p></div>"
  * entry[+].reference = "urn:uuid:0dc1fe99-b0ff-41f6-954f-ad6aaf1adf33"

* section[+]
  * title = "Results"
  * code.coding[0] = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>One somatic sequence variant detected.</p></div>"
  * section[+]
    * title = "Simple variants"
    * code = $loinc#81250-3
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>EGFR NM_005228.5:c.2573T&gt;G p.(Leu858Arg), somatic, variant allele frequency 32%.</p></div>"
    * entry[+].reference = "urn:uuid:a3b9a389-6a6b-4a16-b862-9d2f51551ef5"

* section[+]
  * title = "Interpretation"
  * code.coding[0] = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>EGFR p.(Leu858Arg) is a sensitising mutation, predictive of response to EGFR tyrosine kinase inhibitors such as osimertinib.</p></div>"
  * entry[+].reference = "urn:uuid:675e7eaf-66d7-4668-81cb-8b7c770fd47b"

* section[+]
  * title = "Recommendations"
  * code.coding[0] = $loinc#62385-0 "Recommendation [Interpretation] Document"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Discuss EGFR tyrosine kinase inhibitor treatment at the lung cancer multidisciplinary team meeting.</p></div>"

* section[+]
  * title = "Methodology and limitations"
  * code.coding[0] = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Targeted next generation sequencing of EGFR, ALK, BRAF, KRAS and MET hotspots in tumour DNA. Variants below 5% allele frequency may not be detected. Structural and copy number variants are reported separately (M4.2, M4.3).</p></div>"
  * entry[+].reference = "urn:uuid:14ea83e6-334d-42f2-874d-4d32672c9661"


Instance: DiagnosticReport-GenomicsReport-Somatic
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example - Somatic (Non-Small Cell Lung Cancer)"
Description: "Ramsay Bolton Non-Small Cell Lung Cancer somatic multi-target NGS panel"
Usage: #inline

* extension[DiagnosticReportCompositionR5].valueReference.reference = "urn:uuid:e7e2432d-ec59-4de7-b26b-7e995067084b"
* identifier[ReportIdentifier]
  * value = "c2f4d9a0-somatic-m4"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "71204"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
  * reference = "urn:uuid:5b5d3536-7a68-4631-8c9c-dcaf79c1798b"
* specimen[+].reference = "urn:uuid:fb300032-6854-4c9e-aa21-972a2e1fcb56"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#M4.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383273"
* effectiveDateTime = "2026-10-09T11:00:00+00:00"
* issued = "2026-10-21T09:30:00+00:00"
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
* conclusion = "EGFR p.(Leu858Arg) sensitising mutation detected."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* result[+].reference = "urn:uuid:a3b9a389-6a6b-4a16-b862-9d2f51551ef5"
* result[+].reference = "urn:uuid:675e7eaf-66d7-4668-81cb-8b7c770fd47b"
* result[+].reference = "urn:uuid:14ea83e6-334d-42f2-874d-4d32672c9661"


Instance: Variant-Somatic-EGFR-L858R
InstanceOf: Variant
Title: "Variant - EGFR p.(Leu858Arg) (Somatic)"
Description: "Fictitious example: somatic EGFR sensitising mutation in Non-Small Cell Lung Cancer"
Usage: #inline

* identifier[+].value = "a3b9a389-6a6b-4a16-b862-9d2f51551ef5"

* status = #final
* effectiveDateTime = "2026-10-21T09:30:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#69548-6 "Genetic variant assessment"
* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* method.text = "Targeted next generation sequencing (tumour DNA)"
* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:3236 "EGFR"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_005228.5
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_005228.5:c.2573T>G
* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#NP_005219.2:p.(Leu858Arg)
* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6684-0 "Somatic"
* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity = 0.32 '1'


Instance: TherapeuticImplication-Somatic-EGFR-L858R
InstanceOf: TherapeuticImplication
Title: "Therapeutic Implication - EGFR p.(Leu858Arg) osimertinib"
Description: "Fictitious example: EGFR sensitising mutation predictive of response to an EGFR tyrosine kinase inhibitor"
Usage: #inline

* identifier[+].value = "675e7eaf-66d7-4668-81cb-8b7c770fd47b"

* status = #final
* effectiveDateTime = "2026-10-21T09:30:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* derivedFrom.reference = "urn:uuid:a3b9a389-6a6b-4a16-b862-9d2f51551ef5"
* component[+].code = $loinc#51963-7
* component[=].valueCodeableConcept.text = "Osimertinib"
* component[+].code = $loinc#51961-1
* component[=].valueCodeableConcept.text = "Responsive"
* component[+].code = $TbdCodesCS#conclusion-string
* component[=].valueString = "EGFR p.(Leu858Arg) is a sensitising mutation, predictive of response to EGFR tyrosine kinase inhibitors such as osimertinib."


Instance: GenomicStudyPanel-Somatic
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - Non-Small Cell Lung Cancer"
Description: "Fictitious example: overall study variables for the M4.1 multi-target NGS panel"
Usage: #inline

* identifier[+].value = "14ea83e6-334d-42f2-874d-4d32672c9661"

* status = #final
* effectiveDateTime = "2026-10-21T09:30:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#81306-3 "Variables that apply to the overall study"
* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* component[+]
  * code = $loinc#51967-8 "Genetic disease assessed [ID]"
  * valueCodeableConcept = $GCC#M4 "Non-Small Cell Lung Cancer"
* component[+]
  * code = $loinc#48018-6 "Gene studied [ID]"
  * valueCodeableConcept = $genenames#HGNC:3236 "EGFR"
* component[+]
  * code = $loinc#48018-6 "Gene studied [ID]"
  * valueCodeableConcept = $genenames#HGNC:1097 "BRAF"
* component[+]
  * code = $loinc#48018-6 "Gene studied [ID]"
  * valueCodeableConcept = $genenames#HGNC:6407 "KRAS"
* component[+]
  * code = $loinc#81293-3
  * valueString = "Hotspot regions of EGFR, ALK, BRAF, KRAS and MET"


Instance: FHIRDocumentGeneticReportBundle-Somatic
InstanceOf: BundleDocument
Title: "Bundle `Document` - Genomics Report Somatic (Non-Small Cell Lung Cancer)"
Description: "FHIR Document Genomics Report (Somatic, M4.1 Non-Small Cell Lung Cancer) for Ramsay Bolton, following HL7 Genomics Reporting Somatic Reporting. The therapeutic implication is in the Interpretation section."
Usage: #example
* insert DocumentBundle("5a1e7c3d-2f6b-4e8a-b0d9-6c4f2a8e1b73", "2026-10-21T09:30:00+00:00")
* insert EntryDocument("urn:uuid:e7e2432d-ec59-4de7-b26b-7e995067084b", Composition-GenomicsReport-Somatic)
* insert EntryDocument("urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7", Patient-Bolton)
// Order (also in the order message GenomicsOrderMessage-Somatic): ServiceRequest, requester and Specimen
* insert EntryDocument("urn:uuid:5b5d3536-7a68-4631-8c9c-dcaf79c1798b", ServiceRequest-Somatic)
* insert EntryDocument("urn:uuid:547e7b64-63b0-4a6c-b3fc-c832cf9fc5c5", PractitionerRole-Requester-Oncology-RBV)
* insert EntryDocument("urn:uuid:fb300032-6854-4c9e-aa21-972a2e1fcb56", Specimen-Somatic)
* insert EntryDocument("urn:uuid:0dc1fe99-b0ff-41f6-954f-ad6aaf1adf33", DiagnosticReport-GenomicsReport-Somatic)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:a3b9a389-6a6b-4a16-b862-9d2f51551ef5", Variant-Somatic-EGFR-L858R)
* insert EntryDocument("urn:uuid:675e7eaf-66d7-4668-81cb-8b7c770fd47b", TherapeuticImplication-Somatic-EGFR-L858R)
* insert EntryDocument("urn:uuid:14ea83e6-334d-42f2-874d-4d32672c9661", GenomicStudyPanel-Somatic)
