Instance:  original-document
InstanceOf: MessageDefinition
Title:   "Message Definition - Document and Document Notification"
Usage:  #definition

* description = """
"""

* category = #notification
* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#T02

* focus[+]
* focus[=]
  * code = #DocumentReference
  * profile = Canonical(DocumentReference)
  * min = 1
  * max = "*"

* focus[+]
* focus[=]
  * code = #Binary
  * profile = Canonical(Binary)
  * min = 1
  * max = "*"
