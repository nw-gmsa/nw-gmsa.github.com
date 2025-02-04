Profile:        Encounter
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Encounter
Id:             Encounter
Title:          "Encounter"
Description:    """
Extension of UKCore-Encounter which includes constraints from:
- HL7 PV1 segment definitions from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
"""

* identifier 1..* MS
* type 1..1 MS
* type from AdmissionMethod
* serviceType 1..1 MS
* serviceType from Service

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* location.location only Reference(Location)
* location.location.identifier only OrganisationSiteIdentifier

* period MS
* participant MS
* participant.individual only Reference(Practitioner)
* participant.type 1..1
* participant.type.coding 1..*
* participant.type.coding.code 1..1
* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type.coding.code"
* participant ^slicing.rules = #open
* participant contains
  attendingDoctor 0..1 and
  referringDoctor 0..1 and
  consultingDoctor 0..* and
  admittingDoctor 0..1

* participant[attendingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ATND
* participant[attendingDoctor].individual.identifier only EnglandPractitionerIdentifier
* participant[referringDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#REF
* participant[referringDoctor].individual.identifier only EnglandPractitionerIdentifier
* participant[consultingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CON
* participant[consultingDoctor].individual.identifier only EnglandPractitionerIdentifier
* participant[admittingDoctor].type.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#ADM
* participant[admittingDoctor].individual.identifier only EnglandPractitionerIdentifier

* hospitalization.admitSource from AdmissionSource
* hospitalization.dischargeDisposition from DischargeDisposition

* serviceProvider 1..1
* serviceProvider.identifier only OrganisationCode
