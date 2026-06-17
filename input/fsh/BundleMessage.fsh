Profile:        BundleMessage
Parent:         Bundle
Id:             BundleMessage
Title:          "Bundle - FHR Messaging"
Description:    "[FHIR Messaging](https://hl7.org/fhir/R4/messaging.html)"

* identifier ^short = "Business identifier for this Laboratory Report"
* identifier 1..
* type = #message
* timestamp 1..

* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open

* entry contains message 1..1
* entry[message].resource only MessageHeader
