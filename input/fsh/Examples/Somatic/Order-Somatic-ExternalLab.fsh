// Order for the Somatic, with a result from another laboratory FHIR Document example, from The Christie NHS Foundation Trust to NW GLH.
// The OML^O21 is shown as a FHIR Message; the ServiceRequest and Specimen are also in the report document.
// Fictitious example: requester, identifiers and dates are illustrative only.

Instance: ServiceRequest-Somatic-ExternalLab
InstanceOf: ServiceRequest
Title: "ServiceRequest - M4.1 Non-Small Cell Lung Cancer resistance testing"
Description: "Fictitious example: oncology request for a multi-target NGS panel on a new lung biopsy, after progression on alectinib"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest"
* identifier[OrderPlacerNumber].value = "71455"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-10-05"

* code = $test-directory#M4.1

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:547e7b64-63b0-4a6c-b3fc-c832cf9fc5c5"
  * identifier.system = $ods-code
  * identifier.value = "RBV"

* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383249"

* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:d22cfe12-7f10-41b1-ad44-c4accb626f52"

* reasonCode[+] = $GCC#M4 "Non-Small Cell Lung Cancer"

* note[+].text = "ALK-positive lung adenocarcinoma, diagnosed in Germany in 2025 (EML4-ALK fusion), now progressing on alectinib. Testing for resistance mechanisms."


Instance: Specimen-Somatic-ExternalLab
InstanceOf: Specimen
Title: "Specimen - FFPE lung biopsy (Tommen Birmingham)"
Description: "Fictitious example: FFPE lung biopsy (Tommen Birmingham)"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RBV26-H10198"
  * system = "http://www.acme.org/specimen/RBV"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBV"

* status = #available

* subject.reference = "urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c"
* subject.display = "Tommen BIRMINGHAM"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383249"

* type = $sct#441652008 "Formalin-fixed paraffin-embedded tissue specimen"
* type.text = "FFPE lung biopsy"
* collection.collectedDateTime = "2026-10-05T10:00:00+00:00"
* collection.bodySite = $sct#39607008 "Lung structure"
* receivedTime = "2026-10-06T09:00:00+00:00"
* note[+].text = "Estimated tumour content 50%."


Instance: MessageHeader-O21-Somatic-ExternalLab
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order M4.1 Non-Small Cell Lung Cancer resistance testing O21"
Description: "Fictitious example: order from THE CHRISTIE NHS FOUNDATION TRUST to NW GLH"
Usage: #example

* meta.lastUpdated = "2026-10-05T16:00:00+00:00"

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
  * reference = "urn:uuid:ee2e9cd7-bcc3-4e0d-b6a9-dab5e4ee3fdb"
  * type = #ServiceRequest


Instance: GenomicsOrderMessage-Somatic-ExternalLab
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomics Order M4.1 Non-Small Cell Lung Cancer resistance testing O21"
Description: "Fictitious example: the order (HL7 v2 OML^O21 as a FHIR Message) for the [Somatic, with a result from another laboratory](Bundle-FHIRDocumentGeneticReportBundle-Somatic-ExternalLab.html) FHIR Document example. The same ServiceRequest and Specimen are in the report."
Usage: #example
* insert MessageBundle("urn:uuid:3ab74805-6411-444c-a3de-ffb26c2fc7e2", "2026-10-05T16:00:00+00:00")
* insert EntryDocument("urn:uuid:e9f84167-d0c6-4f9e-a03e-93250b5474b4", MessageHeader-O21-Somatic-ExternalLab)
* insert EntryDocument("urn:uuid:2ad4e236-0bf0-4a42-a83b-173a6b0dc14c", Patient-Birmingham)
* insert EntryDocument("urn:uuid:ee2e9cd7-bcc3-4e0d-b6a9-dab5e4ee3fdb", ServiceRequest-Somatic-ExternalLab)
// Requester PractitionerRole
* insert EntryDocument("urn:uuid:547e7b64-63b0-4a6c-b3fc-c832cf9fc5c5", PractitionerRole-Requester-Oncology-RBV)
* insert EntryDocument("urn:uuid:d22cfe12-7f10-41b1-ad44-c4accb626f52", Specimen-Somatic-ExternalLab)
