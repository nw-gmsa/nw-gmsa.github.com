// FHIR Messages and Document for the Inherited Breast Cancer (BRCA) ExampleScenario: the R208.1 Laboratory Order (O21)
// from East Cheshire NHS Trust (RJN) to the North West GLH (699X0), the Laboratory Report (R01), the FHIR Document for the
// central repository, and the referral of the family to clinical genetics for predictive testing (O19).
// Fictitious example: identifiers, dates and results are illustrative only.

// Patients

Instance: Patient-Congleton
InstanceOf: Patient
Title: "Patient - Margaery Congleton NHS Number: 9737383281"
Description: "Test Patient for Cheshire and Merseyside ICS - the patient with triple-negative breast cancer in the Inherited Breast Cancer (BRCA) scenario"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383281"
* identifier[1].type = $v2-0203#MR
* identifier[1].value = "M482113"
* identifier[1].assigner.identifier.system = $ods-code
* identifier[1].assigner.identifier.value = "RJN"
* name.use = #official
* name.family = "CONGLETON"
* name.given = "Margaery"
* birthDate = "1982-02-11"
* gender = #female
* address[+]
  * use = #home
  * type = #both
  * line[+] = "Town Hall"
  * line[+] = "7 High Street"
  * city = "CONGLETON"
  * postalCode = "CW12 1BN"
* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "N81027"

Instance: Patient-Buxton
InstanceOf: Patient
Title: "Patient - Lysa Buxton NHS Number: 9737383338"
Description: "Test Patient for Derbyshire ICS - the sister of Margaery Congleton, referred for predictive testing in the Inherited Breast Cancer (BRCA) scenario"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383338"
* name.use = #official
* name.family = "BUXTON"
* name.given = "Lysa"
* birthDate = "1971-01-01"
* gender = #female
* address[+]
  * use = #home
  * type = #both
  * line[+] = "Market Place"
  * city = "BUXTON"
  * postalCode = "SK17 6EL"
* generalPractitioner[+]
  * identifier.system = $ods-code
  * identifier.value = "C81065"

RuleSet: CongletonSubject
* subject.reference = "urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3"
* subject.display = "Margaery CONGLETON"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383281"

Instance: PractitionerRole-Requester-Breast-RJN
InstanceOf: PractitionerRole
Title: "PractitionerRole - breast surgeon (East Cheshire NHS Trust)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C4567891"
* practitioner.display = "FICTITIOUS, Helen"
* organization.identifier.system = $ods-code
* organization.identifier.value = "RJN"
* organization.display = "EAST CHESHIRE NHS TRUST"

// Laboratory Order (LAB-1)

Instance: DocumentReference-BreastCancer-PathologyReport
InstanceOf: DocumentReference
Title: "Document Reference - Cellular pathology report (breast core biopsy), Margaery Congleton"
Description: "Fictitious example: a copy of Histopathology's report on the breast core biopsy - invasive breast cancer, oestrogen receptor (ER), progesterone receptor (PR) and HER2 negative (triple negative) - as a PDF, sent with the Laboratory Order as clinical context (ServiceRequest.supportingInfo)"
Usage: #example

* identifier[+]
  * system = "http://www.acme.org/documentreference/identifier/RJN"
  * value = "H26-30871"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RJN"
* status = #current
* date = "2026-09-28T14:00:00+00:00"
* type = $sct#1054291000000102 "Cellular pathology report"
* author[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "RJN"
  * display = "Histopathology, EAST CHESHIRE NHS TRUST"
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:db8d3ed1-449c-4cbd-b740-1d6469fea782"
  * attachment.title = "Cellular pathology report - Margaery CONGLETON"
* insert CongletonSubject

Instance: Specimen-BreastCancer
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) for inherited breast cancer testing"
Description: "Fictitious example: peripheral blood (EDTA) for BRCA testing"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "26GEN-RJN-008734"
  * system = "http://www.acme.org/specimen/RJN"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RJN"
* status = #available
* insert CongletonSubject
* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* collection.collectedDateTime = "2026-10-05T10:00:00+00:00"
* receivedTime = "2026-10-06T09:00:00+00:00"

Instance: ServiceRequest-BreastCancer
InstanceOf: ServiceRequest
Title: "ServiceRequest - R208.1 Inherited breast cancer and ovarian cancer"
Description: "Fictitious example: request for genetic testing (diagnostic testing) for a woman with triple-negative breast cancer at a young age, with a copy of the pathology report"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/RJN"
* identifier[OrderPlacerNumber].value = "RJN-26-48213"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "RJN"
* status = #active
* intent = #order
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* authoredOn = "2026-10-05"
* code = $test-directory#R208.1
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:92b2469f-10c0-4638-84d5-9c04b53be163"
  * identifier.system = $ods-code
  * identifier.value = "RJN"
* insert CongletonSubject
* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* specimen[+].reference = "urn:uuid:fbcaee67-e412-4d89-ae54-5f38cba8fe30"
* reasonCode[+] = $GCC#R208 "Inherited breast cancer and ovarian cancer"
* reasonCode[+] = $sct#706970001 "Triple-negative breast cancer"
// A copy of the pathology report (receptor status) as clinical context
* supportingInfo[clinicalContext]
  * reference = "urn:uuid:52d3d913-91ce-4bc0-94b3-150396bc42f0"
  * type = "DocumentReference"
  * display = "Cellular pathology report - breast core biopsy"
* note[+].text = "Triple-negative invasive breast cancer diagnosed at 44. No known family history. Genetic testing offered regardless of family history."

Instance: MessageHeader-O21-BreastCancer
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order R208.1 Inherited breast cancer and ovarian cancer O21"
Description: "Fictitious example: order from EAST CHESHIRE NHS TRUST to NORTH WEST GLH"
Usage: #example

* meta.lastUpdated = "2026-10-05T10:30:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "RJN"
* sender.display = "EAST CHESHIRE NHS TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RJN"
* source.software = "ECT EPR"
* focus[+]
  * reference = "urn:uuid:5a09314c-e738-4fbc-87ac-d132fbdb2071"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-BreastCancer
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomics Order R208.1 Inherited breast cancer and ovarian cancer O21"
Description: "Fictitious example: the LAB-1 Laboratory Order in the [Inherited Breast Cancer (BRCA)](ExampleScenario-BreastCancer.html) scenario, with a copy of the pathology report as ServiceRequest.supportingInfo"
Usage: #example
* insert MessageBundle("urn:uuid:275b30d2-1af0-4b9a-9bb8-52caf89a7403", "2026-10-05T10:30:00+00:00")
* insert EntryDocument("urn:uuid:1f3801a4-e3d6-4940-bba8-846cbb74a4b7", MessageHeader-O21-BreastCancer)
* insert EntryDocument("urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3", Patient-Congleton)
* insert EntryDocument("urn:uuid:5a09314c-e738-4fbc-87ac-d132fbdb2071", ServiceRequest-BreastCancer)
* insert EntryDocument("urn:uuid:92b2469f-10c0-4638-84d5-9c04b53be163", PractitionerRole-Requester-Breast-RJN)
* insert EntryDocument("urn:uuid:fbcaee67-e412-4d89-ae54-5f38cba8fe30", Specimen-BreastCancer)
* insert EntryDocument("urn:uuid:52d3d913-91ce-4bc0-94b3-150396bc42f0", DocumentReference-BreastCancer-PathologyReport)
* insert EntryDocument("urn:uuid:db8d3ed1-449c-4cbd-b740-1d6469fea782", Binary-Sample)

// Laboratory Report (LAB-3)

Instance: DiagnosticReport-BreastCancer-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R208.1 Inherited breast cancer and ovarian cancer, Margaery Congleton"
Description: "Fictitious example: the North West GLH's LAB-3 report, based on the Laboratory Order (identified by its Order Placer Number), with the BRCA1 variant and its diagnostic implication as results"
Usage: #example

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R208.1 Inherited breast cancer and ovarian cancer, for Margaery CONGLETON. Heterozygous pathogenic BRCA1 variant NM_007294.3:c.68_69del, consistent with hereditary breast and ovarian cancer.</p></div>"
* identifier[ReportIdentifier]
  * value = "G26-48213"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RJN"
  * identifier.value = "RJN-26-48213"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RJN"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R208.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* insert CongletonSubject
* effectiveDateTime = "2026-10-05T10:00:00+00:00"
* issued = "2026-10-26T12:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NORTH WEST GLH"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"
* conclusion = "Heterozygous pathogenic BRCA1 variant detected, consistent with hereditary breast and ovarian cancer. Predictive testing is available for relatives."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* result[+].reference = "urn:uuid:48d4cbac-aca4-4f75-921c-013da5174824"
* result[+].reference = "urn:uuid:3802e85c-cb2e-415c-9e25-1b694d98c663"
* insert ReportPDF(urn:uuid:fc8c5611-f3bc-4d54-9645-c054fecede15, R208.1 Laboratory Report - Margaery CONGLETON, 2026-10-26)

Instance: Variant-BreastCancer-BRCA1
InstanceOf: Variant
Title: "Variant - BRCA1, Margaery Congleton"
Description: "Fictitious example: the germline BRCA1 variant found by the North West GLH"
Usage: #example

* insert GenomicResultObservation(48d4cbac-aca4-4f75-921c-013da5174824, 2026-10-26T12:00:00+00:00, 699X0, NORTH WEST GLH)
* code = $loinc#69548-6 "Genetic variant assessment"
* insert CongletonSubject
* valueCodeableConcept = $loinc#LA9633-4 "Present"
* method = $sct#264896000 "Nucleic acid analysis"
* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:1100 "BRCA1"
* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_007294.3
* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_007294.3:c.68_69del
* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6683-2 "Germline"
* component[+].code = $loinc#53034-5 "Allelic state"
* component[=].valueCodeableConcept = $loinc#LA6706-1 "Heterozygous"

Instance: DiagnosticImplication-BreastCancer-BRCA1
InstanceOf: DiagnosticImplication
Title: "Diagnostic Implication - BRCA1, Margaery Congleton"
Description: "Fictitious example: pathogenic classification of the BRCA1 variant, consistent with hereditary breast and ovarian cancer"
Usage: #example

* insert GenomicResultObservation(3802e85c-cb2e-415c-9e25-1b694d98c663, 2026-10-26T12:00:00+00:00, 699X0, NORTH WEST GLH)
* insert CongletonSubject
* derivedFrom.reference = "urn:uuid:48d4cbac-aca4-4f75-921c-013da5174824"
* component[clinical-significance].valueCodeableConcept = $loinc#LA6668-3 "Pathogenic"
* component[predicted-phenotype].valueCodeableConcept = $sct#718220008 "Hereditary breast and ovarian cancer syndrome"
* component[conclusion-string].valueString = "Heterozygous pathogenic BRCA1 variant, consistent with hereditary breast and ovarian cancer."

Instance: DocumentReference-BreastCancer-Report
InstanceOf: DocumentReference
Title: "Document Reference - R208.1 Laboratory Report PDF, Margaery Congleton"
Description: "Fictitious example: the North West GLH's LAB-3 report as a PDF, related to its DiagnosticReport and the Laboratory Order"
Usage: #example

* insert ReportPDFDocumentReference(70ce6e2f-6588-4469-aeaf-4a56c394f47e, 699X0, 2026-10-26T12:00:00+00:00, urn:uuid:8c0097b8-cc07-4f84-b8f3-63ed163207ce, http://www.acme.org/diagnosticreport/identifiers, G26-48213, http://www.acme.org/servicerequest/RJN, RJN-26-48213, RJN, urn:uuid:fc8c5611-f3bc-4d54-9645-c054fecede15, R208.1)
* insert CongletonSubject

Instance: MessageHeader-R01-BreastCancer
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R208.1 (R01), Inherited breast cancer and ovarian cancer"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to EAST CHESHIRE NHS TRUST"
Usage: #example

* meta.lastUpdated = "2026-10-26T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RJN"
* destination.receiver.display = "EAST CHESHIRE NHS TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RJN"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:8c0097b8-cc07-4f84-b8f3-63ed163207ce"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-BreastCancer
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R208.1 (R01), Inherited breast cancer and ovarian cancer"
Description: "Fictitious example: the LAB-3 Laboratory Report in the [Inherited Breast Cancer (BRCA)](ExampleScenario-BreastCancer.html) scenario, with the variant and diagnostic implication results and the report as a PDF. The FHIR Document for the central repository includes all of these results."
Usage: #example
* insert MessageBundle("urn:uuid:004e4011-782b-499e-ae78-afb8294e26f1", "2026-10-26T12:00:00+00:00")
* insert EntryDocument("urn:uuid:167ffe0f-1704-4d40-88e9-7317ac0aa4e4", MessageHeader-R01-BreastCancer)
* insert EntryDocument("urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3", Patient-Congleton)
* insert EntryDocument("urn:uuid:8c0097b8-cc07-4f84-b8f3-63ed163207ce", DiagnosticReport-BreastCancer-Report)
* insert EntryDocument("urn:uuid:48d4cbac-aca4-4f75-921c-013da5174824", Variant-BreastCancer-BRCA1)
* insert EntryDocument("urn:uuid:3802e85c-cb2e-415c-9e25-1b694d98c663", DiagnosticImplication-BreastCancer-BRCA1)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:70ce6e2f-6588-4469-aeaf-4a56c394f47e", DocumentReference-BreastCancer-Report)
* insert EntryDocument("urn:uuid:fc8c5611-f3bc-4d54-9645-c054fecede15", Binary-Sample)

// FHIR Document for the central repository

Instance: Composition-GenomicsReport-BreastCancer
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Inherited breast cancer and ovarian cancer (BRCA)"
Description: "Fictitious example: the Laboratory Report for Margaery Congleton as a FHIR Document"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:8c0097b8-cc07-4f84-b8f3-63ed163207ce"
* identifier
  * value = "G26-48213"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* status = #final
* type.coding[+] = $GTD#R208.1
* type.coding[+] = $sct#1054161000000101 "Genetic report"
* date = "2026-10-26T12:00:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "NORTH WEST GLH"
* attester[+].mode = #legal
* attester[=].time = "2026-10-26T12:00:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"
* title = "Genomics Report - Inherited breast cancer and ovarian cancer"
* subject.reference = "urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3"
* subject.display = "Margaery CONGLETON"

// Sections in reading order. SUSHI pre-fills the profile's required section slices at the first
// positions, so each section sets code.coding[0] (replacing the pre-filled code) rather than code.
* section[+]
  * title = "Referral"
  * code.coding[0] = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R208 Inherited breast cancer and ovarian cancer. Triple-negative breast cancer diagnosed at 44; no known family history.</p></div>"
  * entry[+].reference = "urn:uuid:5a09314c-e738-4fbc-87ac-d132fbdb2071"
* section[+]
  * title = "Specimen"
  * code.coding[0] = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Peripheral blood (EDTA). Received 06-Oct-2026.</p></div>"
  * entry[+].reference = "urn:uuid:fbcaee67-e412-4d89-ae54-5f38cba8fe30"
* section[+]
  * title = "Result summary"
  * code.coding[0] = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Pathogenic BRCA1 variant detected.</p></div>"
  * entry[+].reference = "urn:uuid:8c0097b8-cc07-4f84-b8f3-63ed163207ce"
* section[+]
  * title = "Results"
  * code.coding[0] = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>One sequence variant detected.</p></div>"
  * section[+]
    * title = "Simple variants"
    * code = $loinc#81250-3
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>BRCA1 NM_007294.3:c.68_69del, germline, heterozygous.</p></div>"
    * entry[+].reference = "urn:uuid:48d4cbac-aca4-4f75-921c-013da5174824"
* section[+]
  * title = "Results from other laboratories"
  * code.coding[0] = GenomicReportSection#other-laboratory-results
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Breast core biopsy (Histopathology, East Cheshire NHS Trust): invasive breast cancer, oestrogen receptor, progesterone receptor and HER2 negative (triple negative).</p></div>"
  * entry[+].reference = "urn:uuid:52d3d913-91ce-4bc0-94b3-150396bc42f0"
* section[+]
  * title = "Interpretation"
  * code.coding[0] = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Pathogenic. Hereditary breast and ovarian cancer (BRCA1). Predictive testing is available for relatives; each child of someone with a BRCA1 variant has a 1 in 2 chance of inheriting it.</p></div>"
  * entry[+].reference = "urn:uuid:3802e85c-cb2e-415c-9e25-1b694d98c663"
* section[+]
  * title = "Methodology and limitations"
  * code.coding[0] = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R208.1 Inherited breast cancer and ovarian cancer (small panel): sequencing and copy number analysis of the genes in the panel.</p></div>"

Instance: FHIRDocumentGeneticReportBundle-BreastCancer
InstanceOf: BundleDocument
Title: "Bundle `Document` - Genomics Report Inherited breast cancer and ovarian cancer (BRCA)"
Description: "Fictitious example: FHIR Document Genomics Report for Margaery Congleton in the [Inherited Breast Cancer (BRCA)](ExampleScenario-BreastCancer.html) scenario. It includes every Observation from the R01 Laboratory Report."
Usage: #example
* insert DocumentBundle("bf096289-d7e1-4550-ab65-96f82c8bb4f6", "2026-10-26T12:00:00+00:00")
* insert EntryDocument("urn:uuid:8c2bb51e-a410-442b-90dc-4fe99e886fdc", Composition-GenomicsReport-BreastCancer)
* insert EntryDocument("urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3", Patient-Congleton)
* insert EntryDocument("urn:uuid:5a09314c-e738-4fbc-87ac-d132fbdb2071", ServiceRequest-BreastCancer)
* insert EntryDocument("urn:uuid:92b2469f-10c0-4638-84d5-9c04b53be163", PractitionerRole-Requester-Breast-RJN)
* insert EntryDocument("urn:uuid:fbcaee67-e412-4d89-ae54-5f38cba8fe30", Specimen-BreastCancer)
* insert EntryDocument("urn:uuid:52d3d913-91ce-4bc0-94b3-150396bc42f0", DocumentReference-BreastCancer-PathologyReport)
* insert EntryDocument("urn:uuid:db8d3ed1-449c-4cbd-b740-1d6469fea782", Binary-Sample)
* insert EntryDocument("urn:uuid:8c0097b8-cc07-4f84-b8f3-63ed163207ce", DiagnosticReport-BreastCancer-Report)
* insert EntryDocument("urn:uuid:fc8c5611-f3bc-4d54-9645-c054fecede15", Binary-Sample)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:48d4cbac-aca4-4f75-921c-013da5174824", Variant-BreastCancer-BRCA1)
* insert EntryDocument("urn:uuid:3802e85c-cb2e-415c-9e25-1b694d98c663", DiagnosticImplication-BreastCancer-BRCA1)

// Referral to clinical genetics (O19): predictive testing of relatives

Instance: Group-BreastCancer-Family-Congleton
InstanceOf: FamilyGeneticGroup
Title: "Family Genetic Group - Congleton family (Duo)"
Description: "Fictitious example: Margaery Congleton (proband) and her sister Lysa Buxton, the subject of the referral to clinical genetics for predictive testing"
Usage: #example

* identifier[PedigreeNumber]
  * type = $v2-0203#PGN
  * system = "https://fhir.nhs.uk/Id/genomics-pedigree-number"
  * value = "PED-2026-0482"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RJN"
* type = #person
* actual = true
* code = $nwgmsa#FamilyStructureDuo "Duo"
* name = "Congleton family"
* quantity = 2
* member[+]
  * entity.reference = "urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3"
  * entity.display = "Margaery CONGLETON"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#ONESELF "self"
* member[+]
  * entity.reference = "urn:uuid:b74f7d63-fb4e-423f-831d-ab96431df5b6"
  * entity.display = "Lysa BUXTON"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#SIS "sister"

Instance: DocumentReference-BreastCancer-Registry-GenomicReport
InstanceOf: DocumentReference
Title: "Document Reference - R208.1 Genomic Report document on the central registry, Margaery Congleton"
Description: "Fictitious example: the Genomic Report document (FHIR Document) for the R208.1 testing, held on the central registry (UGR) and referenced from the referral to clinical genetics"
Usage: #example

* identifier[+]
  * type = $v2-0203#FILL
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * value = "G26-48213"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* status = #current
* date = "2026-10-26T12:30:00+00:00"
* type = $sct#1054161000000101 "Genetic report"
* author[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* custodian
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "X26"
  * display = "NHS ENGLAND"
* context.related[DiagnosticReport]
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "http://www.acme.org/diagnosticreport/identifiers"
  * identifier.value = "G26-48213"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* context.related[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RJN"
  * identifier.value = "RJN-26-48213"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RJN"
* context.event[+] = $test-directory#R208.1
* content[+]
  * attachment.contentType = #application/fhir+json
  * attachment.url = "https://ugr.example.nhs.uk/FHIR/R4/Bundle/G26-48213"
  * attachment.title = "R208.1 Genomic Report - Margaery CONGLETON"
* insert CongletonSubject

Instance: ServiceRequest-BreastCancer-Referral
InstanceOf: http://hl7.org/fhir/StructureDefinition/ServiceRequest
Title: "ServiceRequest - Referral of the Congleton family to clinical genetics (predictive testing)"
Description: "Fictitious example: after the Laboratory Report finds a pathogenic BRCA1 variant, the requesting clinician refers the family to clinical genetics so relatives can have predictive testing. A clinical referral, not a laboratory order: the subject is the family, and the testing done is referenced as the Genomic Report document on the central registry."
Usage: #example

* identifier[+]
  * type = $v2-0203#PLAC
  * system = "http://www.acme.org/servicerequest/RJN"
  * value = "RJN-REF-26-1188"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RJN"
* status = #active
* intent = #order
* priority = #routine
* code = $sct#306119003 "Referral to genetics service"
* subject
  * reference = "urn:uuid:6f46c32e-7fb9-4ec8-bb91-b5f05c32b7ff"
  * type = "Group"
  * display = "Congleton family"
* authoredOn = "2026-10-30"
* requester
  * type = "PractitionerRole"
  * reference = "urn:uuid:92b2469f-10c0-4638-84d5-9c04b53be163"
  * display = "FICTITIOUS, Helen"
* performer[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "MANCHESTER CENTRE FOR GENOMIC MEDICINE"
* reasonCode[+] = $GCC#R208 "Inherited breast cancer and ovarian cancer"
* supportingInfo[+]
  * type = "DocumentReference"
  * reference = "urn:uuid:27b414a2-b752-41c5-a8d0-86122c46cfb9"
  * display = "R208.1 Genomic Report document (central registry), Margaery Congleton"
* note[+].text = "Heterozygous pathogenic BRCA1 variant found in Margaery Congleton. Please see the family for genetic counselling and predictive testing of relatives for the same variant."

Instance: MessageHeader-BreastCancer-Referral
InstanceOf: MessageHeader
Title: "Message Header - Referral to clinical genetics (O19), BRCA predictive testing"
Description: "Fictitious example: referral from EAST CHESHIRE NHS TRUST to the MANCHESTER CENTRE FOR GENOMIC MEDICINE, sent via NHS e-Referral Service (eRS) or a Genomics England Limited application"
Usage: #example

* meta.lastUpdated = "2026-10-30T11:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O19
* sender.identifier.system = $ods-code
* sender.identifier.value = "RJN"
* sender.display = "EAST CHESHIRE NHS TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER CENTRE FOR GENOMIC MEDICINE"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/eRS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RJN"
* source.software = "ECT EPR"
* focus[+]
  * reference = "urn:uuid:eda9b7b1-af8e-4b9c-8b5f-a99f39dd2294"
  * type = #ServiceRequest
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/referral-order"

Instance: GenomicsReferralMessage-BreastCancer
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Referral to clinical genetics (O19), BRCA predictive testing"
Description: "Fictitious example: the referral of the family to clinical genetics for predictive testing in the [Inherited Breast Cancer (BRCA)](ExampleScenario-BreastCancer.html) scenario. The subject is the family (a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html)) and the Genomic Report document for the testing done, held on the central registry, is referenced as supporting information."
Usage: #example
* insert MessageBundle("urn:uuid:bfd06c25-451f-4619-bd8e-849ec115f2e5", "2026-10-30T11:00:00+00:00")
* insert EntryDocument("urn:uuid:0531b4c8-47d6-4705-9e94-27c01dc8f9b5", MessageHeader-BreastCancer-Referral)
* insert EntryDocument("urn:uuid:eda9b7b1-af8e-4b9c-8b5f-a99f39dd2294", ServiceRequest-BreastCancer-Referral)
* insert EntryDocument("urn:uuid:6f46c32e-7fb9-4ec8-bb91-b5f05c32b7ff", Group-BreastCancer-Family-Congleton)
* insert EntryDocument("urn:uuid:cc329921-f9c6-45b4-8bbe-782834e293b3", Patient-Congleton)
* insert EntryDocument("urn:uuid:b74f7d63-fb4e-423f-831d-ab96431df5b6", Patient-Buxton)
* insert EntryDocument("urn:uuid:92b2469f-10c0-4638-84d5-9c04b53be163", PractitionerRole-Requester-Breast-RJN)
* insert EntryDocument("urn:uuid:27b414a2-b752-41c5-a8d0-86122c46cfb9", DocumentReference-BreastCancer-Registry-GenomicReport)
