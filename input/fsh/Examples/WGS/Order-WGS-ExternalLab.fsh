// Order for the Whole Genome Sequencing, with a result from another laboratory FHIR Document example, from Northern Care Alliance NHS Foundation Trust to NW GLH.
// The OML^O21 is shown as a FHIR Message; the ServiceRequest and Specimen are also in the report document.
// Fictitious example: requester, identifiers and dates are illustrative only.

Instance: PractitionerRole-Requester-Neurology-RM3
InstanceOf: PractitionerRole
Title: "PractitionerRole - requesting neurologist (Northern Care Alliance)"
Description: "Fictitious example: requesting clinician"
Usage: #example

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C4567123"
* practitioner.display = "FICTITIOUS, Owen"

* organization.identifier.system = $ods-code
* organization.identifier.value = "RM3"
* organization.display = "NORTHERN CARE ALLIANCE NHS FOUNDATION TRUST"

* specialty[+]
  * coding[+]
    * system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode"
    * code = #400

Instance: ServiceRequest-WGS-ExternalLab
InstanceOf: ServiceRequest
Title: "ServiceRequest - R54.3 Hereditary ataxia with onset in adulthood (WGS)"
Description: "Fictitious example: neurology request for whole genome sequencing for adult-onset ataxia"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].system = "http://www.acme.org/servicerequest"
* identifier[OrderPlacerNumber].value = "71502"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* authoredOn = "2026-08-11"

* code = $test-directory#R54.3

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:0a9b29d6-b81b-4747-9045-2aca50e861d7"
  * identifier.system = $ods-code
  * identifier.value = "RM3"

* subject.reference = "urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f"
* subject.display = "Robert BLACKBURN"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383370"

* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * display = "NW GLH"

* specimen[+].reference = "urn:uuid:3767ac32-ead0-4d95-9793-1a4559822666"

* reasonCode[+] = $GCC#R54 "Hereditary ataxia with onset in adulthood"

* note[+].text = "Progressive cerebellar ataxia from age 55, no family history. Repeat expansion testing (another laboratory, 2024) normal."


Instance: Specimen-WGS-ExternalLab
InstanceOf: Specimen
Title: "Specimen - peripheral blood (EDTA) for WGS (Robert Blackburn)"
Description: "Fictitious example: peripheral blood (EDTA) for WGS (Robert Blackburn)"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "RM326-0081123"
  * system = "http://www.acme.org/specimen/RM3"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RM3"

* status = #available

* subject.reference = "urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f"
* subject.display = "Robert BLACKBURN"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383370"

* type = $sct#258580003 "Whole blood specimen"
* type.text = "Peripheral blood (EDTA)"
* collection.collectedDateTime = "2026-08-12T10:00:00+00:00"
* receivedTime = "2026-08-13T09:00:00+00:00"


Instance: MessageHeader-O21-WGS-ExternalLab
InstanceOf: MessageHeader
Title: "Message Header - Genomic Order R54.3 Hereditary ataxia with onset in adulthood (WGS) O21"
Description: "Fictitious example: order from NORTHERN CARE ALLIANCE NHS FOUNDATION TRUST to NW GLH"
Usage: #example

* meta.lastUpdated = "2026-08-11T11:30:00+00:00"

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#O21

* sender.identifier.system = $ods-code
* sender.identifier.value = "RM3"
* sender.display = "NORTHERN CARE ALLIANCE NHS FOUNDATION TRUST"

* destination.receiver.identifier.system = $ods-code
* destination.receiver.identifier.value = "699X0"
* destination.receiver.display = "NORTH WEST GLH"
* destination.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RIE"

* source.endpoint = "https://fhir.nwgenomics.nhs.uk/Endpoint/RM3"
* source.software = "NCA EPR"

* focus[+]
  * reference = "urn:uuid:d975fa86-c754-48e6-935b-d2aa1e822ba9"
  * type = #ServiceRequest


Instance: GenomicsOrderMessage-WGS-ExternalLab
InstanceOf: BundleMessage
Title: "Bundle 'Message' - Genomics Order R54.3 Hereditary ataxia with onset in adulthood (WGS) O21"
Description: "Fictitious example: the order (HL7 v2 OML^O21 as a FHIR Message) for the [Whole Genome Sequencing, with a result from another laboratory](Bundle-FHIRDocumentGeneticReportBundle-WGS-ExternalLab.html) FHIR Document example. The same ServiceRequest and Specimen are in the report."
Usage: #example
* insert MessageBundle("urn:uuid:ff9138e1-061c-465d-9aa9-d704aeab68e0", "2026-08-11T11:30:00+00:00")
* insert EntryDocument("urn:uuid:93097ec6-eb09-42d5-8871-1df840c35992", MessageHeader-O21-WGS-ExternalLab)
* insert EntryDocument("urn:uuid:d9dc03c1-b90b-4474-85a8-fb7e7717c24f", Patient-Blackburn)
* insert EntryDocument("urn:uuid:d975fa86-c754-48e6-935b-d2aa1e822ba9", ServiceRequest-WGS-ExternalLab)
// Requester PractitionerRole
* insert EntryDocument("urn:uuid:0a9b29d6-b81b-4747-9045-2aca50e861d7", PractitionerRole-Requester-Neurology-RM3)
* insert EntryDocument("urn:uuid:3767ac32-ead0-4d95-9793-1a4559822666", Specimen-WGS-ExternalLab)
