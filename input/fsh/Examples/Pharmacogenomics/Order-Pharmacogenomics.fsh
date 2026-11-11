// Order for the Pharmacogenomics FHIR Document example, from Liverpool Heart and Chest Hospital NHS Foundation Trust to NW GLH.
// The OML^O21 is shown as a FHIR Message; the ServiceRequest and Specimen are also in the report document.
// Fictitious example: requester, identifiers and dates are illustrative only.

Instance: PractitionerRole-Requester-Cardiology-RBQ
InstanceOf: PractitionerRole
Title: "PractitionerRole - requesting cardiologist (Liverpool Heart and Chest)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C2345671"
* practitioner.display = "FICTITIOUS, Hester"

* organization.identifier.system = $ods-code
* organization.identifier.value = "RBQ"
* organization.display = "LIVERPOOL HEART AND CHEST HOSPITAL NHS FOUNDATION TRUST"

* specialty[+]
  * coding[+]
    * system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode"
    * code = #320

Instance: ServiceRequest-Pharmacogenomics
InstanceOf: ServiceRequest
Title: "ServiceRequest - R454.1 CYP2C19 genotyping before mavacamten"
Description: "Fictitious example: cardiology request for CYP2C19 genotyping before starting mavacamten"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest"
* identifier[OrderPlacerNumber].value = "71388"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-10-26"

* code = $test-directory#R454.1

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:354876d4-435a-413f-817d-eb6440b0a4ef"
  * identifier.system = $ods-code
  * identifier.value = "RBQ"

* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"

* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4"

* reasonCode[+] = $GCC#R454 "Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy"

* note[+].text = "Symptomatic obstructive hypertrophic cardiomyopathy. CYP2C19 genotyping before starting mavacamten."


Instance: Specimen-Pharmacogenomics
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) for CYP2C19 genotyping"
Description: "Fictitious example: peripheral blood (EDTA) for CYP2C19 genotyping"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RBQ26-004417"
  * system = "http://www.acme.org/specimen/RBQ"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RBQ"

* status = #available

* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"

* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* collection.collectedDateTime = "2026-10-27T10:15:00+00:00"
* receivedTime = "2026-10-28T09:00:00+00:00"


Instance: MessageHeader-O21-Pharmacogenomics
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order R454.1 CYP2C19 genotyping before mavacamten O21"
Description: "Fictitious example: order from LIVERPOOL HEART AND CHEST HOSPITAL NHS FOUNDATION TRUST to NW GLH"
Usage: #example

* meta.lastUpdated = "2026-10-26T14:00:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "RBQ"
* sender.display = "LIVERPOOL HEART AND CHEST HOSPITAL NHS FOUNDATION TRUST"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RBQ"
* source.software = "LHCH EPR"

* focus[+]
  * reference = "urn:uuid:a3ef9f92-1896-4174-8523-659726543fb4"
  * type = #ServiceRequest


Instance: GenomicsOrderMessage-Pharmacogenomics
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomics Order R454.1 CYP2C19 genotyping before mavacamten O21"
Description: "Fictitious example: the order (HL7 v2 OML^O21 as a FHIR Message) for the [Pharmacogenomics](Bundle-FHIRDocumentGeneticReportBundle-Pharmacogenomics.html) FHIR Document example. The same ServiceRequest and Specimen are in the report."
Usage: #example
* insert MessageBundle("urn:uuid:7308629e-36d9-4b16-87c8-a46625c1891e", "2026-10-26T14:00:00+00:00")
* insert EntryDocument("urn:uuid:aa5c222d-4042-45cb-947c-5aabdb643fd4", MessageHeader-O21-Pharmacogenomics)
* insert EntryDocument("urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a", Patient-Northwich)
* insert EntryDocument("urn:uuid:a3ef9f92-1896-4174-8523-659726543fb4", ServiceRequest-Pharmacogenomics)
// Requester PractitionerRole
* insert EntryDocument("urn:uuid:354876d4-435a-413f-817d-eb6440b0a4ef", PractitionerRole-Requester-Cardiology-RBQ)
* insert EntryDocument("urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4", Specimen-Pharmacogenomics)
