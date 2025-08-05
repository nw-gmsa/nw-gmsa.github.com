Instance:  unsolicited-observation
InstanceOf: MessageDefinition
Title:   "Message Definition - Unsolicited Observation"
Usage:  #definition

* description = """
"""

* category = #notification
* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* focus[+]
* focus[=]
  * code = #DiagnosticReport
  * profile = Canonical(DiagnosticReport)
  * min = 1
  * max = "*"

* focus[+]
* focus[=]
  * code = #DocumentReference
  * profile = Canonical(DocumentReference)
  * min = 0
  * max = "*"
