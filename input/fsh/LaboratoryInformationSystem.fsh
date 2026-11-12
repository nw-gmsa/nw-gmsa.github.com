Profile:        LaboratoryInformationSystem
Parent:         Device
Id:             LaboratoryInformationSystem
Title:          "Laboratory Information System"
Description:    """
A Laboratory Information Management System (LIMS), Automation Manager or other laboratory system (e.g. DLIMS, OmicsDSS) that receives orders.
Used as `ServiceRequest.performer` for internal orders (LAB-4 work orders, and LAB-35 sub-orders within the same organisation),
where the ODS code cannot identify the receiving system, so the order can be routed to, and searched for by, the system that fulfils it.
Other resources normally reference the system by `identifier` only; the `Device` resource itself is held in repositories rather than exchanged.
"""

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the system"
* identifier ^slicing.ordered = false
* identifier contains
  laboratoryInformationSystemId 1..1 MS

* identifier[laboratoryInformationSystemId] ^short = "Identifier of the laboratory system, e.g. DLIMS or OmicsDSS"
* identifier[laboratoryInformationSystemId].system 1..1
* identifier[laboratoryInformationSystemId].system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
* identifier[laboratoryInformationSystemId].value 1..1

* deviceName 1..* MS
* deviceName.type = http://hl7.org/fhir/device-nametype#user-friendly-name

* owner 1..1 MS
* owner ^short = "The organisation (laboratory) that runs the system"
* owner only Reference(Organization)
* owner.identifier only OrganisationCode
