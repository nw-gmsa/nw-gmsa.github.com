Instance: laboratory-information-system
InstanceOf: NamingSystem
Title: "Laboratory Information System Identifier"
Description: "Identifiers for laboratory systems (LIMS, Automation Managers and decision support systems) within NW Genomics, e.g. DLIMS and OmicsDSS. Used for `Device.identifier` and `ServiceRequest.performer[laboratoryInformationSystem].identifier`."
Usage: #definition

* name = "LaboratoryInformationSystemIdentifier"
* status = #draft
* kind = #identifier
* date = "2026-11-12"
* publisher = "NHS North West Genomics"
* responsible = "NHS North West Genomics"
* type = http://terminology.hl7.org/CodeSystem/v2-0203#RI "Resource identifier"
* description = "Identifiers for laboratory systems (LIMS, Automation Managers and decision support systems) within NW Genomics. Initial values: `DLIMS`, `OmicsDSS`."
* usage = "Used to reference a [Laboratory Information System](StructureDefinition-LaboratoryInformationSystem.html) Device by identifier, so internal orders (LAB-4, and LAB-35 within the same organisation) can be routed to, and searched for by, the system that fulfils them."
* jurisdiction = urn:iso:std:iso:3166#GB "United Kingdom of Great Britain and Northern Ireland"
* uniqueId[+]
  * type = #uri
  * value = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * preferred = true
