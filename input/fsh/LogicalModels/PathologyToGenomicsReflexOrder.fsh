Logical:        PathologyToGenomicsReflexOrder
Id:             PathologyToGenomicsReflexOrder
Title:          "Pathology to Genomics Reflex Order"
Description:    """
**This logical model is a proposal, not an active or planned project.**

The data carried by a reflex order (`LAB-35`) from a pathology laboratory to
the genomics laboratory, extracted from the [Pathology to Genomics
Reflex](https://nw-gmsa.github.io/use-cases/PathologyToGenomicsReflex.html) use
case. Pathology is the Order Placer of the reflex order.

It has two parts: the **reflex order** itself, and the **pathology report
semantics** genomics needs alongside it. Pathology report items are aligned
with [COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology) (v5).
"""
Characteristics: #can-be-target

// Reflex order

* patient 1..1 BackboneElement "Patient" "Patient identification"
  * nhsNumber 0..1 Identifier "NHS Number" "NHS Number of the patient"
  * medicalRecordNumber 0..* Identifier "Medical Record Number (MRN)" "Local hospital number(s) of the patient"
  * name 0..1 HumanName "Patient name" "Patient name"
  * birthDate 0..1 date "Date of birth" "Patient date of birth"
  * gender 0..1 code "Administrative gender" "Patient administrative gender"

* pathologyOrderNumber 1..1 Identifier "Pathology order number" """
The Pathology Order Filler Number. Links the genomic order to the pathology
order/report, and becomes the Placer Order Number of the genomic order,
because pathology is now the Order Placer.
**Open:** confirm whether pathology sends its own order number, the original
EPR order number, or both.
"""
* parentOrderNumber 0..1 Identifier "Parent order number" """
The pathology order the reflex order follows on from (provisional ORC-8
Parent).
"""
* originalClinicalOrderNumber 0..1 Identifier "Original clinical order number (EPR)" """
Lets the genomic report be filed back against the clinician's original order.
**Open:** only needed if genomics reports to the original Order Placer.
"""
* hospitalSpell 0..1 Identifier "Hospital spell / account number" "Links to the patient's hospital spell"

* pathologyLaboratory 1..1 Identifier "Pathology laboratory (ODS code)" """
The laboratory that holds the block, and the Ordering Facility of the reflex
order. National form field "Histopathology Lab ID".
"""
* pathologist 0..1 BackboneElement "Pathologist" "Who to contact about the sample"
  * name 0..1 HumanName "Pathologist name" "Pathologist name"
  * registration 0..1 Identifier "Professional registration" "e.g. GMC number"
* requestingClinician 0..1 BackboneElement "Requesting (responsible) clinician" """
**Open:** whether this is the clinician on the original pathology order or the
person placing the reflex order (e.g. the pathologist) - they differ for a
reflex order.
"""
  * name 0..1 HumanName "Clinician name" "Clinician name"
  * registration 0..1 Identifier "Professional registration" "GMC/GMP number"
  * organisation 0..1 Identifier "Organisation (ODS code)" "Clinician's organisation"
* copyReportTo 0..* Identifier "Copy report to" """
Second recipient of the genomic report, e.g. the original clinician when
pathology is the requester. **Open:** not mapped in this IG yet.
"""

* genomicTest 1..1 CodeableConcept "Genomic test requested" "National Genomic Test Directory test (e.g. M-code) / clinical indication"
* consent 0..1 boolean "Consent for tissue/report to be sent" "Form-specific, e.g. HRD/tBRCA"

* specimen 1..* BackboneElement "Specimen" "The block, sections or sample sent"
  * identifier 1..1 Identifier "Specimen identifier" "Pathology block/sample number"
  * collectionDate 0..1 dateTime "Sample collection date" "When the sample was taken"
  * receiptDate 0..1 dateTime "Sample receipt date" "When pathology received the sample"
  * specimenNature 0..1 CodeableConcept "Specimen nature" "e.g. primary tumour, lymph node, metastatic site"
  * investigationType 0..1 CodeableConcept "Pathology investigation type" "e.g. cytology, biopsy, excision"
  * neoplasticCellContent 0..1 Quantity "Neoplastic / tumour cell content (%)" """
Whether the specimen is suitable (national guidance is typically >20%).
Assessed on an H&E section of the block or area sent, so it can differ between
blocks. Not in COSD Pathology.
"""

// Pathology report semantics

* pathologyReport 0..1 BackboneElement "Pathology report" """
Clinical evidence for the test. **Open:** send the whole report, or send a
reference and let genomics query it.
"""
  * identifier 0..1 Identifier "Service report identifier" "Pathology report identifier"
  * status 0..1 code "Service report status" "e.g. final, preliminary"
  * resultDate 0..1 date "Investigation result date" "Date the pathology report was authorised"
  * presentedForm 0..1 Attachment "Pathology report document" "Report as a document, e.g. PDF"
  * text 0..1 string "Pathology report text" "Full report text"
  * topography 0..1 CodeableConcept "Tumour topography" "Primary site (SNOMED CT)"
  * morphology 0..1 CodeableConcept "Tumour morphology" "Histology and behaviour (SNOMED CT)"
  * diagnosis 0..1 CodeableConcept "Diagnosis" "Pathological diagnosis (ICD-10)"
  * diagnosisDate 0..1 date "Diagnosis date" "Date of diagnosis"
  * presentationStatus 0..1 CodeableConcept "Presentation status" "Newly diagnosed or recurrence/relapse"
  * laterality 0..1 CodeableConcept "Tumour laterality" "Left, right, midline, bilateral"
  * grade 0..1 CodeableConcept "Grade of differentiation" "G1-G4"
  * lesionSize 0..1 Quantity "Lesion size" "Diameter in millimetres"
  * stage 0..1 BackboneElement "Pathological TNM stage" "Pathological TNM stage"
    * t 0..1 CodeableConcept "T category" "Primary tumour"
    * n 0..1 CodeableConcept "N category" "Regional lymph nodes"
    * m 0..1 CodeableConcept "M category" "Distant metastases"
    * group 0..1 CodeableConcept "TNM stage grouping" "Stage grouping"

* ihcResult 0..* BackboneElement "IHC result" """
Immunohistochemistry results, including the result that triggered the reflex,
e.g. MMR deficiency for Lynch screening.
"""
  * marker 1..1 CodeableConcept "Marker" "e.g. MLH1, PMS2, MSH2, MSH6, Ki-67"
  * result[x] 1..1 CodeableConcept or Quantity "Result" "e.g. nuclear expression intact / lost / equivocal, or Ki-67 %"

Mapping:        PathologyToGenomicsReflexOrder-HL7v2
Source:         PathologyToGenomicsReflexOrder
Target:         "http://hl7.org/v2"
Id:             hl7v2
Title:          "HL7 v2 (indicative)"
* patient -> "PID"
* pathologyOrderNumber -> "ORC-2 / OBR-2"
* parentOrderNumber -> "ORC-8 / OBR-29 (provisional)"
* originalClinicalOrderNumber -> "ORC-8 / OBR-29 (provisional)"
* hospitalSpell -> "PV1-19"
* pathologyLaboratory -> "ORC-21"
* pathologist -> "ORC-12 / OBX"
* requestingClinician -> "ORC-12 / OBR-16"
* copyReportTo -> "OBR-28"
* genomicTest -> "OBR-4"
* consent -> "OBX"
* specimen -> "SPM"
* specimen.identifier -> "SPM-2 / SPM-30"
* specimen.collectionDate -> "SPM-17"
* specimen.receiptDate -> "SPM-18"
* specimen.neoplasticCellContent -> "OBX in the specimen group"
* pathologyReport -> "OBX (ED, PDF), coded OBX, or a reference"
* ihcResult -> "OBX"

Mapping:        PathologyToGenomicsReflexOrder-FHIR
Source:         PathologyToGenomicsReflexOrder
Target:         "https://fhir.nwgenomics.nhs.uk"
Id:             fhir
Title:          "FHIR (this IG)"
* patient -> "ServiceRequest.subject (Patient)"
* pathologyOrderNumber -> "ServiceRequest.identifier[OrderIdentifier]"
* parentOrderNumber -> "ServiceRequest.requisition (provisional)"
* originalClinicalOrderNumber -> "ServiceRequest.requisition (provisional)"
* hospitalSpell -> "ServiceRequest.encounter.identifier"
* pathologyLaboratory -> "ServiceRequest.requester (PractitionerRole).organization"
* pathologist -> "ServiceRequest.requester (PractitionerRole).practitioner, or supportingInfo[OrderEntryQuestions]"
* requestingClinician -> "ServiceRequest.requester (PractitionerRole)"
* copyReportTo -> "Not mapped yet"
* genomicTest -> "ServiceRequest.code"
* consent -> "ServiceRequest.supportingInfo[OrderEntryQuestions] (Observation)"
* specimen -> "ServiceRequest.specimen (Specimen)"
* specimen.identifier -> "Specimen.identifier / Specimen.accessionIdentifier"
* specimen.neoplasticCellContent -> "Observation with Observation.specimen, via supportingInfo[OrderEntryQuestions]"
* pathologyReport -> "ServiceRequest.supportingInfo[clinicalContext] (DocumentReference); coded items via supportingInfo[OrderEntryQuestions] (Observation)"
* ihcResult -> "Observation coded with LOINC, via supportingInfo[OrderEntryQuestions] (gap - no profile)"

Mapping:        PathologyToGenomicsReflexOrder-COSD
Source:         PathologyToGenomicsReflexOrder
Target:         "https://www.ndrs.nhs.uk/cosd-pathology"
Id:             cosd-pathology
Title:          "COSD Pathology v5"
* requestingClinician.registration -> "pCR7100 / pCR7120"
* pathologist.registration -> "pCR7130 / pCR7140"
* pathologyLaboratory -> "pCR0800 Organisation Identifier (Reporting Pathologist)"
* specimen.collectionDate -> "pCR1010 Sample Collection Date"
* specimen.receiptDate -> "pCR0770 Sample Receipt Date"
* specimen.specimenNature -> "pCR0970 Specimen Nature"
* specimen.investigationType -> "pCR0760 Pathology Investigation Type"
* pathologyReport.identifier -> "pCR0950 Service Report Identifier"
* pathologyReport.status -> "pCR0960 Service Report Status"
* pathologyReport.resultDate -> "pCR0780 Investigation Result Date"
* pathologyReport.text -> "pCR1020 Pathology Report Text"
* pathologyReport.topography -> "pCR6410 Topography (SNOMED) Pathology"
* pathologyReport.morphology -> "pCR6420 Morphology (SNOMED) Pathology"
* pathologyReport.diagnosis -> "pCR0810 Diagnosis (ICD Pathological)"
* pathologyReport.laterality -> "pCR0820 Tumour Laterality (Pathological)"
* pathologyReport.grade -> "pCR0860 Grade of Differentiation (Pathological)"
* pathologyReport.lesionSize -> "pCR0830 Lesion Size (Pathological)"
* pathologyReport.stage.t -> "pCR0910 T Category (Pathological)"
* pathologyReport.stage.n -> "pCR0920 N Category (Pathological)"
* pathologyReport.stage.m -> "pCR0930 M Category (Pathological)"
* pathologyReport.stage.group -> "pCR0940 TNM Stage Grouping (Pathological)"
* ihcResult -> "pCR7020-pCR7050 MLH1/PMS2/MSH2/MSH6 Nuclear Expression Intact; pCR7000/pCR7010 Ki-67"
