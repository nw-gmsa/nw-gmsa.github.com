// Whole Genome Sequencing (rare disease) report for the Proband of the dWGS Trio referral r26000000203.
// Fictitious example: the variant, classification and dates are illustrative only.

Instance: Composition-GenomicsReport-WGS
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Whole Genome Sequencing"
Description: "Composition - Genomics Report Whole Genome Sequencing (R27.3 Paediatric disorders) for the Proband of the dWGS Trio referral r26000000203"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:aaac7b4a-1484-4b06-a1a3-4200da1bce76"


* identifier
  * value = "8b0c4e52-wgs-r26000000203"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
* type.coding[+] = $GTD#R27.3
* type.coding[+] = $sct#1054161000000101 "Genetic report"

* date = "2026-10-28T14:10:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "NW GLH"
* attester[+].mode = #legal
* attester[=].time = "2026-10-28T14:10:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Whole Genome Sequencing"

* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"

* section[+]
  * title = "Referral"
  * code = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R27.3 Paediatric disorders (WGS). Trio analysis with both parents, NGIS referral r26000000203.</p></div>"

* section[+]
  * title = "Specimen"
  * code = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Whole blood (EDTA), sample S26-1A04. Collected 18-Aug-2026, received 26-Aug-2026.</p></div>"

* section[+]
  * title = "Result summary"
  * code = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Pathogenic de novo MECP2 variant detected. This result is consistent with the referral indication.</p></div>"
  * entry[+].reference = "urn:uuid:aaac7b4a-1484-4b06-a1a3-4200da1bce76"

* section[+]
  * title = "Results"
  * code = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>One sequence variant detected. No reportable structural or copy number variants.</p></div>"
  * section[+]
    * title = "Simple variants"
    * code = $loinc#81250-3
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>MECP2 NM_004992.4:c.763C&gt;T p.(Arg255Ter), heterozygous, de novo. Pathogenic.</p></div>"
    * entry[+].reference = "urn:uuid:50bd850b-f997-404e-bc4b-4a078ee37fa7"
  * section[+]
    * title = "Structural variants"
    * code = $loinc#81297-4
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No reportable structural or copy number variants detected.</p></div>"
    * emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

* section[+]
  * title = "Interpretation"
  * code = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>The variant was not detected in either parent and is classified as pathogenic. It confirms a diagnosis of MECP2-related disorder (Rett syndrome).</p></div>"
  * entry[+].reference = "urn:uuid:9a3327aa-558c-4f9e-aafd-13d4e976cd72"

* section[+]
  * title = "Recommendations"
  * code = $loinc#62385-0 "Recommendation [Interpretation] Document"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Referral to Clinical Genetics to discuss the result. The recurrence risk for the parents is low, but not zero because of the possibility of germline mosaicism.</p></div>"

* section[+]
  * title = "Methodology and limitations"
  * code = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Whole genome sequencing of the proband and both parents, analysed against the R27 Paediatric disorders virtual gene panels, with copy number and structural variant calling. Variants outside the panels are not reported.</p></div>"
  * entry[+].reference = "urn:uuid:aa2d7981-74d2-474e-9e1a-cd78cd485b72"


Instance: DiagnosticReport-GenomicsReport-WGS
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example - Whole Genome Sequencing"
Description: "Gilly Brough Whole Genome Sequencing (R27.3 Paediatric disorders)"
Usage: #inline

* extension[DiagnosticReportCompositionR5].valueReference.reference = "urn:uuid:3b50bc11-0026-4071-a29e-c8cc9c16d10e"
* identifier[ReportIdentifier]
  * value = "8b0c4e52-wgs-r26000000203"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.value = "4000000004"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699N0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R27.3
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"
* effectiveDateTime = "2026-08-18T00:00:00+00:00"
* issued = "2026-10-28T14:10:00+00:00"
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
* conclusion = "Pathogenic de novo MECP2 variant detected."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"
* result[+].reference = "urn:uuid:50bd850b-f997-404e-bc4b-4a078ee37fa7"
* result[+].reference = "urn:uuid:9a3327aa-558c-4f9e-aafd-13d4e976cd72"
* result[+].reference = "urn:uuid:aa2d7981-74d2-474e-9e1a-cd78cd485b72"


Instance: Variant-WGS-MECP2
InstanceOf: Variant
Title: "Variant - MECP2 (WGS)"
Description: "Fictitious example: de novo MECP2 sequence variant found by Whole Genome Sequencing"
Usage: #inline

* identifier[+].value = "50bd850b-f997-404e-bc4b-4a078ee37fa7"

* status = #final
* effectiveDateTime = "2026-10-28T14:10:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#69548-6 "Genetic variant assessment"
* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* method.text = "Whole genome sequencing (trio)"
* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:6990 "MECP2"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_004992.4
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_004992.4:c.763C>T
* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#NP_004983.1:p.(Arg255Ter)
* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6683-2 "Germline"
* component[+].code = $loinc#53034-5 "Allelic state"
* component[=].valueCodeableConcept = $loinc#LA6706-1 "Heterozygous"


Instance: DiagnosticImplication-WGS-MECP2
InstanceOf: DiagnosticImplication
Title: "Diagnostic Implication - MECP2 (WGS)"
Description: "Fictitious example: pathogenic classification of the de novo MECP2 variant"
Usage: #inline

* identifier[+].value = "9a3327aa-558c-4f9e-aafd-13d4e976cd72"

* status = #final
* effectiveDateTime = "2026-10-28T14:10:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* derivedFrom.reference = "urn:uuid:50bd850b-f997-404e-bc4b-4a078ee37fa7"
* component[clinical-significance].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[predicted-phenotype].valueCodeableConcept.text = "MECP2-related disorder (Rett syndrome)"
* component[conclusion-string].valueString = "De novo pathogenic MECP2 variant, consistent with the referral indication."


Instance: GenomicStudyPanel-WGS
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - Whole Genome Sequencing"
Description: "Fictitious example: overall study variables for the R27.3 Whole Genome Sequencing trio analysis"
Usage: #inline

* identifier[+].value = "aa2d7981-74d2-474e-9e1a-cd78cd485b72"

* status = #final
* effectiveDateTime = "2026-10-28T14:10:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#81306-3 "Variables that apply to the overall study"
* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* component[+]
  * code = $loinc#51967-8 "Genetic disease assessed [ID]"
  * valueCodeableConcept = $GCC#R27 "Paediatric disorders"
* component[+]
  * code = $loinc#81293-3
  * valueString = "Whole genome, analysed against the R27 Paediatric disorders virtual gene panels"
* component[+]
  * code = $loinc#62374-4
  * valueCodeableConcept = $loinc#LA26806-2 "GRCh38"


Instance: FHIRDocumentGeneticReportBundle-WGS
InstanceOf: BundleDocument
Title: "Bundle `Document` - Genomics Report Whole Genome Sequencing"
Description: "FHIR Document Genomics Report (Whole Genome Sequencing, R27.3 Paediatric disorders) for Gilly Brough, the Proband of the dWGS Trio referral r26000000203. Results use the Simple variants and Structural variants sub-sections."
Usage: #example
* insert DocumentBundle("3d7f6a1e-0b4c-4f1e-9a51-7c2f0e6b8d42", "2026-10-28T14:10:00+00:00")
* insert EntryDocument("urn:uuid:3b50bc11-0026-4071-a29e-c8cc9c16d10e", Composition-GenomicsReport-WGS)
* insert EntryDocument("urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7", Patient-Brough)
* insert EntryDocument("urn:uuid:aaac7b4a-1484-4b06-a1a3-4200da1bce76", DiagnosticReport-GenomicsReport-WGS)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:50bd850b-f997-404e-bc4b-4a078ee37fa7", Variant-WGS-MECP2)
* insert EntryDocument("urn:uuid:9a3327aa-558c-4f9e-aafd-13d4e976cd72", DiagnosticImplication-WGS-MECP2)
* insert EntryDocument("urn:uuid:aa2d7981-74d2-474e-9e1a-cd78cd485b72", GenomicStudyPanel-WGS)
