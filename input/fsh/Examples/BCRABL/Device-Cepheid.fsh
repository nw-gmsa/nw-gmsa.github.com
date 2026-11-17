// The Cepheid GeneXpert (Automation Manager) that performs BCR-ABL1 testing, see the BCR-ABL Monitoring use case.
// Its Observations reference it by identifier in Observation.device; the RIE also carries it as a Device resource in the FHIR Message.

Instance: Device-Cepheid
InstanceOf: LaboratoryInformationSystem
Title: "Laboratory Information System - Cepheid GeneXpert (NW GLH)"
Description: "Fictitious example: the Cepheid GeneXpert analyser (Automation Manager) that produces BCR-ABL1 monitoring results"
Usage: #example

* id = "Cepheid"

* identifier[laboratoryInformationSystemId].value = "Cepheid"

* status = #active
* manufacturer = "Cepheid"

* deviceName[+]
  * name = "Cepheid GeneXpert"
  * type = http://hl7.org/fhir/device-nametype#user-friendly-name

* owner
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"
