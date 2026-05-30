Instance:  patient-encounter
InstanceOf: MessageDefinition
Title:   "Message Definition - Patient Encounter"
Usage:  #definition

* description = """
See [Patient Encounter Triggers](ValueSet-PatientEncounterTriggers.html) for `eventCoding` codes.

[Event](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html) Message

Conversion of

- [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)

Related to [IHE Patient Encounter Management [ITI-31]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html)
"""
* status = #draft
* date = 2024-10-04
* category = #notification
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#A01

* focus[+]
* focus[=]
  * code = #Encounter
  * profile = Canonical(Encounter)
  * min = 1
  * max = "1"
