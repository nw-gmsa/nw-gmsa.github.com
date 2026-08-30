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

## Actors

| IHE Actor                                                                                       | Role                                                              |
|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| [Order Filler](ActorDefinition-OrderFiller.html)                                                       | iGene (master LIMS) - orders and specimens are clerked in, reports distributed to NHS Trusts |
| [Intermediary](ActorDefinition-Intermediary.html) / [Resource Access Provider](ActorDefinition-ResourceAccessProvider.html) | Regional Integration Engine (RIE) / FHIR Repository - picks up work order CSV exports, stores Patient/ServiceRequest/Specimen, generates results CSV |
| [Subcontractor](ActorDefinition-Subcontractor.html) (ILW)                                              | StarLIMS - Liverpool GLH satellite LIMS, tests managed here      |
{:.grid}

## Transactions

| Transaction    | Description                                              | Direction               |
|--------------------|-------------------------------------------------------------|-----------------------------|
| `LAB-1`/`LAB-3`      | Orders/specimens clerked into iGene; reports distributed to NHS Trusts | NHS Trusts ↔ iGene            |
| `LAB-4`              | Work orders generated for StarLIMS tests                       | iGene → StarLIMS (via RIE, CSV export) |
| `LAB-35`/`LAB-36`    | Sub-order and result (StarLIMS as Sub-Contractor, iGene as Order Filler) | iGene ↔ StarLIMS               |
{:.grid}

## Current Process

North West Genomics was formed from two Genomic Laboratory Hubs — one in Manchester and one in Liverpool. Many tests for Liverpool hospitals were historically processed in Liverpool using StarLIMS at the Liverpool GLH.

The move to a single organisation includes consolidating onto one master LIMS, iGene. For ordering and reporting, this means:

- Orders and specimens are clerked into iGene. Most orders arrive on paper, though a growing number of NHS Trusts in the region now send electronic orders (IHE LAB-1). Some tests are allocated to satellite LIMS, and these are referred to as work orders.
- Reports still originate from a variety of LIMS in multiple formats, though this is also being centralised in iGene. NW Genomics is moving towards electronic transmission (HL7 ORU / IHE LAB-3, with FHIR Laboratory Report support planned) to return reports to NHS Trusts.

## Future Process

Work orders are currently entered into StarLIMS manually; this process will be automated. The data transferred includes patient demographics (NHS number, gender, date of birth, name), order details (placer and filler order numbers), and specimen information (type and identifier). Results will flow from StarLIMS to iGene, and from there be distributed to NHS hospitals.

The overall design is broadly the same as the IHE Inter Laboratory Workflow, with StarLIMS acting as the Sub-Contractor and iGene acting as the Order Filler. The order process described above corresponds to transaction LAB-35, and the result process corresponds to LAB-36.

This fits inside the IHE Laboratory Testing Workflow, as illustrated at [nw-gmsa.github.io/en/ILW.html#sub-orders-lab-35-and-lab-36](https://nw-gmsa.github.io/en/ILW.html#sub-orders-lab-35-and-lab-36).

### Overall Workflow

```mermaid
flowchart LR
    subgraph OF["iGene — Order Filler"]
        OF1[Orders and Specimens<br/>clerked into iGene]
        OF2[Reports distributed<br/>to NHS Trusts]
    end

    subgraph RIE["Regional Integration Engine / FHIR Repository"]
        R1[(FHIR Repository<br/>Patient, ServiceRequest,<br/>Specimen, Results)]
    end

    subgraph SC["StarLIMS — Sub-Contractor"]
        SC1[Work Orders received<br/>tests managed in StarLIMS]
        SC2[Results produced<br/>in StarLIMS]
    end

    OF1 -->|LAB-35: Sub-Order<br/>CSV export - daily| RIE
    RIE --> SC1
    SC2 -->|LAB-36: Sub-Order Result<br/>CSV| RIE
    RIE --> OF2
```

### Orders

The initial design for handling work orders is as follows:

1. Orders and specimens are clerked into iGene.
2. Work orders for StarLIMS are generated, with specific tests managed within StarLIMS.
3. Work orders are exported as CSV files on a daily basis.
4. The regional integration engine (RIE) picks up these files and stores them in the FHIR Repository as Patient, ServiceRequest, and Specimen resources. Details of this data model are available at [nw-gmsa.github.io/en/diagnostic-core.html](https://nw-gmsa.github.io/en/diagnostic-core.html).
5. A process then updates the StarLIMS SQL database with the work orders.

```mermaid
flowchart TD
    A[Orders and Specimens<br/>clerked into iGene] --> B[Work Orders created<br/>for StarLIMS tests]
    B --> C[Work Orders exported<br/>as CSV - daily]
    C --> D[Regional Integration Engine<br/>RIE picks up CSV files]
    D --> E[(FHIR Repository)]
    E -->|Patient, ServiceRequest,<br/>Specimen resources| F[StarLIMS SQL database<br/>updated with Work Orders]
```

### Results

The results workflow has not yet been designed, but the expectation is that a process will copy results from the StarLIMS SQL database into the FHIR Repository, after which the RIE will generate a CSV file for import into iGene.

```mermaid
flowchart TD
    A[(StarLIMS SQL database)] --> B[Process copies Results<br/>from StarLIMS SQL]
    B --> C[(FHIR Repository updated<br/>with Results)]
    C --> D[Regional Integration Engine<br/>RIE generates CSV file]
    D --> E[iGene imports<br/>Results CSV]
```

> **Note:** the Results process is anticipated, not yet finalised.

## Data Models

- [ServiceRequest](StructureDefinition-ServiceRequest.html) - work orders (placer and filler order numbers)
- [Specimen](StructureDefinition-Specimen.html) - specimen type and identifier
- [Patient](StructureDefinition-Patient.html) - NHS number, gender, date of birth, name

## Examples

No example resources are published yet for this scenario.
