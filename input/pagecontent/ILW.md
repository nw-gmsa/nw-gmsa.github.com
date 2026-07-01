<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## References

1. [IHE Inter Laboratory Workflow](https://wiki.ihe.net/index.php/Inter_Laboratory_Workflow)
2. [IHE Laboratory Technical Framework Supplement Inter-Laboratory Workflow (ILW)](https://www.ihe.net/uploadedFiles/Documents/Laboratory/IHE_LAB_Suppl_ILW.pdf)

## Actors and Transactions

| Actor                                               | Definition                                                                                                                                                                                             |
|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Requestor](ActorDefinition-Requestor.html)         | A hospital laboratory that subcontracts a part of an Order or of an Order Group to another laboratory, e.g. Pathology or HODS. Is known in IHE TLW as [Order Placer](ActorDefinition-OrderPlacer.html) |
| [Subcontractor](ActorDefinition-Subcontractor.html) | Receives Sub-orders, acknowledges specimen arrival and sends back results fulfilling these Sub-orders, e.g. Genomics. Is known in IHE TLW as [Order Filler](ActorDefinition-OrderFiller.html)                                                           |
{:.grid}

## Overview

See Ref 1 for details.

<img style="padding:3px;width:80%;" src="Ihe_lab_ilw_proc.jpg" alt="IHE ILW Summary"/>
<br clear="all">
<p class="figureTitle">IHE ILW Summary</p> 
<br clear="all">


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
<b>Domain Archetype:</b> <a href="filler-order.html" _target="_blank">Filler Order</a> 
</div>

<div class="alert alert-info" role="alert">
<b>Interaction:</b> <a href="MQ.html" _target="_blank">Message Exchange</a> LAB-35
</div>

### Sub-order Results Delivery (LAB-36)

<div class="alert alert-info" role="alert">
<b>Domain Archetype:</b> <a href="Questionnaire-GenomicTestReport.html" _target="_blank">Genomic Test Report</a> 
</div>

<div class="alert alert-info" role="alert">
<b>Interaction:</b> <a href="MQ.html" _target="_blank">Message Exchange</a> LAB-36
</div>


### Modernisation

The current IHE ILW specification relies on HL7 v2.x, HL7 v3, and IHE XDS. Several modernization paths are available, most of which focus on adopting FHIR, updating relevant IHE profiles, and shifting from Clinical Documents (HL7 CDA and FHIR Documents) to IHE QEDm for data exchange.

<img style="padding:3px;width:80%;" src="ILW and FHIR.drawio.png" alt="IHE ILW Modernistion with FHIR"/>
<br clear="all">
<p class="figureTitle">IHE ILW Modernistion with FHIR</p> 
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

In this use case the original order is raised by the `Order Placer` and sent to a Pathology LIMS (`Pathology Order Filler`). The Pathology LIMS follows the processes outlined in [Use Case 1: Genomic Test Order](#use-case-genomic-test-order) and [Use Case 2: Genomic Test Report](#use-case-genomic-test-report) for pathology testing.  
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
    - Step 3: Order Placer submits a Genomic Order O21 (LAB-2) to Order Filler (Genomics).
    - Step 4: Specimen is sent from Order Placer to Genomics.
    - Step 5: Order Filler (Genomics) sends a Genomic Report R01 (LAB-3) back to the Order Placer.
- Optional Path 2 – Genomic Order created by Pathology
    - Condition: [Order Filler (Pathology) creates Genomic Order].
    - Note: The same specimen can be reused for multiple tests.
    - Step 6: Order Filler (Pathology) submits a Genomic Order O21 (LAB-2) to Order Filler (Genomics).
    - Step 7: Specimen is sent from Pathology to Genomics.
    - Step 8: Order Filler (Genomics) sends a Genomic Report R01 (LAB-3) to Order Filler (Pathology).
    - Step 9: Pathology sends the Genomic Report R01 (LAB-3) to the Order Placer.

#### Diagnostic Cancer Pathways

This use case can often occur around cancer:

<img style="padding:3px;width:20%;" src="cancer-diagnostics.png" alt="Cancer Diagnostics"/>
<br clear="all">
<p class="figureTitle">Cancer Diagnostics</p> 
<br clear="all">

##### Colorectal Cancer—Diagnostic Pathways Example

The details of this are beyond the scope of this guide, for more details see [Getting It Right First Time (GIRFT) Best Practice Timed Diagnostic Cancer pathways ](https://gettingitrightfirsttime.co.uk/wp-content/uploads/2024/03/BestPracticeTimedDiagnosticCancerPathwayssummary-guide-March-24-V3.pdf)

For information on `Genomic Tests on the bowel cancer cells`, see [macmillan.org.uk](https://www.macmillan.org.uk/cancer-information-and-support/bowel-cancer/tests-on-the-bowel-cancer-cells) and [NICE DG27 Molecular testing strategies for Lynch syndrome in people with colorectal cancer](https://www.nice.org.uk/guidance/dg27)

<img style="padding:3px;width:90%;" src="ERIC.drawio.png" alt="Colorectal Cancer Diagnostics and Patient Referrals"/>
<br clear="all">
<p class="figureTitle">Colorectal Cancer Diagnostics and Patient Referrals</p> 
<br clear="all">

### Haematological Malignancy Diagnostic Services

```mermaid
sequenceDiagram


participant EPR as Order Placer
participant LIMS as Order Filler (HODS)
participant LIMSP as Order Filler (Pathology)
participant LIMSG as Order Filler (Genomics)


EPR ->> LIMS: Submit Laboratory Order O21 (LAB-1)

opt Order Filler (HODS) creates Pathology Order

    note over LIMS,LIMSP: Same specimen can be reused for multiple tests

    LIMS ->> LIMSP: Submit Pathology Reflex Order O21 (LAB-35)
    LIMS -->> LIMSP: Send Specimen (not a technical interaction)
    LIMSP ->> LIMS: Send Pathology Report R01 (LAB-36)
end

opt Order Filler (HODS) creates Genomic Order

    note over LIMS,LIMSG: Same specimen can be reused for multiple tests

    LIMS ->> LIMSG: Submit Genomic Reflex Order O21 (LAB-35)
    LIMSP -->> LIMSG: Send Specimen (unsure of workflow)
    LIMSG ->> LIMS: Send Genomic Report R01 (LAB-36)
end
LIMS -->> LIMS: Write Report
LIMS ->> EPR: Send Laboratory Report R01 (LAB-3)
```

#### NHS North West Children Cancer Example


<img style="padding:3px;width:95%;" src="OrderCommunicationAndNotifications.drawio.png" alt="Order Communication and Notifications"/>
<br clear="all">
<p class="figureTitle">Genomic Order Notifications - Use Case 4</p> 
<br clear="all">

#### As is Process

(From North West Children Cancer. This is centred around laboratory tests, genomic tests will have similar notification systems)

- Blood test requested by Primary Treatment Centre (PTC)
- Blood sample taken by Community Nurse or Paediatric Oncology Shared Care Unit (POSCU) and the specimen details are documented
- Blood Laboratory Order is created and a laboratory order request is sent to the laboratory
- Blood test performed by laboratory
- Laboratory writes up a blood results report (laboratory report)
- Laboratory report sent to Community Nurse or POSCU
- Laboratory report then sent to PTC
- Community Nurse or POSCU calls PTC by phone to notify that the results have been sent and to confirm that they have been received
- If results cannot be understood, PTC will call Community Nurse or POSCU to inform them. This is usually due to a defective message
    - Community Nurse or POSCU sends results in a different format (via telephone or re-writes the results out)
- PTC may edit a child's prescription on regimen in light of blood results and may need to recall a patient into hospital for additional tests
- If prescription is amended then PTC must notify POSCU



## Options 

Variations on the basic TLW scenario. 

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

### Sub Contact 

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



