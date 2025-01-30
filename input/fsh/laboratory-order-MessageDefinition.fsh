Instance:  LaboratoryOrderMessageDefinition
InstanceOf: MessageDefinition
Title:   "Laboratory Order Message Definition"
Usage:  #definition

* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21
* description = """
Event Notification
"""
* category = #consequence

* focus[+]
* focus[=]
  * code = #ServiceRequest
  * profile = Canonical(ServiceRequest)
  * min = 1
  * max = "*"


