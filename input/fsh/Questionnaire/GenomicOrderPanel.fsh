Instance: GenomicOrderPanel
InstanceOf: NWQuestionnaire
Title: "NHS England North West Genomics Order Panel"
Description: """
THIS IS FOR ANALYSIS, and is not to be used for implementation at present.

The aim of this is to support conversion of multiple Genomic Order Forms HL7 v2 and FHIR.
"""

* status = #draft
* url = "https://fhir.north-west.england.nhs.uk/Questionnaire/GenomicOrderPanel"

* item[+]
  * linkId = "Patient"
  * text = "Patient"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

  * item[+]
    * type = #string
    * linkId = "surname"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"
  * item[+]
    * type = #string
    * linkId = "firstname"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"
  * item[+]
    * type = #date
    * linkId = "dateOfBirth"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"
  * item[+]
    * type = #date
    * linkId = "dateOfDeath"
    * required = false
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.deceasedDateTime"
    * text = "Date of death"
  * item[+]
    * type = #group
    * linkId = "address"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address"
    * text = "Address"
    * item[+]
      * type = #string
      * linkId = "line"
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.line"
      * repeats = true
      * text = "Address Line"
    * item[+]
      * type = #string
      * linkId = "city"
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.city"
      * repeats = true
      * text = "City"
    * item[+]
      * type = #string
      * linkId = "postcode"
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"
      * text = "Postcode"
  * item[+]
    * type = #choice
    * linkId = "registeredGender"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * type = #choice
    * linkId = "ethnicCategory"
    * text = "Ethnic Category"
    * answerValueSet = Canonical(Ethnicity)
  * item[+]
    * type = #string
    * linkId = "NHSNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber.value"
    * text = "NHS Number"
  * item[+]
    * type = #string
    * linkId = "MedicalRecordNumber"
    * text = "Hospital Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber.value"
    * required = true
  * item[+]
    * type = #string
    * linkId = "VisitNumber"
    * text = "Account Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier.value"
    * required = false
    * item[+]
      * linkId = "VisitNumber-designNote"
      * type = #display
      * text = "PV1-19 (also known as stay number)"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "pedigreeNumber"
    * text = "G Number (Pedigree Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:pedigreeNumber.value"

  * item[+]
    * type = #decimal
    * linkId = "ageAtCollection"
    * text = "Age at collection"
  * item[+]
    * type = #string
    * linkId = "location"
    * text = "Location"
  * item[+]
    * type = #choice
    * linkId = "GP"
    * text = "GP Surgery (ODS Code)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.generalPractitioner.identifier.value"
  * item[+]
    * type = #string
    * code[+] = $sct#842009 "Consanguinity"
    * linkId = "consanguinity"
    * text = "Patient is from consanguinous union?"
    * answerValueSet = Canonical(YNU)
    * item[+]
      * linkId = "consanguinity-designNote"
      * type = #display
      * text = "SNOMED CT = 842009"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "isPregnant"
    * text = "Does this test relate to an ongoing pregnancy?"
    * answerValueSet = Canonical(YNU)
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #group
      * linkId = "pregnant"
      * enableWhen[+]
        * question = "isPregnant"
        * operator = #=
        * answerCoding = #LA33-6
      * item[+]
        * type = #string
        * linkId = "multipleBirth"
        * text = "Does this test relate to a pregnancy with > 1 fetus?"
        * answerValueSet = Canonical(YNU)
        * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
      * item[+]
        * type = #date
        * linkId = "deliveryDate"
        * text = "Patient expected delivery date"
        * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueDateTime"
      * item[+]
        * type = #quantity
        * linkId = "patientGestation"
        * text = "Patient gestation"
        * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"


* item[+]
  * type = #group
  * linkId = "Order"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest"
  * text = "Test Request"
  * item[+]
    * type = #group
    * linkId = "3"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.requester"
    * text = "Referring Clinician"
    * item[+]
      * type = #string
      * linkId = "3.1"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.name"
      * text = "Name"
    * item[+]
      * type = #choice
      * linkId = "3.2"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"
      * text = "Specialty"
      * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
    * item[+]
      * type = #string
      * linkId = "3.3"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
      * text = "Professional/Consultant Code"
      * required = true
    * item[+]
      * type = #string
      * linkId = "3.4"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
      * text = "Phone"
    * item[+]
      * type = #string
      * linkId = "3.5"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
      * text = "Email"
    * item[+]
      * type = #string
      * linkId = "3.6"
      * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
      * text = "Referring Organisation ODS Code"

  * item[+]
    * type = #string
    * linkId = "4.1"
    * text = "Order Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:placerOrderNumber"
    * required = true
  * item[+]
    * type = #choice
    * linkId = "TestCategory"
    * text = "Test Category"
    * answerOption[+].valueCoding = #rare "Rare and inherited diseases"
    * answerOption[+].valueCoding = #dna "DNA Storage"
    * answerOption[+].valueCoding = #cancer "Cancer"
  * item[+]
    * type = #choice
    * linkId = "4.2"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "CITT (Test Code)"
    * required = true
    * repeats = true
    * answerValueSet = "https://hl7.mft.nhs.uk/ValueSet/genomic-test-directory"


* item[+]
  * type = #group
  * linkId = "Specimen"
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

  * item[+]
    * type = #string
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * code[+] = $epic#230021 "SAMPLE IDENTIFIER(S)"
    * linkId = "5.1"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier.value"
    * text = "ID Number"
    * item[+]
      * linkId = "80398-1-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 80398-1 and OBX-2 = CE. OML v2.5.1 SPM-2"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #dateTime
    * linkId = "5.2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * code[+] = $sct#1208523001	"Specimen collection by healthcare professional (finding)"
    * code[+] = $epic#230028 "DATE OF SPECIMEN COLLECTION"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
    * text = "Collection Date"
    * item[+]
      * linkId = "281269004-designNote"
      * type = #display
      * text = """
      ORM v2.4 - OBX-3 = LOINC 33882-2 and OBX-2 = TS .
      OML v2.5.1 SPM-17
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "5.3"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $epic#230001 "SPECIMEN TYPE"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerValueSet = Canonical(SpecimenType)
    * text = "Specimen Type"
    * item[+]
      * linkId = "66746-9-designNote"
      * type = #display
      * text = """
      ORM v2.4 - OBX-3 = LOINC 66746-9 and OBX-2 = CE.
      OML v2.5.1 SPM-4
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "5.4"
    * text = "Solid tumour pathology block/sample number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier.value"

* item[+]
  * type = #group
  * linkId = "Supporting Information"
  * text = "Supporting Information"
  * item[+]
    * type = #attachment
    * linkId = "6.1"
    * text = "Family Structure (pdf)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo:GenomicFamilyStructure"
  * item[+]
    * type = #string
    * linkId = "6.2"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber.value"
    * text = "National Genomic Information Service (NGIS) Patient ID"
  * item[+]
    * type = #string
    * linkId = "6.3"
    * text = "National Genomic Information Service (NGIS) Referral ID"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo:PreviousReports.identifier.value"

* item[+]
  * type = #group
  * linkId = "raredisease"
  * text = "Rare and Inherited Disease"
  * enableWhen[+]
    * question = "TestCategory"
    * operator = #=
    * answerCoding = #rare

* item[+]
  * type = #group
  * linkId = "cancer"
  * text = "Cancer"
  * enableWhen[+]
    * question = "TestCategory"
    * operator = #=
    * answerCoding = #cancer
  * item[+]
    * type = #group
    * linkId = "UnknownResultsPanel"
    * text = "Unknown Results Panel"
    * item[+]
      * linkId = "250537006"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * code[+] = $epic#230030 "NEOPLASTIC CELL CONTENT LEVEL"
      * text = "Neoplastic Cell Content Level"
      * type = #quantity
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "230031"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * code[+] = $epic#230031 "NEOPLASTIC CELL CONTENT LEVEL EXACT"
      * text = "Neoplastic Cell Content Level %"
      * type = #quantity
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "252416005"
      * code[+] = $sct#252416005 "Histopathology test (procedure)"
      * code[+] = $epic#230032 "MACRODISSECTION REQUIREMENTS"
      * text = "Macrodissection Requirements"
      * type = #string

    * item[+]
      * linkId = "230033"
      * code[+] = $epic#230033 "BLAST CELL COUNT"
      * text = "Blast Cell Count"
      * type = #quantity
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
