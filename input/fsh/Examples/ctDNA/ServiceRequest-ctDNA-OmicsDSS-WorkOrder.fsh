// Internal/logical example: the Analytics Processing request from DLIMS to OmicsDSS, internal to Lab 2 (both run by NW GLH, 699X0).
// It is not exchanged: in the UGR Full Pipeline scenario Analytics Processing retrieves the iGene work order from the FHIR Repository instead.
// Follows the iGene to DLIMS work order ServiceRequest-ctDNA-DLIMS-WorkOrder. Lab 2 returns the results to iGene (LAB-5).
// Fictitious example: the work order identifier is illustrative only.

Instance: ServiceRequest-ctDNA-OmicsDSS-WorkOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - Analytics Processing request from DLIMS to OmicsDSS (ctDNA, internal/logical)"
Description: "Fictitious example, internal/logical only: DLIMS (Lab 2) asks OmicsDSS (Analytics Processing) to process the analysis requested in iGene work order D26-004512. It is internal to Lab 2 and not exchanged; in the UGR Full Pipeline scenario Analytics Processing retrieves the iGene work order from the FHIR Repository instead."
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "D26-004512-W1"
* identifier[OrderPlacerNumber].system = "https://fhir.nwgenomics.nhs.uk/DLIMS/WorkOrderIdentifier"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* basedOn
  * reference = "ServiceRequest/ServiceRequest-ctDNA-DLIMS-WorkOrder"
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
