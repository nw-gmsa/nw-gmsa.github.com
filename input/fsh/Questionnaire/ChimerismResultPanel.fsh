Instance: ChimerismResultPanel
InstanceOf: NWQuestionnaire
Title: "Chimerism Testing Result Panel"
Description: """
Result panel for STR-based chimerism testing (Clatterbridge post-transplant
monitoring) - see [Histocompatibility and Immunogenetics - Outstanding
Issues](HistocompatibilityAndImmunogenetics.html#outstanding-issues) for the
source data table this Questionnaire structures.

The payload described there is currently unstructured `NTE`/`OBX` text, with no
FHIR mapping yet - `item.definition` values here are the same candidate
mappings recorded in that table's "FHIR Genomic Report Field" column, most
inferred by analogy with [HL7's Genomics Reporting IG - Histocompatibility and
Immunogenetic Reporting](http://hl7.org/fhir/uv/genomics-reporting/histocompatibility.html)
(a dependency of this IG, though it profiles HLA allele genotyping, not STR
chimerism) rather than confirmed against a real example, unlike
[BCRABLResultPanel](Questionnaire-BCRABLResultPanel.html) which is inferred
from real `Observation` examples. Several rows have no direct FHIR fit and are
marked as such rather than forced onto one.
"""
Usage:  #definition

* title = "Chimerism Testing Result Panel"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/ChimerismResultPanel"

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
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.method"
    * item[+]
      * linkId = "Chimerism/TestMethod-designNote"
      * type = #display
      * text = "e.g. \"Chimerism analysis by STR technique.\" No local code (NTE, unstructured) - candidate mapping only, DiagnosticReport.method is not otherwise used in this IG."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE - Device

  * item[+]
    * type = #string
    * linkId = "Chimerism/Device"
    * text = "Device"
    * definition = "http://hl7.org/fhir/StructureDefinition/Device#Device"
    * item[+]
      * linkId = "Chimerism/Device-designNote"
      * type = #display
      * text = "e.g. \"Test performed using Promega GenePrint 24 kit.\" No local code (NTE, unstructured) - candidate mapping only, referenced from DiagnosticReport or Observation.device."
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
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#STR
      * text = "Average % Chimerism"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity"

// OBX|IM - Informative Markers

    * item[+]
      * type = #string
      * linkId = "Chimerism/InformativeMarkers"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#IM
      * text = "Informative Markers"
      * definition = "http://hl7.org/fhir/StructureDefinition/MolecularSequence#MolecularSequence"
      * item[+]
        * linkId = "Chimerism/InformativeMarkers-designNote"
        * type = #display
        * text = "e.g. \"D13S317 PENTA E CSF1PO PENTA D D21S11 D8S1179 D12S391\" - the STR loci examined. Candidate mapping: the same role a Haplotype Observation's MolecularSequence evidence plays for HLA alleles, but for STR loci."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|RANGE - Range

    * item[+]
      * type = #string
      * linkId = "Chimerism/Range"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#RANGE
      * text = "Range"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.referenceRange"

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
        * text = "Coefficient of variation - a QC metric, not profiled by the Histocompatibility Reporting page."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "Specimen"
    * text = "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"

// NTE - Extraction Method

    * item[+]
      * type = #string
      * linkId = "Chimerism/ExtractionMethod"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#EXT
      * text = "Extraction Method"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.method"
      * item[+]
        * linkId = "Chimerism/ExtractionMethod-designNote"
        * type = #display
        * text = "e.g. \"DNA extracted from peripheral blood leukocyte\" - the same field dWGS's dna_extraction_protocol uses, see dWGS field mapping."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|PURE - % Purity

    * item[+]
      * type = #decimal
      * linkId = "Chimerism/Purity"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#PURE
      * text = "% Purity"
      * item[+]
        * linkId = "Chimerism/Purity-designNote"
        * type = #display
        * text = "Specimen quality metric - not profiled by the Histocompatibility Reporting page. No definition mapping - low confidence, free text/number only."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #group
    * linkId = "ClinicalContext"
    * text = "Clinical Context"

// OBX|POST - Time post transplant

    * item[+]
      * type = #string
      * linkId = "Chimerism/TimePostTransplant"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#POST
      * text = "Time Post Transplant"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
      * item[+]
        * linkId = "Chimerism/TimePostTransplant-designNote"
        * type = #display
        * text = "e.g. \"2YR 7 MONTHS\" - carried as an Observation referenced from ServiceRequest.supportingInfo, the same Ask at Order Entry pattern used elsewhere in this IG (dWGS's Family Structure/Participant Type)."
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
        * text = "The transplant event itself - outside the Histocompatibility Reporting page's scope, which starts from the genotyping result, not the clinical transplant history."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// OBX|DID - Donor ID

    * item[+]
      * type = #string
      * linkId = "Chimerism/DonorID"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Chimerism#DID
      * text = "Donor ID"
      * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
      * item[+]
        * linkId = "Chimerism/DonorID-designNote"
        * type = #display
        * text = "e.g. \"6939 DKM0 0096 2141 100\" - the same identifier-on-Specimen pattern dWGS uses for its PLAC/FILL identifiers; could alternatively be a reference to the donor's own Patient resource."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
