## Overview

Diagnostic testing is essential to modern clinical care, offering objective information that supports decision-making at every stage of a patient’s journey—from initial evaluation to long-term monitoring and assessment of outcomes.

Genomic diagnostic testing contributes to this process by examining a patient’s DNA or RNA to detect genetic variations that influence disease susceptibility, diagnosis, treatment choices, and prognosis. By delivering highly specific and personalised insights, genomic testing improves the accuracy and effectiveness of clinical management.


<!--<img style="padding:3px;width:80%;" src="NWGenomicsOverview.png" alt="NW Genomics Overview"/>
<br clear="all">-->

<img style="padding:3px;width:80%;" src="NWGenomicsTechnicalOverview.png" alt="NW Genomics Technical Overview"/>
<br clear="all">

NHS North West Genomics is a new regional NHS service that consolidates clinical genomic testing across the North West of England. Although the service is delivered regionally, it also processes genomic test requests from across the UK. The service is hosted by Manchester University NHS Foundation Trust.

As part of the service transition, existing systems for electronic test ordering and reporting will be enhanced through the introduction of a Regional Orchestration Engine (ROE) and a Genomic Data Platform. These components enable seamless data exchange between local clinical systems and regional genomic laboratory services.


<img style="padding:3px;width:80%;" src="GACS.png" alt="NW Genomics GACS Interoperability Platform"/>
<br clear="all">


## How to Read this IG

```mermaid
graph TD 

User[<b>User Requirements</b> <br/><br/> Clinical Workflow<br/>Patient Pathway]
IHE[<b>Analysis & Design]
HL7["<b>Interfaces - Vol 2</b> <br/><br/> HL7 FHIR REST API, V2 Messages, FHIR Operations (GA4GH/GACS) and FHIR Workflow"]
Data["<b>Data Models and Domain Archetypes - Vol 3</b> <br/><br/> PRSB, GA4GH, English NHS (and suppliers), NHS England, HL7, openEHR, etc"]
Artefacts["<b>Events, Artefacts & Entities  - Vol 4</b>  <br/><br/>EHDS plus NHS England Canonical Data Model (CDM)"] 
Share[<b>Data and Document Sharing - Vol 1</b><br/><br/>EURIDICE]
Message[<b>Workflow Data Exchange - Vol 1</b><br/><br/>IHE LTW and ILW]
API[<b>API Security - Vol 1</b><br/><br/>Consent, Authorisation, Authentication, Access Control and Audits<br/>SMART-on-FHIR,IHE BALP, PCF & IUA]

User --> IHE
IHE -->  Share
IHE --> Message
IHE --> API
Share --> HL7
Message --> HL7
API --> |Secures| HL7
IHE --> Data
Data --> Artefacts
Artefacts --> |Data Contracts| HL7

    classDef pink fill:#F8CECC;
    classDef blue fill:#DAE8FC;
    classDef purple fill:#E1D5E7;

    class Data,Artefacts blue;
    class HL7 pink;
    class IHE,Message,Share,API purple;
```

<table >
  <thead>
    <tr>
      <th></th>
      <th>Menu Item</th>
      <th>Description</th>
      <th>Audience</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="background-color: #E1D5E7">&nbsp;&nbsp;</td>
      <td>Analysis and Design (Volume 1)</td>
      <td>Description of the processes and corresponding technical frameworks</td>
      <td>General (Users, Enterprise Architects, Business Analysts, and Staff Software Engineers)</td>
    </tr>
    <tr>
      <td style="background-color: #F8CECC">&nbsp;&nbsp;</td>
      <td>Interfaces (Volume 2)</td>
      <td>Description of the processes and corresponding technical frameworks (HL7 v2 and FHIR Interactions)</td>
      <td>Technical Design (Developer)</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Data Models (Volume 3)</td>
      <td>NHS North West Forms, Templates, Reports, and Compositions</td>
      <td>Data Modeling (Clinical Informatics and Business Analysts)</td>
    </tr>
    <tr>
      <td style="background-color: #DAE8FC">&nbsp;&nbsp;</td>
      <td>Artefacts (Volume 4)</td>
      <td>NHS North West Common Data Models</td>
      <td>Data Modeling (Data Engineering)</td>
    </tr>
    <tr>
      <td style="background-color: #F8CECC">&nbsp;&nbsp;</td>
      <td>Development</td>
      <td>Testing, Suppport and Architecture</td>
      <td>Technical (Developer)</td>
    </tr>
  </tbody>
</table>


| Diagnostic Process              | <span style="background-color: #E1D5E7">Analysis and Design</span> | <span style="background-color: #F8CECC">Interfaces</span>                                                                               | <span style="background-color: #DAE8FC">Domain Archetype</span>                                                                                                                                                                                | 
|---------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <b>Test Workflow Management</b> | [Laboratory Testing Workflow (LTW)](LTW.html)                      | [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) LAB-4 and LAB-5                   | [Work Order](StructureDefinition-WorkOrder.html) <br/> [Laboratory Analyte Result](StructureDefinition-LaboratoryAnalyteResult.html)                                                            | 
| <b>Laboratory Order</b>         | [Laboratory Testing Workflow (LTW)](LTW.html)                      | [Message Exchange [MQ]](MQ.html) LAB-1                                                   | [North West Genomics Test Order](Questionnaire-GenomicTestOrder.html)                                                                                                                           |                              
|                                 | [Health Data API (HIE/EURDICE)](HIE.html)                          | [Resource Access [IPA/QEDm]](QEDm.html)                                                  |                                                                                                                                                                                                 |                                                     
|                                 | [Inter Laboratory Workflow (ILW)](ILW.html)                        | [Message Exchange [MQ]](MQ.html)                                                         |                                                                                                                                                                                                 |
| <b>Laboratory Report<b/>        | [Laboratory Testing Workflow (LTW)](LTW.html)                      | [Message Exchange [MQ]](MQ.html) LAB-3 <br/> [Document Exchange [MHD]](MHD.html) MDM_T02 | [North West Genomics Test Report](StructureDefinition-DiagnosticReport.html)                                                                                                                         | 
|                                 | [Health Data API (HIE/EURDICE)](HIE.html)                          | [Resource Access [IPA/QEDm]](QEDm.html)                                                  |                                                                                                                                                                                                 | 
|                                 | [Health Data API (HIE/EURDICE)](HIE.html)                          | [Document Exchange [MHD]](MHD.html) ITI-67 ITI-68                                        | [DocumentReference[MHD]/Document Entry[XDS]](StructureDefinition-DocumentReference.html)<br/> plus Future - FHIR Document [HL7 Europe Laboratory Report](https://hl7.eu/fhir/laboratory/2.0.0/) | 
| <b>Specimen Collection</b>      | Future - IHE Specimen Event Tracking (SET)                         | [Resource Access [IPA/QEDm]](QEDm.html)                                                  |                                                                                                                                                                                                 |                                                  
| API Security                    | [API Security](api-security.html)                                  | [Authorisation [IUA]](IUA.html) OAuth2                                                   |                                                                                                                                                                                                 |                                                                                               
{:.grid}




## SNOMED CT

UK edition of SNOMED (83821000000107)

## Dependencies

{% include dependency-table.xhtml %}

## Credits

| Role(s)        | Contributor(s)                                             | 
|----------------|------------------------------------------------------------|
|                | North West Genomic Medicine Service Alliance               |
|                | North East and Yorkshire Genomic Medicine Service Alliance |
|                | Alder Hey Children's Hospital Trust                        |
|                | Manchester University NHS Foundation Trust                 |
|                | Liverpool Womens NHS Foundation Trust                      |
|                | The Christie NHS Foundation Trust                          |
|                | NHS England                                                |
| Staff Engineer | Kevin Mayfield, Aire Logic & Mayfield IS                   |  
{:.grid}
