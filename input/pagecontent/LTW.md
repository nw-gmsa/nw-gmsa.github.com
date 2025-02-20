
## References 

A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 1](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) 

## Actors and Transactions

| Actor                                                      | Definition                                                         |
|------------------------------------------------------------|--------------------------------------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html)           | Commonly known as the Electronic Patient Record (EPR) System       |
| [Order Filler](ActorDefinition-OrderFiller.html)           | Genomic Laboratory Hub (GLH), Laboratory Information System (LIMS) |
| [Automation Manager](ActorDefinition-AutomationManager.html) | Performed by Laboratory Information System (LIMS)                  |
| [Order Result Tracker](ActorDefinition-OrderResultTracker.html)                                    | This is often provided by Electronic Patient Record (EPR) Systems  |
| Laboratory Report (Clinical Document) | See [Clinical Document](ActorDefinition-ClinicalDocument.html)     | 

See also Ref A `Section 3 Laboratory Testing Workflow (LTW) Profile` for detailed description of actors.

<figure>
{%include ihe-palm-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE LTW Actor Diagram</p>
</figure>
<br clear="all">

Initially only the IHE `LAB-1` and `LAB-4` is in focus and this is probably using HL7 v2.x ORM_O01/OML_O21 as described below.
This will be followed by IHE `LAB-3` probably using HL7 v2.x ORU_R01 plus `LAB-2` and `LAB-5`
Later stages will include the use of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir).

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

- [NW Genomics Test Order Form (Minimal Dataset)](Questionnaire-NW-Genomics-Test-Order.html)

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

<img style="padding:3px;width:95%;" src="sdc-overview.png" alt="Order Test Form - Data Extraction Overview"/>
<br clear="all">
<p class="figureTitle">Order Test Form - Data Extraction Overview</p> 
<br clear="all">

The FHIR exchange style used [FHIR Message](https://hl7.org/fhir/R4/messaging.html) following [laboratory-order](MessageDefinition-laboratory-order.html) message definition. This definition is based on HL7 v2 `OML_O21 Laboratory Order` which simplifies conversion to/from pipe+hat (v2) and json (FHIR) formats.

> At present the NW GLH Laboratory Information Management System (LIMS) will not support HL7 FHIR. The Regional Integration Exchange (RIE) will perform conversion between v2 and FHIR formats.

This message is an [aggregate (DDD)](https://martinfowler.com/bliki/DDD_Aggregate.html)/[archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)) and so is a collection of FHIR Resources (similar to v2 segements) which is described in [Genomic Test Request Entity Model](vol3.html#genomic-test-request-entity-model).


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

### Exchange Order Updates

After submitting the original order, the order will be updated to include details such as a specimen collection date, order filler number, etc.
This is also a method of notifying organisations of orders entered directly in the `Order Filler` system, see [LAB-2](LAB-2.html). 


## Use Case 2: Genomic Test Report


A report is created by the clinical practice, and sent to the order result tracker.

### Genomic Test Report Description

<figure>
{%include LTW-usecase-2-activity.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Report Activity</p>
</figure>
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






