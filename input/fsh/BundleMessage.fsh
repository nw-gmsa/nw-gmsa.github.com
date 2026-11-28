Profile:        BundleMessage
Parent:         Bundle
Id:             BundleMessage
Title:          "Bundle - FHIR Messaging"
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

* obeys nw-msg-ref-1 and nw-msg-reachable-1 and nw-msg-patient-1 and nw-msg-fetus-1

Invariant: nw-msg-ref-1
Description: "Every urn:uuid reference SHALL resolve to an entry.fullUrl in the same message"
Expression: "entry.resource.descendants().ofType(Reference).reference.where(startsWith('urn:uuid:')).all($this in %resource.entry.fullUrl)"
Severity: #error

Invariant: nw-msg-reachable-1
Description: "Every entry other than the MessageHeader SHOULD be linked to the rest of the message: referenced by another entry (as a Reference or Attachment.url), or referencing one"
Expression: "entry.tail().all((%resource.entry.resource.descendants().ofType(Reference).reference | %resource.entry.resource.descendants().ofType(Attachment).url) contains fullUrl or resource.descendants().ofType(Reference).reference.exists($this in %resource.entry.fullUrl))"
Severity: #warning

Invariant: nw-msg-patient-1
Description: "An order, report or document message (O19, O21, R01, T02) SHALL be about one patient: at most one Patient entry. Relatives are RelatedPerson or FamilyMemberHistory"
Expression: "(entry.first().resource as MessageHeader).eventCoding.where(code = 'O19' or code = 'O21' or code = 'R01' or code = 'T02').exists() implies entry.where(resource is Patient).count() <= 1"
Severity: #error

Invariant: nw-msg-fetus-1
Description: "A Patient with no NHS Number (e.g. a fetus) SHOULD be accompanied by the mother as a RelatedPerson (relationship MTH) with an NHS Number (HL7 v2 NK1)"
Expression: "entry.resource.ofType(Patient).where(identifier.where(type.coding.code = 'NH').empty()).exists() implies entry.resource.ofType(RelatedPerson).where(relationship.coding.code = 'MTH' and identifier.where(type.coding.code = 'NH').exists()).exists()"
Severity: #warning
