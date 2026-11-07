Logical:        GeneticClinicalReferralModel
Id:             GeneticClinicalReferral
Title:          "Genetic Clinical Referral"
Description:    """
**For analysis purposes only - not an active or planned project.** This referral is not
expected to be implemented within this IG; it is expected to be implemented via a
Genomics England Limited application, NHS England BaRS/eRS or the NHS England Genomic
Order Management Service.

A closed-loop clinical referral into a genomics/clinical genetics service (see
[Genetic Referrals](GeneticReferrals.html)), modelled on the IHE 360X HL7 v2 referral
order `OMG^O19` with `OSU^O51` status updates (see [Referral Request [PCC-55]](PCC-55.html)) -
not a laboratory order. The referral itself stays small: clinical content
travels as forms, clinical documents (pathology report, patient summary) and family
history referenced from the referral.

This is a logical model - it is not exchanged as is. It breaks down into
`ServiceRequest`, `Patient`, `PractitionerRole`, `Organization`, `HealthcareService`,
`QuestionnaireResponse`, `RelatedPerson`, `Observation` and clinical documents
(`DocumentReference` or a FHIR Document `Bundle`).
"""
Characteristics: #can-be-target

* referralIdentifier 1..1 OrderIdentifier "Referral Identifier" "Originating referral identifier, assigned by the referrer and used in every message"
* status 1..1 code "Referral Status" "e.g. active, completed, revoked"
* status from http://hl7.org/fhir/ValueSet/request-status (required)
* priority 0..1 code "Priority" "Urgency of the referral"
* priority from RequestPriority (required)
* dateOfReferral 0..1 dateTime "Date of referral" "When the referral was made"

// Patient

* patient 1..1 BackboneElement "Patient" "The proband. Same items as Genomic Test Order's patient."
  * nhsNumber 0..1 NHSIdentifier "NHS Number" "NHS Number of the patient"
  * medicalRecordNumber 0..1 MedicalRecordNumber "Hospital Number (Medical Record Number)" "Local hospital number of the patient"
  * familyName 1..1 string "Patient surname" "Patient surname"
  * givenName 1..1 string "Patient first name" "Patient first name"
  * birthDate 1..1 date "Date of birth" "Patient date of birth"
  * address 0..1 Address "Address" "Address line(s) and postcode"
  * sexRegisteredAtBirth 0..1 code "Sex registered at birth" "Administrative gender"
  * accountNumber 0..1 Identifier "Account Number (Episode or Stay Number)" "Patient account number - a Visit Number (VN) or Hospital Provider Spell Identifier (AN). Only diagnostic laboratory orders require the Hospital Provider Spell Identifier."
  * pedigreeNumber 0..1 string "G Number (Pedigree Number)" """
Links the proband to consultands (at-risk relatives) referred as part of the same
family investigation. Not a Patient identifier.
"""
* patient.accountNumber only VisitNumber or HospitalProviderSpellIdentifier
* patient.sexRegisteredAtBirth from http://hl7.org/fhir/ValueSet/administrative-gender (required)

// Referrer and recipient

* referrer 1..1 BackboneElement "Referring Provider" "The referring clinician and organisation. Same items as Genomic Test Order's requester."
  * name 1..1 string "Referring Clinician Name" "Referring clinician name"
  * specialty 0..1 CodeableConcept "Referring Clinician Current Speciality" "Referring clinician specialty"
  * professionalIdentifier 0..1 PractitionerIdentifier "Referring Clinician Professional Identifier" "e.g. GMC/GMP number"
  * email 0..* string "Email" "Referring clinician email"
  * phone 0..1 string "Phone" "Referring clinician telephone"
  * organisation 0..1 OrganisationCode "Referring Organisation" "ODS code of the referring organisation"
* referrer.specialty from https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode (extensible)
* recipient 0..1 BackboneElement "Referred-to Provider/Service" """
Who the referral is sent to - a named clinician or a service/clinic. Genomic Test Order
has no equivalent: an order's Order Filler is fixed.
"""
  * service 0..1 string "Referred-to Service/Clinic Name" "e.g. clinical genetics clinic"
  * organisation 0..1 OrganisationCode "Referred-to Organisation" "ODS code of the receiving organisation"
  * clinician 0..1 string "Named Consultant/Clinician (if known)" "Named clinician, if any"

// Request

* serviceRequested 1..1 CodeableConcept "Referral Type / Service Requested" """
The clinical service/assessment requested (e.g. genetic counselling, cascade testing) -
not a Genomic Test Directory code. For a clinical genetics referral this is SNOMED CT
`306119003`.
"""
* serviceRequested = http://snomed.info/sct#306119003
* reasonForReferral 0..* CodeableConcept "Reason for referral" "Suspected/confirmed condition"
* reasonForReferral from GenomicClinicalIndicationCodes (extensible)
* clinicalInformation 0..1 string "Clinical details" "Brief free-text note, if no family letter is attached"

// Supporting information

* forms 0..* Reference(QuestionnaireResponse) "Referral forms" """
Completed referral forms, e.g. a national GMS test order form or a service-specific
referral form, as structured answers.
"""
* consultand 0..* Reference(RelatedPerson) "Consultand" "A named at-risk relative being referred alongside the proband - one per relative"
* pathologyReport 0..* Reference(DocumentReference or Bundle) "Pathology report" """
The pathology report supporting the referral. Ideally a reference to a clinical document
shared via the NHS England Single Patient Record (SPR); in the interim this may be an
attached PDF (`DocumentReference` -> `Binary`). NHS England NDRS also holds Cancer
Pathology Reports.
"""
* patientSummary 0..1 Reference(DocumentReference or Bundle) "Patient summary" """
The patient summary, as a clinical document. **Not** part of the NHS England Genomics
ServiceRequest specification.
"""
* familyHistory 0..* Reference(FamilyMemberHistory or DocumentReference or Bundle) "Family history" """
Structured family history (FamilyMemberHistory, one per relative), or the unstructured
family letter as a clinical document. At present clinical genetics is believed
to retrieve structured family history from NHS England NDRS (National Disease Registration Service). NDRS is a
reporting/analytical service, so the information may not be current.
"""

Mapping:        GeneticClinicalReferral-HL7v2
Source:         GeneticClinicalReferralModel
Target:         "http://hl7.org/v2"
Id:             hl7v2
Title:          "HL7 v2 OMG_O19 / OSU_O51 (IHE 360X)"
* referralIdentifier -> "ORC-2 / OBR-2"
* status -> "ORC-1 / ORC-5 (OMG^O19 ORC-1 NW; status changes in OSU^O51)"
* priority -> "TQ1-9"
* dateOfReferral -> "ORC-9"
* patient -> "PID"
* patient.nhsNumber -> "PID-3"
* patient.medicalRecordNumber -> "PID-3"
* patient.familyName -> "PID-5.1"
* patient.givenName -> "PID-5.2"
* patient.birthDate -> "PID-7"
* patient.address -> "PID-11"
* patient.sexRegisteredAtBirth -> "PID-8"
* patient.accountNumber -> "PV1-19"
* patient.pedigreeNumber -> "OBX"
* referrer -> "ORC-12 / OBR-16 (ordering provider), ORC-21 (ordering facility)"
* recipient -> "MSH-5 / MSH-6 (receiving application / facility)"
* serviceRequested -> "OBR-4 (306119003^^SCT)"
* reasonForReferral -> "OBR-31 / DG1"
* clinicalInformation -> "NTE"
* forms -> "OBX"
* consultand -> "NK1"
* pathologyReport -> "OBX (type = RP reference pointer, or ED for an attached PDF)"
* patientSummary -> "OBX (type = RP reference pointer, or ED for an attached PDF)"
* familyHistory -> "OBX (type = RP or ED) for the family letter; structured family history has no OMG_O19 segment - retrieved from NHS England NDRS"

Mapping:        GeneticClinicalReferral-FHIR
Source:         GeneticClinicalReferralModel
Target:         "https://fhir.nwgenomics.nhs.uk"
Id:             fhir
Title:          "FHIR (this IG)"
* referralIdentifier -> "ServiceRequest.identifier[OrderIdentifier]"
* status -> "ServiceRequest.status"
* priority -> "ServiceRequest.priority"
* dateOfReferral -> "ServiceRequest.authoredOn"
* patient -> "ServiceRequest.subject (Patient)"
* patient.nhsNumber -> "Patient.identifier[nhsNumber]"
* patient.medicalRecordNumber -> "Patient.identifier[MedicalRecordNumber]"
* patient.familyName -> "Patient.name.family"
* patient.givenName -> "Patient.name.given"
* patient.birthDate -> "Patient.birthDate"
* patient.address -> "Patient.address"
* patient.sexRegisteredAtBirth -> "Patient.gender"
* patient.accountNumber -> "ServiceRequest.encounter.identifier"
* patient.pedigreeNumber -> "Observation.valueString via ServiceRequest.supportingInfo"
* referrer -> "ServiceRequest.requester (PractitionerRole)"
* referrer.organisation -> "PractitionerRole.organization"
* recipient -> "ServiceRequest.performer (PractitionerRole or HealthcareService)"
* recipient.service -> "HealthcareService.name"
* recipient.organisation -> "PractitionerRole.organization"
* recipient.clinician -> "PractitionerRole.practitioner"
* serviceRequested -> "ServiceRequest.code"
* reasonForReferral -> "ServiceRequest.reasonCode"
* clinicalInformation -> "ServiceRequest.note"
* forms -> "ServiceRequest.supportingInfo (QuestionnaireResponse)"
* consultand -> "ServiceRequest.supportingInfo (RelatedPerson)"
* pathologyReport -> "ServiceRequest.supportingInfo (DocumentReference, or Bundle type = document)"
* patientSummary -> "ServiceRequest.supportingInfo (DocumentReference, or Bundle type = document)"
* familyHistory -> "ServiceRequest.supportingInfo (FamilyMemberHistory, or DocumentReference for the family letter)"

Mapping:        GeneticClinicalReferral-Questionnaire
Source:         GeneticClinicalReferralModel
Target:         "https://fhir.nwgenomics.nhs.uk/Questionnaire/GeneticClinicalReferral"
Id:             questionnaire
Title:          "Questionnaire (linkId)"
* referralIdentifier -> "HL7/ORC-2"
* status -> "HL7/ORC-5"
* priority -> "LN/82768-3"
* patient -> "Patient"
* patient.nhsNumber -> "LN/89061-6"
* patient.medicalRecordNumber -> "LN/76435-7"
* patient.familyName -> "LN/45394-4"
* patient.givenName -> "LN/45392-8"
* patient.birthDate -> "LN/21112-8"
* patient.address -> "LN/56799-0"
* patient.sexRegisteredAtBirth -> "LN/46098-0"
* patient.accountNumber -> "LN/56797-4"
* patient.pedigreeNumber -> "pedigreeNumber"
* referrer -> "ReferringProvider"
* referrer.name -> "LN/18705-4"
* referrer.specialty -> "LN/18707-0"
* referrer.professionalIdentifier -> "LN/46608-6"
* referrer.email -> "LN/89058-2"
* referrer.phone -> "LN/81230-5"
* referrer.organisation -> "HL7/ORC-21"
* recipient -> "ReferredToProvider"
* recipient.service -> "ReferredToProvider/serviceName"
* recipient.organisation -> "ReferredToProvider/organisationCode"
* recipient.clinician -> "ReferredToProvider/clinicianName"
* serviceRequested -> "HL7/OBR-4"
* reasonForReferral -> "LN/51967-8"
* clinicalInformation -> "HL7/NTE-1"
* consultand -> "Genetic Referral Consultand Questionnaire"
* forms -> "SupportingInformation/forms"
* pathologyReport -> "SupportingInformation/pathologyReport"
* patientSummary -> "SupportingInformation/patientSummary"
* familyHistory -> "FamilyHistory (family letter: FamilyHistory/attachment)"
