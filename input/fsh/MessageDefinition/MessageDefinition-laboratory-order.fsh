Instance:  laboratory-order
InstanceOf: MessageDefinition
Title:   "Message Definition - Laboratory Order"
Usage:  #definition

* description = """
"""

* category = #consequence
* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* focus[+]
* focus[=]
  * code = #ServiceRequest
  * profile = Canonical(ServiceRequest)
  * min = 1
  * max = "*"



