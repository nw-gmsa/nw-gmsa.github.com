Instance: OrderEntryQuestions
InstanceOf: Questionnaire
Title: "Laboratory Order Questions"
Description: """
Laboratory Order Questions - THIS IS FOR ANALYSIS, and is not to be used for implementation.
"""

* status = #draft

* item[+]
  * linkId = "Order"
  * type = #group

* item[+]
  * linkId = "Specimen"
  * type = #group
  * repeats = true
  * item[+]
    * linkId = "113979"
    * code[+] = $epic#113979 "SPECIMEN 1 SOURCE (BLOOD RESTRICTIONS)"
    * text = "Specimen 1 Source"
    * type = #string
  * item[+]
    * linkId = "230001"
    * code[+] = $epic#230001 "SPECIMEN 1 TYPE"
    * text = "Specimen 1 Type"
    * type = #string
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type"
  * item[+]
    * linkId = "230002"
    * code[+] = $epic#230002 "SPECIMEN 1 SOURCE"
    * text = "Specimen 1 Source"
    * type = #string
  * item[+]
    * linkId = "230003"
    * code[+] = $epic#230003 "SPECIMEN 1 ANTICOAGULANT/PRESERVATIVE"
    * text = "Anticoagulant/Preservative"
    * type = #string

  * item[+]
    * linkId = "230004"
    * code[+] = $epic#230004 "SPECIMEN 1 DUPLICATE VIALS"
    * text = "Number of Duplicate Vials (If Needed)"
    * type = #string
  * item[+]
    * linkId = "230005"
    * code[+] = $epic#230005 "SPECIMEN 1 DESCRIPTION"
    * text = "Specimen Description(s)/Sample Identifier(s) for DNA or Pathology Material (e.g. Block Number)"
    * type = #string
  * item[+]
    * linkId = "230019"
    * code[+] = $sct#281269004 "High infection risk sample"
    * text = "High Infection Risk"
    * answerValueSet = Canonical(ll2828-3)
    * type = #choice
  * item[+]
    * linkId = "230020"
    * code[+] = $epic#230020 "INFECTION RISK DETAILS"
    * text = "Infection Risk Details"
    * type = #string
  * item[+]
    * linkId = "230028"
    * code[+] = $epic#230028 "DATE OF SPECIMEN COLLECTION"
    * text = "Date of Specimen(s) Collection"
    * type = #dateTime
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"


* item[+]
  * linkId = "114867"
  * code[+] = $epic#114867 "NAME OF SUPERVISING CLINICIAN (CLC)"
  * text = "Name of Supervising Clinician"
  * type = #string

* item[+]
  * linkId = "230016"
  * code[+] = $epic#230016 "TEST TYPE (RARE DISEASE)"
  * text = "Test Type"
  * type = #string

* item[+]
  * linkId = "230017"
  * code[+] = $epic#230017 "TEST TYPE (SOLID CANCER)"
  * text = "Test Type"
  * type = #string

* item[+]
  * linkId = "230018"
  * code[+] = $epic#230018 "TEST TYPE (HAEMATOLOGICAL ONCOLOGY)"
  * text = "Test Type"
  * type = #string

* item[+]
  * linkId = "102313"
  * code[+] = $epic#102313 "GENETICS HIGH INFECTION RISK"
  * text = "High Infection Risk?"
  * type = #choice
  * required = false
  * repeats = false
  * answerValueSet = Canonical(ll2828-3)
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCoding"


* item[+]
  * linkId = "230021"
  * code[+] = $epic#230021 "SAMPLE IDENTIFIER(S)"
  * text = "Sample Identifier(s) for DNA or Pathology Material (e.g. Block Number)"
  * type = #string
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"

* item[+]
  * linkId = "230022"
  * code[+] = $epic#230022 "REFERRAL COMMENTS"
  * text = "Referral Comments (Please include any previous or familial variant details, if appropriate)"
  * type = #string

* item[+]
  * linkId = "230023"
  * code[+] = $epic#230022 "PROBAND OR FAMILY MEMBER"
  * text = "Proband or Family Member"
  * type = #string

* item[+]
  * linkId = "230027"
  * code[+] = $epic#230027 "EMAIL ADDRESSES"
  * text = "Email Addresses of Non-MFT Clinicians for Result Reports"
  * type = #string


* item[+]
  * linkId = "230029"
  * code[+] = $epic#230029 "CONFIRMATION OF CONSENT"
  * text = "Confirmation of Consent for Testing - MANDATORY Testing will not be performed without completed confirmation of consent"
  * type = #choice
  * answerValueSet = Canonical(ll2828-3)

* item[+]
  * linkId = "230030"
  * code[+] = $epic#230030 "NEOPLASTIC CELL CONTENT LEVEL"
  * text = "Neoplastic Cell Content Level"
  * type = #string

* item[+]
  * linkId = "230031"
  * code[+] = $epic#230031 "NEOPLASTIC CELL CONTENT LEVEL EXACT"
  * text = "Neoplastic Cell Content Level %"
  * type = #string

* item[+]
  * linkId = "230032"
  * code[+] = $epic#230032 "MACRODISSECTION REQUIREMENTS"
  * text = "Macrodissection Requirements"
  * type = #string

* item[+]
  * linkId = "230033"
  * code[+] = $epic#230033 "BLAST CELL COUNT"
  * text = "Blast Cell Count"
  * type = #string

* item[+]
  * linkId = "230034"
  * code[+] = $epic#230034 "TEST RELATED TO PREGNANCY"
  * text = "Does This Test Relate to a Pregnancy"
  * type = #choice
  * answerValueSet = Canonical(ll2817-6)

* item[+]
  * linkId = "230035"
  * code[+] = $epic#230035 "DECEASED INFANT"
  * text = "Is This Test Request for a Deceased Infant or Pregnancy Loss"
  * type = #choice
  * answerValueSet = Canonical(ll2828-3)

* item[+]
  * linkId = "230036"
  * code[+] = $epic#230036 "MOTHERS DETAILS"
  * text = "Mother's Details (Name, DOB, NHS & MRN)"
  * type = #string

* item[+]
  * linkId = "230037"
  * code[+] = $epic#230037 "DNA SAMPLE STORED"
  * text = "Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing"
  * type = #string

* item[+]
  * linkId = "230038"
  * code[+] = $epic#230038 "PATHOLOGY REPORT"
  * text = "Please Confirm the Pathology Report will Accompany the Sample to the Laboratory"
  * type = #string

* item[+]
  * linkId = "230039"
  * code[+] = $epic#230039 "IS ORDERER THE REFERRING CLINICIAN"
  * text = "Is the Person Ordering the Test the Referring Clinician"
  * type = #string

* item[+]
  * linkId = "230043"
  * code[+] = $epic#230043 "REASON FOR RE-INTERPRETATION"
  * text = "Reason For Variant Re-Interpretation Request"
  * type = #string

* item[+]
  * linkId = "230045"
  * code[+] = $epic#230045 "LAB DNA NUMBER (IF KNOWN)"
  * text = "Lab DNA Number (If Known)"
  * type = #string

* item[+]
  * linkId = "230048"
  * code[+] = $epic#230048 "GENETICS TEST"
  * text = "Please Select Clinical Indication(s)"
  * type = #string

* item[+]
  * linkId = "230057"
  * code[+] = $epic#230057 "PRE-NATAL GENETICS TEST LIST"
  * text = "Please Select Clinical Indication(s)"
  * type = #string

* item[+]
  * linkId = "230059"
  * code[+] = $epic#230059 "MFT LAB GENETICS DUMMY"
  * text = "TEST"
  * type = #string

* item[+]
  * linkId = "230060"
  * code[+] = $epic#230060 "MFT LAB GENETICS DUMMY2"
  * text = "TEST2"
  * type = #string

* item[+]
  * linkId = "230061"
  * code[+] = $epic#230061 "MFT LAB GENETICS R22 - ABNORMAL SCAN FINDINGS"
  * text = "What were the Abnormal Scan Findings:"
  * type = #string

* item[+]
  * linkId = "230062"
  * code[+] = $epic#230062 "MFT LAB GENETICS R401 - TRISOMY"
  * text = "Please enter the trisomy screening risk (including the chromosome of interest if appropriate)."
  * type = #string

* item[+]
  * linkId = "230063"
  * code[+] = $epic#230063 "SPECIMEN TYPE (PRENATAL REFFERAL)"
  * text = "Specimen 1 Type"
  * type = #string
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type"

* item[+]
  * linkId = "230064"
  * code[+] = $epic#230064 "GENETICS - HAS PATIENT HAD TRANSPLANT"
  * text = "Has the patient had a transplant?"
  * type = #choice
  * answerValueSet = Canonical(ll2828-3)

* item[+]
  * linkId = "230065"
  * code[+] = $epic#230065 "GENETICS - WHAT TYPE OF TRANSPLANT?"
  * text = "What Type Of Transplant Has The Patient Received"
  * type = #string

* item[+]
  * linkId = "230066"
  * code[+] = $epic#230066 "GENETICS - SUSPECTED LUNG CANCER"
  * text = "Is The Patient Suspected Of Having Lung Cancer?"
  * type = #choice
  * answerValueSet = Canonical(ll2828-3)

* item[+]
  * linkId = "230067"
  * code[+] = $epic#230067 "GENETICS - CONFIRMED LUNG CANCER TISSUE"
  * text = "Please Confirm That Lung Cancer Tissue is Inadequate for Testing?"
  * type = #string

* item[+]
  * linkId = "230068"
  * code[+] = $epic#230068 "GENETICS - ADVANCED LUNG CANCER STAGE"
  * text = "Please Select Advanced Stage Lung Cancer Stage"
  * type = #choice

* item[+]
  * linkId = "230100"
  * code[+] = $epic#230100 "MFT LAB GENETICS EXTRA TESTING FORM COMPLETED"
  * text = "Please Note That An Additional Test Order Form 'Whole Genome Sequencing Rare Disease Order Form (Link at Top of Form)' is Required To Activate Testing. If This is Not Received, The DNA Will Be Extracted and Stored"
  * type = #string

