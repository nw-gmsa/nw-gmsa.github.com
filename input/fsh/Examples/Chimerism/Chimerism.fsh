// FHIR Messages for the Chimerism Monitoring ExampleScenario: the GT1368 chimerism order (O21) from The Clatterbridge
// Cancer Centre (REN) to the Histocompatibility and Immunogenetics laboratory (Histotrac, R0A), and the Laboratory Report
// (R01). Converted from the HL7 v2 examples in the Testing repo:
// https://github.com/nw-gmsa/Testing/blob/main/Input/Chimerism/Clatterbridge-REN-OML_O21.txt and
// https://github.com/nw-gmsa/Testing/blob/main/Input/Chimerism/Clatterbridge-REN-ORU_R01.txt
// Fictitious example: identifiers, dates and results are illustrative only.

RuleSet: LiverpoolSubject
* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

// Result Observation: OBX-3 LOINC code, then the local Histotrac (IMM) code from OBX-3.4
RuleSet: ChimerismResult(id, loinc, loincDisplay, local)
* insert GenomicResultObservation({id}, 2026-08-17T10:32:00+01:00, R0A, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST)
* code.coding[+] = $loinc#{loinc} "{loincDisplay}"
* code.coding[+] = Chimerism#{local}
* insert LiverpoolSubject
* specimen.reference = "urn:uuid:9e62aa72-44d2-4f12-9520-675786ddd362"

Instance: PractitionerRole-Requester-Haematology-REN
InstanceOf: PractitionerRole
Title: "PractitionerRole - haematologist (The Clatterbridge Cancer Centre)"
Description: "Fictitious example: requesting clinician (HL7 v2 ORC-12/OBR-16)"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C9000102"
* practitioner.display = "FICTITIOUS, Bernard"
* organization.identifier.system = $ods-code
* organization.identifier.value = "REN"
* organization.display = "THE CLATTERBRIDGE CANCER CENTRE NHS FOUNDATION TRUST"

Instance: PractitionerRole-Interpreter-HI-R0A
InstanceOf: PractitionerRole
Title: "PractitionerRole - clinical scientist (Histocompatibility and Immunogenetics laboratory)"
Description: "Fictitious example: the clinical scientist who authorised the chimerism report (HL7 v2 OBR-32 Principal Result Interpreter)"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/hcpc-number"
* practitioner.identifier.value = "CS90006"
* practitioner.display = "FICTITIOUS, Iris"
* organization.identifier.system = $ods-code
* organization.identifier.value = "R0A"
* organization.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

// Laboratory Order (LAB-1)

Instance: Specimen-Chimerism-Order
InstanceOf: Specimen
Title: "Specimen - peripheral blood for chimerism testing (as ordered)"
Description: "Fictitious example: the blood sample as sent with the order (HL7 v2 SPM). No specimen identifier is assigned by the Order Placer"
Usage: #example

* status = #available
* insert LiverpoolSubject
* type = $sct#119297000 "Blood specimen"
* collection.collectedDateTime = "2026-08-10T09:15:00+01:00"

Instance: ServiceRequest-Chimerism
InstanceOf: ServiceRequest
Title: "ServiceRequest - GT1368 Chimerism by STR Testing - Post Stem Cell Transplant"
Description: "Fictitious example: chimerism monitoring after an allogeneic stem cell transplant, ordered by The Clatterbridge Cancer Centre"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/REN"
* identifier[OrderPlacerNumber].value = "CB-260817-01"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "REN"
// ORC-4 Placer Group Number
* requisition.system = "http://www.acme.org/requisition/REN"
* requisition.value = "100826:GM1"
* requisition.assigner.identifier.system = $ods-code
* requisition.assigner.identifier.value = "REN"
* status = #active
* intent = #order
* priority = #routine
* authoredOn = "2026-08-10T09:00:00+01:00"
* code.coding[+] = $DGTS#GT1368 "Chimerism by STR Testing - Post Stem Cell Transplant"
* code.coding[+] = $loinc#112449-4 "Chimerism post transplant panel without cell selection - Specimen"
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:7dfc232c-0b01-46e6-834a-95a85b9090c9"
  * identifier.system = $ods-code
  * identifier.value = "REN"
* insert LiverpoolSubject
* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* specimen[+].reference = "urn:uuid:d327a578-2a4f-44ed-9ed4-39b479cb444e"
// OBR-31 local reason code POSTHSCT
* reasonCode[+].text = "Post allogeneic stem cell transplant chimerism monitoring"

Instance: MessageHeader-O21-Chimerism
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order GT1368 Chimerism (O21)"
Description: "Fictitious example: order from THE CLATTERBRIDGE CANCER CENTRE NHS FOUNDATION TRUST to the Histocompatibility and Immunogenetics laboratory (Histotrac)"
Usage: #example

* meta.lastUpdated = "2026-08-10T09:00:00+01:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "REN"
* sender.display = "THE CLATTERBRIDGE CANCER CENTRE NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/REN"
* source.software = "MEDITECH"
* focus[+]
  * reference = "urn:uuid:fae1337c-11bd-471d-9cf8-0ad85d257d7b"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-Chimerism
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order GT1368 Chimerism (O21)"
Description: "Fictitious example: the LAB-1 Laboratory Order in the [Chimerism Monitoring](ExampleScenario-ChimerismMonitoring.html) scenario, converted from the HL7 v2 OML^O21"
Usage: #example
* insert MessageBundle("urn:uuid:cdbef8e9-1ffa-470c-aa9e-22b335af3d5a", "2026-08-10T09:00:00+01:00")
* insert EntryDocument("urn:uuid:8cca19a8-57ea-40d8-9355-05dae22576a6", MessageHeader-O21-Chimerism)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:fae1337c-11bd-471d-9cf8-0ad85d257d7b", ServiceRequest-Chimerism)
* insert EntryDocument("urn:uuid:7dfc232c-0b01-46e6-834a-95a85b9090c9", PractitionerRole-Requester-Haematology-REN)
* insert EntryDocument("urn:uuid:d327a578-2a4f-44ed-9ed4-39b479cb444e", Specimen-Chimerism-Order)

// Laboratory Report (LAB-3)

Instance: Specimen-Chimerism
InstanceOf: Specimen
Title: "Specimen - peripheral blood for chimerism testing (as received)"
Description: "Fictitious example: the blood sample with the laboratory's specimen identifier (HL7 v2 SPM-2) and received time (SPM-18)"
Usage: #example

* identifier[FillerSpecimenNumber]
  * value = "SP-260810-01"
  * system = "http://www.acme.org/specimen/R0A"
  * type = $v2-0203#FILL
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* status = #available
* insert LiverpoolSubject
* type = $sct#119297000 "Blood specimen"
* collection.collectedDateTime = "2026-08-10T09:15:00+01:00"
* receivedTime = "2026-08-10T11:00:00+01:00"

Instance: Observation-Chimerism-Recipient
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - recipient-derived cells (chimerism), Ned Liverpool"
Description: "Fictitious example: 0% recipient-derived cells in peripheral blood by STR (OBX 1), i.e. full donor chimerism. Method and kit from the report's NTE segments"
Usage: #example

* insert ChimerismResult(f347bd24-5317-426d-a7df-2745213ba695, 104479-1, Cells.recipient derived/Cells in Blood or Tissue by Molecular genetics method --post stem cell transplant, STR)
* valueQuantity = 0 '%' "percent"
* method.text = "Chimerism analysis by STR technique."
* device.display = "Promega GenePrint 24 kit"

Instance: Observation-Chimerism-InformativeMarkers
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - informative STR markers (chimerism), Ned Liverpool"
Description: "Fictitious example: the STR markers that distinguish donor from recipient (OBX 2, a repeating value in HL7 v2)"
Usage: #example

* insert ChimerismResult(72098b78-c517-459d-8282-415de55f5c4f, 53035-2, DNA marker assessed [Identifier], IM)
* valueString = "D13S317, PENTA E, CSF1PO, PENTA D, D21S11, D8S1179, D12S391"

Instance: Observation-Chimerism-CellType
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - cell type tested (chimerism), Ned Liverpool"
Description: "Fictitious example: the cells the DNA was extracted from (OBX 3) - peripheral blood leukocytes, no cell selection"
Usage: #example

* insert ChimerismResult(4b08bdbe-fccc-4014-ab3c-47d1dc9ecf8e, 32760-1, Cell type in Specimen, EXT)
* valueString = "Peripheral blood leukocytes"

Instance: Observation-Chimerism-TimePostTransplant
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - time since transplant (chimerism), Ned Liverpool"
Description: "Fictitious example: 31 months since the stem cell transplant (OBX 4)"
Usage: #example

* insert ChimerismResult(e8b9d493-059f-455e-9fcd-64f2d56dcd37, 99782-5, Months [Time] --post transplant, POST)
* valueQuantity = 31 'mo' "month"

Instance: Observation-Chimerism-TransplantDate
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - date of transplant (chimerism), Ned Liverpool"
Description: "Fictitious example: the date of the stem cell transplant (OBX 5)"
Usage: #example

* insert ChimerismResult(58e8efd4-49c3-4eba-a55b-381f98dbd5a3, 68445-6, Date transplant, DTP)
* valueDateTime = "2024-01-10"

Instance: Observation-Chimerism-DonorID
InstanceOf: LaboratoryAnalyteResult
Title: "Observation - donor identifier (chimerism), Ned Liverpool"
Description: "Fictitious example: the stem cell donor's identifier (OBX 6)"
Usage: #example

* insert ChimerismResult(0e897244-1636-4eb5-b94a-0f19042499bf, 112446-0, Donor [Identifier] in Specimen from Donor, DID)
* valueString = "6939 DKM0 0096 2141 100"

Instance: DiagnosticReport-Chimerism-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - GT1368 Chimerism by STR Testing, Ned Liverpool"
Description: "Fictitious example: the Histocompatibility and Immunogenetics laboratory's LAB-3 report, based on the Laboratory Order (identified by its Order Placer Number), with the chimerism results and the report as a PDF"
Usage: #example

// Hand-written narrative: a generated one links presentedForm.url, and urn: is not a valid hyperlink scheme
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>GT1368 Chimerism by STR Testing - Post Stem Cell Transplant, for Ned LIVERPOOL. Recipient-derived cells 0% in peripheral blood, 31 months after transplant.</p></div>"
* identifier[ReportIdentifier]
  * value = "C,26.6512478.P"
  * system = "http://www.acme.org/diagnosticreport/identifiers/R0A"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/REN"
  * identifier.value = "CB-260817-01"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "REN"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[ProcedureCodeDigitalGenomicTestServices] = $DGTS#GT1368 "Chimerism by STR Testing - Post Stem Cell Transplant"
* code.coding[UKCoreReportCode] = $sct#4241000179101 "Laboratory report"
* code.coding[2] = $loinc#112449-4 "Chimerism post transplant panel without cell selection - Specimen"
* insert LiverpoolSubject
* effectiveDateTime = "2026-08-10T09:15:00+01:00"
* issued = "2026-08-17T10:32:00+01:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * type = #Organization
  * display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
// HL7 v2 OBR-32 Principal Result Interpreter
* resultsInterpreter[+]
  * type = "PractitionerRole"
  * reference = "urn:uuid:1aaad2ec-1779-453e-bfae-c0e6ea88fac4"
  * identifier.system = "https://fhir.hl7.org.uk/Id/hcpc-number"
  * identifier.value = "CS90006"
  * display = "FICTITIOUS, Iris"
* specimen[+].reference = "urn:uuid:9e62aa72-44d2-4f12-9520-675786ddd362"
* result[+].reference = "urn:uuid:f347bd24-5317-426d-a7df-2745213ba695"
* result[+].reference = "urn:uuid:72098b78-c517-459d-8282-415de55f5c4f"
* result[+].reference = "urn:uuid:4b08bdbe-fccc-4014-ab3c-47d1dc9ecf8e"
* result[+].reference = "urn:uuid:e8b9d493-059f-455e-9fcd-64f2d56dcd37"
* result[+].reference = "urn:uuid:58e8efd4-49c3-4eba-a55b-381f98dbd5a3"
* result[+].reference = "urn:uuid:0e897244-1636-4eb5-b94a-0f19042499bf"
* conclusion = "Recipient-derived cells 0% (full donor chimerism)."
* insert ReportPDF(urn:uuid:490dd702-7121-482d-ba0a-d5af6382f65a, GT1368 Chimerism Report - Ned LIVERPOOL, 2026-08-17)

// The report PDF (HL7 v2 OBX 7, ED) - written out rather than ReportPDFDocumentReferenceByIdentifier, which is for
// Genomic Test Directory genetic reports
Instance: DocumentReference-Chimerism-Report
InstanceOf: DocumentReference
Title: "Document Reference - GT1368 Chimerism Report PDF, Ned Liverpool"
Description: "Fictitious example: the Histocompatibility and Immunogenetics laboratory's LAB-3 report as a PDF, related to its DiagnosticReport and the Laboratory Order"
Usage: #example

* identifier[+].value = "08b5e6e6-4edd-4443-8cdc-684bb2b12189"
* identifier[=].system = "http://www.example.org/documentreference/identifier"
* identifier[=].assigner.identifier.system = $ods-code
* identifier[=].assigner.identifier.value = "R0A"
* status = #current
* date = "2026-08-17T10:32:00+01:00"
* type = $sct#909871000000100 "Histocompatibility and immunogenetics"
* insert LiverpoolSubject
* context.related[DiagnosticReport]
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "http://www.acme.org/diagnosticreport/identifiers/R0A"
  * identifier.value = "C,26.6512478.P"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
* context.related[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/REN"
  * identifier.value = "CB-260817-01"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "REN"
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:490dd702-7121-482d-ba0a-d5af6382f65a"
* context.event[+] = $DGTS#GT1368 "Chimerism by STR Testing - Post Stem Cell Transplant"

Instance: MessageHeader-R01-Chimerism
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report GT1368 Chimerism (R01)"
Description: "Fictitious example: LAB-3 report from the Histocompatibility and Immunogenetics laboratory (Histotrac) to THE CLATTERBRIDGE CANCER CENTRE NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-08-17T10:33:23+01:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "REN"
* destination.receiver.display = "THE CLATTERBRIDGE CANCER CENTRE NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/REN"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "Histotrac"
* focus[+]
  * reference = "urn:uuid:fd62bc04-10f6-4f00-a3d2-204547d9f54d"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-Chimerism
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report GT1368 Chimerism (R01)"
Description: "Fictitious example: the LAB-3 Laboratory Report in the [Chimerism Monitoring](ExampleScenario-ChimerismMonitoring.html) scenario, converted from the HL7 v2 ORU^R01: the chimerism results as Observations and the report as a PDF"
Usage: #example
* insert MessageBundle("urn:uuid:e540dbc7-9693-4143-9049-d747ca78ca60", "2026-08-17T10:33:23+01:00")
* insert EntryDocument("urn:uuid:7a20614c-05d3-4879-836d-e669b772e515", MessageHeader-R01-Chimerism)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:fd62bc04-10f6-4f00-a3d2-204547d9f54d", DiagnosticReport-Chimerism-Report)
* insert EntryDocument("urn:uuid:f347bd24-5317-426d-a7df-2745213ba695", Observation-Chimerism-Recipient)
* insert EntryDocument("urn:uuid:72098b78-c517-459d-8282-415de55f5c4f", Observation-Chimerism-InformativeMarkers)
* insert EntryDocument("urn:uuid:4b08bdbe-fccc-4014-ab3c-47d1dc9ecf8e", Observation-Chimerism-CellType)
* insert EntryDocument("urn:uuid:e8b9d493-059f-455e-9fcd-64f2d56dcd37", Observation-Chimerism-TimePostTransplant)
* insert EntryDocument("urn:uuid:58e8efd4-49c3-4eba-a55b-381f98dbd5a3", Observation-Chimerism-TransplantDate)
* insert EntryDocument("urn:uuid:0e897244-1636-4eb5-b94a-0f19042499bf", Observation-Chimerism-DonorID)
* insert EntryDocument("urn:uuid:9e62aa72-44d2-4f12-9520-675786ddd362", Specimen-Chimerism)
* insert EntryDocument("urn:uuid:1aaad2ec-1779-453e-bfae-c0e6ea88fac4", PractitionerRole-Interpreter-HI-R0A)
* insert EntryDocument("urn:uuid:08b5e6e6-4edd-4443-8cdc-684bb2b12189", DocumentReference-Chimerism-Report)
* insert EntryDocument("urn:uuid:490dd702-7121-482d-ba0a-d5af6382f65a", Binary-Sample)
