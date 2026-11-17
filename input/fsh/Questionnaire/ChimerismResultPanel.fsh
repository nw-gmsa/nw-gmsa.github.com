Instance: ChimerismResultPanel
InstanceOf: NWQuestionnaire
Title: "Chimerism Testing Result Panel"
Description: """
Result panel for STR-based chimerism testing (Clatterbridge post-transplant
monitoring) - see [Histocompatibility and Immunogenetics - Chimerism Testing
Result Panel (Future?)](https://github.com/nw-gmsa/nw-gmsa-use-cases/blob/main/HistocompatibilityAndImmunogenetics.md#chimerism-testing-result-panel-future)
for the source data table this Questionnaire structures, taken from the original iLab
`ORU^R01` ([LUFT_ORU_For_Clatterbridge.txt](https://github.com/nw-gmsa/Testing/blob/main/Input/V2/R01/LUFT_ORU_For_Clatterbridge.txt)).

A chimerism result is **not a Genomic Report** data type: it is a measurement (the
percentage of donor or recipient cells) with QC values and transplant context, not a
variant or genotype, so it follows the ordinary laboratory result pattern - a
`DiagnosticReport` with `Observation` results (`valueQuantity` in `%`), like
[BCRABLResultPanel](Questionnaire-BCRABLResultPanel.html). LOINC classes its chimerism
panels as blood bank and cell markers, not molecular pathology.

The panel code is LOINC `112460-1` (with cell selection - the example is a myeloid
lineage result); whole blood chimerism uses `112449-4` "Chimerism post transplant panel
without cell selection - Specimen". Items carry a LOINC code where a candidate was found,
followed by the original local `IMM` code (the [Chimerism](CodeSystem-Chimerism.html)
CodeSystem). The LOINC codes are **candidates**, found by searching LOINC 2.83; they have
not been checked against the panels' member lists, and the LOINC result codes are
*recipient*-derived %, while the example result is probably *donor* % - to confirm with
the laboratory.
"""
Usage:  #definition

* title = "Chimerism Testing Result Panel"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/ChimerismResultPanel"
* code[+] = $loinc#112460-1 "Chimerism post transplant cell selection panel - Specimen"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "Report"
  * text = "Chimerism Report"
  * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport"

// NTE - Test Method

  * item[+]
    * type = #string
    * linkId = "Chimerism/TestMethod"
    * text = "Test Method"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.method"
    * item[+]
      * linkId = "Chimerism/TestMethod-designNote"
      * type = #display
      * text = "e.g. \"Chimerism analysis by STR technique.\" No local code (NTE, unstructured)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE - Device

  * item[+]
    * type = #string
    * linkId = "Chimerism/Device"
    * text = "Device"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.device"
    * item[+]
      * linkId = "Chimerism/Device-designNote"
      * type = #display
      * text = "e.g. \"Test performed using Promega GenePrint 24 kit.\" No local code (NTE, unstructured) - a Device for the kit, referenced from Observation.device."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "Result"
    * text = "Chimerism Result"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.result"

// OBX|STR - Average % chimerism

    * item[+]
      * type = #decimal
      * linkId = "Chimerism/AverageChimerism"
      * code[+] = $loinc#103160-8 "Cells.CD33.recipient derived/Cells.CD33 in Blood --post bone marrow transplant"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#STR
      * text = "Average % Chimerism"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
      * item[+]
        * linkId = "Chimerism/AverageChimerism-designNote"
        * type = #display
        * text = "e.g. 100, in UCUM %. The LOINC code depends on the cell selection: 103160-8 CD33 (myeloid, the example), 103158-2 CD15 or 103156-6 CD3 for other lineages, or 104479-1 \"Cells.recipient derived/Cells in Blood or Tissue by Molecular genetics method --post stem cell transplant\" for whole blood (104480-9 for bone marrow). To confirm: these LOINC codes are recipient-derived %, the example is probably donor %."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|IM - Informative Markers

    * item[+]
      * type = #string
      * linkId = "Chimerism/InformativeMarkers"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#IM
      * text = "Informative Markers"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.note"
      * item[+]
        * linkId = "Chimerism/InformativeMarkers-designNote"
        * type = #display
        * text = "e.g. \"D13S317 PENTA E CSF1PO PENTA D D21S11 D8S1179 D12S391\" - the STR loci that distinguish donor from recipient. No LOINC code found; a note, or an Observation.component per STR locus."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|RANGE - Range

    * item[+]
      * type = #string
      * linkId = "Chimerism/Range"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#RANGE
      * text = "Range"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.referenceRange"
      * item[+]
        * linkId = "Chimerism/Range-designNote"
        * type = #display
        * text = "e.g. \"NA\". Whether this is a reference range or a QC range (Observation.component) is to be confirmed with the laboratory."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|CV - CV

    * item[+]
      * type = #string
      * linkId = "Chimerism/CV"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#CV
      * text = "CV"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"
      * item[+]
        * linkId = "Chimerism/CV-designNote"
        * type = #display
        * text = "Coefficient of variation - a QC metric. No LOINC code found."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|PURE - % Purity

    * item[+]
      * type = #decimal
      * linkId = "Chimerism/Purity"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#PURE
      * text = "% Purity"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
      * item[+]
        * linkId = "Chimerism/Purity-designNote"
        * type = #display
        * text = "e.g. 87, in UCUM % - the purity of the selected cells. No LOINC code found; an Observation.component, or a specimen quality Observation."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "Specimen"
    * text = "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"

// OBX|EXT - Extraction Method

    * item[+]
      * type = #string
      * linkId = "Chimerism/ExtractionMethod"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#EXT
      * text = "Extraction Method"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.processing.description"
      * item[+]
        * linkId = "Chimerism/ExtractionMethod-designNote"
        * type = #display
        * text = "e.g. \"DNA extracted from myeloid lineage\" - the cell selection and DNA extraction. The lineage is also in the result's LOINC code (e.g. CD33)."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "ClinicalContext"
    * text = "Clinical Context"

// OBX|POST - Time post transplant

    * item[+]
      * type = #quantity
      * linkId = "Chimerism/TimePostTransplant"
      * code[+] = $loinc#99782-5 "Months [Time] --post transplant"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#POST
      * text = "Time Post Transplant"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"
      * item[+]
        * linkId = "Chimerism/TimePostTransplant-designNote"
        * type = #display
        * text = "e.g. \"2YR 7 MONTHS\" = 31 mo - an Observation referenced from ServiceRequest.supportingInfo, the same Ask at Order Entry pattern used elsewhere in this IG."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|DTP - Date of transplant

    * item[+]
      * type = #date
      * linkId = "Chimerism/DateOfTransplant"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#DTP
      * text = "Date of Transplant"
      * definition = "http://hl7.org/fhir/StructureDefinition/Procedure#Procedure.performedDateTime"
      * item[+]
        * linkId = "Chimerism/DateOfTransplant-designNote"
        * type = #display
        * text = "e.g. \"10.5.23\" (2023-05-10) - the transplant Procedure, referenced from ServiceRequest.supportingInfo."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|DID - Donor ID

    * item[+]
      * type = #string
      * linkId = "Chimerism/DonorID"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#DID
      * text = "Donor ID"
      * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier"
      * item[+]
        * linkId = "Chimerism/DonorID-designNote"
        * type = #display
        * text = "e.g. \"6939 DKM0 0096 2141 100\" - the donor's identifier (a donor Patient), referenced from the transplant Procedure."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
