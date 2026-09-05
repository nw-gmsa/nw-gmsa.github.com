Instance: BCRABLResultPanel
InstanceOf: NWQuestionnaire
Title: "BCR-ABL Monitoring Result Panel"
Description: """
Result panel for BCR-ABL1 monitoring (chronic myeloid leukaemia), capturing a
Cepheid-class ASTM-communicating analyser's result as a [Laboratory Analyte
Result](StructureDefinition-LaboratoryAnalyteResult.html) `Observation` - see
[BCR-ABL Monitoring](BCRABLMonitoring.html).

`item.definition` and `item.code` are inferred directly from this IG's own
example `Observation`s -
[Observation-BCRABL-Valid](Observation-BCRABL-Valid.html),
[Observation-BCRABL-Invalid](Observation-BCRABL-Invalid.html) and
`Observation-LAR-BCRABL` (`input/fsh/Examples/BCRABL/`) - not just the
[data mapping table](LaboratoryAnalyteResult.html#data-mapping): the local
`Cepheid` CodeSystem component codes below (`BCR-ABL&`, `ABL&Ct`, etc.) are the
exact codes those examples use, and the two examples together show both a
normal result and the `dataAbsentReason` shape used when a value is invalid/out
of range.
"""
Usage:  #definition

* title = "BCR-ABL Monitoring Result Panel"
* status = #active
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/BCRABLResultPanel"
* code[+] = $loinc#69380-4 "t(9;22)(q34.1;q11)(ABL1,BCR) b2a2+b3a2 fusion transcript/control transcript (International Scale) [# Ratio] in Blood or Tissue by Molecular genetics method"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "Result"
  * text = "BCR-ABL Result"
  * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation"

// NHS England Genomic Test Directory England-GenomicTestDirectory code + local Cepheid assay code, both on Observation.code

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * text = "NHS Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.subject.identifier"

  * item[+]
    * type = #string
    * linkId = "Cepheid/AssayCode"
    * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCRABL
    * text = "Analyte Code"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code"
    * item[+]
      * linkId = "Cepheid/AssayCode-designNote"
      * type = #display
      * text = "Observation.code carries two codings: the Cepheid analyte code (e.g. BCRABL) and, per Observation-BCRABL-Valid, the specific Cepheid cartridge/assay code (e.g. Xpert-BCR-ABL-Ultra-G2)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #dateTime
    * linkId = "Cepheid/TestStart"
    * text = "Test Start DateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectivePeriod.start"

  * item[+]
    * type = #dateTime
    * linkId = "Cepheid/TestEnd"
    * text = "Test End DateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectivePeriod.end"

  * item[+]
    * type = #string
    * linkId = "Cepheid/Performer"
    * text = "Performer"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.performer"
    * item[+]
      * linkId = "Cepheid/Performer-designNote"
      * type = #display
      * text = "Both examples carry two performers: the performing laboratory (Organization, ODS code) and the analyst (practitioner display text only)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #choice
    * linkId = "OBR-25"
    * code[+] = $loinc#89264-8 "Overall Interpretation of Study"
    * text = "Result Status"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.status"
    * item[+]
      * linkId = "OBR-25-designNote"
      * type = #display
      * text = "Both examples use status = final (F)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "Cepheid/ReferenceRange"
    * text = "Reference Range"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.referenceRange.text"
    * item[+]
      * linkId = "Cepheid/ReferenceRange-designNote"
      * type = #display
      * text = "Both examples use text-only \"0.0030-55.00\", not a coded low/high Quantity."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #decimal
    * linkId = "Cepheid/Value"
    * text = "Analyte Result (%IS)"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueQuantity.value"
    * item[+]
      * linkId = "Cepheid/Value-designNote"
      * type = #display
      * text = "Observation-BCRABL-Valid populates this (0.011); Observation-BCRABL-Invalid omits it entirely and populates Value Absent below instead - the two are mutually exclusive in both examples."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "Cepheid/ValueAbsent"
    * text = "Value Absent"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.dataAbsentReason.text"
    * item[+]
      * linkId = "Cepheid/ValueAbsent-designNote"
      * type = #display
      * text = "Observation-BCRABL-Invalid uses this for an out-of-range result: dataAbsentReason.text = \"POSITIVE [Above upper LoQ]\"."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

  * item[+]
    * type = #string
    * linkId = "Cepheid/DeviceIdentifier"
    * text = "Device Identifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.device.identifier"
    * item[+]
      * linkId = "Cepheid/DeviceIdentifier-designNote"
      * type = #display
      * text = "Both examples carry the full Cepheid instrument/run identifier string (e.g. \"20901225~08699~114262192~604297~700039~WinDev2006Eval\") as a single identifier value, not decomposed into its component parts."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Result Detail - Observation.component, one item per Cepheid channel actually seen in the example data

  * item[+]
    * type = #group
    * linkId = "ResultDetail"
    * text = "Result Detail"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

    * item[+]
      * type = #decimal
      * linkId = "Cepheid/MR"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"&MR"
      * text = "MR"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
      * item[+]
        * linkId = "Cepheid/MR-designNote"
        * type = #display
        * text = "Present (valueQuantity) in Observation-BCRABL-Valid; present but with no value[x] at all in Observation-BCRABL-Invalid - the component itself is still listed."
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

    * item[+]
      * type = #string
      * linkId = "Cepheid/BCR-ABL"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"BCR-ABL&"
      * text = "BCR-ABL Analyte Result"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"

    * item[+]
      * type = #decimal
      * linkId = "Cepheid/BCR-ABL-Ct"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"BCR-ABL&Ct"
      * text = "BCR-ABL Ct"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"

    * item[+]
      * type = #decimal
      * linkId = "Cepheid/BCR-ABL-EndPt"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"BCR-ABL&EndPt"
      * text = "BCR-ABL EndPt"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"

    * item[+]
      * type = #decimal
      * linkId = "Cepheid/BCR-ABL-DeltaCt"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"BCR-ABL&Delta Ct"
      * text = "BCR-ABL Target Delta Ct"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"

    * item[+]
      * type = #string
      * linkId = "Cepheid/ABL"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"ABL&"
      * text = "ABL Probe Check Result"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueString"

    * item[+]
      * type = #decimal
      * linkId = "Cepheid/ABL-Ct"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"ABL&Ct"
      * text = "ABL Ct"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"

    * item[+]
      * type = #decimal
      * linkId = "Cepheid/ABL-EndPt"
      * code[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"ABL&EndPt"
      * text = "ABL EndPt"
      * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity"
      * item[+]
        * linkId = "Cepheid/ABL-EndPt-designNote"
        * type = #display
        * text = """
        The BCRABL Result Detail table (see LaboratoryAnalyteResult.html and
        BCRABLMonitoring.html) also lists ABL_Probe_Check_Result,
        BCR-ABL_Probe_Check_Result as separate rows and a few "??"-flagged local
        codes - neither example Observation actually populates a distinct
        Probe_Check_Result component beyond ABL&/BCR-ABL&, so this Questionnaire
        only models the 8 components genuinely present in the example data.
        """
        * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
