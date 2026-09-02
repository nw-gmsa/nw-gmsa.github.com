CodeSystem: NWGMSA
Id: NWGMSA
Title: "NW GMSA Codes"
Description: """
Bucket for local codes
"""

* ^content = #complete
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^version = "0.0.1"
* ^date = "2025-05-06"
// Ethnic

* #SouthEastAsian "South East Asian"
* #NorthernEuropean "Northern European"
* #JewishNOS "Jewish NOS"
* #IrishTraveller "Gypsy/Traveller/ Irish Traveller"
* #Traveller "Gypsy/Traveller"
* #Roma "Roma"
* #AshkenaziJew "Ashkenazi Jew, follower of religion (person)"

// Order Category

* #RareAndInheritedDiseasesGeneticTesting "Rare and inherited diseases Genetic Testing (procedure)"
* #PreNatalGeneticTesting "Pre Natal Genetic Testing (procedure)"
* #HaemoglobinopathyGeneticTesting "Haemoglobinopathy Genetic Testing (procedure)"
* #CancerGeneticTesting "Cancer Genetic Testing (procedure)"




// Order Entry Codes

* #GeneticistEmail "Clinical Geneticist email"
* #GeneticistDepartmentEmail "Clinical Geneticist department email"
* #RODToFollow "ROD attached or to follow"
* #InfectionRiskDetails "High infection Risk Details"
* #VariantReinterpretationReason "Reason For Variant Re-Interpretation Request"
* #SampleSent "Date and time sample sent"
* #TransportUsed "Transport used"
* #SampleSentTo "Sample sent to"
* #SampleSentToName "Name of person who sent sample"

* #TESTOUTCOME "NHS England Genomics Test Outcome"

// dWGS Ask at Order Entry Codes

* #FamilyStructure "Family Structure"
* #ParticipantType "Participant Type"

* #230056 "What Type of Referral Do You Require?"
* #230016 "Test Type"
* #231284 "Please Select R240 Test(s):"
* #231285 "Please Select R242 Test(s):"
* #230027 "Email Addresses of Non-MFT Clinicians for Result Reports"
* #230037 "Please Acknowledge That a DNA Sample Will be Stored in the Laboratory on Completion of Testing"
* #230039 "Is the Person Ordering the Test the Referring Clinician"
* #GENEAP "GENETICS TEST PERFORMABLE"
* #unknown "Unknown"

// Identifier Type (local, HL7 v2 Table 0203 Z-code)

* #ZCID "Container Identifier"

// HLA Tests - Transplant Ask At Order Entry Codes (from Hive/Histotrac order-entry UI
// - see Questionnaire-HLATestsTransplantAskAtOrderEntry.html)

* #Patient "Patient"
* #Donor "Donor"

* #StemCell "Stem cell"
* #Renal "Renal"
* #Thoracic "Thoracic"

* #Kidney "Kidney"
* #Pancreas "Pancreas"
* #Islets "Islets"
* #SimultaneousPancreasKidney "Simultaneous Pancreas/Kidney"
* #SimultaneousIsletKidney "Simultaneous Islet/Kidney"

* #HLATypingAntibodyScreening "HLA Typing + Antibody Screening"
* #HLAAntibodyScreening "HLA Antibody Screening"
* #HLATypeRecipient "HLA Type Recipient"
* #DSA "DSA"
* #HLAAutoXM "HLA Auto XM"

* #HistoBlood "Blood"
* #HistoBuccal "Buccal"
* #HistoOther "Other"

// Chimerism Testing Blood (PB) Ask At Order Entry Codes (from Hive/Histotrac
// order-entry UI - see Questionnaire-ChimerismTestingAskAtOrderEntry.html)

* #ChimerismBloodPB "Blood (PB)"
* #ChimerismBoneMarrowBM "Bone Marrow (BM)"

* #ChimerismPeripheralBlood "Chimerism Peripheral Blood"
* #ChimerismCD3 "Chimerism CD3"
* #ChimerismCD15 "Chimerism CD15"
* #ChimerismCD19 "Chimerism CD19"
* #ChimerismLineageOther "Chimerism Lineage Other"
