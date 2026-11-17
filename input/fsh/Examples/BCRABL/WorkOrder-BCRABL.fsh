// BCR-ABL1 monitoring work order (LTW LAB-4) from iGene (Order Filler) to the Cepheid GeneXpert (Automation Manager), both NW GLH (699X0).
// The GeneXpert retrieves it with an HL7 v2 QBP query and returns the result as an ORU^R32, see TestResultsMessage-BCRABL-Cepheid.
// Fictitious example: identifiers and dates are illustrative only.

Instance: Specimen-BCRABL
InstanceOf: Specimen
Title: "Specimen - peripheral blood for BCR-ABL1 monitoring"
Description: "Fictitious example: the blood sample for iGene work order T26-61BC (HL7 v2 SPM)"
Usage: #example

* identifier[+]
  * type = $v2-0203#FGN
  * value = "S26-1KD4"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/SpecimenIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* status = #available
* type = $sct#119297000 "Blood specimen"
* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Sansa MANCHESTER"
* collection.collectedDateTime = "2026-07-10T09:30:00+01:00"

Instance: ServiceRequest-BCRABL-Cepheid-WorkOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - BCR-ABL1 work order from iGene to the Cepheid GeneXpert"
Description: "Fictitious example: iGene places a work order with the Cepheid GeneXpert for M84.2 BCR-ABL1 RT-qPCR monitoring, order T26-61BC (LTW LAB-4)"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "T26-61BC"
* identifier[OrderPlacerNumber].system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* requisition
  * type = $v2-0203#PGN
  * value = "R26-16CK"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReferralIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* status = #active
* intent = #instance-order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-07-12"

* code.coding[+] = $test-directory#M84.2
// OBR-4 Universal Service Identifier, the GeneXpert assay
* code.coding[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR

* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Sansa MANCHESTER"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383192"

* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* performer[laboratoryInformationSystem]
  * type = #Device
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * identifier.value = "Cepheid"
  * display = "Cepheid GeneXpert"

* specimen[+].reference = "urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22"

* reasonCode[+].text = "Chronic myeloid leukaemia - monitoring of response to tyrosine kinase inhibitor"
