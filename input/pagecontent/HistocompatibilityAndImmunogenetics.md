# Clatterbridge Chimerism Testing — Process Overview

## Original Process

Chimerism testing at Clatterbridge originally worked as follows:

1. Clatterbridge (Meditech EPR) sent an ORM_O01 message to the Clatterbridge TIE, which forwarded it to the LUFT TIE, which in turn forwarded it to the iLab LIMS.
2. Once testing was complete, Clatterbridge (Meditech EPR) received a structured ORU_R01 message back from iLab, routed via the LUFT TIE and then the Clatterbridge TIE.

This closed-loop process corresponds to the IHE Laboratory Testing Workflow, in which the ORM_O01 message is referred to as LAB-1 and the ORU_R01 message as LAB-3.

```mermaid
sequenceDiagram
    participant CM as Clatterbridge Meditech (EPR)
    participant CTIE as Clatterbridge TIE
    participant LTIE as LUFT TIE
    participant iLab as iLab LIMS

    CM->>CTIE: ORM_O01 (LAB-1)
    CTIE->>LTIE: ORM_O01 (LAB-1)
    LTIE->>iLab: ORM_O01 (LAB-1)
    Note over iLab: Testing performed
    iLab->>LTIE: ORU_R01 (LAB-3)
    LTIE->>CTIE: ORU_R01 (LAB-3)
    CTIE->>CM: ORU_R01 (LAB-3)
```

## Interim Process

Following organisational restructuring, testing was transferred to North West Genomics (hosted by Manchester Foundation Trust). As part of this change, Histotrac replaced iLab as the testing system. The electronic exchange of results was discontinued, and HODS was adopted as an interim order comms system for Clatterbridge users to submit lab orders.

```mermaid
sequenceDiagram
    participant User as Clatterbridge User
    participant HODS as HODS (Order Comms)
    participant Histotrac as Histotrac (NW Genomics / MFT)

    User->>HODS: Manual order entry
    Note over HODS,Histotrac: No electronic order exchange
    Note over Histotrac: Testing performed
    Note over HODS,Histotrac: No electronic result exchange
    Note over User: Results retrieved outside EPR
```

## Future Process

The current project aims to re-establish electronic ordering and reporting. The new message flows are:

- Clatterbridge Meditech → Clatterbridge TIE → NW Genomics Regional Integration Engine (RIE) → Histotrac — still an ORM_O01 message, though no longer classified as LAB-35 due to the involvement of a regional integration engine.
- Histotrac → NW Genomics Regional Integration Engine → Clatterbridge TIE → Clatterbridge Meditech — still an ORU_R01 message, classified as LAB-36.

Communication between the Clatterbridge TIE and the NW RIE will follow the NW Genomics HL7 v2 standard — a data contract shared across NHS Trusts in the North West. NW Genomics will not build Trust-specific transformations; instead, the standard is designed collectively to meet the needs of all participating NHS organisations. 

The data contract (North West Genomics HL7 v2 standard) is based on a union of:

- NHS England HL7 v2 ADT
- DHCW (NHS Wales) HL7 v2 ORU
- NHS Data Model and Dictionary

HL7 v2.5.1 was chosen as the version for the standard, as it uses a model compatible with HL7 FHIR and also aligns with the version used by NHS Wales (DHCW).

> **Note:** The Data Contract only exists between NHS Trusts and NW Genomics — it does not apply to local integrations with EPR or LIMS systems. See also the [Canonical Data Model](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CanonicalDataModel.html) pattern.

The NW Genomics RIE will handle the necessary transformations between the NW HL7 standard and Histotrac's HL7 v2 format.

This separation of responsibilities enables modular delivery. For example, the reporting flow from NW Genomics to Clatterbridge can be implemented and tested independently — which is useful for validating the firewall between NW Genomics (hosted by MFT) and Clatterbridge.

This modularity also allows components to be reused across other projects. For instance, the iGene Genomic Reports feed into the RIE for Clatterbridge has already been built, and — being nearly identical to the Histotrac reports flow — can be used both to test the firewall and to inform development of the NW Genomics RIE-to-Clatterbridge reports feed.

```mermaid
sequenceDiagram
    participant CM as Clatterbridge Meditech (EPR)
    participant CTIE as Clatterbridge TIE
    participant RIE as NW Genomics RIE
    participant iGene as iGene

    iGene->>RIE: ORU_R01 (iGene format)
    RIE->>CTIE: ORU_R01 (transformed, LAB-36)
    CTIE->>CM: ORU_R01 (LAB-36)

    Note over CTIE,RIE: Used to test firewall and inform RIE-to-Clatterbridge reports feed
```

It has not yet been decided, from a business process perspective, whether HODS will be replaced as the order comms system. It is desired that orders originating from Meditech are reinstated.

```mermaid
sequenceDiagram
    participant CM as Clatterbridge Meditech (EPR)
    participant CTIE as Clatterbridge TIE
    participant RIE as NW Genomics RIE
    participant Histotrac as Histotrac

    CM->>CTIE: ORM_O01
    CTIE->>RIE: ORM_O01 (NW Genomics HL7 v2 standard - LAB-35)
    RIE->>Histotrac: ORM_O01 (transformed to Histotrac HL7 v2)
    Note over Histotrac: Testing performed
    Histotrac->>RIE: ORU_R01 (Histotrac HL7 v2)
    RIE->>CTIE: ORU_R01 (NW Genomics HL7 v2 standard - LAB-36)
    CTIE->>CM: ORU_R01

    Note over CTIE,RIE: Data contract: NW Genomics HL7 v2 standard
    Note over RIE,Histotrac: RIE performs HL7 transformation
```
