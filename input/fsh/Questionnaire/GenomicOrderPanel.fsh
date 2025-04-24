Instance: GenomicOrderPanel
InstanceOf: NWQuestionnaire
Title: "NHS England North West Genomics Order Panel"
Description: """
THIS IS FOR ANALYSIS, and is not to be used for implementation.
"""

* status = #draft
* url = "https://fhir.north-west.england.nhs.uk/Questionnaire/GenomicOrderEntryCommon"

* item[+]
  * linkId = "PatientDetails"
  * text = "Patient Details"
  * type = #group
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

  * item[+]
    * type = #string
    * linkId = "1.1"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
    * text = "Patient last name"
  * item[+]
    * type = #string
    * linkId = "1.2"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"
  * item[+]
    * type = #date
    * linkId = "1.3"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"
  * item[+]
    * type = #string
    * linkId = "1.4"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"
    * text = "Postcode"
  * item[+]
    * type = #choice
    * linkId = "1.5"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * type = #string
    * linkId = "1.6"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber.value"
    * text = "NHS Number"
  * item[+]
    * type = #string
    * linkId = "1.7"
    * text = "Hospital Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber.value"
    * required = true

* item[+]
  * type = #group
  * linkId = "2"
  * text = "Pedigree G Number"
  * item[+]
    * type = #string
    * linkId = "2.1"
    * text = "Patient - G Number"
  * item[+]
    * type = #string
    * linkId = "2.2"
    * text = "Family - G Number"




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
