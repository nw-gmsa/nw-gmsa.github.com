Profile:        DocumentReference
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference
Id:             DocumentReference
Title:          "DocumentReference"
Description:    """
HL7 v2:
- [OBX type ED](hl7v2.html#obx-type--ed)
- [OBX to DocumentReference](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-obx-to-documentreference.html)
- [TXA](hl7v2.html#txa)
- [TXA to DocumentReference](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-txa-to-documentreference.html)

Reference:
[IHE Europe Metadata for exchange medical documents and images](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf)
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* type from DocumentEntryType
* category from DocumentEntryClass

* content.attachment only NWAttachment

* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.sourcePatientInfo.identifier only MedicalRecordNumber

* context.event ^short = "The procedure or test code associated with the Accession Number (e.g. NICIP, Genomic Test Directory, etc.)"

* context.encounter 0..1 MS
* context.encounter only Reference(Encounter)
* context.encounter.identifier only HospitalProviderSpellIdentifier

* context.related 0..*

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "identifier.type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type"
* context.related ^slicing.ordered = false

* context.related contains
  fillerOrderNumber 0..1 MS and accessionNumber 0..1 MS
* context.related[accessionNumber] only Reference(ServiceRequest)
* context.related[accessionNumber].type 1..1 MS
* context.related[accessionNumber].type = "ServiceRequest"
* context.related[accessionNumber].identifier 1..1
* context.related[accessionNumber].identifier only AccessionNumber
* context.related[fillerOrderNumber] only Reference(ServiceRequest)
* context.related[fillerOrderNumber].type 1..1 MS
* context.related[fillerOrderNumber].type = "ServiceRequest"
* context.related[fillerOrderNumber].identifier 1..1
* context.related[fillerOrderNumber].identifier only FillerOrderNumber

* context.sourcePatientInfo only Reference(Patient)
* context.sourcePatientInfo.identifier only MedicalRecordNumber

* subject 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* author only Reference(Organization or Practitioner or PractitionerRole)
* author.identifier only PractitionerIdentifier or OrganisationCode

* custodian only Reference(Organization)
* custodian.identifier only OrganisationCode


