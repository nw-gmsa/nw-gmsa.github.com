// OMICS DSS work order (LTW LAB-4) from DLIMS (Order Filler) to OmicsDSS, both run by NW GLH (699X0).
// Follows the iGene to DLIMS sub-order ServiceRequest-ctDNA-DLIMS-SubOrder.
// Fictitious example: the work order identifier is illustrative only.

Instance: ServiceRequest-ctDNA-OmicsDSS-WorkOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - OMICS DSS work order from DLIMS to OmicsDSS (ctDNA)"
Description: "Fictitious example: DLIMS places a work order with OmicsDSS for the analysis requested in sub-order D26-004512 (LTW LAB-4)"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "D26-004512-W1"
* identifier[OrderPlacerNumber].system = "https://fhir.nwgenomics.nhs.uk/DLIMS/WorkOrderIdentifier"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* basedOn
  * reference = "ServiceRequest/ServiceRequest-ctDNA-DLIMS-SubOrder"
  * identifier.type = $v2-0203#FILL
  * identifier.value = "D26-004512"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/DLIMS/OrderIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* requisition
  * type = $v2-0203#PGN
  * value = "R26-15AY"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReferralIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* status = #active
* intent = #instance-order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-07-03"

* code = $test-directory#M4.14

* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* subject.reference = "Patient/Patient-Sheffield"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* performer[laboratoryInformationSystem]
  * type = #Device
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * identifier.value = "OmicsDSS"
  * display = "Omics DSS"

* specimen[+].reference = "Specimen/Specimen-ctDNA"

* reasonCode[+]
  * coding[+]
    * code = #M4
    * system = $GCC
