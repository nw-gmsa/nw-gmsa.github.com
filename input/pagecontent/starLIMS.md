<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

NW Genomics — StarLIMS / iGene Integration.

## References

1. [Inter Laboratory Workflow (ILW) - Sub-orders LAB-35 and LAB-36](ILW.html#sub-orders-lab-35-and-lab-36)
2. [Diagnostic Core](diagnostic-core.html)
3. [Regional Integration Engine (RIE)](overview.html)
4. [FHIR Validation](testing.html#fhir-validation)
5. [nw-gmsa.github.io/en/index.html](https://nw-gmsa.github.io/en/index.html) - the North West "data contract" all FHIR Repository resources must conform to
6. [02 - Work Orders: A Worked Example](https://github.com/nw-gmsa/Testing/blob/main/notebooks/02-work-orders-worked-example.ipynb) - worked example of retrieving orders from the Resource Access Provider (FHIR Repository), the mechanism used by both the existing sub-contracting path and the future RIE-routed path (see [Developer Guides](DeveloperGuides.html))

## Clinical Pathway Overview

### What is being tested

This use case isn't about a specific clinical test - it's about how a test
allocated to StarLIMS (the Liverpool GLH's satellite LIMS) gets its order and
result moved correctly between iGene (the master LIMS) and StarLIMS, so which
system actually processes the test stays invisible to the referring clinician.

### The end-to-end clinical journey

1. **Order placed** - a clinician orders a genomic test, the same way regardless of which LIMS will eventually process it.
2. **Order clerked into iGene** - the order is entered into the master LIMS.
3. **Test allocated to StarLIMS** - some tests are work-ordered to StarLIMS for processing.
4. **Testing performed** - StarLIMS carries out the test.
5. **Result flows back** - the result returns to iGene, and from there to the ordering clinician.
6. **Clinical decision** - the clinician acts on the result, without needing to know which LIMS actually ran it.

```mermaid
flowchart LR
    A[Clinician<br/>orders test] --> B[Order clerked<br/>into iGene]
    B --> C[Test allocated to<br/>StarLIMS]
    C --> D[Testing<br/>performed]
    D --> E[Result flows back<br/>through iGene]
    E --> F[Clinician<br/>acts on result]
```

### Why this matters for developers

- Whether a test runs on iGene or StarLIMS is purely an internal allocation decision - it should never be visible in what the referring clinician receives.
- A "work order" is a different concept from the original Laboratory Order (`LAB-1`): the work order is the internal routing of a specific test to whichever system (StarLIMS or otherwise) will actually process it.

## Actors

| IHE Actor                                                                                                                   | Role                                                                                                                                                                                                        |
|-----------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html)                                                                            | NHS Trusts - send Laboratory Orders (LAB-1), receive Laboratory Reports (LAB-3)                                                                                                                             |
| [Order Filler](ActorDefinition-OrderFiller.html)                                                                            | iGene (master LIMS) - orders and specimens are clerked in, reports distributed to NHS Trusts                                                                                                                |
| [Resource Access Provider](ActorDefinition-ResourceAccessProvider.html) / [Intermediary](ActorDefinition-Intermediary.html) | FHIR Repository + Regional Integration Engine (RIE) - picks up work order CSV exports, stores Patient/ServiceRequest/Specimen, generates reports CSV (existing sub-contracting path)                                                         |
| [Intermediary](ActorDefinition-Intermediary.html)                                                                           | Regional Integration Engine (RIE) - inspects and routes Laboratory Orders (LAB-1) and Laboratory Reports (LAB-3) between NHS Trusts and iGene/StarLIMS, based on order metadata such as Test Directory Code |
| [Subcontractor](ActorDefinition-Subcontractor.html) (ILW) / [Order Filler](ActorDefinition-OrderFiller.html) (future)       | StarLIMS - Liverpool GLH satellite LIMS, tests managed here. Sub-Contractor for iGene-routed work orders (existing); Order Filler for orders routed here directly by the RIE (future)                       |
{:.grid}

## Transactions

| Transaction    | Description                                              | Direction               |
|--------------------|-------------------------------------------------------------|-----------------------------|
| `LAB-1`/`LAB-3` (current)      | Orders/specimens clerked into iGene; reports distributed to NHS Trusts | NHS Trusts ↔ iGene            |
| `LAB-1`/`LAB-3` (future, routed) | RIE inspects order metadata (e.g. Test Directory Code) and routes Laboratory Orders to iGene or StarLIMS as Order Filler; routes Laboratory Reports back to the originating NHS Trust | NHS Trusts ↔ RIE ↔ iGene/StarLIMS |
| `LAB-4`              | Work orders generated for StarLIMS tests                       | iGene → StarLIMS (via RIE, CSV export) |
| `LAB-35`/`LAB-36`    | Sub-order and Laboratory Report (StarLIMS as Sub-Contractor, iGene as Order Filler) | iGene ↔ StarLIMS               |
{:.grid}

## Current Process

North West Genomics was formed from two Genomic Laboratory Hubs — one in Manchester and one in Liverpool. Many tests for Liverpool hospitals were historically processed in Liverpool using StarLIMS at the Liverpool GLH.

The move to a single organisation includes consolidating onto one master LIMS, iGene. For ordering and reporting, this means:

- Orders and specimens are clerked into iGene. Most orders arrive on paper, though a growing number of NHS Trusts in the region now send electronic orders (IHE LAB-1). Some tests are allocated to satellite LIMS, and these are referred to as work orders.
- Reports still originate from a variety of LIMS in multiple formats, though this is also being centralised in iGene. NW Genomics is moving towards electronic transmission (HL7 ORU / IHE LAB-3, with FHIR Laboratory Report support planned) to return reports to NHS Trusts.

## Future Process

Two future developments are planned for StarLIMS integration:

- **Order and Report Routing** - the Regional Integration Engine (RIE) will receive Laboratory Orders (LAB-1) directly from NHS Trusts and route each one to iGene or StarLIMS, in addition to the existing sub-contracting path from iGene.
- **Automated Sub-Contracted Orders** - the existing sub-contracting path, where iGene routes selected work orders to StarLIMS, moves from manual entry to an automated feed.

### Order and Report Routing

<div class="alert alert-info" role="alert">
This is a future development.
</div>

<div class="alert alert-info" role="alert">
<b>Use Case:</b> This extends the existing <a href="overview.html">Regional Integration Engine (RIE)</a> use case. Today, that use case only covers Laboratory Orders (LAB-1) routed from NHS Trusts to iGene, and Laboratory Reports (LAB-3) routed from iGene back to NHS Trusts. This development adds StarLIMS as a second routing destination/source alongside iGene.
</div>

Today, NHS Trusts (Order Placer) send Laboratory Orders (LAB-1) to iGene (Order Filler), and iGene alone decides - internally - which orders to sub-contract to StarLIMS (see Sub-Contracted Orders below). As a further future development, the RIE will sit in the LAB-1/LAB-3 path itself: it will receive Laboratory Orders directly from NHS Trusts, inspect order metadata such as the Test Directory Code, and route each order to whichever system - iGene or StarLIMS - is the correct Order Filler for that test.

The existing sub-contracting process from iGene to StarLIMS is unaffected and continues to exist alongside this - it is, in effect, a second, iGene-internal routing step for orders the RIE has already routed to iGene.

For StarLIMS, the mechanism for receiving these RIE-routed orders is the same as receiving iGene's sub-contracted orders today: StarLIMS picks them up by querying the Resource Access Provider (FHIR Repository), as described in [Overall Workflow (Sub-Contracted Orders)](#overall-workflow-sub-contracted-orders) below - there is no new, bespoke integration for the NHS Trust-routed case. The two are distinguished in the FHIR Repository by `ServiceRequest.intent`: RIE-routed Laboratory Orders (LAB-1) use `order`, while iGene's sub-contracted orders (LAB-35) use `filler-order`.

Laboratory Reports follow the same pattern in reverse. The process that populates the FHIR Repository from a Laboratory Report is unchanged (see Subcontracted Laboratory Report below for the sub-contracting case); what's new is that the RIE also acts as a router, forwarding each Laboratory Report on to the NHS Trust that originally placed the order.

```mermaid
flowchart LR
    OP["NHS Trusts<br/>Order Placer"]

    subgraph RIE["Regional Integration Engine (RIE)"]
        R1{"Inspect order metadata<br/>e.g. Test Directory Code"}
    end

    IGENE["iGene<br/>Order Filler"]
    STARLIMS["StarLIMS<br/>Order Filler"]

    OP -->|"LAB-1: Laboratory Order"| RIE
    R1 -->|Routed Order| IGENE
    R1 -->|Routed Order| STARLIMS
    IGENE -->|"LAB-3: Laboratory Report"| RIE
    STARLIMS -->|"LAB-3: Laboratory Report"| RIE
    RIE -->|Routed Report| OP

    IGENE -.->|"Sub-Contracted Orders<br/>LAB-35/LAB-36 - existing, unchanged"| STARLIMS
```

### Automated Sub-Contracted Orders

Work orders are currently entered into StarLIMS manually; this process will be automated. The data transferred includes patient demographics (NHS number, gender, date of birth, name), order details (placer and filler order numbers), and specimen information (type and identifier). Reports will flow from StarLIMS to iGene, and from there be distributed to NHS hospitals.

The overall design is broadly the same as the IHE Inter Laboratory Workflow, with StarLIMS acting as the Sub-Contractor and iGene acting as the Order Filler. The order process described above corresponds to transaction LAB-35, and the report process corresponds to LAB-36.

This fits inside the IHE Laboratory Testing Workflow, as illustrated at [nw-gmsa.github.io/en/ILW.html#sub-orders-lab-35-and-lab-36](https://nw-gmsa.github.io/en/ILW.html#sub-orders-lab-35-and-lab-36).

### Overall Workflow (Sub-Contracted Orders)

```mermaid
flowchart LR
    subgraph OF["iGene — Order Filler"]
        OF1[Orders and Specimens<br/>clerked into iGene]
        OF2[Reports distributed<br/>to NHS Trusts]
    end

    subgraph RIE["Regional Integration Engine / FHIR Repository"]
        R1[(FHIR Repository<br/>Patient, ServiceRequest,<br/>Specimen, Reports)]
    end

    subgraph SC["StarLIMS — Sub-Contractor"]
        SC1[Work Orders received<br/>tests managed in StarLIMS]
        SC2[Reports produced<br/>in StarLIMS]
    end

    OF1 -->|LAB-35: Sub-Order<br/>CSV export - daily| RIE
    RIE --> SC1
    SC2 -->|LAB-36: Sub-Order Report<br/>CSV| RIE
    RIE --> OF2
```

### Subcontracted Orders

The initial design for handling work orders is as follows:

1. Orders and specimens are clerked into iGene.
2. Work orders for StarLIMS are generated, with specific tests managed within StarLIMS.
3. Work orders are exported as CSV files on a daily basis.
4. The regional integration engine (RIE) picks up these files and stores them in the FHIR Repository as Patient, ServiceRequest, and Specimen resources. Details of this data model are available at [nw-gmsa.github.io/en/diagnostic-core.html](https://nw-gmsa.github.io/en/diagnostic-core.html).
5. A StarLIMS Import process polls the FHIR Repository for new work orders, and imports them directly into the StarLIMS SQL database.

```mermaid
flowchart TD
    A[Orders and Specimens<br/>clerked into iGene] --> B[Work Orders created<br/>for StarLIMS tests]
    B --> C[Work Orders exported<br/>as CSV - daily]
    C --> D[Regional Integration Engine<br/>RIE picks up CSV files]
    D --> E[(FHIR Repository)]
    E -.->|StarLIMS Import process polls<br/>for new Work Orders| F[StarLIMS SQL database<br/>updated with Work Orders]
```

### Subcontracted Laboratory Report

Once results have been produced in StarLIMS, a StarLIMS Export process (in the
RIE, or an external process - probably developed in Python for both) extracts
the report from StarLIMS via SQL (and other sources, if required). This output
is converted to a FHIR Laboratory Report Message `R01`, and sent to the RIE -
from there it is handled the same way as reports from iGene or Histotrac, as
described in [Regional Integration Engine (RIE) - Report
Process](overview.html#report-process).

```mermaid
flowchart TD
    A[(StarLIMS SQL database)] --> B[StarLIMS Export process<br/>extracts report via SQL<br/>- and other sources if required]
    B --> C[Converted to FHIR<br/>Laboratory Report Message R01]
    C --> D[Sent to Regional<br/>Integration Engine RIE]
    D --> E["Handled as any other report<br/>(see RIE Report Process)"]
```

> **Note:** the Reports process is anticipated, not yet finalised.

## Data Models

- [ServiceRequest](StructureDefinition-ServiceRequest.html) - work orders (placer and filler order numbers)
- [Specimen](StructureDefinition-Specimen.html) - specimen type and identifier
- [Patient](StructureDefinition-Patient.html) - NHS number, gender, date of birth, name

### Work Order CSV Export from iGene

<div class="alert alert-info" role="alert">
<b>FHIR Questionnaire:</b> <a href="Questionnaire-iGeneWorkOrderExport.html">iGene Work Order Export (CSV)</a>
</div>

The daily work-order CSV export from iGene (step 3 of [Subcontracted
Orders](#subcontracted-orders) above) has the shape below - see
[StarLIMSSampleData.csv](https://github.com/nw-gmsa/Testing/blob/main/Input/StarLIMSSampleData.csv)
for a full example file. This same export shape/pattern is reused by [OMICS DSS Result
Integration](reportable-variants.html#work-order-csv-from-igene) for DLIMS work order
metadata.

| CSV Column                  | Description                                                        | Type      | FHIR Mapping                                                        |
|-------------------------------|--------------------------------------------------------------------|-----------|-------------------------------------------------------------------------|
| `PatientAccessionIdentifier`  | iGene's internal patient accession number - see [Patient Identifier](StructureDefinition-PatientIdentifier.html) | string    | `Patient.identifier` (PatientIdentifier)                                |
| `NHSNumber`                   | Patient's NHS Number - see [NHS Identifier](StructureDefinition-NHSIdentifier.html) | string    | `Patient.identifier` (NHS Number)                                       |
| `PatientGivenName`            | Patient's first name                                                | string    | `Patient.name.given`                                                    |
| `PatientFamilyName`           | Patient's surname                                                   | string    | `Patient.name.family`                                                   |
| `DateOfBirth`                 | Patient's date of birth                                             | date      | `Patient.birthDate`                                                     |
| `AdministrativeSex`           | Sex registered at birth                                             | string    | `Patient.gender`                                                        |
| `PostCode`                    | Patient's postcode                                                  | string    | `Patient.address.postalCode`                                            |
| `HospitalSpellIdentifier`     | Identifier for the hospital spell/episode the order was placed under - see [Hospital Provider Spell Identifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | string  | `ServiceRequest.encounter.identifier` (HospitalProviderSpellIdentifier) |
| `PlacerOrderNumber`           | Order identifier assigned by the ordering Trust - see [Order Identifier](StructureDefinition-OrderIdentifier.html) | string    | `ServiceRequest.identifier` (OrderIdentifier, type=PLAC)                |
| `HospitalNumber`              | Patient's hospital/medical record number - see [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | string    | `Patient.identifier` (MedicalRecordNumber)                              |
| `FillerOrderNumber`           | Order identifier assigned by iGene (the lab) - see [Order Identifier](StructureDefinition-OrderIdentifier.html) | string    | `ServiceRequest.identifier` (OrderIdentifier, type=FILL)                |
| `TestAccessionIdentifier`     | iGene's test-level accession number                                 | string    | `ServiceRequest.identifier` *(system TBD)*                              |
| `TestOrderDate`               | Date/time the test was ordered                                      | dateTime  | `ServiceRequest.authoredOn`                                             |
| `NGTDTestCode`                | NHS England Genomic Test Directory test code                        | string    | `ServiceRequest.code`                                                   |
| `NGTDTestName`                | NHS England Genomic Test Directory test/package name                | string    | `ServiceRequest.code.coding.display`                                    |
| `OrderStatus`                 | Order's current status in iGene (e.g. Dispatched)                   | string    | `ServiceRequest.status`                                                 |
| `SpecimenDispatchDate`        | Date/time the specimen was dispatched to StarLIMS                   | dateTime  | `Observation.valueDateTime` (via `ServiceRequest.supportingInfo`)       |
| `ShipmentTrackingNumber`      | Courier tracking number for the dispatched specimen - see [Shipment Tracking Number](StructureDefinition-ShipmentTrackingNumber.html) | string    | `Specimen.identifier` (ShipmentTrackingNumber)                          |
| `DatasetTargetOrganisation`   | Destination the dataset/specimen was sent to                        | string    | `Observation.valueString` (via `ServiceRequest.supportingInfo`)         |
| `SpecimenAccessionIdentifier` | Specimen's lab accession/DNA number - see [Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) | string    | `Specimen.accessionIdentifier`                                          |
| `SpecimenTypeDescription`     | Specimen type, free text (e.g. Blood, Tissue)                       | string    | `Specimen.type.coding.display`                                          |
| `SpecimenTakenDateTime`       | Date/time the specimen was taken from the patient                   | dateTime  | `Specimen.collection.collectedDateTime`                                 |
| `ClinicalDetails`             | Free-text clinical details/history (redacted in example data)       | string    | `ServiceRequest.note`                                                   |
| `OrderingProviderIdentifier`  | Ordering clinician's professional identifier - see [Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | string    | `PractitionerRole.practitioner.identifier.value`                        |
| `OrderingProviderName`        | Ordering clinician's name                                           | string    | `PractitionerRole.practitioner.display`                                 |
| `RequestingOrganisationCode`  | Requesting Trust's ODS code - see [Organisation Code](StructureDefinition-OrganisationCode.html) | string    | `PractitionerRole.organization.identifier.value`                        |
| `RequestingOrganisationName`  | Requesting Trust's name                                             | string    | `PractitionerRole.organization.display`                                 |
{:.grid}

`TestAccessionIdentifier`, and the `PLAC`/`FILL` split on `PlacerOrderNumber`/
`FillerOrderNumber`, are not yet confirmed against a published identifier system - see
the Questionnaire's own item design notes for detail.

## Examples

No example resources are published yet for this scenario.

## Developer Guides

- [02 - Work Orders: A Worked Example](https://github.com/nw-gmsa/Testing/blob/main/notebooks/02-work-orders-worked-example.ipynb) - worked example of retrieving orders from the Resource Access Provider (FHIR Repository), the mechanism used by both the existing sub-contracting path and the future RIE-routed path

See [Developer Guides](DeveloperGuides.html) for the full notebook series.
