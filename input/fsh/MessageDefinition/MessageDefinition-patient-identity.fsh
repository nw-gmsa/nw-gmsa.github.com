Instance:  patient-identity
InstanceOf: MessageDefinition
Title:   "Message Definition - Patient Identity"
Usage:  #definition

* description = """
See [Patient Identity Triggers](ValueSet-PatientIdentityTriggers) for `eventCoding` codes.

[Event](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html) Message

Conversion of

- [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
  - Create Patient [HL7 v2.4 ADT_28](https://hl7-definition.caristix.com/v2/HL7v2.4/TriggerEvents/ADT_A28)
  - Update Patient [HL7 v2.4 ADT_31](https://hl7-definition.caristix.com/v2/HL7v2.4/TriggerEvents/ADT_A31)
  - Update (merge) Patient [HL7 v2.4 ADT_40](https://hl7-definition.caristix.com/v2/HL7v2.4/TriggerEvents/ADT_A40)

Related to [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html)
"""
* status = #draft
* date = 2024-10-04
* category = #notification
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#A31

* focus[+]
* focus[=]
  * code = #Patient
  * profile = Canonical(Patient)
  * min = 1
  * max = "1"



