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
* reasonCode[+] = $sct#109841003 "Liver cell carcinoma"

// A copy of the pathology report (tumour MMR immunohistochemistry) as clinical context
* supportingInfo[clinicalContext]
  * reference = "urn:uuid:5bbcf981-f3bc-4f17-ad6b-330ce6aedbf0"
  * type = "DocumentReference"
  * display = "Cellular pathology report - tumour MMR immunohistochemistry"

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
// Copy of the pathology report (ServiceRequest.supportingInfo)
* insert EntryDocument("urn:uuid:5bbcf981-f3bc-4f17-ad6b-330ce6aedbf0", DocumentReference-LynchSyndrome-PathologyReport)
* insert EntryDocument("urn:uuid:7ef49da9-f398-496a-befe-37ec391d9bf7", Binary-Sample)

Instance: DocumentReference-LynchSyndrome-PathologyReport
InstanceOf: DocumentReference
Title: "Document Reference - Cellular pathology report (tumour MMR immunohistochemistry), Ned Liverpool"
Description: "Fictitious example: a copy of Histopathology's report on the tumour mismatch repair immunohistochemistry, as a PDF, sent with the Lynch syndrome Laboratory Order as clinical context (ServiceRequest.supportingInfo)"
Usage: #example

* identifier[+]
  * system = "http://www.acme.org/documentreference/identifier/R0A"
  * value = "H23-41022"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* status = #current
* date = "2023-08-21T09:00:00+00:00"
* type = $sct#1054291000000102 "Cellular pathology report"
* author[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "Histopathology, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* content[+]
  * attachment.contentType = #application/pdf
  * attachment.url = "urn:uuid:7ef49da9-f398-496a-befe-37ec391d9bf7"
  * attachment.title = "Cellular pathology report - Ned LIVERPOOL"
* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

// Referral to clinical genetics (O19): cascade testing of the family

Instance: Group-LynchSyndrome-Family-Liverpool
InstanceOf: FamilyGeneticGroup
Title: "Family Genetic Group - Liverpool family (Duo)"
Description: "Fictitious example: Ned Liverpool (proband) and his son Rob Leeds, the subject of the referral to clinical genetics for cascade testing"
Usage: #example

* identifier[PedigreeNumber]
  * type = $v2-0203#PGN
  * system = "https://fhir.nhs.uk/Id/genomics-pedigree-number"
  * value = "PED-2023-0311"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* type = #person
* actual = true
* code = $nwgmsa#FamilyStructureDuo "Duo"
* name = "Liverpool family"
* quantity = 2
* member[+]
  * entity.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
  * entity.display = "Ned LIVERPOOL"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#ONESELF "self"
* member[+]
  * entity.reference = "urn:uuid:a9184839-c29d-4a5a-b394-594356b22796"
  * entity.display = "Rob LEEDS"
  * extension[relationship].valueCodeableConcept = $v3-RoleCode#SON "natural son"

Instance: ServiceRequest-LynchSyndrome-Referral
InstanceOf: http://hl7.org/fhir/StructureDefinition/ServiceRequest
Title: "ServiceRequest - Referral of the Liverpool family to clinical genetics (cascade testing)"
Description: "Fictitious example: after the Laboratory Report finds a pathogenic MLH1 variant, the requesting clinician refers the family to clinical genetics so other members can be tested. A clinical referral, not a laboratory order: the subject is the family, and the testing done is referenced as the Genomic Report document on the central registry."
Usage: #example

* identifier[+]
  * type = $v2-0203#PLAC
  * system = "http://www.acme.org/servicerequest/R0A"
  * value = "R0A-REF-23-0917"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"
* status = #active
* intent = #order
* priority = #routine
* code = $sct#306119003 "Referral to genetics service"
* subject
  * reference = "urn:uuid:02e60af2-7ffd-427e-870d-1b8c662fdc64"
  * type = "Group"
  * display = "Liverpool family"
* authoredOn = "2023-09-15"
* requester
  * type = "PractitionerRole"
  * reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"
  * display = "Dr Samuel Darwin"
* performer[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "MANCHESTER CENTRE FOR GENOMIC MEDICINE"
* reasonCode[+] = $GCC#R210 "Inherited MMR deficiency (Lynch syndrome)"
* supportingInfo[+]
  * type = "DocumentReference"
  * reference = "urn:uuid:7163f6f6-24f3-47ee-bb9c-c88b7591e93a"
  * display = "R210.2 Genomic Report document (central registry), Ned Liverpool"
* note[+].text = "Heterozygous pathogenic germline MLH1 variant (Lynch syndrome) found in Ned Liverpool. Please see the family for genetic counselling and cascade testing of relatives."

Instance: DocumentReference-LynchSyndrome-Registry-GenomicReport
InstanceOf: DocumentReference
Title: "Document Reference - R210.2 Genomic Report document on the central registry, Ned Liverpool"
Description: "Fictitious example: the Genomic Report document (FHIR Document) for the R210.2 testing, held on the central registry (UGR) and referenced from the referral to clinical genetics"
Usage: #example

* identifier[+]
  * type = $v2-0203#FILL
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * value = "98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* status = #current
* date = "2023-09-12T10:30:00+00:00"
* type = $sct#1054161000000101 "Genetic report"
* author[+]
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NORTH WEST GLH"
* custodian
  * type = "Organization"
  * identifier.system = $ods-code
  * identifier.value = "X26"
  * display = "NHS ENGLAND"
* context.related[DiagnosticReport]
  * type = "DiagnosticReport"
  * identifier.type = $v2-0203#FILL
  * identifier.system = "http://www.acme.org/diagnosticreport/identifiers"
  * identifier.value = "98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* context.related[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "66717"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
* context.event[+] = $test-directory#R210.2
* content[+]
  * attachment.contentType = #application/fhir+json
  * attachment.url = "https://ugr.example.nhs.uk/FHIR/R4/Bundle/98763a9b-98d4-4cfc-b760-1db086ec52a1"
  * attachment.title = "R210.2 Genomic Report - Ned LIVERPOOL"
* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383206"

Instance: MessageHeader-LynchSyndrome-Referral
InstanceOf: MessageHeader
Title: "Message Header - Referral to clinical genetics (O19), Lynch syndrome cascade testing"
Description: "Fictitious example: referral from MANCHESTER UNIVERSITY NHS FOUNDATION TRUST to the MANCHESTER CENTRE FOR GENOMIC MEDICINE, sent via NHS e-Referral Service (eRS) or a Genomics England Limited application"
Usage: #example

* meta.lastUpdated = "2023-09-15T11:00:00+00:00"
* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O19
* sender.identifier.system = $ods-code
* sender.identifier.value = "R0A"
* sender.display = "MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "R0A"
* destination.receiver.display = "MANCHESTER CENTRE FOR GENOMIC MEDICINE"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/eRS"
* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/EPIC"
* source.software = "MFT Epic"
* focus[+]
  * reference = "urn:uuid:900876c3-9e3e-42c9-9fd7-131499a6feaa"
  * type = #ServiceRequest
* definition = "https://fhir.nwgenomics.nhs.uk/MessageDefinition/referral-order"

Instance: GenomicsReferralMessage-LynchSyndrome
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Referral to clinical genetics (O19), Lynch syndrome cascade testing"
Description: "Fictitious example: the referral of the family to clinical genetics for cascade testing in the [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) scenario. The subject is the family (a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html)) and the Genomic Report document for the testing done, held on the central registry, is referenced as supporting information."
Usage: #example
* insert MessageBundle("urn:uuid:16e26d6b-ad58-4958-9ca2-23d3c601a4ce", "2023-09-15T11:00:00+00:00")
* insert EntryDocument("urn:uuid:72b799d1-8f94-42fe-918b-f0c7e690b797", MessageHeader-LynchSyndrome-Referral)
* insert EntryDocument("urn:uuid:900876c3-9e3e-42c9-9fd7-131499a6feaa", ServiceRequest-LynchSyndrome-Referral)
* insert EntryDocument("urn:uuid:02e60af2-7ffd-427e-870d-1b8c662fdc64", Group-LynchSyndrome-Family-Liverpool)
* insert EntryDocument("urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd", Patient-Liverpool)
* insert EntryDocument("urn:uuid:a9184839-c29d-4a5a-b394-594356b22796", Patient-Leeds)
* insert EntryDocument("urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8", ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8)
* insert EntryDocument("urn:uuid:7163f6f6-24f3-47ee-bb9c-c88b7591e93a", DocumentReference-LynchSyndrome-Registry-GenomicReport)
