Logical:        GenomicTestOrderModel
Id:             GenomicTestOrder
Title:          "Genomic Test Order"
Description:    """
The common core of a Genomic Test Order: the Patient, Healthcare Professional, Test
Request and Specimen shared by every order, regardless of test type. Ask At Order Entry
questions, which vary by order/test type, are **not** part of this core - they are
carried alongside it (see Order Entry Questions below).

This is a logical model - it is not exchanged as is. It breaks down into `ServiceRequest`,
`Patient`, `Encounter`, `PractitionerRole`, `Organization`, `Specimen`, `Observation` and
`RelatedPerson` for exchange via [HL7 v2 OML_O21](hl7v2.html#oml_o21-laboratory-order)
or the [FHIR Message O21](MessageDefinition-laboratory-order.html).
"""
Characteristics: #can-be-target

// Patient

* patient 1..1 BackboneElement "Patient" "Patient (proband) identification and demographics"
  * nhsNumber 0..1 NHSIdentifier "NHS Number" "NHS Number of the patient"
  * medicalRecordNumber 1..1 MedicalRecordNumber "Hospital Number (Medical Record Number)" "Local hospital number of the patient. Used as the subject identifier if NHS Number is not present."
  * familyName 1..1 string "Patient surname" "Patient surname"
  * givenName 1..1 string "Patient first name" "Patient first name"
  * birthDate 1..1 date "Date of birth" "Patient date of birth"
  * deceasedDateTime 0..1 dateTime "Date of death" "Patient date of death"
  * address 0..1 Address "Address" "Address line(s), city and postcode"
  * sexRegisteredAtBirth 0..1 code "Sex registered at birth" "Administrative gender"
  * ethnicCategory 0..1 CodeableConcept "Ethnic Category" "Patient ethnic category"
  * generalPractice 0..1 OrganisationCode "GP Surgery (ODS Code)" "Patient's registered GP practice"
* patient.sexRegisteredAtBirth from http://hl7.org/fhir/ValueSet/administrative-gender (required)
* patient.ethnicCategory from Ethnicity (extensible)

// Hospital Spell

* hospitalSpell 0..1 BackboneElement "Hospital Spell" "Treat as mandatory for reflex or subcontracted orders."
  * accountNumber 0..1 HospitalProviderSpellIdentifier "Account Number (Episode or Stay Number)" """
Case identification or account number. Assigned by the Order Placer, where it is known
as spell or episode id. Also known as stay number.
"""
  * hospitalService 0..1 CodeableConcept "Hospital Service" "Hospital service the patient is under"
  * location 0..1 string "Location" "Where the patient is (ward/clinic)"
* hospitalSpell.hospitalService from Service (extensible)

// Healthcare Professional

* requester 1..1 BackboneElement "Healthcare Professional (Ordering Practitioner)" "The referring clinician and their organisation"
  * name 1..1 string "Referring Clinician Name" "Referring clinician name"
  * specialty 1..1 CodeableConcept "Referring Clinician Current Speciality" "Referring clinician specialty"
  * professionalIdentifier 1..1 PractitionerIdentifier "Referring Clinician Professional Identifier" "e.g. GMC/GMP number"
  * email 0..* string "Email" "Referring (and secondary) clinician email"
  * phone 0..1 string "Phone" "Referring clinician telephone"
  * orderingFacility 1..1 OrganisationCode "Referring Organisation / Ordering Facility" "ODS code of the organisation placing the order"
* requester.specialty from https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode (extensible)

// Test Request (Diagnostic Workflow)

* orderIdentifier 1..1 OrderPlacerNumber "Order Placer Number" "Test request ID / Order ID, assigned by the Order Placer"
* fillerOrderNumber 0..1 Identifier "Filler Order Number" "Order number assigned by the Order Filler (LIMS)"
* orderGroupNumber 0..1 OrderGroupNumber "(Placer) Order Group Number" "Groups related orders together"
* category 0..1 CodeableConcept "Test Category" "e.g. Rare and inherited disease, Cancer, Haemoglobinopathy"
* category from OrderCategory (extensible)
* testCode 1..* CodeableConcept "Test Code" """
(Order) Procedure Code - the National Genomic Test Directory code. Which codes apply
depends on the test category (Rare and Inherited Disease, Haemoglobinopathy, Cancer).
"""
* testCode from GenomicTestCodes (extensible)
* orderDate 0..1 dateTime "Order date" "When the order was placed"
* priority 0..1 code "Priority" "Urgency of the order"
* priority from RequestPriority (required)
* performer 0..1 OrganisationCode "Performer" "The laboratory the order is sent to"
* reasonCode 0..* CodeableConcept "Specific disease suspected / reason for testing" "Clinical indication (CITT code), generally a SNOMED CT condition"
* reasonCode from GenomicClinicalIndicationCodes (extensible)
* clinicalInformation 0..* string "Relevant clinical information and family history" "Free-text clinical details"
* clinicalGeneticist 0..1 BackboneElement "Clinical Geneticist" "Clinical geneticist contact details"
  * email 0..1 string "Clinical Geneticist email" "Clinical geneticist email"
  * departmentEmail 0..1 string "Clinical Geneticist department email" "Clinical geneticist department email"
* forms 0..* Reference(QuestionnaireResponse or Observation or RelatedPerson) "Order forms (Ask At Order Entry)" """
Also known as **Ask At Order Entry** questions. Questions that vary by order/test type,
defined by a separate Ask At Order Entry Questionnaire and completed as a
QuestionnaireResponse. For exchange the answers are carried as Observation (OBX) or
RelatedPerson (NK1). See Order Entry Questions.
"""
* pathologyReport 0..* Reference(DocumentReference or Bundle) "Pathology report" """
Pathology studies supporting the order, e.g. a Cancer Pathology Report held by NHS
England NDRS, or a pathology report shared by the NHS England Single Patient Record.
Referenced as a clinical document, or in the interim an attached PDF.
"""
* patientSummary 0..1 Reference(DocumentReference or Bundle) "Patient summary" """
The patient summary, as a clinical document. **Not** part of the NHS England Genomics
ServiceRequest specification.
"""

// Specimen

* specimen 0..* BackboneElement "Specimen/Biopsy" "The sample(s) sent for testing"
  * status 0..1 code "Sample collection status" "e.g. available, unavailable"
  * identifier 0..* Identifier "Specimen ID Number" "Placer specimen number (LOINC 80398-1)"
  * accessionIdentifier 0..* SpecimenAccessionNumber "Lab DNA Number (if known)" "Identifier assigned by the laboratory that holds the sample/stored DNA"
  * accessionAssigner 0..1 OrganisationCode "Pathology Laboratory Hospital/Trust ID" "For a pathology lab sample or stored DNA"
  * type 1..1 CodeableConcept "Specimen Type" "Specimen type"
  * bodySite 0..1 CodeableConcept "Tissue source/organ of origin" "Specimen source site"
  * quantity 0..1 string "Specimen Volume/number of slides or scrolls" "Volume, or number of slides or scrolls"
  * additive 0..1 boolean "Anticoagulant/preservative?" "Whether an anticoagulant/preservative was used"
  * collectedDateTime 0..1 dateTime "Specimen Collection Date" "When the specimen was collected"
  * receivedTime 0..1 dateTime "Date and time sample received in lab" "When the laboratory received the specimen"
  * shipmentTrackingNumber 0..* ShipmentTrackingNumber "Tracking number" "Shipment tracking number"
  * tracking 0..1 BackboneElement "Audit (Specimen Tracking)" "How the specimen was sent"
    * sentDateTime 0..1 dateTime "Date and time sample sent" "When the specimen was sent"
    * transportUsed 0..1 string "Transport used" "e.g. courier"
    * sentTo 0..1 string "Sample sent to" "Destination of the specimen"
    * sentBy 0..1 string "Name of person who sent sample" "Who sent the specimen"
* specimen.status from http://hl7.org/fhir/ValueSet/specimen-status (required)
* specimen.type from SpecimenType (extensible)
* specimen.bodySite from SpecimenBodySite (extensible)

Mapping:        GenomicTestOrder-HL7v2
Source:         GenomicTestOrderModel
Target:         "http://hl7.org/v2"
Id:             hl7v2
Title:          "HL7 v2 OML_O21 / OMG_O19"
* patient -> "PID"
* patient.nhsNumber -> "PID-3"
* patient.medicalRecordNumber -> "PID-3"
* patient.familyName -> "PID-5.1"
* patient.givenName -> "PID-5.2"
* patient.birthDate -> "PID-7"
* patient.deceasedDateTime -> "PID-29"
* patient.address -> "PID-11"
* patient.sexRegisteredAtBirth -> "PID-8"
* patient.ethnicCategory -> "PID-22"
* patient.generalPractice -> "PD1-3"
* hospitalSpell -> "PV1"
* hospitalSpell.accountNumber -> "PV1-19"
* hospitalSpell.hospitalService -> "PV1-10"
* hospitalSpell.location -> "PV1-3"
* requester -> "ORC-12"
* requester.professionalIdentifier -> "ORC-12"
* requester.name -> "ORC-12"
* requester.orderingFacility -> "ORC-21"
* orderIdentifier -> "ORC-2"
* fillerOrderNumber -> "ORC-3"
* orderGroupNumber -> "ORC-4"
* testCode -> "OBR-4"
* orderDate -> "ORC-9"
* performer -> "Implied by the destination of the message"
* reasonCode -> "DG1-3"
* clinicalInformation -> "NTE"
* clinicalGeneticist -> "OBX"
* forms -> "OBX / NK1"
* pathologyReport -> "OBX (type = RP reference pointer, or ED for an attached PDF)"
* patientSummary -> "OBX (type = RP reference pointer, or ED for an attached PDF)"
* specimen -> "SPM"
* specimen.identifier -> "SPM-2"
* specimen.accessionIdentifier -> "SPM-30"
* specimen.type -> "SPM-4"
* specimen.bodySite -> "SPM-8"
* specimen.additive -> "OBX (LOINC 74384-9)"
* specimen.collectedDateTime -> "SPM-17"
* specimen.receivedTime -> "SPM-18"
* specimen.shipmentTrackingNumber -> "SPM-32"
* specimen.tracking -> "OBX"

Mapping:        GenomicTestOrder-FHIR
Source:         GenomicTestOrderModel
Target:         "https://fhir.nwgenomics.nhs.uk"
Id:             fhir
Title:          "FHIR (this IG)"
* patient -> "ServiceRequest.subject (Patient)"
* patient.nhsNumber -> "Patient.identifier[nhsNumber]"
* patient.medicalRecordNumber -> "Patient.identifier[MedicalRecordNumber]"
* patient.familyName -> "Patient.name.family"
* patient.givenName -> "Patient.name.given"
* patient.birthDate -> "Patient.birthDate"
* patient.deceasedDateTime -> "Patient.deceasedDateTime"
* patient.address -> "Patient.address"
* patient.sexRegisteredAtBirth -> "Patient.gender"
* patient.ethnicCategory -> "Patient.extension:ethnicCategory"
* patient.generalPractice -> "Patient.generalPractitioner"
* hospitalSpell -> "ServiceRequest.encounter (Encounter - HospitalSpell)"
* hospitalSpell.accountNumber -> "Encounter.identifier"
* hospitalSpell.hospitalService -> "Encounter.serviceType"
* hospitalSpell.location -> "Encounter.location"
* requester -> "ServiceRequest.requester (PractitionerRole)"
* requester.name -> "PractitionerRole.practitioner.display"
* requester.specialty -> "PractitionerRole.specialty"
* requester.professionalIdentifier -> "PractitionerRole.practitioner.identifier"
* requester.email -> "PractitionerRole.telecom"
* requester.phone -> "PractitionerRole.telecom"
* requester.orderingFacility -> "PractitionerRole.organization; ServiceRequest.requester (Organization) if there is no requesting practitioner"
* orderIdentifier -> "ServiceRequest.identifier[OrderPlacerNumber]"
* fillerOrderNumber -> "ServiceRequest.identifier[OrderFillerNumber]"
* orderGroupNumber -> "ServiceRequest.requisition"
* category -> "ServiceRequest.category"
* testCode -> "ServiceRequest.code"
* orderDate -> "ServiceRequest.authoredOn"
* priority -> "ServiceRequest.priority"
* performer -> "ServiceRequest.performer"
* reasonCode -> "ServiceRequest.reasonCode"
* clinicalInformation -> "ServiceRequest.note"
* clinicalGeneticist -> "ServiceRequest.supportingInfo (Observation)"
* forms -> "ServiceRequest.supportingInfo (QuestionnaireResponse; answers as Observation / RelatedPerson)"
* pathologyReport -> "ServiceRequest.supportingInfo (DocumentReference, or Bundle type = document)"
* patientSummary -> "ServiceRequest.supportingInfo (DocumentReference, or Bundle type = document)"
* specimen -> "ServiceRequest.specimen (Specimen)"
* specimen.status -> "Specimen.status"
* specimen.identifier -> "Specimen.identifier"
* specimen.accessionIdentifier -> "Specimen.accessionIdentifier"
* specimen.accessionAssigner -> "Specimen.accessionIdentifier.assigner"
* specimen.type -> "Specimen.type"
* specimen.bodySite -> "Specimen.collection.bodySite"
* specimen.quantity -> "Specimen.collection.quantity"
* specimen.additive -> "Observation (LOINC 74384-9) via ServiceRequest.supportingInfo"
* specimen.collectedDateTime -> "Specimen.collection.collectedDateTime"
* specimen.receivedTime -> "Specimen.receivedTime"
* specimen.shipmentTrackingNumber -> "Specimen.identifier[ShipmentTrackingNumber]"
* specimen.tracking -> "Observation via ServiceRequest.supportingInfo"

Mapping:        GenomicTestOrder-Questionnaire
Source:         GenomicTestOrderModel
Target:         "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"
Id:             questionnaire
Title:          "Questionnaire (linkId)"
* patient -> "Patient"
* patient.nhsNumber -> "LN/89061-6"
* patient.medicalRecordNumber -> "LN/76435-7"
* patient.familyName -> "LN/45394-4"
* patient.givenName -> "LN/45392-8"
* patient.birthDate -> "LN/21112-8"
* patient.deceasedDateTime -> "LN/81954-0"
* patient.address -> "LN/56799-0"
* patient.sexRegisteredAtBirth -> "LN/46098-0"
* patient.ethnicCategory -> "LN/32624-9"
* patient.generalPractice -> "HL7/PD1-3"
* hospitalSpell.accountNumber -> "LN/56797-4"
* hospitalSpell.location -> "LN/89009-5"
* requester -> "HealthcareProfessional"
* requester.name -> "LN/18705-4"
* requester.specialty -> "LN/18707-0"
* requester.professionalIdentifier -> "LN/46608-6"
* requester.email -> "LN/89058-2"
* requester.phone -> "LN/81230-5"
* requester.orderingFacility -> "HL7/ORC-21"
* orderIdentifier -> "LN/106194-4"
* category -> "SNM/15220000"
* testCode -> "HL7/OBR-4-r, HL7/OBR-4-h, HL7/OBR-4-c"
* priority -> "LN/82768-3"
* reasonCode -> "LN/51967-8"
* clinicalInformation -> "HL7/NTE-1"
* clinicalGeneticist.email -> "NOS/GeneticistEmail"
* clinicalGeneticist.departmentEmail -> "NOS/GeneticistDepartmentEmail"
* specimen -> "Specimen"
* specimen.status -> "HL7/SPM"
* specimen.identifier -> "LN/80398-1"
* specimen.accessionIdentifier -> "Specimen/accessionIdentifier"
* specimen.accessionAssigner -> "LN/80398-1-ODS"
* specimen.type -> "LN/66746-9"
* specimen.bodySite -> "LN/39111-0"
* specimen.quantity -> "LN/3169-0"
* specimen.additive -> "LN/74384-9"
* specimen.collectedDateTime -> "LN/33882-2"
* specimen.receivedTime -> "NOS/SampleReceived"
* specimen.shipmentTrackingNumber -> "LN/97209-1"
* specimen.tracking -> "OrderTracking"
* specimen.tracking.sentDateTime -> "NOS/SampleSent"
* specimen.tracking.transportUsed -> "NOS/TransportUsed"
* specimen.tracking.sentTo -> "NOS/SampleSentTo"
* specimen.tracking.sentBy -> "NOS/SampleSentToName"
