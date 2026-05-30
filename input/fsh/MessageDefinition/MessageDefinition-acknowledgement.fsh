Instance:  acknowledgement
InstanceOf: MessageDefinition
Title:   "Message Definition - Acknowledgement"
Usage:  #definition

* description = """
OperationOutcome is required for rejected messages.
"""

* category = #consequence
* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#varies

* focus[+]
* focus[=]
  * code = #OperationOutcome
  * profile = Canonical(OperationOutcome)
  * min = 0
  * max = "1"

