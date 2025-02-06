Instance:  laboratory-order
InstanceOf: MessageDefinition
Title:   "Message Definition - Laboratory Order"
Usage:  #definition

* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* description = """
DRAFT conversion of [HL7 v2.5.1 OML_O21](https://hl7-definition.caristix.com/v2/HL7v2.5.1/TriggerEvents/OML_O21)
"""
* category = #consequence

* focus[+]
* focus[=]
  * code = #ServiceRequest
  * profile = Canonical(ServiceRequest)
  * min = 1
  * max = "*"

* allowedResponse[+].message = Canonical(laboratory-order-acknowledgement)


