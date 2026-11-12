// OMICS DSS sub-order (ILW LAB-35) from iGene (Requestor) to DLIMS (Subcontractor), both run by NW GLH (699X0).
// Fictitious example: the sub-order and DLIMS identifiers are illustrative only.

Instance: DLIMS
InstanceOf: LaboratoryInformationSystem
Title: "Laboratory Information System - DLIMS (NW GLH)"
Description: "Fictitious example: DLIMS, the NW GLH laboratory system that receives OMICS DSS sub-orders from iGene"
Usage: #example

* identifier[laboratoryInformationSystemId].value = "DLIMS"

* deviceName[+]
  * name = "DLIMS"
  * type = http://hl7.org/fhir/device-nametype#user-friendly-name

* owner
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"


Instance: OmicsDSS
InstanceOf: LaboratoryInformationSystem
Title: "Laboratory Information System - OmicsDSS (NW GLH)"
Description: "Fictitious example: OmicsDSS, the NW GLH bioinformatics decision support system"
Usage: #example

* identifier[laboratoryInformationSystemId].value = "OmicsDSS"

* deviceName[+]
  * name = "Omics DSS"
  * type = http://hl7.org/fhir/device-nametype#user-friendly-name

* owner
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"


Instance: ServiceRequest-ctDNA-DLIMS-SubOrder
InstanceOf: ServiceRequest
Title: "ServiceRequest - OMICS DSS sub-order from iGene to DLIMS (ctDNA)"
Description: "Fictitious example: iGene sub-orders the OMICS DSS analysis for ctDNA order T26-59XG to DLIMS (ILW LAB-35)"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "T26-59XG-DSS1"
* identifier[OrderPlacerNumber].system = "https://fhir.nwgenomics.nhs.uk/iGene/SubOrderIdentifier"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* identifier[OrderFillerNumber].type = $v2-0203#FILL
* identifier[OrderFillerNumber].value = "D26-004512"
* identifier[OrderFillerNumber].system = "https://fhir.nwgenomics.nhs.uk/DLIMS/OrderIdentifier"
* identifier[OrderFillerNumber].assigner.identifier.system = $ods-code
* identifier[OrderFillerNumber].assigner.identifier.value = "699X0"

* basedOn
  * reference = "ServiceRequest/ServiceRequest-ctDNA"
  * identifier.type = $v2-0203#FILL
  * identifier.value = "T26-59XG"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* requisition
  * type = $v2-0203#PGN
  * value = "R26-15AY"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/ReferralIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* status = #active
* intent = #filler-order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-07-02"

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

* performer[organization]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* performer[laboratoryInformationSystem]
  * type = #Device
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * identifier.value = "DLIMS"
  * display = "DLIMS"

* specimen[+].reference = "Specimen/Specimen-ctDNA"

* reasonCode[+]
  * coding[+]
    * code = #M4
    * system = $GCC
