Profile:        MessageHeader
Parent:         http://hl7.org/fhir/StructureDefinition/MessageHeader
Id:             MessageHeader
Title:          "MessageHeader"
Description:    "DRAFT"

* eventCoding 1..1 MS
* eventCoding from http://terminology.hl7.org/ValueSet/v2-0003 (required)
* eventUri 0..0

* destination.receiver.identifier 1..1 MS
* destination.receiver.identifier only OrganisationCode

* sender.identifier 1..1 MS
* sender.identifier only OrganisationCode

