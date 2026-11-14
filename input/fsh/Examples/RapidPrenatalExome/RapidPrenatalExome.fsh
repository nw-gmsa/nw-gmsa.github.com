// FHIR Messages for the Rapid Prenatal Exome Sequencing ExampleScenario: the R21 Laboratory Order (LAB-1)
// from the fetal medicine unit at Manchester University NHS FT (R0A) to the North West GLH (699X0), the
// sub-order (LAB-35) to North Thames GLH via GOMS, its order status (O51), the sub-order report (LAB-36)
// and the Laboratory Report (LAB-3).
// North Thames GLH is hosted by Great Ormond Street Hospital, so it is identified here by GOSH's ODS code (RP4).
// Fictitious example: patients, identifiers, dates and results are illustrative only.

// Patients

Instance: Patient-Fetus-Wigan
InstanceOf: Patient
Title: "Patient - Fetus Wigan"
Description: "Fictitious example: the fetus, the subject of the R21 rapid prenatal exome sequencing order. A fetus has no NHS Number, so it is identified by the Trust's Medical Record Number."
Usage: #example

* active = true
* identifier[0].type = $v2-0203#MR
* identifier[0].value = "R0A-F26-0042"
* identifier[0].system = "http://www.acme.org/mrn/R0A"
* identifier[0].assigner.identifier.system = $ods-code
* identifier[0].assigner.identifier.value = "R0A"
* name.use = #temp
* name.family = "WIGAN"
* name.given = "Baby"
* birthDate = "2027"

Instance: Patient-Mother-Wigan
InstanceOf: Patient
Title: "Patient - Imogen Wigan (mother)"
Description: "Fictitious example: the mother of the fetus, tested as part of the trio"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383400"
* name.use = #official
* name.family = "WIGAN"
* name.given = "Imogen"
* birthDate = "1994-03-12"
* gender = #female

Instance: Patient-Father-Wigan
InstanceOf: Patient
Title: "Patient - Daniel Wigan (father)"
Description: "Fictitious example: the father of the fetus, tested as part of the trio"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383419"
* name.use = #official
* name.family = "WIGAN"
* name.given = "Daniel"
* birthDate = "1992-11-05"
* gender = #male

Instance: RelatedPerson-Mother-Wigan
InstanceOf: RelatedPerson
Title: "RelatedPerson - Imogen Wigan, mother of Fetus Wigan"
Description: "Fictitious example: links the mother to the fetus"
Usage: #example

* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383400"
* name.use = #official
* name.family = "WIGAN"
* name.given = "Imogen"
* relationship[0] = $v3-RoleCode#MTH "mother"
* patient.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* patient.display = "Baby WIGAN"
* birthDate = "1994-03-12"
* gender = #female

Instance: PractitionerRole-Requester-FetalMedicine-R0A
InstanceOf: PractitionerRole
Title: "PractitionerRole - fetal medicine consultant (Manchester University NHS FT)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C5678234"
* practitioner.display = "FICTITIOUS, Ruth"
* organization.identifier.system = $ods-code
* organization.identifier.value = "R0A"
* organization.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

// Laboratory Order (LAB-1)

RuleSet: RPXSpecimen(subject, display, nhs)
* status = #available
* subject.reference = {subject}
* subject.display = {display}
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = {nhs}

Instance: ServiceRequest-RPX-Order
InstanceOf: ServiceRequest
Title: "ServiceRequest - R21 Fetal anomalies with a likely genetic cause (Laboratory Order)"
Description: "Fictitious example: the LAB-1 order from the fetal medicine unit to the North West GLH. The fetus is the subject; the parents' samples are sent with it for trio testing."
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
* identifier[OrderPlacerNumber].value = "1702114"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "R0A"
* status = #active
* intent = #order
* priority = #urgent
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* code = $test-directory#R21.1
* authoredOn = "2026-09-07"
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:a363d816-72f1-416b-92d1-2dc74c00e1e8"
  * identifier.system = $ods-code
  * identifier.value = "R0A"
* subject.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* subject.display = "Baby WIGAN"
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* specimen[+].reference = "urn:uuid:a633e6ef-1a20-488a-8c1f-8574343e4dce"
* specimen[+].reference = "urn:uuid:0d4e7321-620c-4cdc-b490-6b24b4f622df"
* specimen[+].reference = "urn:uuid:9889dd88-2770-412a-bc62-06ddb31ebd2d"
* reasonCode[+] = $GCC#R21 "Fetal anomalies with a likely genetic cause"
* note[+].text = "Short, bowed long bones and multiple fractures on the 20-week anomaly scan. Fetal medicine and clinical genetics MDT agree the case is eligible for rapid prenatal exome sequencing (R21.2) if QF-PCR (R21.1) and microarray (R21.3) are normal. Trio samples sent."

Instance: Specimen-RPX-Fetal
InstanceOf: Specimen
Title: "Specimen - amniotic fluid (Fetus Wigan)"
Description: "Fictitious example: amniotic fluid from amniocentesis"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "R0A26-0090411"
  * system = "http://www.acme.org/specimen/R0A"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* status = #available
* subject.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* subject.display = "Baby WIGAN"
* type = $sct#119373006 "Amniotic fluid specimen"
* collection.collectedDateTime = "2026-09-07T11:00:00+00:00"
* receivedTime = "2026-09-07T15:30:00+00:00"

Instance: Specimen-RPX-Mother
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) (Imogen Wigan)"
Description: "Fictitious example: the mother's blood sample for trio testing"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "R0A26-0090412"
  * system = "http://www.acme.org/specimen/R0A"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* insert RPXSpecimen("urn:uuid:379561af-adbb-4894-985f-6fbcc501804e", "Imogen WIGAN", "9737383400")
* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* collection.collectedDateTime = "2026-09-07T11:15:00+00:00"
* receivedTime = "2026-09-07T15:30:00+00:00"

Instance: Specimen-RPX-Father
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) (Daniel Wigan)"
Description: "Fictitious example: the father's blood sample for trio testing"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "R0A26-0090413"
  * system = "http://www.acme.org/specimen/R0A"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* insert RPXSpecimen("urn:uuid:62386423-16ab-4cf3-9a8f-bccc651d503c", "Daniel WIGAN", "9737383419")
* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* collection.collectedDateTime = "2026-09-07T11:20:00+00:00"
* receivedTime = "2026-09-07T15:30:00+00:00"

Instance: MessageHeader-RPX-Order
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order R21 (O21), rapid prenatal exome"
Description: "Fictitious example: LAB-1 order from MANCHESTER UNIVERSITY NHS FOUNDATION TRUST to NORTH WEST GLH"
Usage: #example

* meta.lastUpdated = "2026-09-07T12:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.software = "EPIC"
* focus[+]
  * reference = "urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-RPX
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order R21 (O21), rapid prenatal exome"
Description: "Fictitious example: the LAB-1 Laboratory Order for the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario. The fetus is the subject, the mother is linked to the fetus by a RelatedPerson, and the trio's samples are carried with the order."
Usage: #example
* insert MessageBundle("urn:uuid:a4703fa8-ed94-4fdc-a97d-aa7321175b75", "2026-09-07T12:00:00+00:00")
* insert EntryDocument("urn:uuid:16055b1c-db32-41a0-b4aa-239c2863d5d3", MessageHeader-RPX-Order)
* insert EntryDocument("urn:uuid:e322141b-af07-451d-92ab-74d192151818", Patient-Fetus-Wigan)
* insert EntryDocument("urn:uuid:956ca674-005e-4459-81d8-6bd888729244", RelatedPerson-Mother-Wigan)
* insert EntryDocument("urn:uuid:379561af-adbb-4894-985f-6fbcc501804e", Patient-Mother-Wigan)
* insert EntryDocument("urn:uuid:62386423-16ab-4cf3-9a8f-bccc651d503c", Patient-Father-Wigan)
* insert EntryDocument("urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105", ServiceRequest-RPX-Order)
* insert EntryDocument("urn:uuid:a363d816-72f1-416b-92d1-2dc74c00e1e8", PractitionerRole-Requester-FetalMedicine-R0A)
* insert EntryDocument("urn:uuid:a633e6ef-1a20-488a-8c1f-8574343e4dce", Specimen-RPX-Fetal)
* insert EntryDocument("urn:uuid:0d4e7321-620c-4cdc-b490-6b24b4f622df", Specimen-RPX-Mother)
* insert EntryDocument("urn:uuid:9889dd88-2770-412a-bc62-06ddb31ebd2d", Specimen-RPX-Father)

// Laboratory Report - first-line result (LAB-3), alternative

RuleSet: RPXReportToTrust
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"

RuleSet: RPXBasedOnOrder
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
  * identifier.value = "1702114"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
  * reference = "urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105"

RuleSet: RPXReportFetus
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* subject.display = "Baby WIGAN"
// A fetus has no NHS Number, so it is identified by its Medical Record Number
* subject.identifier
  * type = $v2-0203#MR
  * value = "R0A-F26-0042"
  * system = "http://www.acme.org/mrn/R0A"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

RuleSet: RPXInterpreterNW
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"

Instance: DiagnosticReport-RPX-FirstLine
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R21 first-line result (QF-PCR), Fetus Wigan"
Description: "Fictitious example: the alternative path, where QF-PCR finds the cause and exome sequencing does not go ahead"
Usage: #example

* identifier[ReportIdentifier]
  * value = "G26-41180-QF"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* insert RPXBasedOnOrder
* insert RPXReportFetus
* code.coding[+] = $GTD#R21.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* specimen[+].reference = "urn:uuid:a633e6ef-1a20-488a-8c1f-8574343e4dce"
* effectiveDateTime = "2026-09-07T11:00:00+00:00"
* issued = "2026-09-09T10:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NORTH WEST GLH"
* insert RPXInterpreterNW
* conclusion = "QF-PCR: result consistent with trisomy 18. Microarray and rapid prenatal exome sequencing are not required."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"

Instance: MessageHeader-RPX-FirstLineReport
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R21.1 (R01), first-line result"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-09-09T10:00:00+00:00"
* insert RPXReportToTrust
* focus[+]
  * reference = "urn:uuid:33106624-dfc8-400c-9cbe-d569823366fb"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-RPX-FirstLine
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R21.1 (R01), first-line result"
Description: "Fictitious example: the LAB-3 report when the first-line tests find the cause, so no sub-order is sent, in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:684a2703-dbdc-4d26-8608-84357779b88b", "2026-09-09T10:00:00+00:00")
* insert EntryDocument("urn:uuid:8c1ec142-93a8-4980-b604-8ab5019efdb2", MessageHeader-RPX-FirstLineReport)
* insert EntryDocument("urn:uuid:e322141b-af07-451d-92ab-74d192151818", Patient-Fetus-Wigan)
* insert EntryDocument("urn:uuid:33106624-dfc8-400c-9cbe-d569823366fb", DiagnosticReport-RPX-FirstLine)
* insert EntryDocument("urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105", ServiceRequest-RPX-Order)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)

// Sub-order (LAB-35)

Instance: ServiceRequest-RPX-SubOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - R21.2 rapid prenatal exome sequencing (sub-order to North Thames GLH)"
Description: "Fictitious example: the LAB-35 sub-order from the North West GLH to North Thames GLH, with the trio's DNA. It is based on the Laboratory Order, and its requester and performer organisations differ."
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "https://fhir.nwgenomics.nhs.uk/iGene/OrderIdentifier"
* identifier[OrderPlacerNumber].value = "G26-41180"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"
* basedOn[+]
  * reference = "urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105"
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
  * identifier.value = "1702114"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "R0A"
* status = #active
* intent = #filler-order
* priority = #urgent
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* code = $test-directory#R21.2
* authoredOn = "2026-09-11"
* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* subject.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* subject.display = "Baby WIGAN"
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "RP4"
  * display = "NORTH THAMES GLH"
* specimen[+].reference = "urn:uuid:5bcb951e-a64c-461f-9334-8b9f932b1cbc"
* specimen[+].reference = "urn:uuid:90bc6eee-c9dc-451a-96ba-7f77c16efd0c"
* specimen[+].reference = "urn:uuid:dfae9e30-5ca3-4c7d-a191-d2e3bed1efa2"
* reasonCode[+] = $GCC#R21 "Fetal anomalies with a likely genetic cause"
* note[+].text = "Short, bowed long bones and multiple fractures on the 20-week anomaly scan. QF-PCR (R21.1) and microarray (R21.3) normal. Trio DNA sent by sample transport."

RuleSet: RPXDNA(value, parent)
* identifier[PlacerSpecimenNumber]
  * value = {value}
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/SpecimenIdentifier"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* type = $sct#258566005 "Deoxyribonucleic acid sample"
* parent.reference = {parent}
* collection.collectedDateTime = "2026-09-10T16:00:00+00:00"

Instance: Specimen-RPX-Fetal-DNA
InstanceOf: Specimen
Title: "Specimen - DNA (Fetus Wigan)"
Description: "Fictitious example: DNA extracted by the North West GLH from the amniotic fluid"
Usage: #example

* insert RPXDNA("G26-41180-D1", "urn:uuid:a633e6ef-1a20-488a-8c1f-8574343e4dce")
* status = #available
* subject.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* subject.display = "Baby WIGAN"

Instance: Specimen-RPX-Mother-DNA
InstanceOf: Specimen
Title: "Specimen - DNA (Imogen Wigan)"
Description: "Fictitious example: DNA extracted by the North West GLH from the mother's blood"
Usage: #example

* insert RPXDNA("G26-41180-D2", "urn:uuid:0d4e7321-620c-4cdc-b490-6b24b4f622df")
* insert RPXSpecimen("urn:uuid:379561af-adbb-4894-985f-6fbcc501804e", "Imogen WIGAN", "9737383400")

Instance: Specimen-RPX-Father-DNA
InstanceOf: Specimen
Title: "Specimen - DNA (Daniel Wigan)"
Description: "Fictitious example: DNA extracted by the North West GLH from the father's blood"
Usage: #example

* insert RPXDNA("G26-41180-D3", "urn:uuid:9889dd88-2770-412a-bc62-06ddb31ebd2d")
* insert RPXSpecimen("urn:uuid:62386423-16ab-4cf3-9a8f-bccc651d503c", "Daniel WIGAN", "9737383419")

Instance: MessageHeader-RPX-SubOrder
InstanceOf: MessageHeader
Title: "Message Header - Sub-order R21.2 (O21), rapid prenatal exome"
Description: "Fictitious example: LAB-35 sub-order from NORTH WEST GLH to NORTH THAMES GLH via GOMS"
Usage: #example

* meta.lastUpdated = "2026-09-11T09:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RP4"
* destination.receiver.display = "NORTH THAMES GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOMS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus[+]
  * reference = "urn:uuid:bc2ce852-cad4-4f35-aeac-c1c1021bf680"
  * type = #ServiceRequest

Instance: GenomicsSubOrderMessage-RPX
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order R21.2 (O21), rapid prenatal exome"
Description: "Fictitious example: the LAB-35 sub-order with the trio's DNA in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario. `intent` = `filler-order` and `basedOn` the Laboratory Order; the Laboratory Order is carried so the testing GLH has the original order details."
Usage: #example
* insert MessageBundle("urn:uuid:ffdea2ea-45f1-4204-96b4-03a6d74e3404", "2026-09-11T09:00:00+00:00")
* insert EntryDocument("urn:uuid:556a15b5-8d1d-47b3-9963-da6addd974c3", MessageHeader-RPX-SubOrder)
* insert EntryDocument("urn:uuid:e322141b-af07-451d-92ab-74d192151818", Patient-Fetus-Wigan)
* insert EntryDocument("urn:uuid:956ca674-005e-4459-81d8-6bd888729244", RelatedPerson-Mother-Wigan)
* insert EntryDocument("urn:uuid:379561af-adbb-4894-985f-6fbcc501804e", Patient-Mother-Wigan)
* insert EntryDocument("urn:uuid:62386423-16ab-4cf3-9a8f-bccc651d503c", Patient-Father-Wigan)
* insert EntryDocument("urn:uuid:bc2ce852-cad4-4f35-aeac-c1c1021bf680", ServiceRequest-RPX-SubOrder)
* insert EntryDocument("urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105", ServiceRequest-RPX-Order)
* insert EntryDocument("urn:uuid:a363d816-72f1-416b-92d1-2dc74c00e1e8", PractitionerRole-Requester-FetalMedicine-R0A)
* insert EntryDocument("urn:uuid:5bcb951e-a64c-461f-9334-8b9f932b1cbc", Specimen-RPX-Fetal-DNA)
* insert EntryDocument("urn:uuid:90bc6eee-c9dc-451a-96ba-7f77c16efd0c", Specimen-RPX-Mother-DNA)
* insert EntryDocument("urn:uuid:dfae9e30-5ca3-4c7d-a191-d2e3bed1efa2", Specimen-RPX-Father-DNA)
* insert EntryDocument("urn:uuid:a633e6ef-1a20-488a-8c1f-8574343e4dce", Specimen-RPX-Fetal)
* insert EntryDocument("urn:uuid:0d4e7321-620c-4cdc-b490-6b24b4f622df", Specimen-RPX-Mother)
* insert EntryDocument("urn:uuid:9889dd88-2770-412a-bc62-06ddb31ebd2d", Specimen-RPX-Father)

// Sub-order status (O51)

RuleSet: RPXSubOrderTask
* basedOn.reference = "urn:uuid:bc2ce852-cad4-4f35-aeac-c1c1021bf680"
* basedOn.identifier.type = $v2-0203#PLAC
* basedOn.identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/OrderIdentifier"
* basedOn.identifier.value = "G26-41180"
* basedOn.identifier.assigner.identifier.system = $ods-code
* basedOn.identifier.assigner.identifier.value = "699X0"
* focus.reference = "urn:uuid:bc2ce852-cad4-4f35-aeac-c1c1021bf680"
* for.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* for.display = "Baby WIGAN"
* intent = #order
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill
* authoredOn = "2026-09-11"
* requester.identifier.system = $ods-code
* requester.identifier.value = "699X0"
* requester.display = "NORTH WEST GLH"
* owner.identifier.system = $ods-code
* owner.identifier.value = "RP4"
* owner.display = "NORTH THAMES GLH"

RuleSet: RPXSubOrderStatusHeader(focus, date)
* meta.lastUpdated = {date}
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O51
* sender.identifier.system = $ods-code
* sender.identifier.value = "RP4"
* sender.display = "NORTH THAMES GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOMS"
* source.software = "GOMS"
* focus.reference = {focus}
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/referral-order-status"

Instance: Task-RPX-SubOrder-Accepted
InstanceOf: Task
Title: "Task - R21.2 sub-order accepted by North Thames GLH"
Description: "Fictitious example: North Thames GLH accepts the rapid prenatal exome sequencing sub-order"
Usage: #example
* insert RPXSubOrderTask
* status = #accepted
* businessStatus = ReferralWorkflowStatus#accepted
* lastModified = "2026-09-12T08:30:00+00:00"

Instance: MessageHeader-RPX-SubOrder-Accepted
InstanceOf: MessageHeader
Title: "Message Header - Sub-order status (O51), accepted"
Description: "Fictitious example: North Thames GLH accepts the sub-order"
Usage: #example
* insert RPXSubOrderStatusHeader("urn:uuid:05a5d155-cbfb-4033-84e1-a23c3548c2ed", "2026-09-12T08:30:00+00:00")

Instance: GenomicOrderStatusMessage-RPX-Accepted
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order status (O51), accepted - rapid prenatal exome"
Description: "Fictitious example: North Thames GLH accepts the sub-order in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario, routed to the North West GLH through GOMS"
Usage: #example
* insert MessageBundle("urn:uuid:d89a411d-6557-4b43-8976-e3ea4e5fff23", "2026-09-12T08:30:00+00:00")
* insert EntryDocument("urn:uuid:35791647-ddf8-416c-aad6-c177ee7334d0", MessageHeader-RPX-SubOrder-Accepted)
* insert EntryDocument("urn:uuid:05a5d155-cbfb-4033-84e1-a23c3548c2ed", Task-RPX-SubOrder-Accepted)

Instance: Task-RPX-SubOrder-Declined
InstanceOf: Task
Title: "Task - R21.2 sub-order declined by North Thames GLH"
Description: "Fictitious example: North Thames GLH declines the rapid prenatal exome sequencing sub-order because it does not meet the eligibility criteria"
Usage: #example
* insert RPXSubOrderTask
* status = #rejected
* businessStatus = ReferralWorkflowStatus#declined
* statusReason = ReferralStatusReason#not-eligible
* statusReason.text = "Does not meet the R21 rapid prenatal exome sequencing eligibility criteria: the scan findings are consistent with a single anomaly with a low likelihood of a monogenic cause. Please contact the laboratory to discuss."
* lastModified = "2026-09-12T08:30:00+00:00"

Instance: MessageHeader-RPX-SubOrder-Declined
InstanceOf: MessageHeader
Title: "Message Header - Sub-order status (O51), declined"
Description: "Fictitious example: North Thames GLH declines the sub-order"
Usage: #example
* insert RPXSubOrderStatusHeader("urn:uuid:7e5a413e-fc75-4d21-96d6-4700ab9c9c74", "2026-09-12T08:30:00+00:00")

Instance: GenomicOrderStatusMessage-RPX-Declined
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order status (O51), declined - rapid prenatal exome"
Description: "Fictitious example: North Thames GLH declines the sub-order in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario, with the reason in `Task.statusReason`"
Usage: #example
* insert MessageBundle("urn:uuid:ecdcd965-a220-4557-aae9-d7efdf3564ba", "2026-09-12T08:30:00+00:00")
* insert EntryDocument("urn:uuid:4ca21a1f-943e-4145-9731-5a319a667964", MessageHeader-RPX-SubOrder-Declined)
* insert EntryDocument("urn:uuid:7e5a413e-fc75-4d21-96d6-4700ab9c9c74", Task-RPX-SubOrder-Declined)

// Order status - not tested (O51), home GLH to the requesting clinician

Instance: Task-RPX-NotTested
InstanceOf: Task
Title: "Task - R21 Laboratory Order, rapid prenatal exome sequencing not done"
Description: "Fictitious example: the North West GLH tells the fetal medicine unit that rapid prenatal exome sequencing was not done because the testing GLH declined the sub-order"
Usage: #example
* basedOn.reference = "urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105"
* basedOn.identifier.type = $v2-0203#PLAC
* basedOn.identifier.system = "urn:oid:1.2.840.114350.1.13.0.1.7.2.798268"
* basedOn.identifier.value = "1702114"
* basedOn.identifier.assigner.identifier.system = $ods-code
* basedOn.identifier.assigner.identifier.value = "R0A"
* focus.reference = "urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105"
* for.reference = "urn:uuid:e322141b-af07-451d-92ab-74d192151818"
* for.display = "Baby WIGAN"
* intent = #order
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill
* authoredOn = "2026-09-07"
* requester.identifier.system = $ods-code
* requester.identifier.value = "R0A"
* requester.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* owner.identifier.system = $ods-code
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"
* status = #rejected
* businessStatus = ReferralWorkflowStatus#declined
* statusReason = ReferralStatusReason#not-eligible
* statusReason.text = "Rapid prenatal exome sequencing (R21.2) was declined by the testing GLH (North Thames GLH) as not meeting the eligibility criteria. QF-PCR and microarray were normal. Please contact the laboratory to discuss next steps."
* lastModified = "2026-09-12T10:00:00+00:00"

Instance: MessageHeader-RPX-NotTested
InstanceOf: MessageHeader
Title: "Message Header - Order status (O51), not tested"
Description: "Fictitious example: NORTH WEST GLH tells MANCHESTER UNIVERSITY NHS FOUNDATION TRUST the exome sequencing was not done"
Usage: #example
* meta.lastUpdated = "2026-09-12T10:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O51
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus.reference = "urn:uuid:8150ffbf-c4e4-438a-b876-c95d07c557d4"
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/referral-order-status"

Instance: GenomicOrderStatusMessage-RPX-NotTested
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Order status (O51), not tested - rapid prenatal exome"
Description: "Fictitious example: the North West GLH tells the requesting clinician that rapid prenatal exome sequencing was not done, in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:0e79740a-81b9-403e-90e4-ed252bc74620", "2026-09-12T10:00:00+00:00")
* insert EntryDocument("urn:uuid:a03bf9e7-99d7-4450-829c-45eca7aed4c0", MessageHeader-RPX-NotTested)
* insert EntryDocument("urn:uuid:8150ffbf-c4e4-438a-b876-c95d07c557d4", Task-RPX-NotTested)

// Sub-order Laboratory Report (LAB-36)

Instance: DiagnosticReport-RPX-SubOrder
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R21.2 rapid prenatal exome sequencing (North Thames GLH), Fetus Wigan"
Description: "Fictitious example: the LAB-36 report from North Thames GLH, based on the sub-order"
Usage: #example

* identifier[ReportIdentifier]
  * value = "NT26-77812"
  * system = "http://www.acme.org/diagnosticreport/identifiers/RP4"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RP4"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/OrderIdentifier"
  * identifier.value = "G26-41180"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
  * reference = "urn:uuid:bc2ce852-cad4-4f35-aeac-c1c1021bf680"
* insert RPXReportFetus
* code.coding[+] = $GTD#R21.2
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* specimen[+].reference = "urn:uuid:5bcb951e-a64c-461f-9334-8b9f932b1cbc"
* specimen[+].reference = "urn:uuid:90bc6eee-c9dc-451a-96ba-7f77c16efd0c"
* specimen[+].reference = "urn:uuid:dfae9e30-5ca3-4c7d-a191-d2e3bed1efa2"
* effectiveDateTime = "2026-09-10T16:00:00+00:00"
* issued = "2026-09-26T14:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "RP4"
  * type = #Organization
  * display = "NORTH THAMES GLH"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C7654321"
  * display = "FICTITIOUS, Priya"
* conclusion = "Heterozygous de novo pathogenic variant in COL1A1 identified in the fetus, consistent with osteogenesis imperfecta and the scan findings. The variant was not detected in either parent."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"

Instance: MessageHeader-RPX-SubOrderReport
InstanceOf: MessageHeader
Title: "Message Header - Sub-order Laboratory Report R21.2 (R01)"
Description: "Fictitious example: LAB-36 report from NORTH THAMES GLH to NORTH WEST GLH via GOMS"
Usage: #example

* meta.lastUpdated = "2026-09-26T14:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "RP4"
* sender.display = "NORTH THAMES GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOMS"
* source.software = "GOMS"
* focus[+]
  * reference = "urn:uuid:26c66a34-9028-4b14-866e-42d8284b17c4"
  * type = #DiagnosticReport

Instance: GenomicsSubOrderReportMessage-RPX
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order Laboratory Report R21.2 (R01), rapid prenatal exome"
Description: "Fictitious example: the LAB-36 report from North Thames GLH to the North West GLH, `basedOn` the sub-order, in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:5609cc8c-88a0-4523-94f9-f069effbb2ad", "2026-09-26T14:00:00+00:00")
* insert EntryDocument("urn:uuid:ed8385c2-7609-486c-a62f-b5f682529f60", MessageHeader-RPX-SubOrderReport)
* insert EntryDocument("urn:uuid:e322141b-af07-451d-92ab-74d192151818", Patient-Fetus-Wigan)
* insert EntryDocument("urn:uuid:26c66a34-9028-4b14-866e-42d8284b17c4", DiagnosticReport-RPX-SubOrder)
* insert EntryDocument("urn:uuid:bc2ce852-cad4-4f35-aeac-c1c1021bf680", ServiceRequest-RPX-SubOrder)
* insert EntryDocument("urn:uuid:379561af-adbb-4894-985f-6fbcc501804e", Patient-Mother-Wigan)
* insert EntryDocument("urn:uuid:62386423-16ab-4cf3-9a8f-bccc651d503c", Patient-Father-Wigan)
* insert EntryDocument("urn:uuid:5bcb951e-a64c-461f-9334-8b9f932b1cbc", Specimen-RPX-Fetal-DNA)
* insert EntryDocument("urn:uuid:90bc6eee-c9dc-451a-96ba-7f77c16efd0c", Specimen-RPX-Mother-DNA)
* insert EntryDocument("urn:uuid:dfae9e30-5ca3-4c7d-a191-d2e3bed1efa2", Specimen-RPX-Father-DNA)

// Laboratory Report (LAB-3)

Instance: DiagnosticReport-RPX-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R21 Fetal anomalies with a likely genetic cause, Fetus Wigan"
Description: "Fictitious example: the North West GLH's LAB-3 report to the requesting clinician, based on the Laboratory Order and including the testing GLH's result"
Usage: #example

* identifier[ReportIdentifier]
  * value = "G26-41180"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* insert RPXBasedOnOrder
* insert RPXReportFetus
* code.coding[+] = $GTD#R21.2
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* specimen[+].reference = "urn:uuid:a633e6ef-1a20-488a-8c1f-8574343e4dce"
* effectiveDateTime = "2026-09-07T11:00:00+00:00"
* issued = "2026-09-28T09:00:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NORTH WEST GLH"
* insert RPXInterpreterNW
* conclusion = "QF-PCR (R21.1) and microarray (R21.3): normal. Rapid prenatal exome sequencing (R21.2), performed by North Thames GLH: heterozygous de novo pathogenic variant in COL1A1, consistent with osteogenesis imperfecta."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"

Instance: MessageHeader-RPX-Report
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R21 (R01), rapid prenatal exome"
Description: "Fictitious example: LAB-3 report from NORTH WEST GLH to MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
Usage: #example

* meta.lastUpdated = "2026-09-28T09:00:00+00:00"
* insert RPXReportToTrust
* focus[+]
  * reference = "urn:uuid:0cd9fd4c-7934-4815-9573-e278229d3b9c"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-RPX
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R21 (R01), rapid prenatal exome"
Description: "Fictitious example: the LAB-3 Laboratory Report to the requesting clinician in the [Rapid Prenatal Exome Sequencing](ExampleScenario-RapidPrenatalExomeSequencing.html) scenario, `basedOn` the Laboratory Order"
Usage: #example
* insert MessageBundle("urn:uuid:ba930fa7-bc9e-40d9-a37c-d62914a0de89", "2026-09-28T09:00:00+00:00")
* insert EntryDocument("urn:uuid:5ffedde8-4c1f-4850-8248-b4f730db0a50", MessageHeader-RPX-Report)
* insert EntryDocument("urn:uuid:e322141b-af07-451d-92ab-74d192151818", Patient-Fetus-Wigan)
* insert EntryDocument("urn:uuid:0cd9fd4c-7934-4815-9573-e278229d3b9c", DiagnosticReport-RPX-Report)
* insert EntryDocument("urn:uuid:c8d8cbf0-8e46-429d-b100-44450cbef105", ServiceRequest-RPX-Order)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
