// FHIR Messages for the Specialist Test for Another GLH ExampleScenario: Great Ormond Street Hospital orders
// R67.1 Monogenic hearing loss from North Thames GLH (LAB-1), which sends a sub-order (LAB-35) to the North West
// GLH (699X0) via GOMS. The North West GLH sends the order status (O51) and the sub-order report (LAB-36), and
// North Thames GLH reports to GOSH (LAB-3).
// North Thames GLH is hosted by Great Ormond Street Hospital, so both are identified here by GOSH's ODS code (RP4).
// Fictitious example: patient, identifiers, dates and results are illustrative only.

Instance: Patient-Camden
InstanceOf: Patient
Title: "Patient - Oliver Camden"
Description: "Fictitious example: a child with bilateral sensorineural hearing loss, a patient of Great Ormond Street Hospital"
Usage: #example

* active = true
* identifier[0].use = #official
* identifier[0].type = $v2-0203#NH
* identifier[0].system = $nhs-number
* identifier[0].value = "9737383427"
* name.use = #official
* name.family = "CAMDEN"
* name.given = "Oliver"
* birthDate = "2025-02-14"
* gender = #male

Instance: PractitionerRole-Requester-Audiology-RP4
InstanceOf: PractitionerRole
Title: "PractitionerRole - paediatric audiovestibular consultant (GOSH)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C6789345"
* practitioner.display = "FICTITIOUS, Amara"
* organization.identifier.system = $ods-code
* organization.identifier.value = "RP4"
* organization.display = "GREAT ORMOND STREET HOSPITAL FOR CHILDREN NHS FOUNDATION TRUST"

RuleSet: CamdenSubject
* subject.reference = "urn:uuid:74fe4bf0-26d8-4b8c-90eb-b6ef80d887e0"
* subject.display = "Oliver CAMDEN"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383427"

// Laboratory Order (LAB-1)

Instance: ServiceRequest-SPT-Order
InstanceOf: ServiceRequest
Title: "ServiceRequest - R67.1 Monogenic hearing loss (Laboratory Order to North Thames GLH)"
Description: "Fictitious example: the LAB-1 order from GOSH to its own GLH, North Thames"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/RP4"
* identifier[OrderPlacerNumber].value = "GOSH-5520917"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "RP4"
* status = #active
* intent = #order
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* code = $test-directory#R67.1
* authoredOn = "2026-09-14"
* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:3c1438f5-b280-4049-9764-340018769127"
  * identifier.system = $ods-code
  * identifier.value = "RP4"
* insert CamdenSubject
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "RP4"
  * display = "NORTH THAMES GLH"
* specimen[+].reference = "urn:uuid:0a869ae7-44ee-4657-8494-bfe7297971ba"
* reasonCode[+] = $GCC#R67 "Monogenic hearing loss"
* note[+].text = "Bilateral moderate to severe sensorineural hearing loss identified on newborn hearing screening. No syndromic features. CMV negative."

Instance: Specimen-SPT-Blood
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) (Oliver Camden)"
Description: "Fictitious example: blood sample taken at GOSH"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RP426-0310558"
  * system = "http://www.acme.org/specimen/RP4"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RP4"
* status = #available
* insert CamdenSubject
* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* collection.collectedDateTime = "2026-09-14T10:30:00+00:00"
* receivedTime = "2026-09-14T16:00:00+00:00"

Instance: MessageHeader-SPT-Order
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order R67.1 (O21), specialist test"
Description: "Fictitious example: LAB-1 order from GREAT ORMOND STREET HOSPITAL to NORTH THAMES GLH"
Usage: #example

* meta.lastUpdated = "2026-09-14T11:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "RP4"
* sender.display = "GREAT ORMOND STREET HOSPITAL FOR CHILDREN NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RP4"
* destination.receiver.display = "NORTH THAMES GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NorthThamesGLH"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOSH"
* source.software = "GOSH EPR"
* focus[+]
  * reference = "urn:uuid:05d4f3bb-bf8c-4b5f-9508-0b2458d80582"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-SPT
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order R67.1 (O21), specialist test"
Description: "Fictitious example: the LAB-1 Laboratory Order from GOSH to North Thames GLH in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario. Internal to the North Thames region and shown for completeness."
Usage: #example
* insert MessageBundle("urn:uuid:19e175d7-eb56-426c-a39c-e45b51f68bc9", "2026-09-14T11:00:00+00:00")
* insert EntryDocument("urn:uuid:915f687d-85ce-4d95-a4a6-5acb47121cc8", MessageHeader-SPT-Order)
* insert EntryDocument("urn:uuid:74fe4bf0-26d8-4b8c-90eb-b6ef80d887e0", Patient-Camden)
* insert EntryDocument("urn:uuid:05d4f3bb-bf8c-4b5f-9508-0b2458d80582", ServiceRequest-SPT-Order)
* insert EntryDocument("urn:uuid:3c1438f5-b280-4049-9764-340018769127", PractitionerRole-Requester-Audiology-RP4)
* insert EntryDocument("urn:uuid:0a869ae7-44ee-4657-8494-bfe7297971ba", Specimen-SPT-Blood)

// Sub-order (LAB-35)

Instance: ServiceRequest-SPT-SubOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - R67.1 Monogenic hearing loss (sub-order to the North West GLH)"
Description: "Fictitious example: the LAB-35 sub-order from North Thames GLH to the North West GLH. It is based on the Laboratory Order; the requester is North Thames GLH and the performer the North West GLH."
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/NorthThamesGLH"
* identifier[OrderPlacerNumber].value = "NT26-80455"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "RP4"
* basedOn[+]
  * reference = "urn:uuid:05d4f3bb-bf8c-4b5f-9508-0b2458d80582"
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RP4"
  * identifier.value = "GOSH-5520917"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RP4"
* status = #active
* intent = #filler-order
* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* code = $test-directory#R67.1
* authoredOn = "2026-09-16"
* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "RP4"
  * display = "NORTH THAMES GLH"
* insert CamdenSubject
* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* specimen[+].reference = "urn:uuid:2b589e1b-b81f-48b5-b1a9-a4875b24c6b1"
* reasonCode[+] = $GCC#R67 "Monogenic hearing loss"
* note[+].text = "Bilateral moderate to severe sensorineural hearing loss identified on newborn hearing screening. No syndromic features. CMV negative. DNA sent by sample transport."

Instance: Specimen-SPT-DNA
InstanceOf: Specimen
Title: "Specimen - DNA (Oliver Camden)"
Description: "Fictitious example: DNA extracted by North Thames GLH and sent to the North West GLH"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "NT26-80455-D1"
  * system = "http://www.acme.org/specimen/NorthThamesGLH"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RP4"
* status = #available
* insert CamdenSubject
* type = $sct#258566005 "Deoxyribonucleic acid sample"
* parent.reference = "urn:uuid:0a869ae7-44ee-4657-8494-bfe7297971ba"
* collection.collectedDateTime = "2026-09-15T15:00:00+00:00"

Instance: MessageHeader-SPT-SubOrder
InstanceOf: MessageHeader
Title: "Message Header - Sub-order R67.1 (O21), specialist test"
Description: "Fictitious example: LAB-35 sub-order from NORTH THAMES GLH to NORTH WEST GLH via GOMS"
Usage: #example

* meta.lastUpdated = "2026-09-16T09:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
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
  * reference = "urn:uuid:99bb76ca-edcb-44f4-95ff-b9b1c7b95780"
  * type = #ServiceRequest

Instance: GenomicsSubOrderMessage-SPT
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order R67.1 (O21), specialist test"
Description: "Fictitious example: the LAB-35 sub-order from North Thames GLH to the North West GLH in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario. `intent` = `filler-order` and `basedOn` the Laboratory Order."
Usage: #example
* insert MessageBundle("urn:uuid:67770cf6-9e01-4afa-a5b2-ae63217e7e4a", "2026-09-16T09:00:00+00:00")
* insert EntryDocument("urn:uuid:aa6f9fb4-6c45-4330-8edf-ef499d43a1f6", MessageHeader-SPT-SubOrder)
* insert EntryDocument("urn:uuid:74fe4bf0-26d8-4b8c-90eb-b6ef80d887e0", Patient-Camden)
* insert EntryDocument("urn:uuid:99bb76ca-edcb-44f4-95ff-b9b1c7b95780", ServiceRequest-SPT-SubOrder)
* insert EntryDocument("urn:uuid:05d4f3bb-bf8c-4b5f-9508-0b2458d80582", ServiceRequest-SPT-Order)
* insert EntryDocument("urn:uuid:3c1438f5-b280-4049-9764-340018769127", PractitionerRole-Requester-Audiology-RP4)
* insert EntryDocument("urn:uuid:2b589e1b-b81f-48b5-b1a9-a4875b24c6b1", Specimen-SPT-DNA)
* insert EntryDocument("urn:uuid:0a869ae7-44ee-4657-8494-bfe7297971ba", Specimen-SPT-Blood)

// Sub-order status (O51)

RuleSet: SPTSubOrderTask
* basedOn.reference = "urn:uuid:99bb76ca-edcb-44f4-95ff-b9b1c7b95780"
* basedOn.identifier.type = $v2-0203#PLAC
* basedOn.identifier.system = "http://www.acme.org/servicerequest/NorthThamesGLH"
* basedOn.identifier.value = "NT26-80455"
* basedOn.identifier.assigner.identifier.system = $ods-code
* basedOn.identifier.assigner.identifier.value = "RP4"
* focus.reference = "urn:uuid:99bb76ca-edcb-44f4-95ff-b9b1c7b95780"
* for.reference = "urn:uuid:74fe4bf0-26d8-4b8c-90eb-b6ef80d887e0"
* for.display = "Oliver CAMDEN"
* for.identifier.type = $v2-0203#NH
* for.identifier.system = $nhs-number
* for.identifier.value = "9737383427"
* intent = #order
* code = http://hl7.org/fhir/CodeSystem/task-code#fulfill
* authoredOn = "2026-09-16"
* requester.identifier.system = $ods-code
* requester.identifier.value = "RP4"
* requester.display = "NORTH THAMES GLH"
* owner.identifier.system = $ods-code
* owner.identifier.value = "699X0"
* owner.display = "NORTH WEST GLH"

RuleSet: SPTSubOrderStatusHeader(focus, date)
* meta.lastUpdated = {date}
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O51
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RP4"
* destination.receiver.display = "NORTH THAMES GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOMS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.software = "RIE"
* focus.reference = {focus}
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/referral-order-status"

Instance: Task-SPT-SubOrder-Accepted
InstanceOf: Task
Title: "Task - R67.1 sub-order accepted by the North West GLH"
Description: "Fictitious example: the North West GLH accepts the sub-order"
Usage: #example
* insert SPTSubOrderTask
* status = #accepted
* businessStatus = ReferralWorkflowStatus#accepted
* lastModified = "2026-09-17T09:30:00+00:00"

Instance: MessageHeader-SPT-SubOrder-Accepted
InstanceOf: MessageHeader
Title: "Message Header - Sub-order status (O51), accepted - specialist test"
Description: "Fictitious example: the North West GLH accepts the sub-order"
Usage: #example
* insert SPTSubOrderStatusHeader("urn:uuid:cb1293d2-6a77-4a3f-8ac7-37735367b47e", "2026-09-17T09:30:00+00:00")

Instance: GenomicOrderStatusMessage-SPT-Accepted
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order status (O51), accepted - specialist test"
Description: "Fictitious example: the North West GLH accepts the sub-order in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario, routed to North Thames GLH through GOMS"
Usage: #example
* insert MessageBundle("urn:uuid:08ac469d-af9d-42bf-bb73-a461e4689fbf", "2026-09-17T09:30:00+00:00")
* insert EntryDocument("urn:uuid:26f28807-ae50-4fb0-92c3-c4adca4309ad", MessageHeader-SPT-SubOrder-Accepted)
* insert EntryDocument("urn:uuid:cb1293d2-6a77-4a3f-8ac7-37735367b47e", Task-SPT-SubOrder-Accepted)

Instance: Task-SPT-SubOrder-Declined
InstanceOf: Task
Title: "Task - R67.1 sub-order declined by the North West GLH"
Description: "Fictitious example: the North West GLH declines the sub-order because it does not meet the eligibility criteria"
Usage: #example
* insert SPTSubOrderTask
* status = #rejected
* businessStatus = ReferralWorkflowStatus#declined
* statusReason = ReferralStatusReason#not-eligible
* statusReason.text = "Does not meet the R67 eligibility criteria: congenital CMV has not been excluded. Please send the CMV result with a new order."
* lastModified = "2026-09-17T09:30:00+00:00"

Instance: MessageHeader-SPT-SubOrder-Declined
InstanceOf: MessageHeader
Title: "Message Header - Sub-order status (O51), declined - specialist test"
Description: "Fictitious example: the North West GLH declines the sub-order"
Usage: #example
* insert SPTSubOrderStatusHeader("urn:uuid:53696678-1949-4690-a459-012da941f020", "2026-09-17T09:30:00+00:00")

Instance: GenomicOrderStatusMessage-SPT-Declined
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order status (O51), declined - specialist test"
Description: "Fictitious example: the North West GLH declines the sub-order in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario, with the reason in `Task.statusReason`"
Usage: #example
* insert MessageBundle("urn:uuid:0bbb9491-0f66-4e91-9162-d093f5aa88dd", "2026-09-17T09:30:00+00:00")
* insert EntryDocument("urn:uuid:d97e0d4a-c17f-460e-86db-26433279581f", MessageHeader-SPT-SubOrder-Declined)
* insert EntryDocument("urn:uuid:53696678-1949-4690-a459-012da941f020", Task-SPT-SubOrder-Declined)

Instance: Task-SPT-SubOrder-LaterDeclined
InstanceOf: Task
Title: "Task - R67.1 sub-order declined after acceptance (sample unsuitable)"
Description: "Fictitious example: the North West GLH accepted the sub-order, then found the DNA unsuitable, so declines it"
Usage: #example
* insert SPTSubOrderTask
* status = #rejected
* businessStatus = ReferralWorkflowStatus#declined
* statusReason = ReferralStatusReason#sample-unsuitable
* statusReason.text = "DNA concentration too low for testing. Please send a new DNA sample with a new sub-order."
* lastModified = "2026-09-21T11:00:00+00:00"

Instance: MessageHeader-SPT-SubOrder-LaterDeclined
InstanceOf: MessageHeader
Title: "Message Header - Sub-order status (O51), declined after acceptance - specialist test"
Description: "Fictitious example: the North West GLH declines the sub-order after acceptance"
Usage: #example
* insert SPTSubOrderStatusHeader("urn:uuid:5beaab2f-28c3-4300-bf01-c27a20536d62", "2026-09-21T11:00:00+00:00")

Instance: GenomicOrderStatusMessage-SPT-LaterDeclined
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order status (O51), declined after acceptance - specialist test"
Description: "Fictitious example: the North West GLH declines the sub-order after acceptance because the sample is unsuitable, in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:8e7403a8-fdab-421a-9fcb-b5a41fee39c9", "2026-09-21T11:00:00+00:00")
* insert EntryDocument("urn:uuid:5db9ee6d-b0e0-4e06-9302-046c179ba0d7", MessageHeader-SPT-SubOrder-LaterDeclined)
* insert EntryDocument("urn:uuid:5beaab2f-28c3-4300-bf01-c27a20536d62", Task-SPT-SubOrder-LaterDeclined)

// Sub-order Laboratory Report (LAB-36)

RuleSet: SPTReport
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R67.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* insert CamdenSubject
* specimen[+].reference = "urn:uuid:2b589e1b-b81f-48b5-b1a9-a4875b24c6b1"
* effectiveDateTime = "2026-09-15T15:00:00+00:00"

Instance: DiagnosticReport-SPT-SubOrder
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R67.1 Monogenic hearing loss (North West GLH), Oliver Camden"
Description: "Fictitious example: the North West GLH's LAB-36 report, based on the sub-order"
Usage: #example

* identifier[ReportIdentifier]
  * value = "G26-43307"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/NorthThamesGLH"
  * identifier.value = "NT26-80455"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RP4"
  * reference = "urn:uuid:99bb76ca-edcb-44f4-95ff-b9b1c7b95780"
* insert SPTReport
* issued = "2026-10-19T14:00:00+00:00"
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
* conclusion = "Homozygous pathogenic variant GJB2 c.35delG identified, consistent with autosomal recessive non-syndromic hearing loss (DFNB1)."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"

Instance: MessageHeader-SPT-SubOrderReport
InstanceOf: MessageHeader
Title: "Message Header - Sub-order Laboratory Report R67.1 (R01)"
Description: "Fictitious example: LAB-36 report from NORTH WEST GLH to NORTH THAMES GLH via GOMS"
Usage: #example

* meta.lastUpdated = "2026-10-19T14:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NORTH WEST GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RP4"
* destination.receiver.display = "NORTH THAMES GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOMS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"
* source.software = "iGene"
* focus[+]
  * reference = "urn:uuid:25749dd1-3f8f-472a-a8e3-1ebcf0cd8a23"
  * type = #DiagnosticReport

Instance: GenomicsSubOrderReportMessage-SPT
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order Laboratory Report R67.1 (R01), specialist test"
Description: "Fictitious example: the LAB-36 report from the North West GLH to North Thames GLH, `basedOn` the sub-order, in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:0c55edb0-0af3-4d88-8f09-f5b5ba429584", "2026-10-19T14:00:00+00:00")
* insert EntryDocument("urn:uuid:dee3deb9-5440-4799-97ae-4bc4a3c8c777", MessageHeader-SPT-SubOrderReport)
* insert EntryDocument("urn:uuid:74fe4bf0-26d8-4b8c-90eb-b6ef80d887e0", Patient-Camden)
* insert EntryDocument("urn:uuid:25749dd1-3f8f-472a-a8e3-1ebcf0cd8a23", DiagnosticReport-SPT-SubOrder)
* insert EntryDocument("urn:uuid:99bb76ca-edcb-44f4-95ff-b9b1c7b95780", ServiceRequest-SPT-SubOrder)
* insert EntryDocument("urn:uuid:2b589e1b-b81f-48b5-b1a9-a4875b24c6b1", Specimen-SPT-DNA)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)

// Laboratory Report (LAB-3)

Instance: DiagnosticReport-SPT-Report
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R67.1 Monogenic hearing loss (North Thames GLH), Oliver Camden"
Description: "Fictitious example: North Thames GLH's LAB-3 report to GOSH, based on the Laboratory Order and including the North West GLH's result"
Usage: #example

* identifier[ReportIdentifier]
  * value = "NT26-80455"
  * system = "http://www.acme.org/diagnosticreport/identifiers/RP4"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RP4"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest/RP4"
  * identifier.value = "GOSH-5520917"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "RP4"
  * reference = "urn:uuid:05d4f3bb-bf8c-4b5f-9508-0b2458d80582"
* insert SPTReport
* issued = "2026-10-21T10:00:00+00:00"
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
* conclusion = "Monogenic hearing loss testing (R67.1), performed by the North West GLH: homozygous pathogenic variant GJB2 c.35delG, consistent with autosomal recessive non-syndromic hearing loss (DFNB1). Genetic counselling and cascade testing of the parents are recommended."
* conclusionCode[+] = $GTOC#311 "RESULT CONSISTENT WITH REFERRAL INDICATION"

Instance: MessageHeader-SPT-Report
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Report R67.1 (R01), specialist test"
Description: "Fictitious example: LAB-3 report from NORTH THAMES GLH to GREAT ORMOND STREET HOSPITAL"
Usage: #example

* meta.lastUpdated = "2026-10-21T10:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "RP4"
* sender.display = "NORTH THAMES GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "RP4"
* destination.receiver.display = "GREAT ORMOND STREET HOSPITAL FOR CHILDREN NHS FOUNDATION TRUST"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/GOSH"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/NorthThamesGLH"
* source.software = "North Thames GLH LIMS"
* focus[+]
  * reference = "urn:uuid:bf3c6351-d196-4a3c-b989-1b50aab6fe85"
  * type = #DiagnosticReport

Instance: GenomicsReportMessage-SPT
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Report R67.1 (R01), specialist test"
Description: "Fictitious example: the LAB-3 Laboratory Report from North Thames GLH to GOSH, `basedOn` the Laboratory Order, in the [Specialist Test for Another GLH](ExampleScenario-SpecialistTestForAnotherGLH.html) scenario. Internal to the North Thames region and shown for completeness."
Usage: #example
* insert MessageBundle("urn:uuid:939cf2ca-7558-446d-9577-ac585d5f0f9f", "2026-10-21T10:00:00+00:00")
* insert EntryDocument("urn:uuid:4ae66ef9-04bb-49c1-9d8c-6112f8e12115", MessageHeader-SPT-Report)
* insert EntryDocument("urn:uuid:74fe4bf0-26d8-4b8c-90eb-b6ef80d887e0", Patient-Camden)
* insert EntryDocument("urn:uuid:bf3c6351-d196-4a3c-b989-1b50aab6fe85", DiagnosticReport-SPT-Report)
* insert EntryDocument("urn:uuid:05d4f3bb-bf8c-4b5f-9508-0b2458d80582", ServiceRequest-SPT-Order)
* insert EntryDocument("urn:uuid:3c1438f5-b280-4049-9764-340018769127", PractitionerRole-Requester-Audiology-RP4)
