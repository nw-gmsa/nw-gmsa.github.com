Profile:        DocumentReference
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference
Id:             DocumentReference
Title:          "DocumentReference"
Description:    """
Based on UK Definitions from [IHE Europe Metadata for exchange medical documents and images](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf)
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* type from DocumentEntryType
* category from DocumentEntryClass

* content.attachment only Attachment

* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.sourcePatientInfo.identifier only MedicalRecordNumber

* context.related 0..*

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type"
* context.related ^slicing.ordered = false

* context.related contains
  accessionNumber 0..1 MS
* context.related[accessionNumber] only Reference(ServiceRequest)
* context.related[accessionNumber].type 1..1 MS
* context.related[accessionNumber].type = "ServiceRequest"
* context.related[accessionNumber].identifier 1..1
* context.related[accessionNumber].identifier only AccessionNumber

* subject 1..1
* subject only Reference(Patient)
* subject.identifier only NHSNumber

* author only Reference(Organization or Practitioner)
* author.identifier only EnglandPractitionerIdentifier or OrganisationCode



