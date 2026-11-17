// BCR-ABL1 test results (LTW LAB-5) from the Cepheid GeneXpert (Automation Manager) to iGene (Order Filler), both NW GLH (699X0).
// Converted from the HL7 v2 ORU^R32 https://github.com/nw-gmsa/Testing/blob/main/Input/ASTM/R32/cepheid-1.txt
// Results for the iGene work order ServiceRequest-BCRABL-Cepheid-WorkOrder (T26-61BC).
// Fictitious example: identifiers are illustrative only.

Instance: DiagnosticReport-BCRABL-Cepheid-TestResults
InstanceOf: TestResults
Title: "Diagnostic Report - BCR-ABL1 Cepheid GeneXpert test results"
Description: "Fictitious example: Cepheid GeneXpert test results for iGene work order T26-61BC (LTW LAB-5, HL7 v2 ORU^R32). Clinical validation and the Laboratory Report are done by iGene (the Order Filler)."
Usage: #example

* identifier[ReportIdentifier]
  * value = "GXM-31622127072"
  * system = "https://fhir.nwgenomics.nhs.uk/Cepheid/ResultIdentifier"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.value = "T26-61BC"
  * identifier.system = "https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"

* status = #preliminary
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code.coding[+] = $GTD#M84.2
* code.coding[+] = https://fhir.nwgenomics.nhs.uk/CodeSystem/Cepheid#BCR

* subject.reference = "urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71"
* subject.display = "Sansa MANCHESTER"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383192"

// TQ1-7 start / TQ1-8 end of the run
* effectivePeriod.start = "2026-07-13T10:17:08+00:00"
* effectivePeriod.end = "2026-07-13T10:37:26+00:00"

* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22"

* result[+].reference = "urn:uuid:679dd305-7ea2-481d-af8b-68957eac427c"


Instance: MessageHeader-R32-BCRABL
InstanceOf: MessageHeader
Title: "Message Header - BCR-ABL1 Test Results R32"
Description: "Fictitious example: LAB-5 test results message from the Cepheid GeneXpert to iGene"
Usage: #example

* meta.lastUpdated = "2026-07-13T10:38:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#R32

* sender.identifier.system = $ods-code
* sender.identifier.value = "699X0"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NW GLH"
* destination.name = "iGene"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/iGene"

// MSH-3 Sending Application
* source.name = "GeneXpert PC"
* source.software = "GeneXpert"
* source.version = "6.5a.8"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/Cepheid"

* focus[+]
  * reference = "urn:uuid:5d1c9b4e-8f2a-4e37-b0a6-2c7e9d3f4a18"
  * type = #DiagnosticReport


Instance: TestResultsMessage-BCRABL-Cepheid
InstanceOf: BundleMessage
Title: "Bundle 'Message' - BCR-ABL1 Test Results R32 (LAB-5, Cepheid GeneXpert to iGene)"
Description: "Fictitious example: the Cepheid GeneXpert returns BCR-ABL1 test results to iGene for work order T26-61BC (LTW LAB-5), converted from the HL7 v2 ORU^R32"
Usage: #example
* insert MessageBundle("urn:uuid:9c3e7a41-2b6d-4f85-a1c9-7e5d0b8f2c63", "2026-07-13T10:38:00+00:00")
* insert EntryDocument("urn:uuid:3e8f1a2c-7b4d-4c96-8e5a-1d2f3b4c5d6e", MessageHeader-R32-BCRABL)
* insert EntryDocument("urn:uuid:4a0d3d55-6a1b-4f8e-9c55-3f1f2b6c0a71", Patient-Manchester)
* insert EntryDocument("urn:uuid:5d1c9b4e-8f2a-4e37-b0a6-2c7e9d3f4a18", DiagnosticReport-BCRABL-Cepheid-TestResults)
* insert EntryDocument("urn:uuid:679dd305-7ea2-481d-af8b-68957eac427c", BCRABL)
* insert EntryDocument("urn:uuid:0b6f3c7e-2d4a-4a63-9a8e-6c0f7d1e5b22", Specimen-BCRABL)
* insert EntryDocument("urn:uuid:7a2b4c6d-8e0f-4a1b-9c3d-5e7f9a1b3c5d", Device-Cepheid)
