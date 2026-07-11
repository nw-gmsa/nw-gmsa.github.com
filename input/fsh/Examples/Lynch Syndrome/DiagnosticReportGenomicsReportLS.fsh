Instance: DiagnosticReportGenomicsReportLS
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example."
Description: "Ned Liverpool Lynch Syndrome"

* meta.versionId = "1.0"

* extension[DiagnosticReportCompositionR5].valueReference.reference = "urn:uuid:c55a7dc6-9b29-4cd6-ab8f-9aea594aabde"

* identifier[ReportIdentifier]
  * value = "98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* basedOn[OrderIdentifier]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "66717"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
//  * extension[ExtCodeableReference].valueCodeableConcept.coding = $GTD#R240.1

* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* code.coding[+] = $GTD#R240.1
//* code.coding[+] = $sct#4241000179101 "Laboratory report"
* code.coding[+] = $sct#1054161000000101 "Genetic report"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

* encounter.identifier
  * value = "66717"
  * system = "http://www.acme.org/encounter/identifiers/RBS"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBS"

* effectiveDateTime = "2023-09-07T11:45:41+00:00"

* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"

//* performer[+]
//  * type = "Practitioner"
//  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
//  * identifier.value = "C1234567"
//  * display = "FICTITIOUS, Ralph"
//  * extension[performerFunction].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#SPRF

* resultsInterpreter[author]
  * type = "PractitionerRole"
  * reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"

* conclusion = "Normal - no action"

* result[+].reference = "urn:uuid:6beb613f-d303-42af-b025-86e8e0872061"
* result[+].reference = "urn:uuid:0878c5de-c22f-4e31-841a-a82ad31c93aa"
* result[+].reference = "urn:uuid:8385c2fd-313d-4fd5-b98e-d5ea4bae6f99"
* result[+].reference = "urn:uuid:4490c092-c78c-480a-8cb7-653b70113fd5"
