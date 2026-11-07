Logical:        GenomicTestReportModel
Id:             GenomicTestReport
Title:          "Genomic Test Report"
Description:    """
The common core of a Genomic Test Report: the Patient, Hospital Spell, Diagnostic
Workflow and Results shared by every report, regardless of test type. Individual test
findings are carried as panel-specific results (see Report Panels below).

This is a logical model - it is not exchanged as is. It breaks down into `DiagnosticReport`,
`Patient`, `Encounter`, `ServiceRequest`, `PractitionerRole`, `Organization`, `Specimen`,
`Observation` and `DocumentReference`/`Binary` for exchange via
[HL7 v2 ORU_R01](hl7v2.html) or FHIR (Message R01 / RESTful API).
"""
Characteristics: #can-be-target

// Patient

* patient 1..1 BackboneElement "Patient" "Patient identification"
  * nhsNumber 0..1 NHSIdentifier "NHS Number" "NHS Number of the patient"
  * medicalRecordNumber 1..1 MedicalRecordNumber "Hospital Number (Medical Record Number)" "Local hospital number of the patient"

// Hospital Spell

* hospitalSpell 0..1 BackboneElement "Hospital Spell" "Treat as mandatory for reflex or subcontracted orders."
  * accountNumber 0..1 HospitalProviderSpellIdentifier "Account Number (Episode or Stay Number)" """
Assigned by the Order Placer, where it is known as spell or episode id. Used by all
diagnostics to link tests to a spell/episode. Also known as stay number.
"""
  * hospitalService 0..1 CodeableConcept "Hospital Service" "Hospital service the patient is under"
* hospitalSpell.hospitalService from Service (extensible)

// Diagnostic Workflow

* orderNumber 0..1 OrderPlacerNumber "Order Placer Number" """
The unique order number assigned by the Order Placer (order comms or EHR) that requested
the report. Present for a **closed-loop** report; absent for an **unsolicited** report,
where no order was ever received.
"""
* orderFillerNumber 0..1 OrderFillerNumber "Order Filler Number" "Order number assigned by the Order Filler (LIMS)"
* reportNumber 1..1 ReportIdentifier "Report Number" "Identifies the report, assigned by the Order Filler (LIMS)"
* orderingFacility 0..1 OrganisationCode "Referring Organisation / Ordering Facility" "ODS code of the organisation that ordered the test"
* testCode 1..1 CodeableConcept "Test Code" """
(Order) Procedure Code. For genomics this is the National Genomic Test Directory code
(for radiology it would be the NICIP code). The same code is carried on the order.
"""
* testCode from GenomicTestCodes (extensible)
* geneticDiseaseAssessed 0..1 CodeableConcept "Genetic disease assessed" "Clinical indication (CITT code) the test assessed"
* geneticDiseaseAssessed from GenomicClinicalIndicationCodes (extensible)
* reportDate 1..1 dateTime "Report Date" "Date/time the report was issued"
* status 1..1 code "Report Status" "e.g. preliminary, final, amended"
* status from http://hl7.org/fhir/ValueSet/diagnostic-report-status (required)
* resultsInterpreter 0..* PractitionerIdentifier "Results Interpreter" "Who created the report - principal and assistant results interpreter"
* performerOperator 0..* PractitionerIdentifier "Performer (Operator/Technician)" "Who performed the test"
* performerOrganisation 1..* OrganisationCode "Performer (Organisation)" "The organisation that produced the report"
* specimen 0..* BackboneElement "Specimen/Biopsy" "The sample(s) that were used for testing"
  * identifier 0..1 Identifier "Specimen ID Number" "Specimen identifier (LOINC 80398-1)"
  * accessionIdentifier 0..1 SpecimenAccessionNumber "Lab DNA Number (if known)" "Identifier assigned by the laboratory"

// Results

* narrativeReport 0..* Attachment "Narrative Report" "Results and the entire report as a PDF (LOINC 51969-4 Gene analysis narrative report)"
* conclusion 0..1 string "Conclusion" "Free-text interpretive summary"
* outcome 0..1 CodeableConcept "Outcome" "NHS England Genomics Test Outcome (coded conclusion)"
* outcome from GenomicTestOutcomeCodes (extensible)
* result 0..* Reference(Observation) "Results" """
Individual test findings, carried as panel-specific results - e.g. Reportable Variant,
BCR-ABL Monitoring, Chimerism Testing. See Report Panels.
"""

Mapping:        GenomicTestReport-HL7v2
Source:         GenomicTestReportModel
Target:         "http://hl7.org/v2"
Id:             hl7v2
Title:          "HL7 v2 ORU_R01"
* patient -> "PID"
* patient.nhsNumber -> "PID-3"
* patient.medicalRecordNumber -> "PID-3"
* hospitalSpell -> "PV1"
* hospitalSpell.accountNumber -> "PV1-19"
* hospitalSpell.hospitalService -> "PV1-10"
* orderNumber -> "ORC-2 / OBR-2"
* orderFillerNumber -> "ORC-3"
* reportNumber -> "OBR-3"
* orderingFacility -> "ORC-21"
* testCode -> "OBR-4"
* geneticDiseaseAssessed -> "OBX (LOINC 51967-8)"
* reportDate -> "OBR-7"
* status -> "OBR-25"
* resultsInterpreter -> "OBR-32 (Principal) / OBR-33 (Assistant)"
* performerOperator -> "OBR-34"
* performerOrganisation -> "No dedicated field identified"
* specimen -> "SPM"
* specimen.identifier -> "SPM-2"
* specimen.accessionIdentifier -> "SPM-30"
* narrativeReport -> "OBX (type = ED)"
* conclusion -> "No dedicated field identified"
* outcome -> "OBX (LOINC 51968-6)"
* result -> "OBX"

Mapping:        GenomicTestReport-FHIR
Source:         GenomicTestReportModel
Target:         "https://fhir.nwgenomics.nhs.uk"
Id:             fhir
Title:          "FHIR (this IG)"
* patient -> "DiagnosticReport.subject (Patient)"
* patient.nhsNumber -> "Patient.identifier[nhsNumber]"
* patient.medicalRecordNumber -> "Patient.identifier[MedicalRecordNumber]"
* hospitalSpell -> "DiagnosticReport.encounter (Encounter - HospitalSpell)"
* hospitalSpell.accountNumber -> "Encounter.identifier"
* hospitalSpell.hospitalService -> "Encounter.serviceType"
* orderNumber -> "DiagnosticReport.basedOn[OrderPlacerNumber].identifier"
* orderFillerNumber -> "ServiceRequest.identifier[OrderFillerNumber]"
* reportNumber -> "DiagnosticReport.identifier[ReportNumber]"
* orderingFacility -> "ServiceRequest.requester (PractitionerRole).organization"
* testCode -> "DiagnosticReport.code"
* geneticDiseaseAssessed -> "Observation.valueCodeableConcept (LOINC 51967-8)"
* reportDate -> "DiagnosticReport.effectiveDateTime"
* status -> "DiagnosticReport.status"
* resultsInterpreter -> "DiagnosticReport.resultsInterpreter (Practitioner)"
* performerOperator -> "DiagnosticReport.performer[operator] (Practitioner)"
* performerOrganisation -> "DiagnosticReport.performer[organization] (Organization)"
* specimen -> "DiagnosticReport.specimen (Specimen)"
* specimen.identifier -> "Specimen.identifier"
* specimen.accessionIdentifier -> "Specimen.accessionIdentifier"
* narrativeReport -> "DiagnosticReport.presentedForm / DocumentReference.content (Binary)"
* conclusion -> "DiagnosticReport.conclusion"
* outcome -> "DiagnosticReport.conclusionCode"
* result -> "DiagnosticReport.result (Observation)"

Mapping:        GenomicTestReport-Questionnaire
Source:         GenomicTestReportModel
Target:         "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestReport"
Id:             questionnaire
Title:          "Questionnaire (linkId)"
* patient.nhsNumber -> "LN/89061-6"
* patient.medicalRecordNumber -> "LN/76435-7"
* hospitalSpell.accountNumber -> "LN/56797-4"
* hospitalSpell.hospitalService -> "HL7/PV1-10"
* orderNumber -> "LN/106194-4"
* orderFillerNumber -> "LN/106183-7"
* reportNumber -> "HL7/OBR-3"
* orderingFacility -> "HL7/ORC-21"
* testCode -> "HL7/OBR-4-r"
* geneticDiseaseAssessed -> "/81306-3/51967-8"
* reportDate -> "HL7/OBR-7"
* status -> "HL7/OBR-25"
* resultsInterpreter -> "HL7/OBR-32"
* performerOperator -> "HL7/OBR-34"
* performerOrganisation -> "DiagnosticReport/performer-organization"
* specimen -> "Specimen"
* specimen.identifier -> "LN/80398-1"
* specimen.accessionIdentifier -> "Specimen/accessionIdentifier"
* narrativeReport -> "/81306-3/51969-4"
* conclusion -> "DiagnosticReport/conclusion"
* outcome -> "/81306-3/TESTOUTCOME"
* result -> "/Results"
