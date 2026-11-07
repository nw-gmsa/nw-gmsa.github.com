Instance: GeneticClinicalReferral
InstanceOf: NWQuestionnaire
Title: "Genetic Clinical Referral"
Description: """
**For analysis purposes only - not an active or planned project.** See
[Genetic Referrals](GeneticReferrals.html) for the narrative use case this
Questionnaire sketches a computable data model for, and [Genetic Clinical
Referral - Differences from Genomic Test
Order](StructureDefinition-GeneticClinicalReferral.html#differences-from-genomic-test-order)
for how this compares to [Genomic Test
Order](StructureDefinition-GenomicTestOrder.html).

This is a closed-loop clinical referral into a genomics/clinical genetics
service (see [Genetic Referrals](GeneticReferrals.html)), modelled on HL7 v2
`OMG^O19` (IHE 360X referral order, for future use) - not a laboratory order. Where a data item is
genuinely the same one [Genomic Test Order](StructureDefinition-GenomicTestOrder.html)
already captures (e.g. patient demographics), this Questionnaire reuses the
same item, per the "check for existing patterns" principle in [How To
Engineer (scale and deliver)
Interoperability](HowToEngineerInteroperability.html#check-for-existing-patterns-before-modelling-new-ones).
"""
Usage:  #definition

* title = "Genetic Clinical Referral"
* status = #unknown
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GeneticClinicalReferral"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * linkId = "Patient"
  * text = "Patient"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"
  * item[+]
    * linkId = "Patient-designNote"
    * type = #display
    * text = "Reuses the same items as Genomic Test Order's Patient group - both populate the same HL7 v2 PID segment."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Patient/proband surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"

// Patient	Patient/proband first name

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"

// Patient	Patient/proband DOB

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"

// Patient	Patient/proband address

  * item[+]
    * type = #group
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address"
    * text = "Address"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-1"
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.line"
      * repeats = true
      * text = "Address Line"
    * item[+]
      * type = #string
      * linkId = "LN/45401-7"
      * code[+] = $loinc#45401-7
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"
      * text = "Postcode"

// Patient	Patient/proband sex registered at birth

  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"

// Patient	Patient/proband NHS number

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"

// Patient	Patient/proband hospital number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

// Patient	Account number (visit/episode number) - PV1-19

  * item[+]
    * type = #string
    * linkId = "LN/56797-4"
    * code[+] = $loinc#56797-4
    * text = "Account Number (Episode or Stay Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier.value"
    * required = false
    * item[+]
      * linkId = "LN/56797-4-designNote"
      * type = #display
      * text = "PV1-19 (Visit/Account Number) - identifier type VN (Visit Number) or AN (Hospital Provider Spell Identifier); not the unrelated v2 ACC segment."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	G number (pedigree number)

  * item[+]
    * type = #string
    * linkId = "pedigreeNumber"
    * code[+] = $loinc#74027-4 "Family pedigree identifier"
    * text = "G Number (Pedigree Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * item[+]
      * linkId = "pedigreeNumber-designNote"
      * type = #display
      * text = "Links the proband to consultands (at-risk relatives) referred as part of the same family investigation - see Distributed WGS (dWGS) Family Structure/Participant Type pattern. Modelled as Observation.valueString, not a Patient identifier - see Genomic General Ask At Order Entry's own G Number (Pedigree Number) item and WholeGenomicSequence.html for why."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "ReferringProvider"
  * text = "Referring Provider/Organisation (ORC-12 / ORC-21)"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * item[+]
    * linkId = "ReferringProvider-designNote"
    * type = #display
    * text = "OMG^O19 ORC-12 (ordering provider) and ORC-21 (ordering facility). Reuses the same items as Genomic Test Order's Healthcare Professional group."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Healthcare professional	Referring Clinician Name

  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"
    * text = "Referring Clinician Name"

// Healthcare professional	Referring Clinician Current Speciality

  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"
    * text = "Referring Clinician Current Speciality"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"

// Healthcare professional	Referring Clinician Professional Identifier

  * item[+]
    * type = #string
    * linkId = "LN/46608-6"
    * code[+] = $loinc#46608-6
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
    * text = "Referring Clinician Professional Identifier"

// Healthcare professional	Referring Clinician Email/Phone

  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Email"

  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Phone"

// Healthcare professional	Referring Organisation ODS code

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code"

* item[+]
  * type = #group
  * linkId = "ReferredToProvider"
  * text = "Referred-to Provider/Service (MSH-5 / MSH-6)"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.performer"
  * item[+]
    * linkId = "ReferredToProvider-designNote"
    * type = #display
    * text = """
    OMG^O19 MSH-5 / MSH-6 (receiving application / facility) - who/what the
    referral is being sent to. Genomic Test Order has no equivalent group: an
    order's Order Filler is implicit/fixed (the destination LIMS), whereas a
    referral explicitly names the receiving clinic/service - see Differences
    from Genomic Test Order below. May be a named clinician (PractitionerRole)
    or a service/clinic (HealthcareService) rather than a named individual.
    """
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "ReferredToProvider/serviceName"
    * text = "Referred-to Service/Clinic Name"
    * definition = "http://hl7.org/fhir/StructureDefinition/HealthcareService#HealthcareService.name"

  * item[+]
    * type = #string
    * linkId = "ReferredToProvider/organisationCode"
    * text = "Referred-to Organisation ODS Code"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"

  * item[+]
    * type = #string
    * linkId = "ReferredToProvider/clinicianName"
    * text = "Named Consultant/Clinician (if known)"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"

* item[+]
  * type = #group
  * linkId = "Referral"
  * text = "Referral (ORC / OBR)"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest"

// Referral	Referral Identifier (Originating Referral Identifier)

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-2"
    * text = "Referral Identifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderIdentifier"

// Referral	Referral Status

  * item[+]
    * type = #choice
    * linkId = "HL7/ORC-5"
    * text = "Referral Status"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.status"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/request-status"

// Referral	Referral Priority

  * item[+]
    * type = #choice
    * linkId = "LN/82768-3"
    * code[+] = $loinc#82768-3
    * text = "Priority"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.priority"
    * required = false
    * answerValueSet = Canonical(RequestPriority)

// Referral	Referral Type/Service Requested

  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4"
    * answerOption[+].valueCoding = http://snomed.info/sct#306119003
    * answerOption[=].initialSelected = true
    * text = "Referral Type / Service Requested"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "HL7/OBR-4-designNote"
      * type = #display
      * text = "For a clinical genetics referral this is SNOMED CT 306119003. Unlike Genomic Test Order's Test Code, this is not a Genomic Test Directory code: it names the clinical service/assessment being requested (e.g. genetic counselling, cascade testing), not a specific lab test."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "ReasonForReferral"
  * text = "Reason for Referral (OBR-31 / DG1)"

  * item[+]
    * type = #choice
    * linkId = "LN/51967-8"
    * code[+] = $loinc#51967-8
    * code[+] = $sct#782964007 "Genetic disease"
    * repeats = true
    * text = "Suspected/confirmed condition (reason for referral)"
    * answerValueSet = Canonical(GenomicClinicalIndicationCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"

* item[+]
  * type = #group
  * linkId = "FamilyHistory"
  * text = "Family History (Family Letter)"
  * item[+]
    * linkId = "FamilyHistory-designNote"
    * type = #display
    * text = """
    Genomic Test Order's order/test-type-specific detail is captured by
    structured Ask At Order Entry Questionnaires. A referral has no equivalent
    structured sub-Questionnaire today: the corresponding detail - who else in
    the family is affected, the inheritance pattern, degree of relationship of
    at-risk relatives - travels as free text or an attached document within the
    unstructured **family letter** (see Genetic Referrals and Cancer
    Background Information for Use Cases - Genetic Counselling Referral
    Across Regions), not as discrete data items. A future structured
    representation could use FamilyMemberHistory per relative (see the
    FamilyMemberHistory examples on Genomic Test Report), but that is not
    attempted here.
    """
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "HL7/NTE-1"
    * text = "Family Letter / Clinical Details (free text)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"

  * item[+]
    * type = #reference
    * linkId = "FamilyHistory/attachment"
    * text = "Family Letter (attached document)"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/DocumentReference"
    * item[+]
      * linkId = "FamilyHistory/attachment-designNote"
      * type = #display
      * text = """
      ServiceRequest.supportingInfo references a DocumentReference (the
      family letter), whose own DocumentReference.content.attachment.url
      points at a Binary holding the actual document - the same pattern NHS
      e-Referral Service (eRS) itself already uses for referral attachments
      (ReferralRequest.supportingInfo -> DocumentReference) - see Genetic
      Referrals - eRS FHIR Resource Model.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "SupportingInformation"
  * text = "Supporting Information (Forms and Clinical Documents)"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
  * item[+]
    * linkId = "SupportingInformation-designNote"
    * type = #display
    * text = """
    Clinical content travels as forms and clinical documents referenced from
    the referral, not copied into it - see Genetic Clinical Referral (logical
    model) - From Logical Model to Implementation Model.
    """
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #reference
    * linkId = "SupportingInformation/forms"
    * text = "Referral Forms"
    * required = false
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse"
    * item[+]
      * linkId = "SupportingInformation/forms-designNote"
      * type = #display
      * text = """
      Completed referral forms (e.g. a national GMS test order form or a
      service-specific referral form) as QuestionnaireResponse - structured
      answers, not a clinical document.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #reference
    * linkId = "SupportingInformation/pathologyReport"
    * code[+] = $loinc#11526-1 "Pathology study"
    * text = "Pathology Report"
    * required = false
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/DocumentReference"
    * item[+]
      * linkId = "SupportingInformation/pathologyReport-designNote"
      * type = #display
      * text = """
      Target: a reference to the pathology report as a clinical document
      shared by the NHS England Single Patient Record (SPR), either a
      DocumentReference or a FHIR Document Bundle. Interim: an attached PDF -
      a DocumentReference whose content.attachment.url points at a Binary
      (HL7 v2 OBX type ED).
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #reference
    * linkId = "SupportingInformation/patientSummary"
    * code[+] = $loinc#60591-5 "Patient summary Document"
    * text = "Patient Summary"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
    * extension[referenceProfile].valueCanonical = "http://hl7.org/fhir/StructureDefinition/DocumentReference"
    * item[+]
      * linkId = "SupportingInformation/patientSummary-designNote"
      * type = #display
      * text = """
      A clinical document - a DocumentReference or a FHIR Document Bundle,
      implemented the same way as the Pathology Report. Not part of the NHS
      England Genomics ServiceRequest specification.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
