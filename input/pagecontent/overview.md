# NW Genomics Regional Integration Engine (RIE)

## Overview (non-technical)

Think of the Regional Integration Engine (RIE) as a **post office for genomic test information** across North West Genomics.

- **Test labs** (the LIMS systems that process genomic tests) send their results to the RIE.
- The RIE **translates and sorts** these results into a standard format.
- The RIE **delivers** results to NHS Trusts in the North West region, and also shares them (as PDF documents) with shared care record systems, like the Greater Manchester Care Record, so a patient's wider care team can see them.

Test requests work the same way in reverse: an NHS Trust orders a test, the RIE passes it to the right lab in the format that lab needs. North West Trusts can send requests directly to the RIE, while Trusts from the North West and elsewhere can also order through a national ordering system / web portal.

### Simplified diagram

```mermaid
flowchart LR
    Analysers[Analysers, Sub-contracted LIMS and<br/>Analytic Processing]
    Labs[Test Labs e.g. LIMS]
    RIE[("Regional Integration Engine<br/>(the 'post office' or a TIE)")]
    Trusts[NHS Trusts - NW Region e.g. EPR]
    Trustz[NHS Trusts - NW Region and Other]
    Portal[National Genomic<br/>Order Comms]
    CareRecord[Shared Care Records<br/>e.g. GMCR or UGR]

    Analysers -- Test results --> Labs

    Labs -- Test reports --> RIE
    Labs -- Work Orders --> Analysers
    RIE -- Test reports --> Trusts
    RIE -- Test reports (PDF) --> CareRecord

    Trusts -- Test requests --> RIE
    Trustz -. Future - Test requests .-> Portal
    Portal -. Future - Test requests .-> RIE
    RIE -- Test requests --> Labs
```

## Technical detail

The NW Genomics Regional Integration Engine (RIE) acts as a central messaging hub — effectively a "post office" — for North West Genomics.

The RIE handles message distribution and transformation to standardised HL7, distributing orders and reports to NHS Trusts. It has the potential to interface with national order comms systems, including the one currently in development by the NHS Genomic Medicine Service, for receiving standardised orders.

A second group of NHS Trusts create orders via the NHS Genomic Medicine Service Order Comms system, either electronically or through its web portal, rather than sending standardised HL7 orders directly to the RIE.

The RIE connects to multiple internal LIMS systems — including iGene, StarLIMS, and others — each using its own variant of HL7 messaging. It transforms these into standardised report messages for consumption by NHS Trusts. In the reverse direction, standardised orders received from NHS Trusts (or potentially national order comms) are transformed by the RIE into the appropriate HL7 flavour for each destination LIMS.

Reports are also sent to shared care record providers using HL7 MDM_T02, currently for the Greater Manchester Care Record (GMCR) — this feed is cancer only. Similar services are likely to be provided to Lancashire and South Cumbria, and to the national Unified Genomic Care Record.

The RIE also exchanges NW standard orders and reports with North East and Yorkshire Genomics, as a peer Genomic Laboratory Hub — ctDNA metadata only, with results removed.

> **Note:** Test Results and Work Orders also flow via the RIE, this is not shown in the diagram to aid clarity.

### Technical diagram

```mermaid
flowchart LR
    subgraph LIMS["Internal LIMS Systems"]
        L1[LIMS iGene<br/>HL7 flavour A]
        L2[LIMS StarLIMS<br/>HL7 flavour B]
        L3[LIMS Histotrac<br/>HL7 flavour C]
    end

    subgraph TestResults["Analysers and Analytic Processing"]
        CEP[Cepheid]
        ODSS[Omics DSS]
    end

    subgraph RIE["NW Genomics Regional Integration Engine"]
        direction TB
        T[Message Distribution and Transform to<br/>standardised HL7]
    end

    subgraph Trusts["NHS Trusts - direct HL7"]
        TR1[MFT]
        TR2[Alder Hey]
        TR3[Liverpool Women's]
        TR4[Clatterbridge<br/>Immunology test requests +<br/>Genomic and Immunology reports]
    end

    subgraph TrustsGMS["NHS Trusts - via GMS Order Comms"]
        TG1[Trust D<br/>electronic]
        TG2[Trust E<br/>web portal]
    end

    NOC[National Genomic Order Comms]

    subgraph SCR["Shared Care Record Providers"]
        SCR1["Greater Manchester Care Record (GMCR)"]
        SCR2[Lancashire & South Cumbria - in elaboration]
        SCR3[National Unified Genomic<br/>Care Record - in elaboration]
    end

    NEY[North East and Yorkshire<br/>Genomics]

    CEP -- Test results --> L1
    ODSS -- Test results --> L1

    L1 -- Work Orders --> L2

    L1 -- Reports --> RIE
    L2 -. Potential - Reports .-> RIE
    L3 -- Reports --> RIE
    RIE -- NW standard reports (ORU_R01) Genomics --> TR1
    RIE -- NW standard reports (ORU_R01) Genomics --> TR2
    RIE -- NW standard reports (ORU_R01) Genomics --> TR3
    RIE -- NW standard reports (ORU_R01)<br/>Genomics and Immunology --> TR4

    TR1 -- NW Standard Orders Genomics (V2 OML_O21 or FHIR O21) --> RIE
    TR2 -- NW Standard Orders Genomics (V2 OML_O21 or FHIR O21) --> RIE
    TR3 -- NW Standard Orders Genomics (V2 OML_O21 or FHIR O21) --> RIE
    TR4 -- Immunology test requests --> RIE
    RIE -- Orders --> L1
    RIE -. Potential - Orders .-> L2
    RIE -- Orders --> L3

    RIE <-. Future - Potential interface - Orders .-> NOC

    TG1 -. Future - Orders .-> NOC
    TG2 -. Future - Orders .-> NOC

    RIE -- MDM_T02 reports - cancer only --> SCR1
    RIE -. Likely future .-> SCR2
    RIE -. Likely future .-> SCR3

    RIE <-. NW Standard Orders and Reports<br/>ctDNA metadata only - results removed .-> NEY
```
