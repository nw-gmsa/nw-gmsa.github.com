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

// NW GLH Paper Test Request Form Ask At Order Entry Codes (see
// Questionnaire-GenomicTestOrder.html#order-entry-questions - NW GLH paper
// forms row) - one block per form, in the order the forms appear there.

// HRD and Tumour BRCA Test Request Form
* #HRDPathwayNewlyDiagnosed "HRD/tumour BRCA pathway - newly diagnosed"
* #HRDPathwayRelapsed "HRD/tumour BRCA pathway - relapsed"
* #NewlyDiagnosedAdvancedDiseaseConfirmation "Confirmation of newly diagnosed, advanced high-grade epithelial ovarian, fallopian tube or primary peritoneal cancer"
* #RelapsedDiseaseConfirmation "Confirmation of relapsed high-grade disease, second line of treatment or beyond"
* #NeoplasticCellContent "Neoplastic cell content (%)"
* #PathologistName "Pathologist name"
* #PathologyHospital "Pathology hospital"
* #MyriadInternationalTransferConsent "Consent for tissue, pathology report and personal details to be sent to Myriad Genetics Inc. (United States) for analysis"

// Haemato-Oncology Molecular Genomic Testing Request Form
* #HaemOncPanelRequested "Haemato-Oncology test panel requested"
* #DifferentialDiagnosis "Differential diagnosis/clinical question"

// Genomic Testing Request Form (Rare Disease)
* #ClinicalUtilityPatientManagement "Patient management (determining therapeutic decisions and/or clinical investigations and/or surveillance programme)"
* #ClinicalUtilityReproductiveDecision "Patient, parents, or adult relative reproductive decision making"
* #ClinicalUtilityPredictiveTesting "Unaffected relatives are seeking predictive testing"
* #TargetedFamilialVariant "Known familial variant and affected relative details (targeted familial testing)"

// Haemoglobinopathy Genetic/Prenatal Testing Request Forms
* #RelativeOrPartnerStatus "Status of relative/partner (affected or carrier)"
* #RelativeOrPartnerVariant "Details of the relative/partner's variant, if known"
* #GeneticStatusAffected "Affected"
* #GeneticStatusCarrier "Carrier"
* #HbA2Percent "Hb A2 (%)"
* #HbFPercent "Hb F (%)"
* #OtherHbPercent "Other Hb (%)"

// GP Cystic Fibrosis Carrier Test Request Form
* #CFReferralScenario "CF carrier testing referral scenario"
* #CFReferralFamilyHistory "Family history of CF"
* #CFReferralPartner "Partner of a patient affected with, or a carrier of, CF"

// WGS Test Order Form (local, accompanies samples - distinct from the
// distributed WGS (dWGS) sub-order manifest, see Questionnaire-dWGSSubOrder)
* #WGSPathwayRareDiseaseProband "WGS pathway - Rare Disease, Proband"
* #WGSPathwayRareDiseaseFamilyMember "WGS pathway - Rare Disease, Family Member"
* #WGSPathwayCancerTumour "WGS pathway - Cancer, Tumour Sample"
* #WGSPathwayCancerGermline "WGS pathway - Cancer, Germline Sample"

// Genomic Variant Review Request Form (R442.1)
* #VariantReviewReasonNewInformation "New information (e.g. segregation data, change in phenotype, publication)"
* #VariantReviewReasonTimeElapsed "Sufficient time having passed since the initial review (>2 years)"
* #VariantReviewReasonUrgent "Urgent clinical scenario, e.g. prenatal diagnosis"
* #VariantReviewReasonFormalClassification "Variant requiring formal classification, using ACGS guidelines, where none exists"
* #ReportReference "Prior report reference"

// Deafness Testing Proforma (R67)
* #DeafnessSyndromePendred "Pendred syndrome"
* #DeafnessSyndromeUsher "Usher syndrome"
* #DeafnessSyndromeJervellLangeNielsen "Jervell-Lange Nielsen syndrome"
* #DeafnessSyndromeWaardenburg "Waardenburg syndrome"
* #DeafnessSyndromeBranchioOtoRenal "Branchio-oto-renal syndrome"
* #DeafnessSyndromeWolfram "Wolfram syndrome"
* #DeafnessRiskFactorPrematurity "Prematurity"
* #DeafnessRiskFactorHyperbilirubinemia "Hyperbilirubinemia"
* #DeafnessRiskFactorProlongedNNUStay "Prolonged neonatal care unit stay"
* #DeafnessRiskFactorOtotoxicMedication "Ototoxic medication"
* #AudiogramSeverityRight "Audiogram severity - right ear"
* #AudiogramSeverityLeft "Audiogram severity - left ear"
* #AudiogramProgression "Audiogram progression"

// NHS Genomic Medicine Service (GMS) WGS Test Request Forms (national,
// GMS-branded - not NW GLH-specific) - Rare Disease and Cancer variants.
// See Questionnaire-GenomicTestOrder.html#nw-glh-paper-test-request-forms.

// GMS WGS Test Request - Rare Disease
* #ReasonNHSNumberNotAvailable "Reason NHS Number not available"
* #FamilyTestType "Family test type (Singleton/Trio/Other)"
* #UrgencyReason "Reason for urgency (Clinical Priority)"
* #AdditionalPanels "Additional gene panel(s) (Genomics England PanelApp, GMS Rare Disease Virtual)"
* #ProbandAgeAtOnset "Proband's age at onset of clinical features"
* #SpecificRareDiseaseSuspected "Specific rare disease suspected or confirmed"
* #HPOTerm "HPO (Human Phenotype Ontology) term"
* #MainContact "Main contact (if different from responsible clinician/consultant)"

// GMS WGS Test Request - Cancer
* #PresentationStatus "Presentation status (First diagnosis/Recurrence/Relapse/Unknown)"
* #PresentationFirstDiagnosis "First diagnosis"
* #PresentationRecurrenceRelapse "Recurrence/Relapse"
* #TumourPresentationType "Tumour presentation type (Primary/Metastatic/Unknown/Lymphoma)"
* #TumourPresentationPrimary "Primary"
* #TumourPresentationMetastatic "Metastatic"
* #TumourPresentationLymphoma "Lymphoma"
* #HistopathologyLabID "Histopathology Lab ID"
* #SIHMDSLabID "SIHMDS Lab ID"
* #HaematoOncologyLiquidTumourType "Haemato-oncology liquid tumour type (AML/ALL/Other)"
* #NucleatedCellCount "Nucleated cell count (bone marrow/peripheral blood sample)"
