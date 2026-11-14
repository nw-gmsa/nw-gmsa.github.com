// OMICS DSS test results (LTW LAB-5) from DLIMS (Automation Manager, Lab 2) to iGene (Order Filler, Lab 1), both run by NW GLH (699X0).
// Results for the iGene work order ServiceRequest-ctDNA-DLIMS-WorkOrder (T26-59XG), produced by OmicsDSS (Observation.device).
// The RIE routes the message to iGene and sends a copy to the FHIR Repository using $process-message.
// Fictitious example: identifiers and variant values are illustrative only.

Instance: variant-egfr-omicsdss
InstanceOf: Variant
Title: "Variant - ctDNA EGFR T790M (OmicsDSS test result)"
Description: "Fictitious example: EGFR sequence variant produced by OmicsDSS and returned to iGene for work order T26-59XG (LTW LAB-5)"
Usage: #example

* identifier[+].value = "eb1f8ec5-f9ff-4472-97f9-77999460b8c8"

* basedOn[+]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.value = "T26-59XG"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* status = #preliminary

* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* category[labCategory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

* effectiveDateTime = "2026-07-06T11:20:00+00:00"

// The NW GLH scientist responsible for the analysis; the system that produced the result is in device
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"

* device
  * type = "Device"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system"
  * identifier.value = "OmicsDSS"
  * display = "Omics DSS"

* specimen.reference = "urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5"

* valueCodeableConcept = $loinc#LA9633-4 "Present"

* method = $loinc#LA26398-0 "Sequencing"

* component[0].code = $loinc#83005-9 "Variant category"
* component[=].valueCodeableConcept = IGeneVariantCategory#SEQV "Sequence Variant"

* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:3236 "EGFR"

* component[+].code = $loinc#48002-0 "Genomic source class [Type]"
* component[=].valueCodeableConcept = $loinc#LA6684-0 "Somatic"

* component[+].code = $loinc#51958-7 "Transcript reference sequence [ID]"
* component[=].valueCodeableConcept = $refseq#NM_005228.5

* component[+].code = $loinc#48004-6 "DNA change (c.HGVS)"
* component[=].valueCodeableConcept = $ghgvs#NM_005228.5:c.2369C>T

* component[+].code = $loinc#48005-3 "Amino acid change (pHGVS)"
* component[=].valueCodeableConcept = $ghgvs#"p.(Thr790Met)"

* component[+].code = $loinc#48019-4 "DNA change type"
* component[=].valueCodeableConcept = http://www.sequenceontology.org#SO:1000002 "substitution"

* component[+].code = $loinc#81258-6 "Sample variant allelic frequency [NFr]"
* component[=].valueQuantity.value = 0.0042
* component[=].valueQuantity.unit = "decimal"
* component[=].valueQuantity.system = $ucum


Instance: DiagnosticReport-ctDNA-OmicsDSS-TestResults
InstanceOf: TestResults
Title: "Diagnostic Report - ctDNA OmicsDSS test results"
Description: "Fictitious example: OmicsDSS test results for iGene work order T26-59XG, returned to iGene by DLIMS (LTW LAB-5). Clinical validation and the Laboratory Report are done by iGene (the Order Filler)."
Usage: #example

* identifier[ReportIdentifier]
  * value = "DSS26-000873"
  * system = "https://fhir.nwgenomics.nhs.uk/OmicsDSS/ResultIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.value = "T26-59XG"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* status = #preliminary
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code.coding[+] = $GTD#M4.14
* code.coding[+] = $sct#1054161000000101 "Genetic report"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* effectiveDateTime = "2026-07-06T11:20:00+00:00"

* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5"

* result[+].reference = "urn:uuid:eb1f8ec5-f9ff-4472-97f9-77999460b8c8"


Instance: MessageHeaderR01ctDNAOmicsDSS
InstanceOf: MessageHeader
Title: "Message Header - ctDNA OmicsDSS Test Results R01"
Description: "Fictitious example: LAB-5 test results message from DLIMS (with OmicsDSS) to iGene"
Usage: #example

* meta.lastUpdated = "2026-07-06T11:21:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R01

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NW GLH"
* destination.name = "iGene"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"

* source.name = "DLIMS"
* source.software = "DLIMS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/DLIMS"

* focus[+]
  * reference = "urn:uuid:38be35e1-1df1-40fb-a055-c012dada778f"
  * type = #DiagnosticReport


Instance: TestResultsMessage-ctDNA-OmicsDSS
InstanceOf: BundleMessage
Title: "Bundle 'Message' - ctDNA OmicsDSS Test Results R01 (LAB-5, DLIMS to iGene)"
Description: "Fictitious example: DLIMS returns OmicsDSS test results to iGene for work order T26-59XG (LTW LAB-5)"
Usage: #example
* insert MessageBundle("urn:uuid:a064cfd3-9c89-4213-861b-3966cb2dc77a", "2026-07-06T11:21:00+00:00")
* insert EntryDocument("urn:uuid:06843352-994e-4cc0-91f7-4fcf550c37f5", MessageHeaderR01ctDNAOmicsDSS)
* insert EntryDocument("urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c", Patient-Sheffield)
* insert EntryDocument("urn:uuid:38be35e1-1df1-40fb-a055-c012dada778f", DiagnosticReport-ctDNA-OmicsDSS-TestResults)
* insert EntryDocument("urn:uuid:eb1f8ec5-f9ff-4472-97f9-77999460b8c8", variant-egfr-omicsdss)
* insert EntryDocument("urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5", Specimen-ctDNA)
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
