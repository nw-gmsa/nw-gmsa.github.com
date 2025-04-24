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
  * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.subject"

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"
  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * required = true
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"
  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * required = true
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"
  * item[+]
    * type = #date
    * linkId = "LN/81954-0"
    * required = false
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.deceasedDateTime"
    * text = "Date of death"
  * item[+]
    * type = #group
    * linkId = "LN/56799-0"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.address"
    * text = "Address"
    * item[+]
      * type = #string
      * linkId = "line"
      * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.address.line"
      * repeats = true
      * text = "Address Line"
    * item[+]
      * type = #string
      * linkId = "city"
      * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.address.city"
      * repeats = true
      * text = "City"
    * item[+]
      * type = #string
      * linkId = "postcode"
      * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.address.postalCode"
      * text = "Postcode"
  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * text = "Ethnic Category"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * answerValueSet = Canonical(Ethnicity)
  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.identifier:nhsNumber.value"
    * text = "NHS Number"
  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * text = "Hospital Number"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber.value"
    * required = true
  * item[+]
    * type = #string
    * linkId = "LN/56797-4"
    * text = "Account Number"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier.value"
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
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.identifier:pedigreeNumber.value"

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
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.generalPractitioner.identifier.value"
  * item[+]
    * type = #string
    * code[+] = $sct#842009 "Consanguinity"
    * linkId = "SNM/842009"
    * text = "Patient is from consanguineous union?"
    * answerValueSet = Canonical(YNU)
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #string
    * linkId = "SNM/77386006"
    * text = "Does this test relate to an ongoing pregnancy?"
    * code[+] = $sct#77386006 "Pregnancy"
    * answerValueSet = Canonical(YNU)
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #group
      * linkId = "pregnant"
      * enableWhen[+]
        * question = "SNM/77386006"
        * operator = #=
        * answerCoding = #LA33-6
      * item[+]
        * type = #string
        * linkId = "SNM/370386005"
        * code[+] = $sct#370386005 "Ultrasound scan - multiple fetus"
        * text = "Does this test relate to a pregnancy with > 1 fetus?"
        * answerValueSet = Canonical(YNU)
        * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueCodeableConcept"

      * item[+]
        * type = #date
        * linkId = "SNM/161714006"
        * code[+] = $sct#161714006 "Estimated date of delivery"
        * text = "Patient expected delivery date"
        * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueDateTime"
      * item[+]
        * type = #quantity
        * linkId = "SNM/598151000005105"
        * code[+] = $sct#598151000005105 "Gestational age"
        * text = "Patient gestation"
        * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"

* item[+]
  * type = #group
  * linkId = "3"
  * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.requester"
  * text = "Healthcare Professional"
  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * required = true
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.name"
    * text = "Referring Clinician Name"
  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"
    * text = "Referring Clinician Current Speciality"
    * required = true
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
  * item[+]
    * type = #string
    * linkId = "LN/46608-6"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
    * text = "Referring Clinician Professional Identifier"
    * required = true
  * item[+]
    * type = #string
    * linkId = "3.4"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Email"
  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Phone"
  * item[+]
    * type = #string
    * linkId = "3.6"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code"


* item[+]
  * type = #group
  * linkId = "TestRequest"
  * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest"
  * text = "Test Request"
  * item[+]
    * type = #string
    * linkId = "4.1"
    * text = "Test request ID/Order ID"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.identifier:placerOrderNumber"
    * required = false
  * item[+]
    * type = #choice
    * linkId = "LN/82768-3"
    * text = "Priority"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.priority"
    * required = false
    * answerValueSet = Canonical(RequestPriority)
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
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "CITT (Test Code)"
    * required = true
    * repeats = true
    * answerValueSet = "https://fhir.north-west.england.nhs.uk/ValueSet/genomic-test-directory"

* item[+]
  * type = #group
  * linkId = "Consent"
  * item[+]
    * type = #choice
    * linkId = "LN/19826-7"
    * text = "Has consent has been obtained for tests (Y/N)"
    * answerValueSet = Canonical(YN)
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "consent-2"
    * text = "Has consent has been obtained for DNA storage (Y/N)"
    * answerValueSet = Canonical(YN)
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"

* item[+]
  * type = #group
  * linkId = "Specimen"
  * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

  * item[+]
    * type = #string
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * code[+] = $epic#230021 "SAMPLE IDENTIFIER(S)"
    * linkId = "LN/80398-1"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Specimen#Specimen.identifier.value"
    * text = "ID Number"
    * item[+]
      * linkId = "80398-1-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 80398-1 and OBX-2 = CE. OML v2.5.1 SPM-2"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #dateTime
    * linkId = "LN/33882-2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * code[+] = $sct#1208523001	"Specimen collection by healthcare professional (finding)"
    * code[+] = $epic#230028 "DATE OF SPECIMEN COLLECTION"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
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
    * linkId = "LN/66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $epic#230001 "SPECIMEN TYPE"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Specimen#Specimen.type.coding.code"
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
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Specimen#Specimen.identifier.value"

* item[+]
  * type = #group
  * linkId = "Supporting Information"
  * text = "Supporting Information"
  * item[+]
    * type = #attachment
    * linkId = "6.1"
    * text = "Family Structure (pdf)"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo:GenomicFamilyStructure"
  * item[+]
    * type = #string
    * linkId = "6.2"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber.value"
    * text = "National Genomic Information Service (NGIS) Patient ID"
  * item[+]
    * type = #string
    * linkId = "6.3"
    * text = "National Genomic Information Service (NGIS) Referral ID"
    * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo:PreviousReports.identifier.value"

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
      * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "230031"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * code[+] = $epic#230031 "NEOPLASTIC CELL CONTENT LEVEL EXACT"
      * text = "Neoplastic Cell Content Level %"
      * type = #quantity
      * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"

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
      * definition = "https://fhir.north-west.england.nhs.uk/StructureDefinition/Observation#Observation.valueQuantity"
