<div class="alert alert-danger" role="alert">
This is for information/analysis purposes only and is not a planned piece of work.
</div>

## References

1. [Inter Laboratory Workflow (ILW)](ILW.html) - the generic sub-order/reflex pattern this follows (`LAB-35`/`LAB-36`)
2. [Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html) - the related HODS-orchestrated scenario
3. [Cancer Background Information for Use Cases - Colorectal Cancer Diagnostic Pathways](CancerNOS.html#diagnostic-cancer-pathways) - this use case can often occur around cancer
4. LAB-40 HL7 v2.9 SET <a href="https://wiki.ihe.net/index.php/Specimen_Event_Tracking" _target="_blank">IHE Specimen Event Tracking (SET)</a> and <a href="https://hl7-definition.caristix.com/v2/HL7v2.7/TriggerEvents/OSM_R26" _target="_blank">Hl7 v2.7 OSM_R26 Unsolicited Specimen Shipment Manifest Message</a>

## Clinical Pathway Overview

### What is being tested

A genomic/molecular test that follows on from a pathology result - typically a
tumour biopsy where the histology findings indicate that genomic testing is now
needed (e.g. to identify a targetable mutation). Rather than the referring clinician
placing a separate genomics order, the pathology laboratory reflexes the sample
onward for genomic testing.

### The end-to-end clinical journey

1. **Patient presents** - a clinician orders a pathology test (e.g. on a biopsy) for a suspected condition, often cancer.
2. **Sample taken** - the tissue/blood sample is collected and sent for pathology.
3. **Pathology testing performed** - the pathology laboratory examines the sample. *(`LAB-1`/`LAB-3`.)*
4. **Genomic reflex, if indicated** - based on the pathology finding, the sample is reflexed on for genomic testing, either by the pathology lab or (less commonly) ordered directly by the clinician. *(`LAB-35`/`LAB-36`, or a separate `LAB-1`.)*
5. **Genomic testing performed**.
6. **Report reaches the clinician** - either via the pathology laboratory or directly from genomics. *(`LAB-3`.)*
7. **Clinical decision** - diagnosis and treatment planning is informed by the combined pathology and genomic result.

```mermaid
flowchart LR
    A[Pathology test ordered<br/>e.g. biopsy] --> B[Sample taken]
    B --> C[Pathology<br/>testing]
    C -->|Reflexed if indicated| D[Genomic<br/>testing]
    C --> E[Report reaches<br/>clinician]
    D --> E
    E --> F[Diagnosis and<br/>treatment planning]
```

### Why this matters for developers

- The genomic order can arrive **two ways**: reflexed from pathology (`LAB-35`/`LAB-36`) or placed directly by the clinician (`LAB-1`) - both must be supported, see the Transactions table below.
- The reflex path reuses the ILW sub-order pattern even though pathology and genomics sit within the same NW region, rather than different Genomic Laboratory Hubs - this is a reflex-within-region use of the sub-order pattern, not a genuine external sub-contract.

## Actors

| IHE Actor                                                                                                            | Role                                    | System (example)                        |
|---------------------------------------------------------------------------------------------------------------------------|----------------------------------------|-----------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html)                                                                            | Referring clinician                      | MFT EPIC                                  |
| [Order Filler](ActorDefinition-OrderFiller.html) (receiving `LAB-1`) / [Requestor](ActorDefinition-Requestor.html) (ILW, if sending `LAB-35`) | Pathology laboratory                     | MFT EPIC Beaker or CFT Shire               |
| [Order Filler](ActorDefinition-OrderFiller.html) / [Subcontractor](ActorDefinition-Subcontractor.html) (ILW, if reflexed)   | Genomics laboratory                      | iGene                                     |
{:.grid}

## Transactions

| Transaction | Description                          | Direction                                    |
|-------------|-----------------------------------------|------------------------------------------------|
| `LAB-1`     | Laboratory Order (Pathology)              | Order Placer → Order Filler (Pathology)          |
| `LAB-3`     | Laboratory Report (Pathology)             | Order Filler (Pathology) → Order Placer          |
| `LAB-1`     | Laboratory Order (Genomics, if placed directly by Order Placer) | Order Placer → Order Filler (Genomics) |
| `LAB-35`    | Genomic Reflex Order (if placed by Pathology) | Order Filler (Pathology) → Order Filler (Genomics) |
| `LAB-36`    | Genomic Report (reflex)                   | Order Filler (Genomics) → Order Filler (Pathology) |
| `LAB-3`     | Laboratory Report (Genomics, either path) | Order Filler (Genomics or Pathology) → Order Placer |
{:.grid}

## Current Process

### Use Case: Genomic Test Order following on from Pathology Test Order

```mermaid

graph TD;
    subgraph Pathology["Pathology - Greater Manchester ICS"]
        OrderPlacer[Order Placer<br/>e.g. MFT EPIC] --> |"1. Sends Laboratory Order (Pathology)<br/>ORM_O01 or OML_O21"| OrderFiller["Order Filler (Pathology)<br/>e.g. MFT EPIC Beaker or CFT Shire"]
        OrderPlacer --> |"2. Asks for (Orders)"| SpecimenCollection
        SpecimenCollection[Specimen Collection] --> |3. Sends Specimen| OrderFiller
        OrderFiller --> |4. Send Laboratory Report<br/>ORU_R01| OrderPlacer
    end 
    subgraph Genomics["Genomics - North West Region"]
      OrderPlacerG["Order Placer (Pathology)"] --> |5. Send Laboratory Order<br/>OML_O21| OrderFillerG["Order Filler (Genomics)<br/>e.g. iGene"]
      OrderPlacerG --> |6. Sends Specimen| OrderFillerG
      OrderFillerG --> |7. Sends Laboratory Report<br/>ORU_R01| OrderPlacerG
    end

    OrderFiller --> OrderPlacerG
    OrderFiller --> |8. Sends Laboratory Report<br/>ORU_R01| OrderPlacer
```

<div class="alert alert-info" role="alert">
<b>Specimen Event Tracking:</b> See LAB-40 HL7 v2.9 SET <a href="https://wiki.ihe.net/index.php/Specimen_Event_Tracking" _target="_blank">IHE Specimen Event Tracking (SET)</a> and  <a href="https://hl7-definition.caristix.com/v2/HL7v2.7/TriggerEvents/OSM_R26" _target="_blank">Hl7 v2.7 OSM_R26 Unsolicited Specimen Shipment Manifest Message</a>
</div>

<img style="padding:3px;width:95%;" src="LTW Use Case 3.drawio.png" alt="Genomic LTW Business Process - Use Case 3"/>
<br clear="all">
<p class="figureTitle">Genomic LTW Business Process - Use Case 3</p> 
<br clear="all">

In this use case the original order is raised by the `Order Placer` and sent to a Pathology LIMS (`Pathology Order Filler`). The Pathology LIMS follows the processes outlined in [Process Flow: Genomic Test Order](LTW.html#lab-1-process-flow) and [Process Flow: Genomic Test Report](LTW.html#lab-3-process-flow) for pathology testing.  
As part of this testing, the clinical process requires a genomics test to be performed.
This genomics process is largely the same except for:
- The order is sent as one interaction as the sample does not need to be collected.
- The order should contain the pathology report detailing the results of the pathology tests.

```mermaid
sequenceDiagram


participant EPR as Order Placer
participant LIMSP as Order Filler (Pathology)
participant LIMSG as Order Filler (Genomics)


EPR ->> LIMSP: Submit Laboratory Order O21 (LAB-1)

LIMSP -->> LIMSP : Performs Test

opt Order Filler (Pathology) creates Genomic Order

    note over LIMSP,LIMSG: Same specimen can be reused for multiple tests

    LIMSP ->> LIMSG: Submit Genomic Reflex Order O21 (LAB-35)
    LIMSP -->> LIMSG: Send Specimen (not a technical interaction)
    LIMSG ->> LIMSP: Send Genomic Report R01 (LAB-36)
end

LIMSP ->> EPR: Send Laboratory Report R01 (LAB-3)
```

#### Main Process Flow

- Initial Laboratory Order
    - Step 1: The Order Placer submits a Laboratory Order O21 (LAB-1) to Order Filler (Pathology).
    - Step 2: Order Filler (Pathology) sends back a Laboratory Report R01 (LAB-3).
    - Note: As required by local clinical guidelines, this step can also include imaging orders.
- Optional Path 1 – Genomic Order created by original order placer
    - Condition: [Genomic Order created by original order placer].
    - Note: The same specimen can be reused for multiple tests.
    - Step 3: Order Placer submits a Genomic Order O21 (LAB-1) to Order Filler (Genomics).
    - Step 4: Specimen is sent from Order Placer to Genomics.
    - Step 5: Order Filler (Genomics) sends a Genomic Report R01 (LAB-3) back to the Order Placer.
- Optional Path 2 – Genomic Order created by Pathology
    - Condition: [Order Filler (Pathology) creates Genomic Order].
    - Note: The same specimen can be reused for multiple tests.
    - Step 6: Order Filler (Pathology) submits a Genomic Order O21 (LAB-35) to Order Filler (Genomics).
    - Step 7: Specimen is sent from Pathology to Genomics.
    - Step 8: Order Filler (Genomics) sends a Genomic Report R01 (LAB-36) to Order Filler (Pathology).
    - Step 9: Pathology sends the Genomic Report R01 (LAB-3) to the Order Placer.

This use case can often occur around cancer - see [Cancer Background Information for Use Cases](CancerNOS.html#diagnostic-cancer-pathways)
for the Colorectal Cancer diagnostic pathway example.

## Future Process

No distinct future-state changes are currently defined for this pathway.

## Data Models

- [ServiceRequest](StructureDefinition-ServiceRequest.html) - `LAB-1` placer orders and `LAB-35` reflex sub-order
- [DiagnosticReport](StructureDefinition-DiagnosticReport.html) - `LAB-3`/`LAB-36` reports

## Examples

No example resources are published yet for this scenario.

## Security Considerations

Includes:

- OAuth2 Standard for [Authorisation](api-security.html#authorisation---oauth2)
  - including use of JWT access tokens and future support for [SMART-on-FHIR Scopes](api-security.html#scopes)
- FHIR AuditEvent/IHE BALP for [Audit Logging](api-security.html#audit-logging)
- TLS for [Transport Security/Encryption](api-security.html#encryption)

## Developer Guides

No [Developer Guides](DeveloperGuides.html) notebook covers this use case yet.
