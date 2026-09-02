Instance: iGeneLaboratoryOrderExport

InstanceOf: NWQuestionnaire
Title: "iGene Laboratory Order Export (CSV)"
Description: """
Represents the flat-file shape of `NEYctDNA.csv`, iGene's daily CSV export of ctDNA
orders and reports copied to NE&Y Genomics for regional management information - see
[ctDNA Management Information (NW to NE&Y
Genomics)](NEYManagementInformation.html#current-process). One row per test; a report
row carries both order fields and report/result fields together, so this Questionnaire
models the full row - the order-only columns populate the FHIR Message O21 Laboratory
Order ([Bundle-GenomicsOrderMessage-ctDNA](Bundle-GenomicsOrderMessage-ctDNA.html)),
while the report/result columns (`ReportStatusDateTime`, `ReportIdentifier`,
`ObservationResultStatus`, `ObservationDateTime`, `ObservationIdentifierCode`,
`ObservationIdentifierDescription`) instead populate the separate FHIR Message R01
Laboratory Report ([Bundle-GenomicsReportMessage-ctDNA](Bundle-GenomicsReportMessage-ctDNA.html),
itself based on an HL7 v2 `ORU^R01`, not O21). See [ctDNA Management Information -
Laboratory Order O21 Mapping](NEYManagementInformation.html#laboratory-order-o21-mapping)
for the O21-only columns and [Laboratory Report R01
Mapping](NEYManagementInformation.html#laboratory-report-r01-mapping) for the
report/result columns - the two markdown tables split this Questionnaire's items by
which FHIR Message actually carries them, even though all items live on this one
Questionnaire. Named for iGene (the common source) rather than NE&Y/ctDNA
specifically, since the shape isn't NE&Y- or ctDNA-specific - it's the same LAB-2
CSV re-export pattern [iGene Work Order Export](Questionnaire-iGeneWorkOrderExport.html)
documents for StarLIMS/DLIMS work orders, just with ctDNA report/result columns added.

Each item's `linkId` is the literal CSV column header, `type` the FHIR datatype the
column's values coerce to, and `definition` the FHIR field the column populates once
converted into the relevant FHIR Message - many of these reuse the exact same field as
the equivalent item already defined on [Genomic Test Order](Questionnaire-GenomicTestOrder.html)
or [iGene Work Order Export](Questionnaire-iGeneWorkOrderExport.html), since
this is the same underlying order data plus report/result-specific columns those don't
carry. See [NEYctDNA.csv](https://github.com/nw-gmsa/Testing/blob/main/Input/NEYctDNA.csv)
for the source file this was extracted from.

Unlike the Ask At Order Entry Questionnaires elsewhere in this IG, this is not a
`derivedFrom`/`extends` Questionnaire - it documents an existing system-to-system CSV
export shape, not a human-facing order-entry form.
"""
Usage:  #definition

* title = "iGene Laboratory Order Export (CSV)"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/iGeneLaboratoryOrderExport"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "Patient"
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"
  * text = "Patient"

  * item[+]
    * type = #string
    * linkId = "PatientAccessionIdentifier"
    * text = "PatientAccessionIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:PatientIdentifier"
  * item[+]
    * type = #string
    * linkId = "NHSNumber"
    * text = "NHSNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"
  * item[+]
    * type = #string
    * linkId = "HospitalNumber"
    * text = "HospitalNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"
  * item[+]
    * type = #string
    * linkId = "PatientFamilyName"
    * text = "PatientFamilyName"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
  * item[+]
    * type = #string
    * linkId = "PatientGivenName"
    * text = "PatientGivenName"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
  * item[+]
    * type = #date
    * linkId = "DateOfBirth"
    * text = "DateOfBirth"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
  * item[+]
    * type = #string
    * linkId = "AdministrativeSex"
    * text = "AdministrativeSex"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.gender"
  * item[+]
    * type = #string
    * linkId = "PostCode"
    * text = "PostCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.address.postalCode"

* item[+]
  * type = #group
  * linkId = "HealthcareProfessional"
  * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole"
  * text = "Healthcare Professional"

  * item[+]
    * type = #string
    * linkId = "OrderingProviderIdentifier"
    * text = "OrderingProviderIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.identifier.value"
  * item[+]
    * type = #string
    * linkId = "OrderingProviderName"
    * text = "OrderingProviderName"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.practitioner.display"
  * item[+]
    * type = #string
    * linkId = "RequestingOrganisationCode"
    * text = "RequestingOrganisationCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.identifier.value"
  * item[+]
    * type = #string
    * linkId = "RequestingOrganisationName"
    * text = "RequestingOrganisationName"
    * definition = "http://hl7.org/fhir/StructureDefinition/PractitionerRole#PractitionerRole.organization.display"

* item[+]
  * type = #group
  * linkId = "TestRequest"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest"
  * text = "Test Request"

  * item[+]
    * type = #string
    * linkId = "HospitalSpellIdentifier"
    * text = "HospitalSpellIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.encounter.identifier"
  * item[+]
    * type = #string
    * linkId = "PlacerOrderNumber"
    * text = "PlacerOrderNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderIdentifier"
    * item[+]
      * linkId = "PlacerOrderNumber-designNote"
      * type = #display
      * text = "identifier.type = PLAC (v2-0203), the same OrderIdentifier slice FillerOrderNumber below uses with type = FILL."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "FMIIdentifier"
    * text = "FMIIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier"
    * item[+]
      * linkId = "FMIIdentifier-designNote"
      * type = #display
      * text = "Blank on every current example row - purpose and identifier system not yet confirmed."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "FillerOrderNumber"
    * text = "FillerOrderNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier:OrderIdentifier"
    * item[+]
      * linkId = "FillerOrderNumber-designNote"
      * type = #display
      * text = "identifier.type = FILL (v2-0203)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "OrderStatus"
    * text = "OrderStatus"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.status"
  * item[+]
    * type = #string
    * linkId = "NGTDTestCode"
    * text = "NGTDTestCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
  * item[+]
    * type = #string
    * linkId = "NGTDTestName"
    * text = "NGTDTestName"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code.coding.display"
  * item[+]
    * type = #string
    * linkId = "TestCode"
    * text = "TestCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code.coding"
    * item[+]
      * linkId = "TestCode-designNote"
      * type = #display
      * text = "A shorter local iGene test code (e.g. ctDNA_M4) alongside the national NGTDTestCode - a second `coding` entry on the same ServiceRequest.code, local system not yet confirmed."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "TestAccessionIdentifier"
    * text = "TestAccessionIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.identifier"
    * item[+]
      * linkId = "TestAccessionIdentifier-designNote"
      * type = #display
      * text = "A further, test-level iGene identifier distinct from both the Placer and Filler Order Number slices above - exact identifier.type/system not yet confirmed."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #dateTime
    * linkId = "TestOrderDate"
    * text = "TestOrderDate"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.authoredOn"

* item[+]
  * type = #group
  * linkId = "Report"
  * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport"
  * text = "Report"

  * item[+]
    * type = #dateTime
    * linkId = "ReportStatusDateTime"
    * text = "ReportStatusDateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.issued"
  * item[+]
    * type = #string
    * linkId = "ReportIdentifier"
    * text = "ReportIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.identifier:ReportIdentifier"
  * item[+]
    * type = #string
    * linkId = "ObservationResultStatus"
    * text = "ObservationResultStatus"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.status"
    * item[+]
      * linkId = "ObservationResultStatus-designNote"
      * type = #display
      * text = "F = finalised - see Why this matters for developers on NEYManagementInformation.html for how this drives treating an R01 copy as a completed test."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #dateTime
    * linkId = "ObservationDateTime"
    * text = "ObservationDateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.effectiveDateTime"
    * item[+]
      * linkId = "ObservationDateTime-designNote"
      * type = #display
      * text = "Populated on DiagnosticReport.effectiveDateTime in the current worked example - see R01 Mapping on NEYManagementInformation.html for detail, including why this isn't the individual result Observation's own effectiveDateTime."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "ObservationIdentifierCode"
    * text = "ObservationIdentifierCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding.code"
    * item[+]
      * linkId = "ObservationIdentifierCode-designNote"
      * type = #display
      * text = "On the individual result Observation referenced from DiagnosticReport.result, not DiagnosticReport itself."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "ObservationIdentifierDescription"
    * text = "ObservationIdentifierDescription"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.code.coding.display"

* item[+]
  * type = #group
  * linkId = "Specimen"
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

  * item[+]
    * type = #dateTime
    * linkId = "SpecimenTakenDateTime"
    * text = "SpecimenTakenDateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
  * item[+]
    * type = #dateTime
    * linkId = "SpecimenReceivedDateTime"
    * text = "SpecimenReceivedDateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.receivedTime"
  * item[+]
    * type = #string
    * linkId = "SpecimenAccessionIdentifier"
    * text = "SpecimenAccessionIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier"
  * item[+]
    * type = #string
    * linkId = "SpecimenTypeCode"
    * text = "SpecimenTypeCode"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * item[+]
      * linkId = "SpecimenTypeCode-designNote"
      * type = #display
      * text = "Normally SNOMED coded using the [Specimen Type](ValueSet-specimen-type.html) value set."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "SpecimenTypeDescription"
    * text = "SpecimenTypeDescription"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.display"
