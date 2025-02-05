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

This is documentation on the version of [HL7 FHIR process-message](process-message) to be used for regional FHIR Messaging, this HL7 FHIR definition **SHALL** be followed.

"""
* comment = """

This `event message` differs from traditional NHS England definitions of this operation is that this operation is designed to be an interface to a mix of broker and event consumer actors, and so other standards they suport.

This is **NOT** intended to be a method of transferring health records or data between computer systems (i.e. it is not a health record type).

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

