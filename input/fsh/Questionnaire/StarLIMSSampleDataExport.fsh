Instance: StarLIMSSampleDataExport

InstanceOf: NWQuestionnaire
Title: "StarLIMS Sample Data Export (iGene CSV)"
Description: """
Represents the flat-file shape of `StarLIMSSampleData.csv`, iGene's daily CSV export
of work orders sub-contracted to StarLIMS (the Liverpool GLH satellite LIMS) - see
[StarLIMS / iGene Integration](starLIMS.html#subcontracted-orders). The same export
shape/pattern is reused by the [OMICS DSS Result
Integration](reportable-variants.html) use case for DLIMS work order metadata (see
that page's Future Process) - one row per sub-contracted test.

Each item's `linkId` is the literal CSV column header, `type` the FHIR datatype the
column's values coerce to, and `definition` the FHIR field the column populates once
imported - many of these reuse the exact same field as the equivalent item already
defined on [Genomic Test Order](Questionnaire-GenomicTestOrder.html), since a
sub-contracted work order carries the same underlying data as any other order. See
[StarLIMS / iGene Integration - CSV Column Reference](starLIMS.html#csv-column-reference)
for a simple description of each column plus its FHIR mapping (also reused, unchanged,
by [OMICS DSS Result Integration](reportable-variants.html#csv-column-reference)), and
[StarLIMSSampleData.csv](https://github.com/nw-gmsa/Testing/blob/main/Input/StarLIMSSampleData.csv)
for the source file this was extracted from.

Unlike the Ask At Order Entry Questionnaires elsewhere in this IG, this is not a
`derivedFrom`/`extends` Questionnaire - it documents an existing system-to-system CSV
export shape, not a human-facing order-entry form, so items aren't nested under the
same Patient/HealthcareProfessional/TestRequest/Specimen groups `derivedFrom` would
imply; they're grouped the same way only because that's how the source CSV's columns
naturally cluster.
"""
Usage:  #definition

* title = "StarLIMS Sample Data Export (iGene CSV)"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/StarLIMSSampleDataExport"

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
      * linkId = "PatientAccessionIdentifier-designNote"
      * type = #display
      * text = "iGene's own internal patient accession number, distinct from NHSNumber/HospitalNumber - system/assigner not yet confirmed."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "NHSNumber"
    * text = "NHSNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"
  * item[+]
    * type = #string
    * linkId = "PatientGivenName"
    * text = "PatientGivenName"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
  * item[+]
    * type = #string
    * linkId = "PatientFamilyName"
    * text = "PatientFamilyName"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
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
    * type = #string
    * linkId = "HospitalNumber"
    * text = "HospitalNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:MedicalRecordNumber"

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
      * linkId = "HospitalSpellIdentifier-designNote"
      * type = #display
      * text = "Coded with the HospitalProviderSpellIdentifier extension - same pattern as Visit.partOf.identifier and HospitalSpell.identifier[HospitalSpellIdentifier] elsewhere in this IG."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
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
    * linkId = "OrderStatus"
    * text = "OrderStatus"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.status"
  * item[+]
    * type = #dateTime
    * linkId = "SpecimenDispatchDate"
    * text = "SpecimenDispatchDate"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueDateTime"
    * item[+]
      * linkId = "SpecimenDispatchDate-designNote"
      * type = #display
      * text = "Same Ask At Order Entry pattern as GenomicTestOrder's NOS/SampleSent item (Observation referenced from ServiceRequest.supportingInfo)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "DatasetTargetOrganisation"
    * text = "DatasetTargetOrganisation"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueString"
    * item[+]
      * linkId = "DatasetTargetOrganisation-designNote"
      * type = #display
      * text = "Same Ask At Order Entry pattern as GenomicTestOrder's NOS/SampleSentTo item (Observation referenced from ServiceRequest.supportingInfo)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
  * item[+]
    * type = #string
    * linkId = "ClinicalDetails"
    * text = "ClinicalDetails"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"

* item[+]
  * type = #group
  * linkId = "Specimen"
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"
  * text = "Specimen/Biopsy"

  * item[+]
    * type = #string
    * linkId = "SpecimenAccessionIdentifier"
    * text = "SpecimenAccessionIdentifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.accessionIdentifier"
  * item[+]
    * type = #string
    * linkId = "SpecimenTypeDescription"
    * text = "SpecimenTypeDescription"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.display"
  * item[+]
    * type = #dateTime
    * linkId = "SpecimenTakenDateTime"
    * text = "SpecimenTakenDateTime"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
  * item[+]
    * type = #string
    * linkId = "ShipmentTrackingNumber"
    * text = "ShipmentTrackingNumber"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier:ShipmentTrackingNumber"
