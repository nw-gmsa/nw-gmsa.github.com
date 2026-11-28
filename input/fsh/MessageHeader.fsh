Profile:        MessageHeader
Parent:         http://hl7.org/fhir/StructureDefinition/MessageHeader
Id:             MessageHeader
Title:          "Document Message (MessageHeader)"
Description:    "`Messaging` [Document Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) "

* meta.lastUpdated	1..1 MS

* eventCoding 1..1 MS

* eventCoding from http://terminology.hl7.org/ValueSet/v2-0003|3.0.0

* destination.receiver.identifier 1..1 MS
* destination.receiver.identifier only OrganisationCode

* sender.identifier 1..1 MS
* sender.identifier only OrganisationCode

* response 0..1 MS
* response ^short = "Mandatory for message acknowledgements."
* response.identifier 1..1 MS
* response.code 1..1 MS

* destination 1..* MS

* focus MS
* obeys nw-mh-focus-1 and nw-mh-focus-order and nw-mh-focus-report and nw-mh-focus-document

Invariant: nw-mh-focus-1
Description: "A message SHALL have a focus, unless it is an acknowledgement (response present)"
Expression: "response.exists() or focus.exists()"
Severity: #error

Invariant: nw-mh-focus-order
Description: "An order message (O19, O21) SHALL have a ServiceRequest focus (MessageDefinition laboratory-order)"
Expression: "(eventCoding.code = 'O21' or eventCoding.code = 'O19') implies focus.where(type = 'ServiceRequest' or resolve() is ServiceRequest).exists()"
Severity: #error

Invariant: nw-mh-focus-report
Description: "A report message (R01) SHALL have a DiagnosticReport focus (MessageDefinition unsolicited-observation)"
Expression: "eventCoding.code = 'R01' implies focus.where(type = 'DiagnosticReport' or resolve() is DiagnosticReport).exists()"
Severity: #error

Invariant: nw-mh-focus-document
Description: "A document message (T02) SHALL have a DocumentReference focus"
Expression: "eventCoding.code = 'T02' implies focus.where(type = 'DocumentReference' or resolve() is DocumentReference).exists()"
Severity: #error
