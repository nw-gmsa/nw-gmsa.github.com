# DSS and iGene Integration Overview

The current process works as follows:

1. A work order is created in iGene (for DLIMS)
2. Once the test in DLIMS is complete, the results are sent to Omics DSS
3. Omics DSS processes the results
4. The processed output is sent to iGene

## Proposed Change

Rather than sending processed output directly to iGene, it will instead be converted to a FHIR Genomics Report and stored in the FHIR Repository, following the HL7 Genomic Reporting standard. The Regional Integration Engine will then transform this data into a format suitable for iGene (likely a CSV file).

For this to work, the DLIMS work order will be exported to the FHIR Repository — mirroring the process already used for StarLIMS — so a copy of the work order is held there. Omics DSS will then access the work order metadata via the FHIR Repository, so results can be correctly linked back to the originating work order.

## Diagram

```mermaid
flowchart TD
    A[iGene: Work Order Created] -->|for DLIMS| B[DLIMS: Test Performed]
    A -.->|<b>Proposed process</b><br/>DLIMS Work Order metadata export<br/>same process as StarLIMS| F

    B -->|Test Results| C[Omics DSS]
    C -->|Processes Results,<br/>linked to Work Order metadata| D[Processed Output]
    F -.->|<b>Proposed process</b><br/>Omics DSS reads<br/>Work Order metadata| C

    D -.->|Current process<br/>direct send - being replaced| G[iGene]

    D -->|<b>Proposed process</b><br/>Convert to FHIR Genomics Report and link to the Work Order| F[(FHIR Repository<br/>HL7 Genomic Reporting standard)]
    F -->|Results + linked Work Order metadata| E[Regional Integration Engine]
    E -->|Transforms to CSV| G

    style F fill:#e8f4fd,stroke:#1c7ed6,stroke-width:2px
    style E fill:#fff3bf,stroke:#f08c00,stroke-width:2px
    style D fill:#f8f9fa,stroke:#868e96
```
