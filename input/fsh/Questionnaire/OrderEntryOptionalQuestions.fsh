Instance: GenomicOrderEntryOptionalQuestions
InstanceOf: NWQuestionnaire
Title: "Genomic Order Entry Optional Questions"
Description: """
Genomic Order Entry Optional Questions - THIS IS FOR ANALYSIS, and is not to be used for implementation.
"""
Usage:  #example

* status = #draft
* url = "https://nw-gmsa.github.io/Questionnaire/GenomicOrderEntryOptionalQuestions"

* item[+]
  * linkId = "Order"
  * text = "Order"
  * type = #group

  * item[+]
    * linkId = "230016"
    * code[+] = $sct#405824009 "Genetic test (procedure)"
    * code[+] = $NOS#230016 "TEST TYPE (RARE DISEASE)"
    * text = "Test Type"
    * type = #choice
    * answerValueSet = Canonical(GenomicRareAndInheritedDisease)
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.code"

  * item[+]
    * linkId = "405824009"
    * code[+] = $sct#405824009 "Genetic test (procedure)"
    * code[+] = $NOS#230017 "TEST TYPE (SOLID CANCER)"
    * text = "Test Type"
    * type = #choice
    * answerValueSet = Canonical(GenomicRareAndInheritedDisease)
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.code"

  * item[+]
    * linkId = "230018"
    * code[+] = $sct#405824009 "Genetic test (procedure)"
    * code[+] = $NOS#230018 "TEST TYPE (HAEMATOLOGICAL ONCOLOGY)"
    * text = "Test Type"
    * type = #choice
    * answerValueSet = Canonical(GenomicRareAndInheritedDisease)
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.code"

  * item[+]
    * linkId = "114867"
    * code[+] = $NOS#114867 "NAME OF SUPERVISING CLINICIAN (CLC)"
    * text = "Name of Supervising Clinician"
    * type = #string
  * item[+]
    * linkId = "230022"
    * code[+] = $NOS#230022 "REFERRAL COMMENTS"
    * text = "Referral Comments (Please include any previous or familial variant details, if appropriate)"
    * type = #string
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.note.text"
  * item[+]
    * linkId = "230039"
    * code[+] = $NOS#230039 "IS ORDERER THE REFERRING CLINICIAN"
    * text = "Is the Person Ordering the Test the Referring Clinician"
    * type = #string
    * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.requester.display"

* item[+]
  * linkId = "Specimen"
  * text = "Specimen"
  * type = #group
  * repeats = true
  * code[+] = $NOS#123038009 "Specimen (specimen)"
  * item[+]
    * linkId = "113979"
    * code[+] = $NOS#113979 "SPECIMEN 1 SOURCE (BLOOD RESTRICTIONS)"
    * text = "Specimen Source"
    * type = #string
  * item[+]
    * linkId = "66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $NOS#230001 "SPECIMEN TYPE"
    * extension[designNote].valueMarkdown = "Some text"
    * text = "Specimen Type"
    * type = #choice
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.type"
    * answerValueSet = Canonical(SpecimenType)
    * item[+]
      * linkId = "66746-9-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 66746-9 and OBX-2 = CE. OML v2.5.1 SPM-4"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * linkId = "230002"
    * code[+] = $NOS#230002 "SPECIMEN SOURCE"
    * text = "Specimen Source"
    * type = #string
  * item[+]
    * linkId = "230003"
    * code[+] = $NOS#230003 "SPECIMEN ANTICOAGULANT/PRESERVATIVE"
    * text = "Anticoagulant/Preservative"
    * type = #string
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.condition"
  * item[+]
    * linkId = "230004"
    * code[+] = $NOS#230004 "SPECIMEN DUPLICATE VIALS"
    * text = "Number of Duplicate Vials (If Needed)"
    * type = #string
  * item[+]
    * linkId = "230005"
    * code[+] = $NOS#230005 "SPECIMEN DESCRIPTION"
    * text = "Specimen Description(s)/Sample Identifier(s) for DNA or Pathology Material (e.g. Block Number)"
    * type = #string
  * item[+]
    * linkId = "281269004"
    * code[+] = $sct#281269004 "High infection risk sample"
    * code[+] = $NOS#230019 "HIGH INFECTION RISK"
    * text = "High Infection Risk"
    * answerValueSet = Canonical(YN)
    * type = #choice
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.condition"
    * item[+]
      * linkId = "281269004-designNote"
      * type = #display
      * text = "v2.4/v2.5.1 OBX-3 = SNOMED 281269004 and OBX-2 = CE"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * linkId = "230020"
    * code[+] = $NOS#230020 "INFECTION RISK DETAILS"
    * text = "Infection Risk Details"
    * type = #string
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.condition.text"
  * item[+]
    * linkId = "33882-2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * code[+] = $sct#1208523001	"Specimen collection by healthcare professional (finding)"
    * code[+] = $NOS#230028 "DATE OF SPECIMEN COLLECTION"
    * text = "Date of Specimen(s) Collection"
    * type = #dateTime
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
    * item[+]
      * linkId = "281269004-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 33882-2 and OBX-2 = TS . OML v2.5.1 SPM-17"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * linkId = "230063"
    * code[+] = $NOS#230063 "SPECIMEN TYPE (PRENATAL REFFERAL)"
    * text = "Specimen Type"
    * type = #choice
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.type"

  * item[+]
    * linkId = "80398-1"
    * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
    * code[+] = $NOS#230021 "SAMPLE IDENTIFIER(S)"
    * text = "Sample Identifier(s) for DNA or Pathology Material (e.g. Block Number)"
    * type = #string
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Specimen#Specimen.identifier.value"
    * item[+]
      * linkId = "80398-1-designNote"
      * type = #display
      * text = "ORM v2.4 - OBX-3 = LOINC 80398-1 and OBX-2 = CE. OML v2.5.1 SPM-2"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * linkId = "1186936003"
    * code[+] = $sct#1186936003 "Storage of specimen (procedure)"
    * code[+] = $NOS#230037 "DNA SAMPLE STORED"
    * text = "Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing"
    * type = #string

* item[+]
  * type = #group
  * linkId = "Supporting Information"
  * text = "Supporting Information"
  * definition = "https://nw-gmsa.github.io/StructureDefinition/ServiceRequest#ServiceRequest.supportingInfo"
  * item[+]
    * linkId = "102313"
    * code[+] = $NOS#102313 "GENETICS HIGH INFECTION RISK"
    * text = "High Infection Risk?"
    * type = #choice
    * required = false
    * repeats = false
    * answerValueSet = Canonical(YN)
    * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueCoding"


  * item[+]
    * linkId = "230023"
    * code[+] = $NOS#230022 "PROBAND OR FAMILY MEMBER"
    * text = "Proband or Family Member"
    * type = #string

  * item[+]
    * linkId = "89058-2"
    * code[+] = $loinc#89058-2 "Contact email address"
    * code[+] = $NOS#230027 "EMAIL ADDRESSES"
    * text = "Email Addresses of Non-MFT Clinicians for Result Reports"
    * type = #string


  * item[+]
    * linkId = "762911000000102"
    * code[+] = $sct#309370004 "Consent status (finding)"
    * code[+] = $sct#762911000000102 "Informed consent given for treatment"
    * code[+] = $NOS#230029 "CONFIRMATION OF CONSENT"
    * text = "Confirmation of Consent for Testing - MANDATORY Testing will not be performed without completed confirmation of consent"
    * type = #choice
    * answerValueSet = Canonical(YN)
  * item[+]
    * type = #group
    * linkId = "UnknownResultsPanel"
    * text = "Unknown Results Panel"
    * item[+]
      * linkId = "250537006"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * code[+] = $NOS#230030 "NEOPLASTIC CELL CONTENT LEVEL"
      * text = "Neoplastic Cell Content Level"
      * type = #quantity
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "230031"
      * code[+] = $sct#250537006 "Histopathology finding (finding)"
      * code[+] = $NOS#230031 "NEOPLASTIC CELL CONTENT LEVEL EXACT"
      * text = "Neoplastic Cell Content Level %"
      * type = #quantity
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"

    * item[+]
      * linkId = "252416005"
      * code[+] = $sct#252416005 "Histopathology test (procedure)"
      * code[+] = $NOS#230032 "MACRODISSECTION REQUIREMENTS"
      * text = "Macrodissection Requirements"
      * type = #string

    * item[+]
      * linkId = "230033"
      * code[+] = $NOS#230033 "BLAST CELL COUNT"
      * text = "Blast Cell Count"
      * type = #quantity
      * definition = "https://nw-gmsa.github.io/StructureDefinition/Observation#Observation.valueQuantity"

  * item[+]
    * type = #group
    * linkId = "Reason"
    * text = "Reason"
    * item[+]
      * linkId = "77386006"
      * code[+] = $sct#77386006 "Pregnancy"
      * code[+] = $NOS#230034 "TEST RELATED TO PREGNANCY"
      * text = "Does This Test Relate to a Pregnancy"
      * type = #choice
      * answerValueSet = Canonical(YNU)
    * item[+]
      * linkId = "385675009"
      * code[+] = $sct#385675009 "Reason for action (attribute)"
      * code[+] = $NOS#230043 "REASON FOR RE-INTERPRETATION"
      * text = "Reason For Variant Re-Interpretation Request"
      * type = #string
    * item[+]
      * linkId = "230048"
      * code[+] = $NOS#230048 "GENETICS TEST"
      * text = "Please Select Clinical Indication(s)"
      * type = #string
    * item[+]
      * linkId = "230057"
      * code[+] = $NOS#230057 "PRE-NATAL GENETICS TEST LIST"
      * text = "Please Select Clinical Indication(s)"
      * type = #string


  * item[+]
    * linkId = "230035"
    * code[+] = $NOS#230035 "DECEASED INFANT"
    * text = "Is This Test Request for a Deceased Infant or Pregnancy Loss"
    * type = #choice
    * answerValueSet = Canonical(YN)

  * item[+]
    * linkId = "230036"
    * code[+] = $NOS#230036 "MOTHERS DETAILS"
    * text = "Mother's Details (Name, DOB, NHS & MRN)"
    * type = #string

  * item[+]
    * linkId = "230038"
    * code[+] = $NOS#230038 "PATHOLOGY REPORT"
    * text = "Please Confirm the Pathology Report will Accompany the Sample to the Laboratory"
    * type = #string

  * item[+]
    * linkId = "230045"
    * code[+] = $NOS#230045 "LAB DNA NUMBER (IF KNOWN)"
    * text = "Lab DNA Number (If Known)"
    * type = #string


  * item[+]
    * linkId = "230059"
    * code[+] = $NOS#230059 "MFT LAB GENETICS DUMMY"
    * text = "TEST"
    * type = #string

  * item[+]
    * linkId = "230060"
    * code[+] = $NOS#230060 "MFT LAB GENETICS DUMMY2"
    * text = "TEST2"
    * type = #string

  * item[+]
    * linkId = "169222003"
    * code[+] = $sct#169222003 "Ultrasound obstetric scan abnormal (finding)"
    * code[+] = $NOS#230061 "MFT LAB GENETICS R22 - ABNORMAL SCAN FINDINGS"
    * text = "What were the Abnormal Scan Findings:"
    * type = #string

  * item[+]
    * linkId = "78989007"
    * code[+] = $sct#78989007	"Trisomy (morphologic abnormality)"
    * code[+] = $NOS#230062 "MFT LAB GENETICS R401 - TRISOMY"
    * text = "Please enter the trisomy screening risk (including the chromosome of interest if appropriate)."
    * type = #string


  * item[+]
    * linkId = "230064"
    * code[+] = $NOS#230064 "GENETICS - HAS PATIENT HAD TRANSPLANT"
    * text = "Has the patient had a transplant?"
    * type = #choice
    * answerValueSet = Canonical(YN)

  * item[+]
    * linkId = "230065"
    * code[+] = $NOS#230065 "GENETICS - WHAT TYPE OF TRANSPLANT?"
    * text = "What Type Of Transplant Has The Patient Received"
    * type = #choice


  * item[+]
    * linkId = "230066"
    * code[+] = $NOS#230066 "GENETICS - SUSPECTED LUNG CANCER"
    * text = "Is The Patient Suspected Of Having Lung Cancer?"
    * type = #choice
    * answerValueSet = Canonical(YN)

  * item[+]
    * linkId = "230067"
    * code[+] = $NOS#230067 "GENETICS - CONFIRMED LUNG CANCER TISSUE"
    * text = "Please Confirm That Lung Cancer Tissue is Inadequate for Testing?"
    * type = #choice
    * answerValueSet = Canonical(YN)

  * item[+]
    * linkId = "230068"
    * code[+] = $NOS#230068 "GENETICS - ADVANCED LUNG CANCER STAGE"
    * text = "Please Select Advanced Stage Lung Cancer Stage"
    * type = #choice

  * item[+]
    * linkId = "230100"
    * code[+] = $NOS#230100 "MFT LAB GENETICS EXTRA TESTING FORM COMPLETED"
    * text = "Please Note That An Additional Test Order Form 'Whole Genome Sequencing Rare Disease Order Form (Link at Top of Form)' is Required To Activate Testing. If This is Not Received, The DNA Will Be Extracted and Stored"
    * type = #string
