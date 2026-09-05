Instance: GenomicTestOrder
InstanceOf: NWQuestionnaire
Title: "North West Genomics Test Order"
Description: """
The aim of this is to support conversion of multiple Genomic Order Forms from several NHS Trusts to HL7 v2 and/or FHIR.

This is the **common core** order form: the Patient, Healthcare Professional, Test
Request and Specimen fields shared by every order, regardless of test type - these map
onto the standardised [HL7 v2 OML_O21](hl7v2.html#oml_o21-laboratory-order) message and
its FHIR equivalent, the [FHIR Message O21](MessageDefinition-laboratory-order.html).
Ask At Order Entry questions, which vary by order/test type, are **not** part of this
core form - see [Order Entry Questions](#order-entry-questions) below for the
separate, order-type-specific Questionnaire to use alongside this one.
"""
Usage:  #definition

* title = "North West Genomics Test Order"
* status = #active1
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * linkId = "Patient"
  * text = "Patient"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient	Patient/proband surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"


//Patient	Patient/proband first name

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"

//Patient	Patient/proband DOB

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"

// Patient	Patient/proband date of death


  * item[+]
    * type = #date
    * linkId = "LN/81954-0"
    * code[+] = $loinc#81954-0
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.deceasedDateTime"
    * text = "Date of death"

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
      * linkId = "HL7/PID-11-3"
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.city"
      * text = "City"

// Patient	Patient/proband post code


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

//  Patient	Patient/proband ethnicity


  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnic Category"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * answerValueSet = Canonical(Ethnicity)

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
    * required = true

// Patient	Account number (visit number)


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
      * text = "PV1-19 (also known as stay number)"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Patient	Age at collection

  * item[+]
    * type = #decimal
    * linkId = "ageAtCollection"
    * text = "Age at collection (ignore for FHIR)"

// Patient	Location

  * item[+]
    * type = #string
    * linkId = "LN/89009-5"
    * text = "Location"
    * definition = "http://hl7.org/fhir/StructureDefinition/Encounter#Encounter.location"

// Patient	GP

  * item[+]
    * type = #choice
    * linkId = "HL7/PD1-3"
    * text = "GP Surgery (ODS Code)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.generalPractitioner"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Healthcare Professional"

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
    * required = true
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"

// Healthcare professional	Referring Clinician Professional Identifier

  * item[+]
    * type = #string
    * linkId = "LN/46608-6"
    * code[+] = $loinc#46608-6
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
    * text = "Referring Clinician Professional Identifier"
    * required = true

// Healthcare professional	Referring Clinician Email
// Healthcare professional	Secondary Clinician Email


  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * repeats = true
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Email"

// Healthcare professional	Referring Clinician Telephone

  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Phone"

//Healthcare professional	Referring Organisation ODS code

  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code / Ordering Facility"

* item[+]
  * type = #group
  * linkId = "TestRequest"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest"
  * text = "Test Request"

// Test request	Test request type

  * item[+]
    * type = #choice
    * linkId = "SNM/15220000"
    * code[+] = $sct#15220000 "Laboratory test"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.category"
    * text = "Test Category"
    * answerValueSet = Canonical(OrderCategory)
  //  * answerOption[+].valueCoding = $nwgmsa#RareAndInheritedDiseasesGeneticTesting "Rare and inherited diseases Genetic Testing (procedure)"
  //  * answerOption[+].valueCoding = $sct#1186936003 "Storage of specimen (procedure)"
  //  * answerOption[+].valueCoding = $nwgmsa#PreNatalGeneticTesting "Pre Natal Genetic Testing (procedure)"
  //  * answerOption[+].valueCoding = $nwgmsa#HaemoglobinopathyGeneticTesting "Haemoglobinopathy Genetic Testing (procedure)"
  //  * answerOption[+].valueCoding = $nwgmsa#CancerGeneticTesting "Cancer Genetic Testing (procedure)"

// Test request	CITT code
//Test request	Type of WGS
//Test request	Proband or Family Member (for WGS)
//Test request	Rare Disease Test Type
//Test request	Haemato-Oncology Test Type
//Test request	Solid Tumour Test Type

  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-r"
    * code[+] = $loinc#29300-1
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#RareAndInheritedDiseasesGeneticTesting
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Rare and inherited diseases)"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(GenomicRareAndInheritedDisease)
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-h"
    * code[+] = $loinc#29300-1
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#HaemoglobinopathyGeneticTesting
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Haemoglobinopathy)"
    * required = true
    * repeats = true
    * answerOption[+].valueCoding = $GTD#R361.1
    * answerOption[+].valueCoding = $GTD#R361.2
    * answerOption[+].valueCoding = $GTD#R372.1
    * answerOption[+].valueCoding = $GTD#R93.1
    * answerOption[+].valueCoding = $GTD#R93.2

  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-c"
    * code[+] = $loinc#29300-1
    * enableWhen[+]
      * question = "SNM/15220000"
      * operator = #=
      * answerCoding = $nwgmsa#CancerGeneticTesting
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Cancer)"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(GenomicCancer)


// Test request	Test request ID/Order ID

  * item[+]
    * type = #string
    * linkId = "LN/106194-4"
    * code[+] = $loinc#106194-4
    * text = "Test request ID/Order ID"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderIdentifier"
    * required = false

// Test request	Priority


  * item[+]
    * type = #choice
    * linkId = "LN/82768-3"
    * code[+] = $loinc#82768-3
    * text = "Priority"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.priority"
    * required = false
    * answerValueSet = Canonical(RequestPriority)

// Healthcare professional	Clinical Geneticist email

  * item[+]
    * linkId = "NOS/GeneticistEmail"
    * code[+] = $nwgmsa#GeneticistEmail
    * text = "Clinical Geneticist email"
    * type = #string
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"


// Healthcare professional	Clinical Geneticist department email

  * item[+]
    * linkId = "NOS/GeneticistDepartmentEmail"
    * code[+] = $nwgmsa#GeneticistDepartmentEmail
    * text = "Clinical Geneticist department email"
    * type = #string
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"


  * item[+]
    * type = #group
    * linkId = "PatientClinicalInformation"
    * text = "Patient Clinical Information"

// Patient clinical information	Specific disease suspected/reason for testing

    * item[+]
      * type = #choice
      * linkId = "LN/51967-8"
      * code[+] = $loinc#51967-8
      * code[+] = $sct#782964007 "Genetic disease"
      * repeats = true
      * text = "CITT code (Specific disease suspected/reason for testing)"
      * answerValueSet = Canonical(GenomicClinicalIndicationCodes)
      * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"

// Patient clinical information	Relevant clinical information and family history

    * item[+]
      * type = #string
      * linkId = "HL7/NTE-1"
      * text = "Relevant clinical information and family history"
      * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"

* item[+]
  * type = #group
  * linkId = "Specimen"
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

// Test request	Sample collection status

  * item[+]
    * type = #choice
    * linkId = "HL7/SPM"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.status"
    * text = "Sample collection status"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/specimen-status"


// Raw specimen/biopsy (Directly obtained from patient)	Specimin ID Number

  * item[+]
    * type = #string
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * linkId = "LN/80398-1"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
    * text = "Specimen ID Number"
    * item[+]
      * linkId = "LN/80398-1-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 80398-1 and OBX-2 = CE. OML v2.5.1 SPM-2"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Test request	Lab stored DNA Number (If Known)

  * item[+]
    * type = #string
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * linkId = "Specimen/accessionIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier"
    * text = "Lab DNA Number (If Known)"

  * item[+]
    * type = #string
    * linkId = "LN/80398-1-ODS"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier.assigner.identifier.value"
    * text = "Pathology Laboratory Hospital/Trust ID (for Path Lab Sample/Stored DNA)"

// Raw specimen/biopsy (Directly obtained from patient)	Specimin Collection Date

  * item[+]
    * type = #dateTime
    * linkId = "LN/33882-2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * code[+] = $loinc#68963-8 "Collection date and time of Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
    * text = "Specimen Collection Date"
    * item[+]
      * linkId = "LN/33882-2-designNote"
      * type = #display
      * text = """
      ORM v2.4 - OBX-3 = LOINC 33882-2 and OBX-2 = TS .
      OML v2.5.1 SPM-17
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Raw specimen/biopsy (Directly obtained from patient)	Specimen Type

  * item[+]
    * type = #choice
    * linkId = "LN/66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerValueSet = Canonical(SpecimenType)
    * text = "Specimen Type"
    * item[+]
      * linkId = "LN/66746-9-designNote"
      * type = #display
      * text = """
      ORM v2.4 - OBX-3 = LOINC 66746-9 and OBX-2 = CE.
      OML v2.5.1 SPM-4
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * linkId = "LN/74384-9"
    * code[+] = $sct#434711009 "Specimen container"
    * code[+] = $loinc#74384-9
    * text = "Anticoagulant/preservative?"
    * type = #choice
    * required = false
    * repeats = false
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

  // Raw specimen/biopsy (Directly obtained from patient)	Tissue source/organ of origin

  * item[+]
    * linkId = "LN/39111-0"
    * code[+] = $loinc#39111-0
    * code[+] = $loinc#31208-2 "Specimen source identified"
    * text = "Tissue source/organ of origin"
    * type = #choice
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.bodySite"

// Raw specimen/biopsy (Directly obtained from patient)	Specimin Volume/number of slides or scrolls

  * item[+]
    * linkId = "LN/3169-0"
    * code[+] = $loinc#3169-0 "Volume of Specimen"
    * code[+] = $loinc#42185-9 "Number of specimens obtained"
    * text = "Specimen Volume/number of slides or scrolls"
    * type = #string
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.quantity"

// Raw specimen/biopsy (Directly obtained from patient)	Anticoagulant/preservative


  * item[+]
    * linkId = "OrderTracking"
    * text = "Audit (Specimen Tracking)"
    * type = #group
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection"
    * item[+]
      * linkId = "NOS/SampleReceived"
      * text = "Date and time sample received in lab"
      * type = #date
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.receivedTime"
    * item[+]
      * linkId = "NOS/SampleSent"
      * code[+] = $nwgmsa#SampleSent
      * text = "Date and time sample sent"
      * type = #date
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueDateTime"
    * item[+]
      * linkId = "NOS/TransportUsed"
      * code[+] = $nwgmsa#TransportUsed
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
      * text = "Transport used"
      * type = #string
    * item[+]
      * linkId = "LN/97209-1"
      * code[+] = $loinc#97209-1
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier[ShipmentTrackingNumber]"
      * text = "Tracking number"
      * type = #string
    * item[+]
      * linkId = "NOS/SampleSentTo"
      * code[+] = $nwgmsa#SampleSentTo
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
      * text = "Sample sent to"
      * type = #string
    * item[+]
      * linkId = "NOS/SampleSentToName"
      * code[+] = $nwgmsa#SampleSentToName
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
      * text = "Name of person who sent sample"
      * type = #string


// Ask At Order Entry Questions have moved to a per-order-type Questionnaire - see
// GenomicGeneralAskAtOrderEntry ("NW Genomic General Test Order") for the default set
// (Consanguinity, pathology report confirmation, pregnancy/neonatal, deceased infant,
// Consent, Reason For Variant Re-Interpretation Request, High Infection Risk),
// dWGSSubOrder for distributed WGS, or HLATestsTransplantAskAtOrderEntry /
// ChimerismTestingAskAtOrderEntry for Histocompatibility and Immunogenetics (one per
// Hive order screen). See Questionnaire-GenomicTestOrder.html#order-entry-questions.

//* item[+]
//  * type = #group
//  * linkId = "PriorResults"
//  * text = "Prior Results"

//Raw specimen/biopsy (Directly obtained from patient)	Pathology Laboratory Hospital/Trust ID	If Test request type =solid tumour or haem onc or Cancer WGS
//Raw specimen/biopsy (Directly obtained from patient)	Date of Diagnosis	If Test request type =solid tumour or haem onc or Cancer WGS
//Raw specimen/biopsy (Directly obtained from patient)	Confirm pathology report to follow 	If Test request type =solid tumour or haem onc or Cancer WGS
//Raw specimen/biopsy (Directly obtained from patient)	Germline sample also being sent 	If Test request type =solid tumour or haem onc or Cancer WGS
//Raw specimen/biopsy (Directly obtained from patient)	Germline sample type	If Cancer sample type = germline/normal
//Raw specimen/biopsy (Directly obtained from patient)	Solid tumour pathology block/sample number	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Solid tumour type	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Solid tumour location	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Solid tumour topography	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Solid tumour morphology	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Solid tumour macrodissection requirements 	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Overall neoplastic cell content (%)	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Tumour sample presence (or not) of necrotic tissue within the cross section of the block that was cut	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Tumour sample Overall cellularity of the block that was cut (estimated # of cells in the cross-section of the block cut)	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Approx % neoplastic nuclei in tumour area highlighted 	If Cancer sample type = solid tumour
//Raw specimen/biopsy (Directly obtained from patient)	Haemato-oncology liquid tumour type	If Cancer sample type = haem onc
//Raw specimen/biopsy (Directly obtained from patient)	Tumour sample % Malignant nuceli/blasts	If Cancer sample type = haem onc
