Instance:  ProcessMessage
InstanceOf: OperationDefinition
Title:   "Process Message"
Usage:  #definition

* status = #draft
* kind = http://hl7.org/fhir/operation-kind#operation
* code = #process-message
* name = "ProcessMessage"
* system = true
* type = false
* instance = false
* description = """

This is documentation on a specific `event message` use case for [HL7 FHIR process-message](process-message), this HL7 FHIR definition **SHOULD** be followed.

This `event message` differs from traditional NHS England definitions of this operation is that this operation is designed to be an interface to a mix of broker and event consumer actors, and so other standards they suport.

It is **NOT** intended to be a method of transferring health records or data between computer systems (i.e. it is not a health record type). This distinction is to highlight the similarity of `event-messages` and business communication, it is aimed to support business process automation and so replace Fax 2.0 (email).

"""
* comment = """

## Message Metadata Mapping

For detailed HL7 v2 to FHIR Mappings see [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-msh-to-messageheader.html)

| Name                | Direct / REST Headers (NHS England) | Point to Point <br/> FHIR Message R4B          | Point to Point <br/> MSH HL7 v2     | Topic Notification <br/>  FHIR Message R4B                                                     | Subscription Notification <br/>FHIR Subscription R4B | Point to Point MESH <br/> REST Headers | Subscription MNS <br/> [CloudEvents](https://cloudevents.io/)                       |
|---------------------|-------------------------------------|------------------------------------------------|-------------------------------------|------------------------------------------------------------------------------------------------|------------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------------------|
| From (Organisation) | NHSD-End-User-Organisation          | MessageHeader .sender .identifier              | MSH-4 Sending Facility (ODS Code)   | MessageHeader.sender .identifier                                                               |                                                      |                                        |                                                                                     |
| To (Organisation)   |                                     | MessageHeader.destination .receiver.identifier | MSH-6 Receiving Facility (ODS Code) | MessageHeader.destination .receiver.identifier                                                 |                                                      |                                        |                                                                                     |
| From (System)       |                                     | MessageHeader.source .endpoint                 | MSH-3 Sending Application           | MessageHeader.source .endpoint                                                                 |                                                      | mex-from                               | source                                                                              |
| To (System)         |                                     | MessageHeader.destination .endpoint            | MSH-5 Receiving Application         | MessageHeader.destination .endpoint                                                            |                                                      | mex-to                                 |                                                                                     |
| Topic               |                                     | &#10007;                                       |                                     | MessageHeader.eventUri (SubscriptionTopic)                                                                   | SubscriptionStatus.topic                             |                                        | subject?                                                                            |
| Event               |                                     | MessageHeader.eventCoding                      | MSH-9 Message Type                  | &#10007;                                                                                       |                                                      | mex-workflowid                         | type?                                                                               |
| Event Number        |                                     |                                                |                                     |                                                                                                | SubscriptionStatus.notificationEvent                 |                                        |                                                                                     |
| Reason              |                                     |                                                | MSH-9 Message Type                  | MessageHeader.reason ([hl7v2 events](https://terminology.hl7.org/6.0.2/ValueSet-v2-0003.html)) |                                                      |                                        |                                                                                     |
| Subscription        |                                     |                                                |                                     |                                                                                                | SubscriptionStatus.subscription                      |                                        |                                                                                     |
| Timestamp           |                                     | Bundle.timestamp                               | MSH-7 Date/Time of Message          | Bundle .timestamp                                                                              | SubscriptionStatus.notificationEvent .timestamp      |                                        | time                                                                                |
| Correlation ID      | X-Correlation-Id                    | Bundle.identifier                              | MSH-10 Message Control ID           | Bundle .identifier                                                                             |                                                      | mex-localid                            |                                                                                     |
| Message ID          | X-Request-Id                        | MessageHeader.id                               | MSH-10 Message Control ID           | MessageHeader .id                                                                              |                                                      | mex-messageid                          | id                                                                                  |
| Payload             | event data                          | event data                                     | event data                          | event data (and referenced event?)                                                             | event data (and referenced event)                    | event data                             | event reference (dataref but cloud watch also support data, is this filter in MNS?) |


"""
* resource[+] = #MessageHeader
* parameter[+].name = #content
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The message to process (or, if using asynchronous messaging, it may be a response message to accept)"
* parameter[=].type = #Bundle

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #Bundle
* parameter[=].documentation = "A response message, if synchronous messaging is being used (mandatory in this case). For asynchronous messaging, there is no return value"

