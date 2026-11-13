Instance:  unsolicited-observation
InstanceOf: MessageDefinition
Title:   "Message Definition - Unsolicited Observation"
Usage:  #definition

* description = """
Unsolicited Observation (`R01`) FHIR Message, used for Test Results (LAB-5), Laboratory Reports (LAB-3) and sub-order results (LAB-36). The focus `DiagnosticReport` SHALL conform to [Test Results](StructureDefinition-TestResults.html) for LAB-5, or [Laboratory Report](StructureDefinition-LaboratoryReport.html) for LAB-3 and LAB-36.
"""

* category = #notification
* status = #draft
* date = 2024-10-04
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* focus[+]
* focus[=]
  * code = #DiagnosticReport
  // Test Results (LAB-5) and Laboratory Report (LAB-3, LAB-36) both derive from this profile; R4 allows only one profile here
  * profile = Canonical(DiagnosticReport)
  * min = 1
  * max = "*"

* focus[+]
* focus[=]
  * code = #DocumentReference
  * profile = Canonical(DocumentReference)
  * min = 0
  * max = "*"

* responseRequired = #always
* allowedResponse[+]
  * message = Canonical(acknowledgement)
