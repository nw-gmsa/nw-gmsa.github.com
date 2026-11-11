// Order for the Lynch syndrome FHIR Document example, from Manchester University NHS Foundation Trust to NW GLH.
// The OML^O21 is shown as a FHIR Message; the ServiceRequest and Specimen are also in the report document.
// Fictitious example: requester, identifiers and dates are illustrative only.

Instance: ServiceRequest-LynchSyndrome
InstanceOf: ServiceRequest
Title: "ServiceRequest - R210.2 Inherited MMR deficiency (Lynch syndrome)"
Description: "Fictitious example: request for Lynch syndrome germline testing after tumour MMR immunohistochemistry showed loss of MLH1 and PMS2"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest"
* identifier[OrderPlacerNumber].value = "66717"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2023-09-05"

* code = $test-directory#R210.2

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"
  * identifier.system = $ods-code
  * identifier.value = "R0A"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:635eaecb-a9c9-488e-978b-f63b12ce52b1"

* reasonCode[+] = $GCC#R210 "Inherited MMR deficiency (Lynch syndrome)"
* reasonReference[+].reference = "urn:uuid:d6c19529-a64e-476b-b896-303abec26a79"

* note[+].text = "History of carcinoma. Tumour MMR immunohistochemistry: loss of MLH1 and PMS2, no MLH1 promoter hypermethylation."


Instance: Specimen-LynchSyndrome
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) for Lynch syndrome testing"
Description: "Fictitious example: peripheral blood (EDTA) for Lynch syndrome testing"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "23GEN-029GN00417"
  * system = "http://www.acme.org/specimen/R0A"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* status = #available

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* receivedTime = "2023-09-08T09:00:00+00:00"


Instance: MessageHeader-O21-LynchSyndrome
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order R210.2 Inherited MMR deficiency (Lynch syndrome) O21"
Description: "Fictitious example: order from MANCHESTER UNIVERSITY NHS FOUNDATION TRUST to NW GLH"
Usage: #example

* meta.lastUpdated = "2023-09-05T10:00:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.software = "MFT Epic"

* focus[+]
  * reference = "urn:uuid:c0627dab-6f98-4846-beba-d9412ed3a60e"
  * type = #ServiceRequest


Instance: GenomicsOrderMessage-LynchSyndrome
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomics Order R210.2 Inherited MMR deficiency (Lynch syndrome) O21"
Description: "Fictitious example: the order (HL7 v2 OML^O21 as a FHIR Message) for the [Lynch syndrome](Bundle-FHIRDocumentGeneticReportBundle2.html) FHIR Document example. The same ServiceRequest and Specimen are in the report."
Usage: #example
* insert MessageBundle("urn:uuid:f15a8a15-83ce-4dcb-ba70-76360e6ba62a", "2023-09-05T10:00:00+00:00")
* insert EntryDocument("urn:uuid:1b13c2ee-b8af-4bbd-81ed-2bd69cff0f0d", MessageHeader-O21-LynchSyndrome)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:c0627dab-6f98-4846-beba-d9412ed3a60e", ServiceRequest-LynchSyndrome)
// Requester PractitionerRole
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
* insert EntryDocument("urn:uuid:635eaecb-a9c9-488e-978b-f63b12ce52b1", Specimen-LynchSyndrome)
// Reason for referral (Condition)
* insert EntryDocument("urn:uuid:d6c19529-a64e-476b-b896-303abec26a79", d6c19529-a64e-476b-b896-303abec26a79)
