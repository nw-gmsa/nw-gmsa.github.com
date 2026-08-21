# NW Genomics Regional Integration Engine (RIE)

<details>
<summary><strong>Glossary of terms used on this page</strong></summary>

- **IHE** — Integrating the Healthcare Enterprise: an international framework for how healthcare IT systems should exchange information.
- **LTW** — IHE Laboratory Testing Workflow: the IHE profile covering how test orders and reports flow between a hospital's EPR and a lab.
- **ILW** — IHE Inter Laboratory Workflow: the IHE profile covering how one lab refers or forwards work to another lab or analyser.
- **MHD / XDS** — IHE profiles for sharing documents (such as PDF reports) across organisations, e.g. into a shared care record.
- **TIE** — Trust Integration Engine: the local system inside an NHS Trust or lab that translates messages into and out of its own IT systems.
- **LIMS** — Laboratory Information Management System: the software a test lab uses to manage samples and results.
- **EPR** — Electronic Patient Record: a hospital's main clinical IT system.
- **HL7 v2 / FHIR** — the two families of data standard used to exchange healthcare information electronically. HL7 v2 is the older, message-based standard; FHIR is the newer, more flexible standard.
- **ORU_R01** — an HL7 v2 message type for delivering a test result/report.
- **OML_O21** — an HL7 v2 message type for placing a laboratory order.
- **MDM_T02** — an HL7 v2 message type for sending a document (e.g. a PDF report) into a record system.

</details>

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
    RIE -- "Test reports (PDF)" --> CareRecord

    Trusts -- Test requests --> RIE
    Trustz -. Future - Test requests .-> Portal
    Portal -. Future - Test requests .-> RIE
    RIE -- Test requests --> Labs
```

### Future potential

The RIE is also capable of interfacing to National Genomic Order Comms systems. This will allow users to create genomic orders via a portal or via 3rd party apps.

Potentially the RIE will be able to make use of this system for out of region orders, both incoming and outgoing.

Note: the RIE already has FHIR to V2 conversion capabilities which could be used to send reports to NHS Trusts, which may be a cost saving for NHS Trusts.

### Why this is different from a typical integration

Most NHS integrations connect an EPR directly to a LIMS, one pair at a time. The RIE works differently.

By sitting in the middle, the RIE hides the different HL7 LIMS variants used internally by North West Genomics and provides a single, consistent interface — this makes it much simpler for NHS Trusts to interoperate. The reverse is also true: North West Genomics doesn't need to work with multiple HL7 EPR standards from each Trust, since a single standard HL7 format is used instead.

Transformation to each Trust's EPR and each lab's LIMS still has to happen — but it's done by TIE (Trust Integration Engine) developers who are already familiar with those standards, for example NHS Trust developers for EPR HL7, and North West Genomics developers for LIMS.

This use of HL7/FHIR standards is also called a "Canonical Model" or "Data Contracts". It is neither an EPR standard nor a LIMS standard — it is a standard agreed between NHS Trusts and Diagnostics Services.

> **The sections below (Technical detail, Design, Data model) are written for architects and technical readers. If you just needed the summary, you can stop here.**

## Technical detail

The NW Genomics Regional Integration Engine (RIE) acts as a central messaging hub — effectively a "post office" — for North West Genomics.

The RIE handles message distribution and transformation to standardised HL7, distributing orders and reports to NHS Trusts. It has the potential to interface with national order comms systems, including the one currently in development by the NHS Genomic Medicine Service, for receiving standardised orders.

A second group of NHS Trusts create orders via the NHS Genomic Medicine Service Order Comms system, either electronically or through its web portal, rather than sending standardised HL7 orders directly to the RIE.

The RIE connects to multiple internal LIMS systems — including iGene, StarLIMS, and others — each using its own variant of HL7 messaging. It transforms these into standardised report messages for consumption by NHS Trusts. In the reverse direction, standardised orders received from NHS Trusts (or potentially national order comms) are transformed by the RIE into the appropriate HL7 flavour for each destination LIMS.

Reports are also sent to shared care record providers using HL7 MDM_T02 (the HL7 v2 message type for sending a document, such as a PDF report), currently for the Greater Manchester Care Record (GMCR) — this feed is cancer only. Similar services are likely to be provided to Lancashire and South Cumbria, and to the national Unified Genomic Care Record.

The RIE also exchanges NW Diagnostic Core Standard orders and reports with North East and Yorkshire Genomics, as a peer Genomic Laboratory Hub — ctDNA metadata only, with results removed.

> **Note:** Test Results and Work Orders also flow via the RIE, this is not shown in the diagram to aid clarity.

### Technical diagram

The diagram below labels each flow with its HL7 v2 message type: `ORU_R01` delivers a result/report, `OML_O21` places a laboratory order, and `MDM_T02` sends a document such as a PDF report.

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
    RIE -- "NW Diagnostic Core Standard reports (ORU_R01) Genomics" --> TR1
    RIE -- "NW Diagnostic Core Standard reports (ORU_R01) Genomics" --> TR2
    RIE -- "NW Diagnostic Core Standard reports (ORU_R01) Genomics" --> TR3
    RIE -- "NW Diagnostic Core Standard reports (ORU_R01)<br/>Genomics and Immunology" --> TR4

    TR1 -- "NW Diagnostic Core Standard Orders Genomics (V2 OML_O21 or FHIR O21)" --> RIE
    TR2 -- "NW Diagnostic Core Standard Orders Genomics (V2 OML_O21 or FHIR O21)" --> RIE
    TR3 -- "NW Diagnostic Core Standard Orders Genomics (V2 OML_O21 or FHIR O21)" --> RIE
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

    RIE <-. NW Diagnostic Core Standard Orders and Reports<br/>ctDNA metadata only - results removed .-> NEY
```

## Design

The design generally follows Domain Driven Design principles, plus related data engineering principles such as Data Mesh and Data Contracts. The domain split follows IHE profiles as follows:

- Interactions between NHS Trusts/EPR and North West Genomics follow IHE Laboratory Testing Workflow (LTW) interactions LAB-1 (placing an order) and LAB-3 (returning a report).
- Interactions between LIMS follow IHE Inter Laboratory Workflow (ILW).
- Interactions between NW Genomics and shared care record providers currently follow IHE Mobile Access to Health Documents (MHD) — the older version of this profile is known as Cross Enterprise Document Sharing (XDS).
- Interactions between LIMS and Analysers follow IHE Laboratory Testing Workflow (LTW) interactions LAB-4 (a lab ordering further analysis internally) and LAB-5 (the analyser returning its results).

```mermaid
flowchart LR
    subgraph D1["NHS Trust / EPR Domain — IHE LTW LAB-1 & LAB-3"]
        Trusts[NHS Trusts - NW Region e.g. EPR]
        Trustz[NHS Trusts - NW Region and Other]
        Portal[National Genomic<br/>Order Comms]
    end

    subgraph D2["North West Genomics Domain — IHE ILW"]
        RIE[("Regional Integration Engine<br/>(the 'post office' or a TIE)")]
        Labs[Test Labs e.g. LIMS]
        Analysers[Analysers, Sub-contracted LIMS and<br/>Analytic Processing]
    end

    subgraph D3["Shared Care Record Domain — IHE MHD / XDS"]
        CareRecord[Shared Care Records<br/>e.g. GMCR or UGR]
    end

    Analysers -- "Test results<br/>(LTW LAB-5)" --> Labs
    Labs -- "Work Orders<br/>(LTW LAB-4)" --> Analysers

    Labs -- Test reports --> RIE
    RIE -- "Test reports<br/>(LTW LAB-3)" --> Trusts
    RIE -- "Test reports PDF<br/>(MHD / XDS)" --> CareRecord

    Trusts -- "Test requests<br/>(LTW LAB-1)" --> RIE
    Trustz -. "Future - Test requests" .-> Portal
    Portal -. "Future - Test requests<br/>(LTW LAB-1)" .-> RIE
    RIE -- Test requests --> Labs
```

### Data model

#### Diagnostic Core

The data models used in these interactions follow a core canonical model ([nw-gmsa.github.io/en/diagnostic-core.html](https://nw-gmsa.github.io/en/diagnostic-core.html)) which is documented as a series of HL7 FHIR profiles and can be implemented in HL7 v2, ASTM, FHIR and other formats.

Although unsolicited reports are supported, the default design is built around multiple closed loop referrals. This is particularly dependent on a number of identifiers and codes, including:

- **Account Number** (known in the NHS England Data Dictionary as Hospital Spell Identifier) — links multiple diagnostic referrals with an NHS Trust's Episodes/Spells.
- **Placer Order Number** — links specific referrals between an NHS Trust and a LIMS.
- **NHS Number**
- **Medical Record Number** (also known as Hospital Number or NHS England Local Patient Identifier)
- **Requested Procedure Code** — for the Genomics Test Directory Code.

In everyday terms: a patient has a referral (Service Request), which leads to a specimen being collected and a report being produced.

```mermaid
erDiagram
    PATIENT ||--o{ SERVICE_REQUEST : "is subject of"
    PATIENT ||--o{ DIAGNOSTIC_REPORT : "is subject of"
    SERVICE_REQUEST ||--o{ SPECIMEN : "requests collection of"
    SERVICE_REQUEST ||--o{ DIAGNOSTIC_REPORT : "is basis for"
    SPECIMEN ||--o{ DIAGNOSTIC_REPORT : "is basis for"

    PATIENT {
        string NHS_Number
        string Medical_Record_Number
        string Account_Number
    }
    SERVICE_REQUEST {
        string Placer_Order_Number
        string Requested_Procedure_Code
        string Status
    }
    SPECIMEN {
        string Specimen_Identifier
        string Specimen_Type
        string Collected_DateTime
    }
    DIAGNOSTIC_REPORT {
        string Report_Identifier
        string Status
        string Conclusion
    }
```

Codes tend to follow the NHS England Data Dictionary and include ODS and SNOMED CT concepts. LOINC is also used where it is more practical to do so — codes often don't exist in SNOMED CT, and LOINC is more widely supported by LIMS and EPR systems.

> The NW Diagnostic Core tends to be used between [bounded contexts](https://martinfowler.com/bliki/BoundedContext.html) which are generally between NHS Trusts, ICS/Regions and North West Genomics.
>
> In Data Engineering terms, this is also known as a [Data Contract](https://en.wikipedia.org/wiki/Data_contract).
>
> The main aim for both is to reduce the need for 'anti-corruption layers' which often exist in HL7 v2 and (UK) FHIR to transform between different models used by EPRs.
>
> This should not be confused with UK Core which is a base HL7 standard.

#### Genomic Model - Placer Order and Reports

The genomic-specific data model builds on the Diagnostic Core (the main model used for interactions IHE LTW LAB-1 and LAB-3), which is very similar to de-facto models used in other diagnostic services such as imaging or pathology.
At present this model is mostly unstructured, using a PDF attachment (in FHIR this is DocumentReference + Binary, and in HL7 v2 this is OBX type ED).

In everyday terms: the same referral and specimen as above, but the report is attached as a document (e.g. a PDF) rather than as structured data.

```mermaid
erDiagram
    SERVICE_REQUEST ||--o{ SPECIMEN : "requests collection of"

    SERVICE_REQUEST ||--o{ DIAGNOSTIC_REPORT : "is basis for"

    DOCUMENT_REFERENCE }o--|| DIAGNOSTIC_REPORT : "result of"

    SERVICE_REQUEST {
        string Placer_Order_Number "LAB-1, from EPR/Trust"
        string Requested_Procedure_Code
        string Status
    }

    SPECIMEN {
        string Specimen_Identifier
        string Specimen_Type
        string Collected_DateTime
    }
    DOCUMENT_REFERENCE {
        string Document_Type "Genetic report SCT 1054161000000101"
        string attachment "PDF"
    }
    DIAGNOSTIC_REPORT {
        string Report_Identifier
        string Status
        string Conclusion
    }
```

> **Note:** The DocumentReference + attachment currently forms the basis for interactions with shared care record providers (i.e. this is what is used to generate MDM_T02 for GMCR).

#### Genomic Model - Filler Order and Reports

The interactions between the LIMS and Analysers/Analytic Processors (LAB-4 and LAB-5) add detailed genomic data models. These are referred to here as filler orders, with the simpler LAB-1 and LAB-3 referred to as placer orders.

These filler orders add Observations (results from DiagnosticReport). For Omics DSS these observations are known as Reportable Variant, following [build.fhir.org/ig/HL7/genomics-reporting](https://build.fhir.org/ig/HL7/genomics-reporting/).

In everyday terms: this adds the internal lab-to-analyser order (Filler Service Request) and the individual result values (Observations, e.g. a specific variant found) that sit behind the report.

```mermaid
erDiagram
    SERVICE_REQUEST ||--o{ FILLER_SERVICE_REQUEST : "basedOn (placer order)"
    FILLER_SERVICE_REQUEST ||--o{ SPECIMEN : "requests collection of"

    FILLER_SERVICE_REQUEST ||--o{ DIAGNOSTIC_REPORT : "is basis for"
    SPECIMEN ||--o{ OBSERVATION : "subject of"
    OBSERVATION }o--|| DIAGNOSTIC_REPORT : "result of"

    SERVICE_REQUEST {
        string Placer_Order_Number "LAB-1, from EPR/Trust"
        string Requested_Procedure_Code
        string Status
    }
    FILLER_SERVICE_REQUEST {
        string Filler_Order_Number "LAB-4, LIMS to Analyser"
        string BasedOn_Placer_Order_Number
        string Status
    }
    SPECIMEN {
        string Specimen_Identifier
        string Specimen_Type
        string Collected_DateTime
    }
    OBSERVATION {
        string Observation_Code
        string Value
        string Reportable_Variant "Omics DSS: HL7 Genomics Reporting IG"
    }
    DIAGNOSTIC_REPORT {
        string Report_Identifier
        string Status
        string Conclusion
    }
```

#### Future Composition / Aggregated Laboratory Report

This is a placeholder for future work, probably NHS England Unified Genomics Care Record phase II.

In Domain Driven Design this is a pattern called Aggregate, which collates multiple events into a single entity. This is already a feature of the design above, the placer order cascades into multiple hierarchical entities.

In health informatics this is a pattern called Composition; it focuses on the output format, which in FHIR is called a FHIR Document (and in HL7 v3 Clinical Document Architecture).


