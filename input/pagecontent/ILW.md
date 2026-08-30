<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## References

1. [IHE Inter Laboratory Workflow](https://wiki.ihe.net/index.php/Inter_Laboratory_Workflow)
2. [IHE Laboratory Technical Framework Supplement Inter-Laboratory Workflow (ILW)](https://www.ihe.net/uploadedFiles/Documents/Laboratory/IHE_LAB_Suppl_ILW.pdf)

## Actors and Transactions

| Actor                                               | Definition                                                                                                                                                                                             |
|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Requestor](ActorDefinition-Requestor.html)         | A hospital laboratory that subcontracts a part of an Order or of an Order Group to another laboratory, e.g. Pathology or HODS. Is known in IHE LTW as [Order Placer](ActorDefinition-OrderPlacer.html) |
| [Subcontractor](ActorDefinition-Subcontractor.html) | Receives Sub-orders, acknowledges specimen arrival and sends back results fulfilling these Sub-orders, e.g. Genomics. Is known in IHE LTW as [Order Filler](ActorDefinition-OrderFiller.html)                                                           |
{:.grid}

## Overview

See Ref 1 for details.

<img style="padding:3px;width:80%;" src="Ihe_lab_ilw_proc.jpg" alt="IHE ILW Summary"/>
<br clear="all">
<p class="figureTitle">IHE ILW Summary</p> 
<br clear="all">

```mermaid
graph LR;

    OrderPlacer

    subgraph OrderFiller;
        

        OrderManagement --> WriteReport
    end

    ExtOrderPlacer[External OrderFiller] 
    OrderManagement --> |"Laboratory Order LAB-35<br/>reflex or sub-contract"| ExtOrderPlacer
    ExtOrderPlacer --> |Laboratory Report LAB-36| OrderManagement 

    OrderPlacer --> |Laboratory Order LAB-1| OrderFiller
    WriteReport --> |Laboratory Report LAB-3| OrderPlacer

    classDef purple fill:#E1D5E7;

    classDef yellow fill:#FFF2CC;
    classDef pink fill:#F8CECC
    classDef green fill:#D5E8D4;
    classDef blue fill:#DAE8FC;
    classDef orange fill:#FFE6CC;

```

## Sub-orders LAB-35 and LAB-36

```mermaid
sequenceDiagram
    participant clinician as Order Placer<br/>Clinician (EHR)
    participant nurse as Specimen Collection<br/>Clinician/Nurse
    participant LIMS as Order Filler<br/>LIMS 
    participant Sub as Subcontractor<br/>e.g. other GMSA

    clinician -->> clinician: Creates Order
    note over clinician,LIMS: IHE LAB-1 Laboratory Order
    clinician ->> LIMS: Sends Laboratory Order
    clinician -->> nurse: Requests specimen collection
    nurse -->> nurse: Collect Specimen
    nurse -->> LIMS: Ship Specimen
    opt
        LIMS-->> LIMS : Perform Test
    end
    note over LIMS,Sub: IHE LAB-35 Sub-order Management
    LIMS ->> Sub: Send Reflex Order
    LIMS -->> Sub: Ship Specimen
    Sub -->> Sub : Perform Test
    Sub -->> Sub: Write Report
    note over LIMS,Sub: IHE LAB-36 Sub-order Results Delivery
    Sub ->> LIMS: Sends Laboratory Report
    opt
        LIMS -->> LIMS: Write Report
    end
    note over clinician,LIMS: IHE LAB-3 Laboratory Report
    LIMS ->> clinician: Sends Laboratory Report
```

### Sub Order Management (LAB-35)

<div class="alert alert-info" role="alert">
<b>Domain Archetype:</b> <a href="diagnostic-core.html#filler-order" _target="_blank">Diagnostic Core - Filler Order</a> 
</div>

<div class="alert alert-info" role="alert">
<b>Interaction:</b> <a href="MQ.html" _target="_blank">Message Exchange</a> LAB-35
</div>

Used by these Use Cases:
- [Distributed WGS (dWGS)](dWGS.html)
- [Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html)
- [Cheshire and Merseyside Pathology](CheshireAndMerseysidePathology.html)
- [Regional Integration Engine (RIE)](overview.html)
- [StarLIMS / iGene Integration](starLIMS.html)

### Sub-order Results Delivery (LAB-36)

<div class="alert alert-info" role="alert">
<b>Domain Archetype:</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">Genomic Test Report</a> 
</div>

<div class="alert alert-info" role="alert">
<b>Interaction:</b> <a href="MQ.html" _target="_blank">Message Exchange</a> LAB-36
</div>

Used by these Use Cases:
- [Distributed WGS (dWGS)](dWGS.html)
- [Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html)
- [Regional Integration Engine (RIE)](overview.html)
- [StarLIMS / iGene Integration](starLIMS.html)


### Modernisation

The current IHE ILW specification relies on HL7 v2.x, HL7 v3, and IHE XDS. Several modernization paths are available, most of which focus on adopting FHIR, updating relevant IHE profiles, and shifting from Clinical Documents (HL7 CDA and FHIR Documents) to IHE QEDm for data exchange.

<img style="padding:3px;width:80%;" src="ILW and FHIR.drawio.png" alt="IHE ILW Modernisation with FHIR"/>
<br clear="all">
<p class="figureTitle">IHE ILW Modernisation with FHIR</p> 
<br clear="all">

## Scenarios

### NHS England Genomic Order Management Service FHIR API

- [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) a [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) based service for managing orders and results at a national level.

```mermaid
sequenceDiagram

participant EPR as Order Placer
participant RIE as Regional Orchestration Engine
participant LIMSP as Order Filler for LAB-1<br/>Order Placer for LAB-35<br/>(North West GMSA)
participant LIMSG as Order Filler<br/>(other GMSA via GOMS)

EPR ->> RIE: Submit Laboratory Order O21 (LAB-1)

RIE ->> LIMSP: Submit Genomic Order O21 (LAB-1)

opt Other GMSA Order (Sub Contract)

note over RIE,LIMSG: IHE LAB-35 Sub-order Management

LIMSP ->> RIE: Submit Sub-Contract Order O21 (LAB-35)
RIE ->> LIMSG: Submit Sub-Contract Order O21 (LAB-35)<br/>Using Genomic Order Management Service API

note over RIE,LIMSG: IHE LAB-36 Sub-order Results Delivery

LIMSG ->> RIE: Send Laboratory Report R01 (LAB-36)<br/>Using Genomic Order Management Service API
RIE -->> LIMSP: Send Laboratory Report R01 (LAB-36)<br/>Using Genomic Order Management Service API

RIE ->> EPR: Send Laboratory Report R01 (LAB-3)
end
```



See [Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html) for the
CFT Shire → HODS-orchestrated reflex use case (pathology test order following on
to a genomics test order, and the HODS-orchestrated haematological malignancy
pathway), including the NHS North West Children Cancer notification example.

## Options 

Variations on the basic LTW scenario. 

Order Order Placer MUST include Ordering Facility (ODS Code) if the Order Filler is outside the organisation (i.e. ICS Pathology Lab or Regional Genomics Lab).
Order Filler MUST respond with a Report Identifier and the Order Identifier (if supplied in the Order) in the laboratory report.

```mermaid
sequenceDiagram
    participant OrderPlacer as Requestor<br/>(Order Placer - Laboratory) 
    participant OrderFillerGenomics as Subcontractor<br/>(Order Filler - Genomics Laboratory) 

    OrderPlacer ->> OrderFillerGenomics: Places Laboratory Order (Order Identifier 1. Optional Visit/Spell Number A)
    OrderFillerGenomics -->> OrderPlacer: Returns Laboratory Report (Report Identifier 1 & Order Identifier 1. Optional Visit/Spell Number A)
```

### Orchestrated Order 

e.g. Haematology and oncology services

The specialty is responsible for sending a consolidated report to the Order Placer.
For both the Pathology and Genomics Orders, the original Order Identifier SHOULD be included in the order (ServiceRequest.basedOn)

```mermaid
sequenceDiagram
    participant OrderPlacer as Order Placer
    participant OrderFillerSpecialty as Requestor<br/>(Order Filler - Specialty)  
    participant OrderFillerPathology as Subcontractor<br/>(Order Filler - Pathology Laboratory)
    participant OrderFillerGenomics as Subcontractor<br/>(Order Filler - Genomics Laboratory)
  

    OrderPlacer ->> OrderFillerSpecialty: Places Order (Order Identifier 1 & Visit/Spell Number A)
    alt Pathology Diagnostic Testing
        OrderFillerSpecialty ->> OrderFillerPathology: Places Laboratory Order (Order Identifier 2 & Visit/Spell Number A)
        OrderFillerPathology -->> OrderFillerSpecialty: Returns Laboratory Report (Report Identifier 1, Order Identifier 2 & Visit/Spell Number A)
    end
    alt Genomic Diagnostic Testing
        OrderFillerSpecialty ->> OrderFillerGenomics: Places Laboratory Order (Order Identifier 3 & Visit/Spell Number A)
        OrderFillerGenomics -->> OrderFillerSpecialty: Returns Laboratory Report (Report Identifier 2 , Order Identifier 3 & Visit/Spell Number A)
    end

    OrderFillerSpecialty -->> OrderPlacer: Returns (Discharge/Hospital?) Report (Report Identifier 3, Order Identifier 1 & Visit/Spell Number A)
```

### Reflex Order

Is this around cancer? Is similar to above but both Lab and Genomics use the specimen for testing, so the genomic order is raised by the Pathology Lab.

Who has the responsibility for sending the genomic report to the Order Placer?

For the Reflex Order, the original Order Identifier SHOULD be included in the order (ServiceRequest.basedOn)

```mermaid
sequenceDiagram
    participant OrderPlacer as Order Placer

    participant OrderFillerPathology as Requestor<br/>(Order Filler - Pathology Laboratory) 
    participant OrderFillerGenomics as Subcontractor<br/>(Order Filler - Genomics Laboratory)
  
    OrderPlacer ->> OrderFillerPathology: Places Order (Order Identifier 1, Visit/Spell Number A and Specimen Accession Number X)
    OrderFillerPathology -->> OrderPlacer: Returns Report (Report Identifier 1, Order Identifier 1, Visit/Spell Number A  and Specimen Accession Number X)
   
    alt Reflex (Genomic) Diagnostic Testing
        OrderFillerPathology ->> OrderFillerGenomics: Places Laboratory Order (Order (Filler) Identifier 2,  Visit/Spell Number A and Specimen Accession Number X)
        OrderFillerGenomics -->> OrderFillerPathology: Returns Laboratory Report (Report Identifier 2, Order Identifier 2, Visit/Spell Number A and Specimen Accession Number X)
    end
    OrderFillerPathology -->> OrderPlacer: Returns Report (Report Identifier 2, Order Identifier 1, Order Identifier 2, Visit/Spell Number A  and Specimen Accession Number X)
```

### Sub Contract 

Genomic Lab sub contracts to another Genomics Lab for testing.

For the Sub Contracted Order, the original Order Identifier SHOULD be included in the order (ServiceRequest.basedOn)

```mermaid
sequenceDiagram
    participant OrderPlacer as Order Placer

    participant OrderFillerGenomics1 as Requestor<br/>(Order Filler - Genomic Laboratory 1) 
    participant OrderFillerGenomics2 as Subcontractor<br/>(Order Filler - Genomic Laboratory 2)
  

    OrderPlacer ->> OrderFillerGenomics1: Places Order (Order Identifier 1, Visit/Spell Number A and Specimen Accession Number X)

    alt Sub Contracted Genomic Diagnostic Testing
        OrderFillerGenomics1 ->> OrderFillerGenomics2: Places Laboratory Order (Order Identifier 2, Visit/Spell Number A and Specimen Accession Number X)
        OrderFillerGenomics2 -->> OrderFillerGenomics1: Returns Laboratory Report (Report Identifier 2, Order Identifier 2, Visit/Spell Number A and Specimen Accession Number X)
    end

    OrderFillerGenomics1 -->> OrderPlacer: Returns Report (Report Identifier 1, Order Identifier 1, Visit/Spell Number A  and Specimen Accession Number X)
```



