Instance:  MessageDefinition-laboratory-order-acknowledgement
InstanceOf: MessageDefinition
Title:   "Message Definition - Laboratory Order Acknowledgement"
Usage:  #definition

* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O22
* description = """
DRAFT conversion of [HL7 v2.5.1 ORL_O22](https://hl7-definition.caristix.com/v2/HL7v2.5.1/TriggerEvents/ORL_O22).

At present it is not intended to support Patient and ServiceRequest resources
"""
* category = #consequence

* focus[+]
* focus[=]
  * code = #Patient
  * profile = Canonical(Patient)
  * min = 0
  * max = "1"

* focus[+]
* focus[=]
  * code = #ServiceRequest
  * profile = Canonical(ServiceRequest)
  * min = 0
  * max = "*"


