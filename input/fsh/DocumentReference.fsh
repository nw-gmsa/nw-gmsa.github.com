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
* context.encounter ^short = "The period of care (PV1-19), as an identifier reference. The Hospital Provider Spell Identifier is preferred for diagnostic reports; a Visit Number may be used for other types of document. XDS referenceIdList type urn:ihe:iti:xds:2015:encounterId"
* context.encounter ^definition = "Identifies the period of care the document belongs to, so that the Order Placer and other care settings can find all reports for that period of care (for example for a cancer MDT). For diagnostic reports the Hospital Provider Spell Identifier is the preferred identifier, as it links reports from several diagnostic services to the same spell. A Visit Number may still be used for other types of document."
* context.encounter only Reference(HospitalSpell or Visit)
* context.encounter.identifier only HospitalProviderSpellIdentifier or VisitNumber
* context.encounter.identifier ^short = "Hospital Provider Spell Identifier (preferred for diagnostic reports) or Visit Number (other types of document)"

* context.related 0..* MS
* context.related ^short = "Related identifiers (IHE XDS referenceIdList). The Report Identifier, as a Reference to the DiagnosticReport, and the Order Placer Number and Order Group Number as identifier references"
* context.related ^definition = "Identifiers the Order Placer uses to find the report for its order (IHE XDS referenceIdList, searched with MHD ITI-67 `related` or XDS FindDocumentsByReferenceId). The Report Identifier is carried as a Reference to the DiagnosticReport. The Order Placer Number and Order Group Number are identifier references (no literal reference). The Hospital Provider Spell Number is carried in context.encounter."

* context.related ^slicing.discriminator[0].type = #value
* context.related ^slicing.discriminator[0].path = "type"
* context.related ^slicing.discriminator[1].type = #value
* context.related ^slicing.discriminator[1].path = "identifier.type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type and identifier.type"
* context.related ^slicing.ordered = false

* context.related contains
  DiagnosticReport 0..1 MS and
  OrderPlacerNumber 0..1 MS and
  OrderGroupNumber 0..1 MS

* context.related[DiagnosticReport] only Reference(DiagnosticReport)
* context.related[DiagnosticReport] ^short = "The DiagnosticReport this document is a rendering of, identified by its Report Identifier"
* context.related[DiagnosticReport] ^definition = "Reference to the DiagnosticReport this document presents, with its Report Identifier (DiagnosticReport.identifier). Accession Number is available from the referenced DiagnosticReport (DiagnosticReport.specimen)."
* context.related[DiagnosticReport].type 1..1
* context.related[DiagnosticReport].type = "DiagnosticReport"
* context.related[DiagnosticReport].reference 0..1 MS
* context.related[DiagnosticReport].identifier 1..1 MS
* context.related[DiagnosticReport].identifier only ReportIdentifier
* context.related[DiagnosticReport].identifier.type = $v2-0203#FILL
* context.related[DiagnosticReport] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentAccessProvider)
* context.related[DiagnosticReport] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentPublisher)

* context.related[OrderPlacerNumber] only Reference(ServiceRequest)
* context.related[OrderPlacerNumber] ^short = "Order Placer Number (ORC-2), as an identifier reference. XDS referenceIdList type urn:ihe:iti:xds:2013:order"
* context.related[OrderPlacerNumber].type 1..1
* context.related[OrderPlacerNumber].type = "ServiceRequest"
* context.related[OrderPlacerNumber].reference 0..0
* context.related[OrderPlacerNumber].identifier 1..1 MS
* context.related[OrderPlacerNumber].identifier only OrderPlacerNumber
* context.related[OrderPlacerNumber].identifier.type = $v2-0203#PLAC
* context.related[OrderPlacerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentAccessProvider)
* context.related[OrderPlacerNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentPublisher)

* context.related[OrderGroupNumber] only Reference(ServiceRequest)
* context.related[OrderGroupNumber] ^short = "Order Group Number (ORC-4), as an identifier reference"
* context.related[OrderGroupNumber].type 1..1
* context.related[OrderGroupNumber].type = "ServiceRequest"
* context.related[OrderGroupNumber].reference 0..0
* context.related[OrderGroupNumber].identifier 1..1 MS
* context.related[OrderGroupNumber].identifier only OrderGroupNumber
* context.related[OrderGroupNumber].identifier.type = $v2-0203#PGN
* context.related[OrderGroupNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentAccessProvider)
* context.related[OrderGroupNumber] insert Obligation(#SHOULD:populate-if-known, https://fhir.nwgenomics.nhs.uk/ActorDefinition/DocumentPublisher)

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

