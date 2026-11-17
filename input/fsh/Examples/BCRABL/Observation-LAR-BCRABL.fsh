Instance: BCRABL
InstanceOf: LaboratoryAnalyteResult
Title: "Laboratory Analyte Result - BCRABL"
Description: "BCR-ABL1 fusion transcript ratio (International Scale) laboratory analyte result, with the Cepheid assay results as components. Converted from the Cepheid GeneXpert HL7 v2 ORU^R32 (OBX-1 to OBX-9), the test result for iGene work order T26-61BC (LTW LAB-5)"
Usage: #example

* identifier[+].value = "679dd305-7ea2-481d-af8b-68957eac427c"

// The iGene work order (OBR-2 Placer Order Number)
* basedOn[+]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.value = "T26-61BC"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

// OBX-11 F, but a LAB-5 test result is preliminary until iGene (the Order Filler) validates it
* status = #preliminary

* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Sansa MANCHESTER"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383192"

* specimen.reference = "urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22"

* effectiveDateTime = "2026-07-13T10:37:26+00:00"

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
//* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code
  * coding[+]
    * code = #BCR
    * system = "https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid"
  * coding[+]
    * code = #69380-4
    * system = $loinc
    * display = "t(9;22)(q34.1;q11)(ABL1,BCR) b2a2+b3a2 fusion transcript/control transcript (International Scale) [# Ratio] in Blood or Tissue by Molecular genetics method"


// The Cepheid GeneXpert that produced the result, by identifier (see Device/Cepheid)
* device
  * type = "Device"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * identifier.value = "Cepheid"
  * display = "Cepheid GeneXpert"

// OBX-5 (OBX-1): above the upper limit of quantification, so there is no numeric ratio
* valueString = "POSITIVE [Above upper LoQ]"

* referenceRange[+].text = "0.0030 to 55.00"

* component[0].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR-ABL&
* component[=].valueString = "POS"

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR-ABL&Ct
* component[=].valueQuantity.value = 9.8

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR-ABL&EndPt
* component[=].valueQuantity.value = 718.0

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#"BCR-ABL&Delta Ct"
* component[=].valueQuantity.value = -0.7

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#ABL
* component[=].valueString = "PASS"

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#ABL&Ct
* component[=].valueQuantity.value = 9.2

* component[+].code = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#ABL&EndPt
* component[=].valueQuantity.value = 411.0
