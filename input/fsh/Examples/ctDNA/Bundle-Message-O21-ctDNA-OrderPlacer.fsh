// Laboratory Order (LTW LAB-1) for the ctDNA ExampleScenario: M4.14 from Sheffield Teaching Hospitals NHS Foundation
// Trust (RHQ) to the NW GLH (699X0), as sent by the Order Placer, before Lab 1 assigns its Order Filler Number.
// Lab 1's copy of the order with its filler numbers (LAB-2) is GenomicsOrderMessage-ctDNA.
// Fictitious example: identifiers and dates are illustrative only.

Instance: Specimen-ctDNA-Order
InstanceOf: Specimen
Title: "Specimen - blood for ctDNA testing (as ordered)"
Description: "Fictitious example: the blood sample for ctDNA testing as sent with the order, with the Order Placer's specimen number"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RHQ26-018842"
  * system = "http://www.acme.org/specimen/RHQ"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RHQ"
* status = #available
* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"
* type = $sct#119297000 "Blood specimen"
* collection.collectedDateTime = "2026-06-29"

Instance: ServiceRequest-ctDNA-OrderPlacer
InstanceOf: ServiceRequest
Title: "ServiceRequest - M4.14 ctDNA, as sent by the Order Placer"
Description: "Fictitious example: laboratory order for M4.14 Non-Small Cell Lung Cancer ctDNA testing for Theon SHEFFIELD from Sheffield Teaching Hospitals NHS Foundation Trust, with the Order Placer Number only"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "RHQ-26-07731"
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest/RHQ"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "RHQ"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-06-29"

* code = $test-directory#M4.14

* requester
  * type = #PractitionerRole
  * identifier.system = $ods-code
  * identifier.value = "RHQ"
  * reference = "urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"

* specimen[+].reference = "urn:uuid:591e5da3-ad39-455a-a1f0-c4f2570af308"

* reasonCode[+]
  * coding[+]
    * code = #M4
    * system = $GCC

Instance: MessageHeader-O21-ctDNA-OrderPlacer
InstanceOf: MessageHeader
Title: "Message Header - Laboratory Order M4.14 ctDNA O21 (LAB-1)"
Description: "Fictitious example: LAB-1 order from SHEFFIELD TEACHING HOSPITALS NHS FOUNDATION TRUST to the NW GLH"
Usage: #example

* meta.lastUpdated = "2026-06-29T11:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* sender.identifier.system = $ods-code
* sender.identifier.value = "RHQ"
* sender.display = "SHEFFIELD TEACHING HOSPITALS NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RHQ"
* focus[+]
  * reference = "urn:uuid:f0560553-0da3-41dd-84da-6eb4e00b0597"
  * type = #ServiceRequest

Instance: GenomicsOrderMessage-ctDNA-OrderPlacer
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Laboratory Order M4.14 ctDNA O21 (LAB-1)"
Description: "Fictitious example: the LAB-1 Laboratory Order from Sheffield Teaching Hospitals in the [ctDNA](ExampleScenario-ctDNA.html) scenario, with the Order Placer Number. Lab 1's copy with its Order Filler Numbers (LAB-2) is [GenomicsOrderMessage-ctDNA](Bundle-GenomicsOrderMessage-ctDNA.html)"
Usage: #example
* insert MessageBundle("urn:uuid:5550b30d-9ba1-43f9-9b6d-b4a30722098a", "2026-06-29T11:00:00+00:00")
* insert EntryDocument("urn:uuid:407be576-82d1-41de-84a1-54f3452731e7", MessageHeader-O21-ctDNA-OrderPlacer)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:f0560553-0da3-41dd-84da-6eb4e00b0597", ServiceRequest-ctDNA-OrderPlacer)
* insert EntryDocument("urn:uuid:4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02", 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02)
* insert EntryDocument("urn:uuid:591e5da3-ad39-455a-a1f0-c4f2570af308", Specimen-ctDNA-Order)
