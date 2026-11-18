// Laboratory Order (LTW LAB-1) for the MRD Monitoring ExampleScenario: M84.2 BCR-ABL1 monitoring for Rob Leeds,
// from Leeds Teaching Hospitals NHS Trust (RR8) to the NW GLH (699X0). iGene then places the work order
// ServiceRequest-BCRABL-Cepheid-WorkOrder with the Cepheid GeneXpert, based on this order.
// Fictitious example: requester, identifiers and dates are illustrative only.

Instance: PractitionerRole-Requester-Haematology-RR8
InstanceOf: PractitionerRole
Title: "PractitionerRole - requesting haematologist (Leeds Teaching Hospitals)"
Description: "Fictitious example: requesting clinician (HL7 v2 ORC-12/OBR-16)"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C9000103"
* practitioner.display = "FICTITIOUS, Imogen"

* organization.identifier.system = $ods-code
* organization.identifier.value = "RR8"
* organization.display = "LEEDS TEACHING HOSPITALS NHS TRUST"

* specialty[+]
  * coding[+]
    * system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode"
    * code = #303

Instance: Specimen-BCRABL-Order
InstanceOf: Specimen
Title: "Specimen - peripheral blood for BCR-ABL1 monitoring (as ordered)"
Description: "Fictitious example: the blood sample as sent with the order (HL7 v2 SPM), with the Order Placer's specimen number"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RR826-031277"
  * system = "http://www.acme.org/specimen/RR8"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RR8"
* status = #available
* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Rob LEEDS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383222"
* type = $sct#119297000 "Blood specimen"
* collection.collectedDateTime = "2026-07-10T09:30:00+01:00"

Instance: ServiceRequest-BCRABL
InstanceOf: ServiceRequest
Title: "ServiceRequest - M84.2 Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR"
Description: "Fictitious example: measurable residual disease (MRD) monitoring of response to tyrosine kinase inhibitor treatment, ordered by Leeds Teaching Hospitals NHS Trust"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/RR8"
* identifier[OrderPlacerNumber].value = "RR8-26-08812"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "RR8"

* status = #active
* intent = #order
* priority = #routine

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-07-10T09:00:00+01:00"

* code = $test-directory#M84.2

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:31cd1b28-3835-4d80-99e8-db25dda81e2a"
  * identifier.system = $ods-code
  * identifier.value = "RR8"

* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Rob LEEDS"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383222"

* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:b8cdcd7c-9c1f-4246-8462-a202f209986c"

* reasonCode[+].text = "Chronic myeloid leukaemia - monitoring of response to tyrosine kinase inhibitor"

Instance: MessageHeader-O21-BCRABL
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order M84.2 BCR-ABL1 MRD monitoring (O21)"
Description: "Fictitious example: order from LEEDS TEACHING HOSPITALS NHS TRUST to NW GLH"
Usage: #example

* meta.lastUpdated = "2026-07-10T09:00:00+01:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "RR8"
* sender.display = "LEEDS TEACHING HOSPITALS NHS TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RR8"
* focus[+]
  * reference = "urn:uuid:58c1eecd-83f6-4878-ab0b-caa813b05d63"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-BCRABL
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order M84.2 BCR-ABL1 MRD monitoring (O21)"
Description: "Fictitious example: the LAB-1 Laboratory Order from Leeds Teaching Hospitals in the [Measurable Residual Disease (MRD) Monitoring](ExampleScenario-MRDMonitoring.html) scenario"
Usage: #example
* insert MessageBundle("urn:uuid:540f104a-d125-4818-9a3c-066f062732b2", "2026-07-10T09:00:00+01:00")
* insert EntryDocument("urn:uuid:54ab78b1-5cd4-4ae6-bd90-9c71445d3047", MessageHeader-O21-BCRABL)
* insert EntryDocument("urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71", Patient-Leeds)
* insert EntryDocument("urn:uuid:58c1eecd-83f6-4878-ab0b-caa813b05d63", ServiceRequest-BCRABL)
* insert EntryDocument("urn:uuid:31cd1b28-3835-4d80-99e8-db25dda81e2a", PractitionerRole-Requester-Haematology-RR8)
* insert EntryDocument("urn:uuid:b8cdcd7c-9c1f-4246-8462-a202f209986c", Specimen-BCRABL-Order)
