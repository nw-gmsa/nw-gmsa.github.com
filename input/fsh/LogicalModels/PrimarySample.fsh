Logical:        PrimarySampleModel
Id:             PrimarySample
Title:          "Primary Sample"
Description:    """
The Primary sample: the initial material provided directly to the first laboratory.
Requirements are from the NHS England [Genomics Master Dataset (MDS)](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/NHSGenomics/Genomics%20Master%20Dataset%20_MDS_%20v1.062.xlsx)
v1.062, Genomic Test Ordering, **Data group - Primary sample** (PS-nnn data elements).

The model follows international standards in preference to the MDS picklists: the HL7 Europe
Laboratory [Specimen](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Specimen-eu-lab.html)
(HL7 v2 `SPM`), SNOMED CT and LOINC. Most of the content is not genomics specific. Tumour
content is owned by the cancer domain and is aligned with the
[Cancer Pathology Report](https://kevinmayfield.github.io/CancerPathologyReport/en/StructureDefinition-PathologyReport.html)
(COSD Pathology, mCODE).

Adds detail to the `specimen` of the [Genomic Test Order](StructureDefinition-GenomicTestOrder.html).
Whether an element is required depends on the test modality - see the modality table on this
page. Elements mandatory for every modality they apply to are 1..1.

This is a logical model - it is not exchanged as is. It breaks down into `Specimen` and
`Observation` (focus = Specimen). Each element's MDS data element is shown on the **Mappings** tab.
"""
Characteristics: #can-be-target

// Specimen - HL7 Europe Laboratory Specimen-eu-lab / HL7 v2 SPM

* identifier 1..1 BackboneElement "Specimen identifier" "Local id applied to the sample by the sending organisation"
  * value 1..1 string "Local identifier" "Local id applied to the sample (PS-002)"
  * assigner 1..1 OrganisationCode "Assigning organisation" "ODS code of the organisation which assigned the local sample id (PS-003)"
* parentIdentifier 0..1 string "Parent specimen identifier (block)" "The tissue block the sample was taken from. Mandatory IF the specimen is FFPE or tissue (PS-030)"
* collector 1..1 OrganisationCode "Collecting organisation" "ODS code of the organisation which took the sample (PS-038)"
* collectedDate 1..1 date "Collection date" "Date the specimen/biopsy was obtained from the patient (PS-010)"
* type 1..1 CodeableConcept "Specimen type" "The specimen material, e.g. peripheral blood, amniotic fluid, tumour tissue, FFPE tissue (PS-011)"
* condition 1..1 CodeableConcept "Specimen condition" "State of the specimen, e.g. fresh, frozen. FFPE is better carried as the specimen type (PS-012)"
* additive 1..1 CodeableConcept "Container additive (preservative)" "e.g. EDTA, lithium heparin, none. Cell-free DNA tube brands (Streck, Roche) are container types (PS-025)"
* collectionMethod 0..1 CodeableConcept "Collection method" """
How the specimen was obtained, e.g. biopsy, excision. Carries both PS-029 (is biopsy: the
method is a biopsy) and PS-039 (biopsy type).
"""
* bodySite 0..1 CodeableConcept "Collection body site" "Site the sample was taken from. Mandatory IF the specimen is a biopsy (PS-019)"
* risk 0..* BackboneElement "Specimen risk" "High infection or contamination risk of the specimen (PS-024)"
  * code 1..1 CodeableConcept "Risk code" "e.g. INF Material Danger Infectious, BHZ Biohazard"
  * reason 0..1 CodeableConcept "Risk reason" """
The clinical reason for the risk: VIRALHEPATITIS, HIVINFECTION, IVDRUGUSERS, TUBERCULOSIS,
CREUTZFELDT-JACOBDISEASE, TYPHOIDFEVER, ANTHRAX, MELIOIDOSIS, BRUCELLOSIS, ECOLI0157,
HAEMOLYTICURAEMICSYNDROME, UNKNOWN. A patient condition, expressed in SNOMED CT
"""
* processing 0..1 BackboneElement "Processing" "Fixation and enrichment of a tissue sample"
  * fixative 0..* CodeableConcept "Fixative" "e.g. neutral buffered formalin. Mandatory IF the specimen is FFPE or tissue, for Solid Tumour (PS-031)"
  * hoursToFixation 0..1 integer "Hours to fixation (cold ischaemia time)" "Hours from collection to fixation (PS-032)"
  * hoursInFixative 0..1 integer "Hours in fixative" "Hours the sample was in fixative (PS-033)"
  * tumourEnrichment 0..* CodeableConcept "Tumour enrichment method" "NONE, MACRO, MICRO (dissection) (PS-034)"
* type from SpecimenType (extensible)
* condition from http://terminology.hl7.org/ValueSet/v2-0493 (extensible)
* additive from http://hl7.eu/fhir/laboratory/ValueSet/lab-specimenAdditive-eu-lab (preferred)
* collectionMethod from http://hl7.org/fhir/ValueSet/specimen-collection-method (preferred)
* bodySite from http://hl7.org/fhir/ValueSet/body-site (preferred)
* risk.code from http://terminology.hl7.org/ValueSet/v2-0489 (extensible)
* processing.fixative from http://terminology.hl7.org/ValueSet/v2-0371 (preferred)

// Specimen assessment - Observation (focus = Specimen), assessed by the local laboratory or SIHMDS

* assessment 0..1 BackboneElement "Specimen assessment" "Cell content and quality of the specimen. Each is an Observation about the specimen"
  * necrosis 0..1 Quantity "Necrosis %" "% necrotic (dead) cells. SNOMED CT 405921002 Percentage of neoplasm involved by necrosis (PS-013)"
  * nucleatedCellCount 0..1 Quantity "Nucleated cell count %" "% nucleated cells (non tumour and tumour), Haem-Onc. No international code identified (PS-014)"
  * tumourContentWholeSection 0..1 Quantity "Tumour (neoplastic) cell content - whole section %" """
% neoplastic cells in the whole section, Solid Tumour. SNOMED CT 371510003 Proportion of
specimen involved by tumour. Mandatory IF the specimen is FFPE or the test method is Whole
Genome Sequencing, and tumourContentMarkedArea is not populated (PS-015)
"""
  * tumourContentMarkedArea 0..1 Quantity "Tumour (neoplastic) cell content - marked area %" """
% neoplastic cells in the marked area, Solid Tumour. No international code identified.
Mandatory IF the specimen is FFPE or the test method is Whole Genome Sequencing, and
tumourContentWholeSection is not populated (PS-026)
"""
  * blasts 0..1 Quantity "Blasts %" "% blasts (immature blood cells), Haem-Onc. LOINC 11150-0 Blasts/cells in Bone marrow (PS-023)"
  * maternalCellContamination 0..1 BackboneElement "Maternal cell contamination (MCC)" """
Prenatal samples. One of observed or confirmed is Mandatory IF the specimen type is fetal
blood, amniotic fluid or chorionic villi. LOINC 59266-7 Maternal cell contamination
[Identifier] in Specimen Nominal
"""
    * observed 0..1 boolean "Observed MCC" "An observed outcome which may indicate MCC. Assume no observed MCC if not provided (PS-021)"
    * confirmed 0..1 Quantity "Test confirmed MCC" "Analytically confirmed MCC level (PS-027)"

// Tumour - owned by the cancer domain (Cancer Pathology Report: COSD Pathology, mCODE)

* tumour 0..1 BackboneElement "Tumour (cancer domain)" """
The tumour the sample was taken from. Owned by the cancer pathology report, not by genomics:
the order should reference the pathology report where one exists (see Genomic Test Order
`pathologyReport`) rather than re-capture these items.
"""
  * specimenNature 0..1 CodeableConcept "Solid tumour status (specimen nature)" "PRIMARY, METASTATIC, UNKNOWN. COSD Specimen Nature (pCR0970) (PS-035)"
  * morphology 0..1 CodeableConcept "Morphology" "Tumour type - SNOMED CT is-a 400177003 Neoplasm and/or hamartoma. COSD pCR6420. Mandatory IF the test is treatment determining (PS-017)"
  * topography 0..1 CodeableConcept "Topography" "Where the tumour originates - SNOMED CT is-a 442083009 Anatomical or acquired body structure. COSD pCR6410. Mandatory IF the test is not GT401 or GT19 (PS-018)"
  * stage 0..1 CodeableConcept "Stage" "TNM stage group - LOINC 21902-2. COSD pCR0940. Mandatory IF the test is GT401 or GT19 (PS-036)"
  * grade 0..1 CodeableConcept "Grade" "Histologic grade - LOINC 33732-9, SNOMED CT 371469007. COSD pCR0860 (PS-037)"

Mapping:        PrimarySample-MDS
Source:         PrimarySampleModel
Target:         "https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/NHSGenomics/Genomics%20Master%20Dataset%20_MDS_%20v1.062.xlsx"
Id:             mds
Title:          "Genomics Master Dataset (MDS) v1.062"
* identifier.value -> "PS-002 Primary sample - Local identifier"
* identifier.assigner -> "PS-003 Primary sample - ODS code of organisation which assigned local id"
* parentIdentifier -> "PS-030 Primary sample - Block identifier"
* collector -> "PS-038 Primary sample - ODS code of organisation which collected sample"
* collectedDate -> "PS-010 Primary sample - Obtained date"
* type -> "PS-011 Primary sample - Primary sample"
* condition -> "PS-012 Primary sample - Primary sample state"
* additive -> "PS-025 Primary sample - Preservative/Container"
* collectionMethod -> "PS-029 Primary sample - Is biopsy; PS-039 Primary sample - Biopsy type"
* bodySite -> "PS-019 Primary sample - Biopsy site"
* risk -> "PS-024 Primary sample - High infection risk reason"
* processing.fixative -> "PS-031 Primary sample - Fixative type"
* processing.hoursToFixation -> "PS-032 Primary sample - Hours to fixation"
* processing.hoursInFixative -> "PS-033 Primary sample - Hours in fixative"
* processing.tumourEnrichment -> "PS-034 Primary sample - Tumour enrichment method"
* assessment.necrosis -> "PS-013 Primary sample - Necrosis"
* assessment.nucleatedCellCount -> "PS-014 Primary sample - Nucleated cell count"
* assessment.tumourContentWholeSection -> "PS-015 Primary sample - Tumour nuclear content in whole section"
* assessment.tumourContentMarkedArea -> "PS-026 Primary sample - Tumour nuclear content in marked area"
* assessment.blasts -> "PS-023 Primary sample - Blasts %"
* assessment.maternalCellContamination.observed -> "PS-021 Primary sample - Observed maternal cell contamination (MCC)"
* assessment.maternalCellContamination.confirmed -> "PS-027 Primary sample - Test confirmed maternal cell contamination (MCC)"
* tumour.specimenNature -> "PS-035 Primary sample - Solid tumour status"
* tumour.morphology -> "PS-017 Primary sample - Solid tumour morphology"
* tumour.topography -> "PS-018 Primary sample - Solid tumour topography"
* tumour.stage -> "PS-036 Primary sample - Solid tumour stage"
* tumour.grade -> "PS-037 Primary sample - Solid tumour grade"

Mapping:        PrimarySample-FHIR
Source:         PrimarySampleModel
Target:         "http://hl7.eu/fhir/laboratory"
Id:             fhir
Title:          "FHIR R4 (HL7 Europe Laboratory)"
* -> "Specimen (Specimen-eu-lab)"
* identifier.value -> "Specimen.identifier.value"
* identifier.assigner -> "Specimen.identifier.assigner"
* parentIdentifier -> "Specimen.parent.identifier"
* collector -> "Specimen.collection.collector (PractitionerRole.organization)"
* collectedDate -> "Specimen.collection.collectedDateTime"
* type -> "Specimen.type"
* condition -> "Specimen.condition"
* additive -> "Specimen.processing.additive (Substance-additive-eu-lab). HL7 Europe Laboratory removes Specimen.container.additive[x]; the MDS maps it to Specimen.container.additiveCodeableConcept"
* collectionMethod -> "Specimen.collection.method"
* bodySite -> "Specimen.collection.bodySite"
* risk -> "Specimen.collection.extension:specimen-specialHandling (MDS); no core FHIR R4 element for HL7 v2 SPM-16"
* processing.fixative -> "Specimen.processing.additive (Substance-additive-eu-lab)"
* processing.hoursToFixation -> "Difference between Specimen.collection.collectedDateTime and Specimen.processing.timeDateTime"
* processing.hoursInFixative -> "Specimen.processing.timePeriod"
* processing.tumourEnrichment -> "Specimen.processing.procedure"
* assessment -> "Observation-resultslab-eu-lab (focus or specimen = Specimen)"
* assessment.necrosis -> "Observation.code = SNOMED CT 405921002, valueQuantity %"
* assessment.nucleatedCellCount -> "Observation.code = TBC, valueQuantity %"
* assessment.tumourContentWholeSection -> "Observation.code = SNOMED CT 371510003, valueQuantity %"
* assessment.tumourContentMarkedArea -> "Observation.code = TBC, valueQuantity %"
* assessment.blasts -> "Observation.code = LOINC 11150-0, valueQuantity %"
* assessment.maternalCellContamination.observed -> "Observation.code = LOINC 59266-7, valueBoolean"
* assessment.maternalCellContamination.confirmed -> "Observation.code = LOINC 59266-7, valueQuantity"
* tumour -> "Cancer Pathology Report profiles (mCODE aligned)"
* tumour.specimenNature -> "CancerPathologySpecimen.type"
* tumour.morphology -> "HistologicBehaviorAndType.valueCodeableConcept"
* tumour.topography -> "PrimaryCancerCondition.bodySite"
* tumour.stage -> "TNMStageGroup.valueCodeableConcept"
* tumour.grade -> "HistologicGrade.valueCodeableConcept"

Mapping:        PrimarySample-HL7v2
Source:         PrimarySampleModel
Target:         "http://hl7.org/v2"
Id:             hl7v2
Title:          "HL7 v2 SPM (indicative)"
* -> "SPM"
* identifier.value -> "SPM-2.1"
* identifier.assigner -> "SPM-2.1 (assigning authority)"
* parentIdentifier -> "SPM-3"
* collector -> "OBR-10 Collector Identifier (facility, XCN.14 Assigning Facility)"
* collectedDate -> "SPM-17"
* type -> "SPM-4"
* condition -> "SPM-24"
* additive -> "SPM-6"
* collectionMethod -> "SPM-7"
* bodySite -> "SPM-8"
* risk.code -> "SPM-16"
* risk.reason -> "OBX"
* processing.fixative -> "SPM-6"
* processing -> "OBX"
* assessment -> "OBX - prior result (ORDER_PRIOR / OBSERVATION_PRIOR) of the pathology laboratory's review of the block"
* tumour -> "OBX - prior result (ORDER_PRIOR / OBSERVATION_PRIOR) in the pathology report"

Mapping:        PrimarySample-CancerPathologyReport
Source:         PrimarySampleModel
Target:         "https://fhir.nwgenomics.nhs.uk/CancerPathologyReport/StructureDefinition/PathologyReport"
Id:             cancer-pathology-report
Title:          "Cancer Pathology Report (COSD Pathology)"
* collectedDate -> "specimen.collectionDate (pCR1010)"
* collectionMethod -> "specimen.investigationType (pCR0760)"
* tumour.specimenNature -> "specimen.specimenNature (pCR0970)"
* tumour.morphology -> "diagnosis.morphology (pCR6420)"
* tumour.topography -> "diagnosis.topography (pCR6410)"
* tumour.stage -> "stage.stageGrouping (pCR0940)"
* tumour.grade -> "tumour.grade (pCR0860)"
