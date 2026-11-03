Instance:  laboratory-order
InstanceOf: MessageDefinition
Title:   "Message Definition - Laboratory Order"
Usage:  #definition

* description = """
FHIR Message equivalent of the HL7 v2 [OML_O21](hl7v2.html#oml_o21-laboratory-order)
Laboratory Order. [OMG_O19](hl7v2.html#omg_o19-general-clinical-order) General Clinical
Order, which has the same segments including SPM, **MAY** be used instead of OML_O21 and
converts to this same message.
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

* responseRequired = #always
* allowedResponse[+]
  * message = Canonical(acknowledgement)


