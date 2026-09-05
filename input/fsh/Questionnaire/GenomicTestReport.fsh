Instance: GenomicTestReport
InstanceOf: NWQuestionnaire
Title: "North West Genomics Test Report"
Description: """
The aim of this is to support conversion of Genomic Report (HL7 v2 ORU) for use by several NHS Trusts (as HL7 v2 or FHIR).
"""
Usage:  #definition

* title = "North West Genomics Test Report"
* status = #active
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestReport"
* code[+] = $loinc#81247-9

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "/Metadata"
  * text = "Metadata"
  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"

  // Patient	Patient/proband hospital number

  * item[+]
    * type = #string
    * linkId = "LN/76435-7"
    * code[+] = $loinc#76435-7
    * text = "Hospital Number (Medical Record Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"
    * required = true
  * item[+]
    * type = #string
    * linkId = "LN/56797-4"
    * code[+] = $loinc#56797-4
    * text = "Account Number (Episode or Stay Number)"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.encounter.identifier.value"
    * required = false
    * item[+]
      * linkId = "LN/56797-4-designNote"
      * type = #display
      * text = "PV1-19 (also known as stay number)"
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #choice
    * linkId = "HL7/PV1-10"
    * text = "Hospital Service"
    * definition = "http://hl7.org/fhir/StructureDefinition/Encounter#Encounter.serviceType"
    * answerValueSet = Canonical(Service)
    * required = false


* item[+]
  * type = #group
  * linkId = "/81306-3"
  * code = $loinc#81306-3 "Overall study variables type"
  * text = "Overall study variables type (Test Details)"
  * item[+]
    * type = #string
    * linkId = "LN/106194-4"
    * code[+] = $loinc#106194-4
    * text = "Test request ID/Order ID/Order Placer Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderIdentifier"
    * required = false
  * item[+]
    * type = #string
    * linkId = "LN/106183-7"
    * code[+] = $loinc#106183-7
    * text = "Order Filler Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderFillerNumber"
    * required = false
  * item[+]
    * type = #string
    * linkId = "HL7/OBR-3"
    * text = "Report Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.identifier:ReportNumber"
    * required = true
  * item[+]
    * type = #string
    * linkId = "HL7/ORC-21"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
    * text = "Referring Organisation ODS Code / Ordering Facility"
  * item[+]
    * type = #dateTime
    * linkId = "HL7/OBR-7"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.effectiveDateTime"
    * text = "Report Date"
    * required = true
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-25"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.status"
    * text = "Report Status"
    * answerValueSet = "http://hl7.org/fhir/ValueSet/diagnostic-report-status"
    * required = true
  * item[+]
    * type = #string
    * linkId = "HL7/OBR-32"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.resultsInterpreter"
    * text = "Results Interpreter"
    * item[+]
      * linkId = "HL7/OBR-32-designNote"
      * type = #display
      * text = "OBR-32 (Principal) and OBR-33 (Assistant) - see Practitioner Identifier."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "HL7/OBR-34"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.performer:operator"
    * text = "Performer (Operator/Technician)"
  * item[+]
    * type = #string
    * linkId = "DiagnosticReport/performer-organization"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.performer:organization"
    * text = "Performer (Organisation)"
    * item[+]
      * linkId = "DiagnosticReport/performer-organization-designNote"
      * type = #display
      * text = "The organisation that produced the report - see Organisation Code. No dedicated HL7 v2 field identified for this element."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #group
    * linkId = "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"
    * text = "Specimen/Biopsy"
    * item[+]
      * type = #string
      * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
      * linkId = "LN/80398-1"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
      * text = "Specimen ID Number"
    * item[+]
      * type = #string
      * code[+] = $loinc#80398-1 "Unique identifier for Current sample"
      * linkId = "Specimen/accessionIdentifier"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier"
      * text = "Lab DNA Number (If Known)"

  * item[+]
    * linkId = "/81306-3/51967-8"
    * code = $loinc#51967-8 "Genetic disease assessed [ID]"
    * text = "Gene dis assessed"
    * type = #choice
    * answerValueSet = Canonical(GenomicClinicalIndicationCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
  * item[+]
    * type = #choice
    * linkId = "HL7/OBR-4-r"
    * code[+] = $loinc#29300-1
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.code"
    * text = "Test Code"
    * required = false
    * item[+]
      * linkId = "HL7/OBR-4-r-designNote"
      * type = #display
      * text = "OBR-4, carried on the report. The same code is carried on the order as ServiceRequest.code - see Genomic Test Order."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
* item[+]
  * type = #group
  * linkId = "/Results"
  * text = "Results"
  * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.result"
  * item[+]
    * linkId = "/81306-3/51969-4"
    * code = $loinc#51969-4 "Genetic analysis report"
    * text = "Gene analysis narr rpt Doc"
    * type = #string
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.presentedForm"
  * item[+]
    * linkId = "DiagnosticReport/conclusion"
    * text = "Conclusion"
    * type = #string
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusion"
    * item[+]
      * linkId = "DiagnosticReport/conclusion-designNote"
      * type = #display
      * text = "Free-text interpretive summary. No dedicated LOINC/OBX code identified for this element - see the Outcome item below for the coded equivalent."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * linkId = "/81306-3/TESTOUTCOME"
    * code = $nwgmsa#TESTOUTCOME "NHS England Genomics Test Outcome"
    * text = "Outcome (NHS England Genomics Test Outcome)"
    * type = #choice
    * answerValueSet = Canonical(GenomicTestOutcomeCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusionCode.coding:GenomicTestOutcomeCode"
  * item[+]
    * linkId = "/Results/ReportPanels"
    * type = #display
    * text = "Individual test results are carried as separate, panel-specific Questionnaires nested under DiagnosticReport.result - see Report Panels below for the full list (e.g. Reportable Variant Result Panel, BCR-ABL Monitoring Result Panel, Chimerism Testing Result Panel)."
    * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
