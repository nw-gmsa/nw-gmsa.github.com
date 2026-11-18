// Sub-order (ILW LAB-35) and sub-order report (LAB-36) for the Pharmacogenomics ExampleScenario, inside the North West GLH (699X0).
// iGene (Order Filler, Lab 1) sub-orders the R454.1 test to StarLIMS (the satellite LIMS, Lab 2), which tests the sample.
// OmicsDSS performs the analytic processing that generates the pharmacogenomic results, which StarLIMS reports back to iGene.
// iGene uses its test number (iGene/ReportIdentifier) as the placer number of the sub-order.
// Fictitious example: identifiers and dates are illustrative only.

Instance: StarLIMS
InstanceOf: LaboratoryInformationSystem
Title: "Laboratory Information System - StarLIMS (NW GLH)"
Description: "Fictitious example: StarLIMS, the NW GLH satellite LIMS that receives sub-orders from iGene"
Usage: #example

* identifier[laboratoryInformationSystemId].value = "StarLIMS"

* deviceName[+]
  * name = "StarLIMS"
  * type = http://hl7.org/fhir/device-nametype#user-friendly-name

* owner
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"


Instance: ServiceRequest-Pharmacogenomics-StarLIMS-SubOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - R454.1 CYP2C19 genotyping sub-order from iGene to StarLIMS"
Description: "Fictitious example: iGene sub-orders R454.1 CYP2C19 genotyping, test T26-62PX, to StarLIMS (LTW LAB-35), based on the Laboratory Order (identified by its Order Placer Number)"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "T26-62PX"
* identifier[OrderPlacerNumber].system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

// The Laboratory Order (LAB-1) from Liverpool Heart and Chest Hospital
* basedOn[+]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "71388"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* status = #active
* intent = #filler-order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-10-28"

* code = $test-directory#R454.1

* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"

// Internal sub-order to another system in the same organisation, so the performer is the Device
* performer[laboratoryInformationSystem]
  * type = #Device
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * identifier.value = "StarLIMS"
  * display = "StarLIMS"

* specimen[+].reference = "urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4"

* reasonCode[+] = $GCC#R454 "Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy"


Instance: MessageHeader-O21-Pharmacogenomics-SubOrder
InstanceOf: MessageHeader
Title: "Message Header - Sub-order R454.1 (O21), CYP2C19 genotyping, iGene to StarLIMS"
Description: "Fictitious example: LAB-35 sub-order from iGene to StarLIMS, both NW GLH"
Usage: #example

* meta.lastUpdated = "2026-10-28T11:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NW GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NW GLH"
* destination.name = "StarLIMS"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/StarLIMS"
* source.name = "iGene"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"
* focus[+]
  * reference = "urn:uuid:2095d69a-a20b-4031-a4d3-3e814d5a9f6c"
  * type = #ServiceRequest

Instance: GenomicsSubOrderMessage-Pharmacogenomics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order R454.1 (O21), CYP2C19 genotyping, iGene to StarLIMS"
Description: "Fictitious example: the LAB-35 sub-order in the [Pharmacogenomics](ExampleScenario-Pharmacogenomics.html) scenario. `intent` = `filler-order`, `basedOn` the Laboratory Order, identified by its Order Placer Number, and `performer` the receiving system"
Usage: #example
* insert MessageBundle("urn:uuid:a64ed019-caef-4bf7-8a0c-3f0e81bb4ea6", "2026-10-28T11:00:00+00:00")
* insert EntryDocument("urn:uuid:7f20a21c-c6bd-4e5b-9003-a7eacd798030", MessageHeader-O21-Pharmacogenomics-SubOrder)
* insert EntryDocument("urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a", Patient-Northwich)
* insert EntryDocument("urn:uuid:2095d69a-a20b-4031-a4d3-3e814d5a9f6c", ServiceRequest-Pharmacogenomics-StarLIMS-SubOrder)
* insert EntryDocument("urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4", Specimen-Pharmacogenomics)

// Sub-order report (LAB-36)

Instance: DiagnosticReport-Pharmacogenomics-SubOrderReport
InstanceOf: LaboratoryReport
Title: "Diagnostic Report - R454.1 CYP2C19 genotyping (StarLIMS sub-order report), Mace Northwich"
Description: "Fictitious example: StarLIMS's LAB-36 report to iGene, based on the sub-order, with the pharmacogenomic results generated by OmicsDSS"
Usage: #example

* identifier[ReportIdentifier]
  * value = "SL26-008831"
  * system = "https://fhir.nwgenomics.nhs.uk/StarLIMS/ReportIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.value = "T26-62PX"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[ProcedureCodeGenomicTestDirectory] = $GTD#R454.1
* code.coding[UKCoreReportCode] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"
* effectiveDateTime = "2026-10-27T10:15:00+00:00"
* issued = "2026-11-02T11:20:00+00:00"
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
* specimen[+].reference = "urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4"
* conclusion = "CYP2C19 *2/*2 - poor metaboliser."
* result[+].reference = "urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b"
* result[+].reference = "urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff"
* result[+].reference = "urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1"
* result[+].reference = "urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2"

Instance: MessageHeader-R01-Pharmacogenomics-SubOrderReport
InstanceOf: MessageHeader
Title: "Message Header - Sub-order report R454.1 (R01), CYP2C19 genotyping, StarLIMS to iGene"
Description: "Fictitious example: LAB-36 report from StarLIMS to iGene, both NW GLH"
Usage: #example

* meta.lastUpdated = "2026-11-02T11:20:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01
* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"
* sender.display = "NW GLH"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NW GLH"
* destination.name = "iGene"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"
* source.name = "StarLIMS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/StarLIMS"
* focus[+]
  * reference = "urn:uuid:6573cb94-133a-4e00-9cb5-bced7ce71403"
  * type = #DiagnosticReport

Instance: GenomicsSubOrderReportMessage-Pharmacogenomics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Sub-order report R454.1 (R01), CYP2C19 genotyping, StarLIMS to iGene"
Description: "Fictitious example: the LAB-36 sub-order report in the [Pharmacogenomics](ExampleScenario-Pharmacogenomics.html) scenario, `basedOn` the sub-order, with the genotype, haplotype, therapeutic implication and genomic study results generated by analytics processing"
Usage: #example
* insert MessageBundle("urn:uuid:cbfaed8f-1ad9-48e3-8bbe-521af17e438d", "2026-11-02T11:20:00+00:00")
* insert EntryDocument("urn:uuid:d366f4ad-61ad-4e2e-9ad2-8603a121d752", MessageHeader-R01-Pharmacogenomics-SubOrderReport)
* insert EntryDocument("urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a", Patient-Northwich)
* insert EntryDocument("urn:uuid:6573cb94-133a-4e00-9cb5-bced7ce71403", DiagnosticReport-Pharmacogenomics-SubOrderReport)
* insert EntryDocument("urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b", Genotype-Pharmacogenomics-CYP2C19)
* insert EntryDocument("urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff", Haplotype-Pharmacogenomics-CYP2C19-2)
* insert EntryDocument("urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1", TherapeuticImplication-Pharmacogenomics-Mavacamten)
* insert EntryDocument("urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2", GenomicStudyPanel-Pharmacogenomics)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
* insert EntryDocument("urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4", Specimen-Pharmacogenomics)
