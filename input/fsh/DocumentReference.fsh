Profile:        DocumentReference
Parent:         http://hl7.org/fhir/StructureDefinition/DocumentReference
Id:             DocumentReference
Title:          "DocumentReference"
Description:    """
`Health Document`
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* type from DocumentEntryType
* category from DocumentEntryClass

* content.attachment only NWAttachment

* context.facilityType from FacilityType
* context.practiceSetting from Specialty

* context.sourcePatientInfo.identifier only MedicalRecordNumber

* context.event ^short = "The procedure or test code associated with the Accession Number (e.g. NICIP, Genomic Test Directory, etc.)"

* context.encounter 0..1 MS
* context.encounter only Reference(Encounter)
* context.encounter.identifier only CorrelationIdentifier

* context.related 0..*
* context.related ^short = "Related resources. For laboratory and imaging reports, a reference to the DiagnosticReport"
* context.related ^definition = "Related resources. Accession Number, Order Identifier and Report Identifier are not carried here; they are held on the referenced DiagnosticReport (DiagnosticReport.specimen, DiagnosticReport.basedOn and DiagnosticReport.identifier)."

* context.related ^slicing.discriminator.type = #value
* context.related ^slicing.discriminator.path = "type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type"
* context.related ^slicing.ordered = false

* context.related contains
  DiagnosticReport 0..1 MS

* context.related[DiagnosticReport] only Reference(DiagnosticReport)
* context.related[DiagnosticReport] ^short = "The DiagnosticReport this document is a rendering of (laboratory or imaging report)"
* context.related[DiagnosticReport] ^definition = "Reference to the DiagnosticReport this document presents. Not mandatory, but highly recommended for the Document Access Provider when serving laboratory or imaging reports. Accession Number, Order Identifier and Report Identifier are available from the referenced DiagnosticReport."
* context.related[DiagnosticReport].type 1..1
* context.related[DiagnosticReport].type = "DiagnosticReport"
* context.related[DiagnosticReport].reference 1..1 MS
* context.related[DiagnosticReport] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentAccessProvider)

* context.sourcePatientInfo only Reference(Patient)
* context.sourcePatientInfo.identifier only MedicalRecordNumber

* context.period 0..1 MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSIdentifier

* author only Reference(Organization or Practitioner or PractitionerRole)
* author.identifier only PractitionerIdentifier or OrganisationCode

* custodian only Reference(Organization)
* custodian.identifier only OrganisationCode

* date 1..1 MS

