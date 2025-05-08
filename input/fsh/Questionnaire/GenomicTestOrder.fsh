Instance: GenomicTestOrder
InstanceOf: NWQuestionnaire
Title: "North West Genomics Test Order"
Description: """
THIS IS FOR ANALYSIS, and is not to be used for implementation at present.

The aim of this is to support conversion of multiple Genomic Order Forms HL7 v2 and FHIR.
"""
Usage:  #definition

* title = "North West Genomics Test Order"
* status = #draft
* url = "https://nw-gmsa.github.io/Questionnaire/GenomicTestOrder"

* item[+]
  * linkId = "Patient"
  * text = "Patient"
  * type = #group
  * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient"

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"
  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * required = true
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"
  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * required = true
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"
  * item[+]
    * type = #date
    * linkId = "LN/81954-0"
    * code[+] = $loinc#81954-0
    * required = false
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.deceasedDateTime"
    * text = "Date of death"
  * item[+]
    * type = #group
    * linkId = "LN/56799-0"
    * code[+] = $loinc#56799-0
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address"
    * text = "Address"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-1"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address.line"
      * repeats = true
      * text = "Address Line"
    * item[+]
      * type = #string
      * linkId = "HL7/PID-11-3"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address.city"
      * text = "City"
    * item[+]
      * type = #string
      * linkId = "LN/45401-7"
      * code[+] = $loinc#45401-7
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.address.postalCode"
      * text = "Postcode"
  * item[+]
    * type = #choice
    * linkId = "LN/46098-0"
    * code[+] = $loinc#46098-0
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.gender"
    * text = "Sex registered at birth"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
  * item[+]
    * type = #choice
    * linkId = "LN/32624-9"
    * code[+] = $loinc#32624-9
    * text = "Ethnic Category"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.extension:ethnicCategory"
    * answerValueSet = Canonical(Ethnicity)
  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"
  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"
    * required = true
  * item[+]
    * type = #string
    * linkId = "LN/56797-4"
    * code[+] = $loinc#56797-4
    * text = "Account Number (Episode or Stay Number)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier.value"
    * required = false
    * item[+]
      * linkId = "LN/56797-4-designNote"
      * type = #display
      * text = "PV1-19 (also known as stay number)"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
    * linkId = "HL7/PD1-3"
    * text = "GP Surgery (ODS Code)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Patient#Patient.generalPractitioner"

* item[+]
  * type = #group
  * linkId = "HL7/ORC-12"
  * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Healthcare Professional"
  * item[+]
    * type = #string
    * linkId = "LN/18705-4"
    * code[+] = $loinc#18705-4
    * required = true
    * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"
    * text = "Referring Clinician Name"
  * item[+]
    * type = #choice
    * linkId = "LN/18707-0"
    * code[+] = $loinc#18707-0
    * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole.specialty.coding.code"
    * text = "Referring Clinician Current Speciality"
    * required = true
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode"
  * item[+]
    * type = #string
    * linkId = "LN/46608-6"
    * code[+] = $loinc#46608-6
    * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
    * text = "Referring Clinician Professional Identifier"
    * required = true
  * item[+]
    * type = #string
    * linkId = "LN/89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Email"
  * item[+]
    * type = #string
    * linkId = "LN/81230-5"
    * code[+] = $loinc#81230-5
    * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole.telecom.value"
    * text = "Phone"
  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code"


* item[+]
  * type = #group
  * linkId = "HL7/OBR/ORC"
  * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest"
  * text = "Test Request"
  * item[+]
    * type = #choice
    * linkId = "NOS/230056"
    * code[+] = $NOS#230056 "What Type of Referral Do You Require?"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.category"
    * text = "Test Category"
    * answerValueSet = Canonical(OrderCategory)
    * answerOption[+].valueCoding = $GSC#rare-disease-non-wgs "Rare and inherited diseases"
    * answerOption[+].valueCoding = $sct#1186936003 "Storage of specimen (procedure)"
    * answerOption[+].valueCoding = $GSC#cancer-non-wgs "Cancer"
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-rci"
    * enableWhen[+]
      * question = "NOS/230056"
      * operator = #=
      * answerCoding = $GSC#rare-disease-non-wgs
    * text = "CITT Code (Rare and inherited diseases)"
    * required = true
    * repeats = false
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-r"
    * enableWhen[+]
      * question = "NOS/230056"
      * operator = #=
      * answerCoding = $GSC#rare-disease-non-wgs
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Rare and inherited diseases)"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(GenomicRareAndInheritedDisease)
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-cci"
    * enableWhen[+]
      * question = "NOS/230056"
      * operator = #=
      * answerCoding = $GSC#cancer-non-wgs
    * text = "CI Code (Cancer)"
    * required = true
    * repeats = false
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-c"
    * enableWhen[+]
      * question = "NOS/230056"
      * operator = #=
      * answerCoding = $GSC#cancer-non-wgs
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * text = "Test Code (Cancer)"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(GenomicCancer)
  * item[+]
    * type = #string
    * linkId = "pedigreeNumber"
    * text = "G Number (Pedigree Number) - Order Group Number"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.requisition"
  * item[+]
    * type = #string
    * linkId = "LN/106194-4"
    * code[+] = $loinc#106194-4
    * text = "Test request ID/Order ID"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.identifier:placerOrderNumber"
    * required = false
  * item[+]
    * type = #choice
    * linkId = "LN/82768-3"
    * code[+] = $loinc#82768-3
    * text = "Priority"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.priority"
    * required = false
    * answerValueSet = Canonical(RequestPriority)

  * item[+]
    * type = #group
    * linkId = "Consent"
    * text = "Consent"
    * item[+]
      * type = #choice
      * linkId = "LN/19826-7"
      * code[+] = $loinc#19826-7
      * text = "Has consent has been obtained for tests (Y/N)"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #choice
      * linkId = "NOS/ConsentStorageSNOMEDDesired"
      * text = "Has consent has been obtained for DNA storage (Y/N)"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #choice
      * linkId = "consent-3"
      * text = "ROD attached or to follow"
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
  * item[+]
    * type = #group
    * linkId = "AskAtOrderEntry"
    * text = "Ask At Order Entry Questions"
    * item[+]
      * type = #string
      * code[+] = $sct#842009 "Consanguinity"
      * linkId = "SNM/842009"
      * text = "Patient is from consanguineous union?"
  // * answerValueSet = Canonical(YNU)
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * type = #choice
      * linkId = "SNM/77386006"
      * text = "Does this test relate to an ongoing pregnancy?"
      * code[+] = $sct#77386006 "Pregnancy"
   //   * answerValueSet = Canonical(YNU)
      * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
      * answerOption[+].valueCoding = $loinc#LA32-8 "No"
      * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCodeableConcept"
      * item[+]
        * type = #group
        * linkId = "pregnant"
        * text = "Pregnant"
        * enableWhen[+]
          * question = "SNM/77386006"
          * operator = #=
          * answerCoding = #LA33-6
        * item[+]
          * type = #string
          * linkId = "SNM/370386005"
          * code[+] = $sct#370386005 "Ultrasound scan - multiple fetus"
          * text = "Does this test relate to a pregnancy with > 1 fetus?"
          * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
          * answerOption[+].valueCoding = $loinc#LA32-8 "No"
          * answerOption[+].valueCoding = $loinc#LA4489-6 "Unknown"
          * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCodeableConcept"

        * item[+]
          * type = #date
          * linkId = "SNM/161714006"
          * code[+] = $sct#161714006 "Estimated date of delivery"
          * text = "Patient expected delivery date"
          * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueDateTime"
        * item[+]
          * type = #quantity
          * linkId = "SNM/598151000005105"
          * code[+] = $sct#598151000005105 "Gestational age"
          * extension[unit].valueCoding = $ucum#wk "Wk"
          * text = "Patient gestation"
          * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"

* item[+]
  * type = #group
  * linkId = "PatientClinicalInformation"
  * text = "Patient Clinical Information"
  * item[+]
    * type = #choice
    * linkId = "HL7/DG1"
    * repeats = true
    * text = "Specific disease suspected/reason for testing"
    * answerValueSet = "https://fhir.hl7.org.uk/ValueSet/UKCore-ConditionCode"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.reasonCode"
  * item[+]
    * type = #string
    * linkId = "HL7/NTE"
    * text = "Relevant clinical information and family history"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.note"


* item[+]
  * type = #group
  * linkId = "HL7/SPM"
  * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

  * item[+]
    * type = #string
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * linkId = "LN/80398-1"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.identifier.value"
    * text = "Specimen ID Number"
    * item[+]
      * linkId = "LN/80398-1-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 80398-1 and OBX-2 = CE. OML v2.5.1 SPM-2"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "LN/80398-1-ODS"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.identifier.assigner.identifier.value"
    * text = "Pathology Laboratory Hospital/Trust ID"

  * item[+]
    * type = #dateTime
    * linkId = "LN/33882-2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * code[+] = $sct#1208523001	"Specimen collection by healthcare professional (finding)"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
    * text = "Specimen Collection Date"
    * item[+]
      * linkId = "LN/33882-2-designNote"
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
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.type.coding.code"
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
    * linkId = "SNM/281269004"
    * code[+] = $sct#281269004 "High infection risk sample"
    * text = "High Infection Risk?"
    * type = #choice
    * required = false
    * repeats = false
    * answerOption[+].valueCoding = $loinc#LA33-6 "Yes"
    * answerOption[+].valueCoding = $loinc#LA32-8 "No"
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * linkId = "NOS/230002"
    * text = "Tissue source/organ of origin"
    * type = #choice
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.collection.bodySite"
  * item[+]
    * linkId = "NOS/230004"
    * text = "Specimen Volume/number of slides or scrolls"
    * type = #string
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.collection.quantity"
  * item[+]
    * linkId = "NOS/audit"
    * text = "Audit (Order Tracking)"
    * type = #group
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.collection"
    * item[+]
      * linkId = "NOS/xxxx1"
      * text = "Date and time sample received in lab"
      * type = #date
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.receivedTime"
    * item[+]
      * linkId = "NOS/xxxx2"
      * text = "Date and time sample sent"
      * type = #date
    * item[+]
      * linkId = "NOS/xxxx3"
      * text = "Transport used"
      * type = #string
    * item[+]
      * linkId = "LN/97209-1"
      * code[+] = $loinc#97209-1
      * text = "Tracking number"
      * type = #string
    * item[+]
      * linkId = "NOS/xxxx5"
      * text = "Sample sent to"
      * type = #string
    * item[+]
      * linkId = "NOS/xxxx6"
      * text = "Name of person who sent sample"
      * type = #string

* item[+]
  * type = #group
  * linkId = "raredisease"
  * text = "Rare and Inherited Disease"
  * enableWhen[+]
    * question = "NOS/230056"
    * operator = #=
    * answerCoding = $GSC#rare-disease-non-wgs

* item[+]
  * type = #group
  * linkId = "cancer"
  * text = "Cancer"
  * enableWhen[+]
    * question = "NOS/230056"
    * operator = #=
    * answerCoding = $GSC#cancer-non-wgs
  * item[+]
    * type = #group
    * linkId = "UnknownResultsPanel"
    * text = "Unknown Results Panel"
    * item[+]
      * linkId = "SNM/250537006"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * text = "Neoplastic Cell Content Level"
      * type = #quantity
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "NOS/230031"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * text = "Neoplastic Cell Content Level %"
      * type = #quantity
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "SNM/252416005"
      * code[+] = $sct#252416005 "Histopathology test (procedure)"
      * text = "Macrodissection Requirements"
      * type = #string

    * item[+]
      * linkId = "NOS/230033"
      * code[+] = $NOS#230033 "BLAST CELL COUNT"
      * text = "Blast Cell Count"
      * type = #quantity
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"
