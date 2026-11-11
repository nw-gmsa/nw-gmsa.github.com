// Order for the Somatic FHIR Document example, from The Christie NHS Foundation Trust to NW GLH.
// The OML^O21 is shown as a FHIR Message; the ServiceRequest and Specimen are also in the report document.
// Fictitious example: requester, identifiers and dates are illustrative only.

Instance: PractitionerRole-Requester-Oncology-RBV
InstanceOf: PractitionerRole
Title: "PractitionerRole - requesting oncologist (The Christie)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C3456712"
* practitioner.display = "FICTITIOUS, Imogen"

* organization.identifier.system = $ods-code
* organization.identifier.value = "RBV"
* organization.display = "THE CHRISTIE NHS FOUNDATION TRUST"

* specialty[+]
  * coding[+]
    * system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode"
    * code = #370

Instance: ServiceRequest-Somatic
InstanceOf: ServiceRequest
Title: "ServiceRequest - M4.1 Non-Small Cell Lung Cancer multi-target NGS panel"
Description: "Fictitious example: oncology request for a multi-target NGS panel on a lung biopsy, for first-line treatment selection"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest"
* identifier[OrderPlacerNumber].value = "71204"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-10-09"

* code = $test-directory#M4.1

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:547e7b64-63b0-4a6c-b3fc-c832cf9fc5c5"
  * identifier.system = $ods-code
  * identifier.value = "RBV"

* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383273"

* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:fb300032-6854-4c9e-aa21-972a2e1fcb56"

* reasonCode[+] = $GCC#M4 "Non-Small Cell Lung Cancer"

* note[+].text = "Adenocarcinoma of the lung, stage IV, for first-line treatment selection."


Instance: Specimen-Somatic
InstanceOf: Specimen
Title: "Specimen - FFPE lung biopsy (Ramsay Bolton)"
Description: "Fictitious example: FFPE lung biopsy (Ramsay Bolton)"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RBV26-H10233"
  * system = "http://www.acme.org/specimen/RBV"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBV"

* status = #available

* subject.reference = "urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7"
* subject.display = "Ramsay BOLTON"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383273"

* type = $sct#441652008 "Formalin-fixed paraffin-embedded tissue specimen"
* type.text = "FFPE lung biopsy"
* collection.collectedDateTime = "2026-10-09T11:00:00+00:00"
* collection.bodySite = $sct#39607008 "Lung structure"
* receivedTime = "2026-10-10T09:00:00+00:00"
* note[+].text = "Estimated tumour content 40%."


Instance: MessageHeader-O21-Somatic
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order M4.1 Non-Small Cell Lung Cancer multi-target NGS panel O21"
Description: "Fictitious example: order from THE CHRISTIE NHS FOUNDATION TRUST to NW GLH"
Usage: #example

* meta.lastUpdated = "2026-10-09T15:00:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "RBV"
* sender.display = "THE CHRISTIE NHS FOUNDATION TRUST"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RBV"
* source.software = "Christie EPR"

* focus[+]
  * reference = "urn:uuid:5b5d3536-7a68-4631-8c9c-dcaf79c1798b"
  * type = #ServiceRequest


Instance: GenomicsOrderMessage-Somatic
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomics Order M4.1 Non-Small Cell Lung Cancer multi-target NGS panel O21"
Description: "Fictitious example: the order (HL7 v2 OML^O21 as a FHIR Message) for the [Somatic](Bundle-FHIRDocumentGeneticReportBundle-Somatic.html) FHIR Document example. The same ServiceRequest and Specimen are in the report."
Usage: #example
* insert MessageBundle("urn:uuid:8030c7f6-ee9b-4c77-8cd6-c0d68739148a", "2026-10-09T15:00:00+00:00")
* insert EntryDocument("urn:uuid:e7e0f368-2c19-45d1-856d-f218188f3179", MessageHeader-O21-Somatic)
* insert EntryDocument("urn:uuid:9a53f1c4-c93b-4e27-a54e-176dd0aca0b7", Patient-Bolton)
* insert EntryDocument("urn:uuid:5b5d3536-7a68-4631-8c9c-dcaf79c1798b", ServiceRequest-Somatic)
// Requester PractitionerRole
* insert EntryDocument("urn:uuid:547e7b64-63b0-4a6c-b3fc-c832cf9fc5c5", PractitionerRole-Requester-Oncology-RBV)
* insert EntryDocument("urn:uuid:fb300032-6854-4c9e-aa21-972a2e1fcb56", Specimen-Somatic)
