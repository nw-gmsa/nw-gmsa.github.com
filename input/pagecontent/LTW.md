
## References 

A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 1](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) 

## Actors and Transactions

| Actor                                                           | Definition                                                                                  |
|-----------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html)                | Commonly known as the Electronic Patient Record (EPR) System or Order Communications System |
| [Order Filler](ActorDefinition-OrderFiller.html)                | Genomic Laboratory Hub (GLH), Laboratory Information System (LIMS)                          |
| [Automation Manager](ActorDefinition-AutomationManager.html)    | Performed by Laboratory Information System (LIMS)                                           |
| [Order Result Tracker](ActorDefinition-OrderResultTracker.html) | This is often provided by Electronic Patient Record (EPR) Systems                           |
| Laboratory Report (Clinical Document)                           | See [Clinical Document](ActorDefinition-ClinicalDocument.html)                              | 
| [Intermediary](ActorDefinition-Intermediary.html)                               | E.g. Regional or Trust Integration Engine |

See also Ref A `Section 3 Laboratory Testing Workflow (LTW) Profile` for detailed description of actors.

<figure>
{%include LTW-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE LTW Actor Diagram</p>
</figure>
<br clear="all">

Initially only the IHE `LAB-1` and `LAB-4` is in focus.

Later stages will include the use of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir).

## Overview

<img style="padding:3px;width:95%;" src="LTW Use Case 1 and 4.drawio.png" alt="Genomic LTW Business Process"/>
<br clear="all">
<p class="figureTitle">Genomic LTW Business Process</p> 
<br clear="all">

> The sample may not need collecting by the ordering clinician for 2 reasons 
> - it has already been sent to the GLH and extracted DNA is already stored there 
> - the sample is somewhere else in the country. In this instance the ordering clinician will need to arrange the sample transfer to the GLH.

The processes above are described in more detail in:

- [Use Case 1: Genomic Test Order](#use-case-1-genomic-test-order) for the order
- [Use Case 4: Genomic Test Report](#use-case-4-genomic-test-report) for the report

From a high level perspective the process is 

<figure>
{%include LTW-basic-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Simplified Sequence Diagram</p>
</figure>
<br clear="all">

Where the `Order Placer` sends the **Laboratory Order** to the `Order Filler`, the lab performs the test and then sends the **Laboratory Report** back to the `Order Placer`. However, variations can exist such as the order is updated or the order is entered directly on the `Order Filler`system (these are currently out of scope).


## Use Case 1: Genomic Test Order

An order is created by the clinical practice, and placed to the laboratory.


<figure>
{%include LTW-usecase-1-activity.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Order Activity</p>
</figure>
<br clear="all">

### Select Genomic Test Order Form

Within the system creating the genomics order, the practitioner will select a form for the test required. Below are several examples from [North West Genomic Laboratory Hub - Test Request Forms](https://mft.nhs.uk/nwglh/documents/test-request-forms/).
How this is implemented will vary between different NHS organisations and systems they use.

<table style="width:100%">
  <tr>
    <td>
       <img style="padding:3px;width:80%;" src="NW GLH Genomic Testing Request Form – Rare Disease.png" alt="NW GLH Genomic Testing Request Form – Rare Disease"/>
      <p class="figureTitle">NW GLH Genomic Testing Request Form – Rare Disease</p>   
    </td>
    <td>
       <img style="padding:3px;width:80%;" src="Request for Genetic Testing for Haemoglobinopathies.png" alt="Request for Genetic Testing for Haemoglobinopathies"/>
      <p class="figureTitle">Request for Genetic Testing for Haemoglobinopathies</p>   
    </td>
  </tr>
</table>

### Complete Genomic Test Order Form

These forms may (/will?) will have a computable definition called an [template (FHIR Questionnaire)](https://hl7.org/fhir/R4/questionnaire.html) which will list the technical content requirements for the form. At present only one archetype has been defined:

- [NW GMSA Genomics Test Order Panel](Questionnaire-GenomicTestOrder.html)

This archetype definition can also support [HL7 Structured Data Capture](https://build.fhir.org/ig/HL7/sdc/index.html) should the Order Placer system support these features.

### Submit Genomic Test Order Form

The completed form is submitted to the Regional Integration Engine using:

- [LAB-1](LAB-1.html) for orders raised by Order Placer systems.
- [LAB-4](LAB-4.html) for orders raised by Order Filler systems to another Order Filler system (typically pathology systems).

<figure>
{%include LTW-usecase-1-sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Order Sequence Diagram - LAB-1</p>
</figure>
<br clear="all">

For submission, this form will be converted by the [Order Placer](ActorDefinition-OrderPlacer.html) to a communication format called [HL7 FHIR](https://hl7.org/fhir/R4/index.html) (and for compatability reasons [HL7 v2](https://en.wikipedia.org/wiki/Health_Level_7#HL7_Version_2).
If the [Order Placer](ActorDefinition-OrderPlacer.html) has a FHIR enabled Electronic Patient Record (e.g. EPIC, Cerner, Meditech, etc), they may use [HL7 SDC - Form Data Extraction](https://build.fhir.org/ig/HL7/sdc/extraction.html) to assist with this process.

<img style="padding:3px;width:95%;" src="SDC Overview.drawio.png" alt="Order Test Form - Data Extraction Overview"/>
<br clear="all">
<p class="figureTitle">Order Test Form - Data Extraction Overview</p> 
<br clear="all">

The FHIR exchange style used [FHIR Message](https://hl7.org/fhir/R4/messaging.html) following [laboratory-order](MessageDefinition-laboratory-order.html) message definition. This definition is based on HL7 v2 `OML_O21 Laboratory Order` which simplifies conversion to/from pipe+hat (v2) and json (FHIR) formats.

> At present the NW GLH Laboratory Information Management System (LIMS) will not support HL7 FHIR. The Regional Integration Exchange (RIE) will perform conversion between v2 and FHIR formats.

This message is an [aggregate (DDD)](https://martinfowler.com/bliki/DDD_Aggregate.html)/[archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)) and so is a collection of FHIR Resources (similar to v2 segements) which is described in [Genomic Test Order](Questionnaire-GenomicTestOrder.html).


#### Communicating Ask at Order Entry questions and prior results

See also [HL7 Europe Laboratory Report - ServiceRequest](https://hl7.eu/fhir/laboratory/StructureDefinition-ServiceRequest-eu-lab.html#communicating-ask-at-order-entry-questions-and-prior-results)
This message can be extended by [template (FHIR Questionnaire)](https://hl7.org/fhir/R4/questionnaire.html) which allows the definition of additional questions to be defined for the `laboratory order`.

The detail of this form/template defines:

<img style="padding:3px;width:700px;" src="sdc-order-test-form.png" alt="Order Test Form Example (extract)"/>
<br clear="all">
<p class="figureTitle">Order Text Form Example (extract)</p> 
<br clear="all">

| Question                             | CodeSystem | Code      | FHIR Profile                                                    | HL7 v2 Segment | FHIR Questionniare <br/>item.type | FHIR Observation <br/>value[x] | v2 OBX-2                                                                      |
|--------------------------------------|------------|-----------|-----------------------------------------------------------------|----------------|--------------------------------|--------------------------------|-------------------------------------------------------------------------------|
| Does This Test Relate to a Pregnancy | SNOMED     | 77386006  | [Observation](StructureDefinition-Observation.html)             | OBX            | boolean                        | valueBoolean                   | CE ([code 0136](https://terminology.hl7.org/5.1.0/CodeSystem-v2-tables.html)) |
| Sample                               | LOINC      | 68992-7   | [Observation-Panel](StructureDefinition-Observation-Panel.html) | OBR            |                                |                                |                                                                               |
| High Infection Risk Sample           | SNOMED     | 281269004 | [Observation](StructureDefinition-Observation.html)             | OBX            | boolean                        | valueBoolean                   | CE ([code 0136](https://terminology.hl7.org/5.1.0/CodeSystem-v2-tables.html)) |

> It is not expected the NW GLH Laboratory Information Management System (LIMS) will support UK SNOMED CT, and the RIE will handle the conversion either internally using [FHIR ConceptMap](https://hl7.org/fhir/R4/conceptmap.html) or a terminology service with the following capabilities [IHE Sharing Valuesets, Codes, and Maps (SVCM)](https://profiles.ihe.net/ITI/SVCM/index.html)

### Collect Sample and Update Genomic Test Order

After submitting the original order, the sample will be collected and sent to the Order Filler. The Order Filler will update the Test Order to include details such as a specimen collection date, order filler number, etc.

## Use Case 2: Genomic Test Order following on from Pathology Test Order

<img style="padding:3px;width:95%;" src="LTW Use Case 2.drawio.png" alt="Genomic LTW Business Process - Use Case 2"/>
<br clear="all">
<p class="figureTitle">Genomic LTW Business Process - Use Case 3</p> 
<br clear="all">

In this use case the original order is raised by the `Order Placer` and sent to a Pathology LIMS (`Pathology Order Filler`). The Pathology LIMS follows the processes outlined in [Use Case 1: Genomic Test Order](#use-case-1-genomic-test-order) and [Use Case 4: Genomic Test Report](#use-case-4-genomic-test-report) for pathology testing.  
As part of this testing, the clinical process requires a genomics test to be performed.
This genomics process is largely the same except for:
- The order is sent as one interaction as the sample does not need to be collected.
- The order should contain the pathology report detailing the results of the pathology tests.

## Use Case 3: Genomic Test Order entered on GLH (Order Filler)

<img style="padding:3px;width:95%;" src="LTW Use Case 3.drawio.png" alt="Genomic LTW Business Process - Use Case 3"/>
<br clear="all">
<p class="figureTitle">Genomic LTW Business Process - Use Case 4</p> 
<br clear="all">

In this use case the order has been manually entered into NW GLH LIMS (as a result of an email or telephone call).
The `Order Filler` notifies the `Order Placer` of the order.
The `Order Placer` can then update the `Order Filler` when details change on the order such as a Order Placer Number assigned or updating details on the specimen such as collection dates.
The proces then follows the same process as [Use Case 4: Genomic Test Report](#use-case-4-genomic-test-report)

## Use Case 4: Genomic Test Report

A report is created by the clinical practice and sent to the order result tracker.


### Genomic Test Report Description

<figure>
{%include LTW-usecase-4-activity.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Report Activity</p>
</figure>
<br clear="all">

### Send/Share Genomic Test Report


<img style="padding:3px;width:95%;" src="LaboratoryReportExplainedPage1.drawio.png" alt="Genomic Report Page 1"/>
<br clear="all">

<img style="padding:3px;width:95%;" src="LaboratoryReportExplainedPage1.drawio.png" alt="Genomic Report Page 2"/>
<br clear="all">
<p class="figureTitle">Genomic Report Example</p> 
<br clear="all">


### Relationship to NHS England Pathology

This guide implements the same use cases described in [NHS England Pathology FHIR Implementation Guide - Background](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Design/Background), with additions to support a wider set of actors and introduces standards around the `Laboratory Order LAB-1`. Key differences:

- [IHE Laboratory and Testing Worflow LTW](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) is used as the base description of laboratory testing workflow.
- `GP Electronic Patient Record System` and `Order Communications System` are collectively known as [Order Placer](ActorDefinition-OrderPlacer.html), this actor can also be fulfilled by other EPR systesm.
- An  [Intermediary](ActorDefinition-Intermediary.html) is used between [Order Placer](ActorDefinition-OrderPlacer.html) and [Order Filler](ActorDefinition-OrderFiller.html) which performs message translation and code conversions.
- For results, the `GP Electronic Patient Record System` is classed a [Order Result Tracker](ActorDefinition-OrderResultTracker.html), other systems may be used to deliver this functionality.
- An  [Intermediary](ActorDefinition-Intermediary.html) is used between [Order Filler](ActorDefinition-OrderFiller.html) and [Order Result Tracker](ActorDefinition-OrderResultTracker.html) which performs message translation and code conversions.
- A [Canonical model](https://en.wikipedia.org/wiki/Canonical_model) is present which is expressed via HL7 FHIR and can be implemented via HL7 v2 and FHIR and IHE XDS. This is conformant to the latest versions of [HL7 UK Core](https://simplifier.net/guide/uk-core-implementation-guide-stu2) and [NHS England Data Model and Dictionary](https://www.datadictionary.nhs.uk/). Although this is focused on Genomics, it also includes elements from Pathology and Radiology for compatability reasons. This also includes mandatory use of NHS England National Procedure Codes. 

<img style="padding:3px;width:95%;" src="Relationship to NHS England Pathology.drawio.png" alt="Relationship to NHS England Pathology"/>
<br clear="all">
<p class="figureTitle">Relationship to NHS England Pathology</p> 
<br clear="all">

## Security Considerations

TODO 

This may include [IHE Internet User Authentication [IUA]](https://profiles.ihe.net/ITI/IUA/index.html) and [IHE Basic Audit Log Patterns[BALP]](https://profiles.ihe.net/ITI/BALP/index.html) which includes use of:

- OAuth2 Standard for **Authorisation**
  - including use of JWT access tokens and including future support for [SMART-on-FHIR Scopes](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html))
- FHIR AuditEvent for **Logging Access**
- TLS for **Transport Security**

## Cross-Profile Considerations

It is recommended that the actors receive patient demographic and encounter updates only within the
context of a work order. Whenever patient data changes, due to:

- Update patient information (A31 or A08)
- Patient transfer (A02)
- Transfer cancelled (A12)
- Patients merge (A40)

Note: Event trigger definitions based on [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) which is NHS England's supplement to IHE Technical Framework Volume2: [Patient Identity Management [ITI-30]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-30.html) and  [Patient Encounter Management [ITI-31]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html).

It is common for this requirement to be answered by a combination of:

- [Patient Identifier Cross-referencing (PIX)](PIX.html)
- [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html)//HL7 v2 ADT Patient Encounter Management (A02, A08 and A12)
  - (Denmark) HL7 FHIR version [DK MedCom HospitalNotification](https://medcomfhir.dk/ig/hospitalnotification/)






