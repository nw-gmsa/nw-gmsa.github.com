This implementation guide primarily focuses on the **Diagnostic Workflow** and how it integrates within the broader **health data model**, as illustrated in the diagram above.
- **Patient Care** and **Patient Administration** are typically found in NHS providers **Electronic Patient Record** systems
- **Care Directory Service** on the other hand, are centrally defined by NHS England, with supporting APIs also provided by NHS England (for example, the ODS API).

In software design, these areas are often referred to as [domains](https://en.wikipedia.org/wiki/Domain-driven_design). The **Genomic Diagnostic Workflow** operates across several of these domains — in software architecture terms, this is known as a [bounded context](https://martinfowler.com/bliki/BoundedContext.html).

<figure>
{%include Diagnostic-Workflow-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Diagnostic Workflow - MindMap</p>
</figure>
<br clear="all">

## Entity Relationship Diagram

```mermaid
erDiagram

  OriginalOrder ||--|{ FillerOrder : "has (FillerOrderNumber = FillerGroupNumber)"
  OriginalOrder ||--|{ Specimen : contains
  FillerOrder ||--|{ Specimen : contains
  Patient ||--|{ OriginalOrder : "NHSNumber or PatientAccessionIdentifier"
  Patient ||--|{ FillerOrder : "NHSNumber or PatientAccessionIdentifier" 
  Patient ||--|{ DiagnosticReport : "NHSNumber or PatientAccessionIdentifier" 
  OriginalOrder ||--|{ DiagnosticReport : contains
  HospitalSpell ||--|{ OriginalOrder : "HospitalSpellProviderIdentifier"
  HospitalSpell ||--|{ FillerOrder : "HospitalSpellProviderIdentifier" 
  HospitalSpell ||--|{ DiagnosticReport : "HospitalSpellProviderIdentifier" 

  OriginalOrder {
    identifier PlacerOrderNumber
    identifier FillerOrderNumber
    code NGTDTestCode
    code RequestingOrganisationCode
    reference Specimen
    reference Patient
     reference HospitalSpellProviderIdentifier
  }

  FillerOrder {
    code OrderStatus
    date TestOrderDate
    identifier TestAccessionIdentifier
    code NGTDTestCode
    string ClinicalDetails
    code Performer
    reference Specimen
    reference Patient
    reference OriginalOrder
     reference HospitalSpellProviderIdentifier
  }

  Patient {
    identifier NHSNumber
    identifier HospitalNumber
    identifier PatientAccessionIdentifier
    string PatientGivenName
    string PatientFamilyName
    date DateOfBirth
    string PostCode
    code AdministrativeSex
  }

  Specimen {
    identifier SpecimenAccessionIdentifier
    identifier ShipmentTrackingNumber
    identifier FMIIdentifier
    reference Patient
    code SpecimenTypeCode
    date SpecimenDispatchDate
    date SpecimenTakenDateTime
    date SpecimenReceivedDateTime
  }

  DiagnosticReport {
    identifier TestAccessionIdentifier
    reference FillerOrder
    reference Patient
    code NGTDTestCode
    date ReportStatusDateTime
    reference HospitalSpellProviderIdentifier
  }
  HospitalSpell {
    identifier HospitalSpellProviderIdentifier
  }
```


### Patient 

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

| Type       | Name                       | Description                                 | FHIR [Patient](StructureDefinition-Patient.html) |
|------------|----------------------------|---------------------------------------------|--------------------------------------------------|
| identifier | NHSNumber                  | Primary patient identifier                  | Patient.identifier (type=NH)                     |
| identifier | HospitalNumber             | Referring organisation local MRN identifier | Patient.identifier (type=MR)                     |
| identifier | PatientAccessionIdentifier | LIMS Patient identifier                     | Patient.identifier (type=PI)                     |
| string     | PatientGivenName           |                                             | Patient.name.given                               |
| string     | PatientFamilyName          |                                             | Patient.name.family                              |
| date       | DateOfBirth                |                                             | Patient.birthDate                                |
| code       | AdministrativeSex          |                                             | Patient.gender                                   |
| string     | PostCode                   |                                             | Patient.address.postalCode                       |
{:.grid}

### Hospital Spell

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-HospitalSpell.html" _target="_blank">Hospital Spell</a> 
</div>

| Type       | Name                                                                                        | Description                       | FHIR [Hospital Spell](StructureDefinition-HospitalSpell.html) |
|------------|---------------------------------------------------------------------------------------------|-----------------------------------|---------------------------------------------------------------|
| identifier | [HospitalSpellProviderIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | Identifier from ordering hospital | Encounter.identifier (type = AN)                              |
{:.grid}

### Original Order

See also [Test Order](Questionnaire-GenomicTestOrder.html). The Original Order is distinguised from the Filler Order by value of intent, .

| Type       | Name                            | Description                         | FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html) |
|------------|---------------------------------|-------------------------------------|----------------------------------------------------------------|
| identifier | PlacerOrderNumber               |                                     | ServiceRequest.identifier (type = PLAC)                        |
| identifier | FillerOrderNumber               |                                     | ServiceRequest.identifier (type = FILL)                        |
| code       |                                 |                                     | ServiceRequest.intent (code = original-order)                  | 
| code       | NGTDTestCode                    | NGTD code for test                  | ServiceRequest.code                                            |
| string     | ClinicalDetails                 | Referrer clinical notes             | ServiceRequest.note                                            |
| code       | RequestingOrganisationCode      | ODS code of requesting organisation | ServiceRequest.requester (ODS Code)                            |
| code       | Performer                       |                                     | ServiceRequest.performer (fixed ODS code = 699X0)              |
| reference  | Specimen                        |                                     | ServiceRequest.specimen                                        |
| reference  | Patient                         |                                     | ServiceRequest.subject                                         |
| reference  | Hospital Spell                  |                                     | ServiceRequest.encounter (Hospital Spell)                      |
| code       | Clinical Indication Code (CITT) |                                     | ServiceRequest.reasonCode                                      | 
{:.grid}

### Filler Order

| Type       | Name                       | Description                         | FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html) |
|------------|----------------------------|-------------------------------------|----------------------------------------------------------------|
| code       | OrderStatus                | Order/test status                   | ServiceRequest.status                                          |
| date       | TestOrderDate              |                                     | ServiceRequest.authoredOn                                      |
| identifier | TestAccessionIdentifier    |                                     | ServiceRequest.identifier                                      |
| code       | NGTDTestCode               | NGTD code for test                  | ServiceRequest.code                                            |
| code       | RequestingOrganisationCode | ODS code of requesting organisation | ServiceRequest.requester (fixed ODS code = 699X0)              |
| code       | Performer                  |                                     | ServiceRequest.performer (ODS Code)                            |
| reference  | Specimen                   |                                     | ServiceRequest.specimen                                        |
| reference  | Patient                    |                                     | ServiceRequest.subject                                         |
| reference  | OriginalOrder              |                                     | ServiceRequest.requisition and ServiceRequest.basedOn          |
| reference | Hospital Spell | | ServiceRequest.encounter (Hospital Spell) |
{:.grid}

#### Filler Order Intent

| Type                | Description                                                                                                                                                     | IHE PALM | Created by   | Original Order Intent | Filler Order Intent   |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|--------------|----------------------------------------|-----------------------|
| Laboratory Order    | A request for one or more laboratory investigations submitted by the requesting clinician or system.                                                            | LAB-1    | Order Placer | order / reflex                         |                       | 
| Work Order          | A subordinate order created by the laboratory to organise and fulfil part of the overall Laboratory Order.                                                      | LAB-4    | Order Filler |                                        | instance-order?       | 
| Subcontracted Order | A laboratory order forwarded to another laboratory for fulfilment, for example when a specialised test is referred to an external provider.                     | LAB-35   | Order Filler |                                        | order (filler-order?) |
| Reflex Order        | A new order created automatically by the Order Filler based on previous test results, for example when pathology findings automatically trigger a genomic test. | LAB-35   | Order Filler |                                        | reflex                | 
{:.grid}

### Specimen 

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
</div>

| Type       | Name                        | Description             | FHIR [Specimen](StructureDefinition-Specimen.html)       |
|------------|-----------------------------|-------------------------|----------------------------------------------------------|
| identifier | SpecimenAccessionIdentifier |                         | Specimen.identifier                                      |
| identifier | ShipmentTrackingNumber      | Courier tracking number | Specimen.identifier[ShipmentTrackingNumber] (type = STN) |
| identifier | FMIIdentifier               |                         | Specimen.container.identifier                            |
| reference  | Patient                     |                         | Specimen.subject                                         |
| code       | SpecimenTypeCode            |                         | Specimen.type                                            |
| date       | SpecimenDispatchDate        |                         |                                                          |
| date       | SpecimenTakenDateTime       | Collection date/time    | Specimen.collection.collectedDateTime                    |
| date       | SpecimenReceivedDateTime    | Received date/time      |                                                          |
{:.grid}

### Diagnostic Report

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>

| Type       | Name                    | Description | FHIR [DiagnosticReport](StructureDefinition-DiagnosticReport.html)                           |
|------------|-------------------------|-------------|----------------------------------------------------------------------------------------------|
| identifier | TestAccessionIdentifier |             | DiagnosticReport.identifier                                                                  |
| reference  | FillerOrder             |             | DiagnosticReport.basedOn (FillerOrder)                                                       |
| reference  | Patient                 |             | DiagnosticReport.subject                                                                     |
| code       | NGTDTestCode            |             | DiagnosticReport.code (system = https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory) |
| date       | ReportStatusDateTime    |             | DiagnosticReport.effectiveDateTime                                                           |
| reference  | Hospital Spell          |             | ServiceRequest.encounter (Hospital Spell)                                                    |
{:.grid}
