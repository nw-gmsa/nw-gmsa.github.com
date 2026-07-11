Profile:        BundleDocument
Parent:         Bundle
//Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Bundle-eu-lab
Id:             BundleDocument
Title:          "Bundle - FHIR Document"
Description:    "[FHIR Document](https://hl7.org/fhir/R4/documents.html)"

* identifier ^short = "Business identifier for this Laboratory Report"
* identifier 1..
* type = #document
* timestamp 1..
* total ..0
* link ..0
* entry 1..
  * link ..0
  * fullUrl 1..1
  * resource 1..
  * search ..0
  * request ..0
  * response ..0
* signature ^short = "Digital Signature of this report"

* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open

* entry contains composition 1..1
* entry[composition].resource only Composition

* entry contains diagnosticReport 1..1
* entry[diagnosticReport].resource only DiagnosticReport

* entry contains patient 0..*
* entry[patient].resource only Patient // or PatientEuCore or PatientAnimalEuCore changed based on https://jira.hl7.org/browse/FHIR-56181

* entry contains observation 0..*
* entry[observation].resource only Observation // not only LaboratoryObservation as this might be needed for ServiceRequest.supportingInformation

* entry contains specimen 0..*
* entry[specimen].resource only Specimen

* entry contains serviceRequest 0..*
* entry[serviceRequest].resource only ServiceRequest

* entry contains organization 0..*
* entry[organization].resource only Organization

* entry contains practitioner 0..*
* entry[practitioner].resource only Practitioner

* entry contains practitionerRole 0..*
* entry[practitionerRole].resource only PractitionerRole


* entry contains encounter 0..*
* entry[encounter].resource only Encounter
