<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#orc" _target="_blank">ORC</a>
</div>

## Reference

- [NHS England Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-ServiceRequest) use text descriptions only, not the rendered profile.
- [HL7 Europe Laboratory Report - ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- HL7 Europe [ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- [NHS Genomic Medicine Service test order forms](https://www.england.nhs.uk/publication/nhs-genomic-medicine-service-test-order-forms/)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- Prior Results (Oncology)
    - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Assessment](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html)

## Domain Archetype

<figure>
{%include Laboratory-Order-mindmap.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomic Test Order Sections</p>
</figure>
<br clear="all"> 

## Diagnostic Order

<span class="badge badge-info">Patient Demographics</span>


| Name                  | Value Set / Data Type                                                 | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest                                     | HL7 FHIR Resource (Message + RESTful)                                       |
|-----------------------|-----------------------------------------------------------------------|-------------|--------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|
| NHS Number            | [NHS Number](StructureDefinition-NHSIdentifier.html)                  | 0..1        | [PID](hl7v2.html#pid)-3  | ServiceRequest.subject.identifier                           | [Patient](StructureDefinition-Patient.html).identifier[nhsNumber]           |
| Medical Record Number | [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 0..1        | [PID](hl7v2.html#pid)-3  | if NHS Number not present ServiceRequest.subject.identifier | [Patient](StructureDefinition-Patient.html).identifier[MedicalRecordNumber] |
| Date of Birth         | [Date of Birth](StructureDefinition-DateOfBirth.html)                 | 0..1        | [PID](hl7v2.html#pid)-7  |                                                             | [Patient](StructureDefinition-Patient.html).birthDate                       |
| Postcode              | [Postcode](StructureDefinition-Postcode.html)                         | 0..1        | [PID](hl7v2.html#pid)-11 |                                                             | [Patient](StructureDefinition-Patient.html).address.postalCode              |
{:.grid}

<span class="badge badge-info">Hospital Spell</span>

Treat as mandatory for reflex or subcontracted orders.

| Name                                  | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest             | HL7 FHIR Resource (Message + RESTful)                                        |
|---------------------------------------|---------------------------------------------------------------------------------------------|-------------|--------------------------|-------------------------------------|------------------------------------------------------------------------------|
| Hospital Service                      | [Service](ValueSet-service.html)                                                            | 0..1        | [PV1](hl7v2.html#pv1)-10 |                                     | Encounter.serviceType                                                        | 
| Case Identification or Account Number | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 0..1        | [PV1](hl7v2.html#pv1)-19 | ServiceRequest.encounter.identifier | Encounter.identifier [HospitalSpell](StructureDefinition-HospitalSpell.html) |
{:.grid}

<span class="badge badge-primary">Diagnostic Workflow</span>

| Name                        | Value Set / Data Type                                                              | Cardinality | HL7 v2 OML_O21 Message            | HL7 FHIR ServiceRequest                                                                                                           | 
|-----------------------------|------------------------------------------------------------------------------------|-------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Order Identifier (Placer)   | [Order Identifier](StructureDefinition-OrderIdentifier.html)                       | 1..1        | [ORC](hl7v2.html#orc)-2           | ServiceRequest.identifier[OrderIdentifier]                                                                                        |                                                                                                                                             
| Filler Order Number         |                                                                                    | 0..1        | [ORC](hl7v2.html#orc)-3           | ServiceRequest.identifier[OrderFillerNumber]                                                                                      |                                                                                                                                             
| (Placer) Order Group Number | [Order Group Number](StructureDefinition-OrderGroupNumber.html)                    | 0..1        | [ORC](hl7v2.html#orc)-4           | ServiceRequest.requisition.identifier                                                                                             |                                                                                                                                                           
| (Order) Procedure Code      | Diagnostic Domain specific - See below                                             | 1..1        | [OBR](hl7v2.html#obr)-4           | ServiceRequest.code                                                                                                               |                                                                                                                                             
| Order date                  |                                                                                    | 0..1        | [ORC](hl7v2.html#orc)-9           | ServiceRequest.authoredOn                                                                                                         |                                                                                                                                             
| Ordering Practitioner       | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 0..1        | [ORC](hl7v2.html#orc)-12          | ServiceRequest.requester[PractitionerRole]                                                                                        |                                                                                                                                                              
| Ordering Facility           | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 1..1        | [ORC](hl7v2.html#orc)-21          | If Order has requesting practitioner ServiceRequest.requester[PractitionerRole] <br/> else ServiceRequest.requester[Organization] | 
| performer                   | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 0..1        | implied by destination of message | ServiceRequest.performer                                                                                                          |                                                                                      
| Suspected Condition         | Domain specific - See below (Generally SNOMED Condition code)                      | *..*        | [DG1](hl7v2.html#dg1)-3           | ServiceRequest.reasonCode                                                                                                         |                                                                                                                                             
| Supporting Information      | Domain specific - See below                                                        | 0..*        | [OBX](hl7v2.html#obx)             | ServiceRequest.supportingInformation                                                                                              |                                                                                                                                      
| Notes                       |                                                                                    | 0..*        | [NTE](hl7v2.html#nte)             | ServiceRequest.note                                                                                                               |                                                                                                                                             
| Specimen                    | See Specimen below                                                                 | 0..*        | [SPM](hl7v2.html#spm)             | ServiceRequest.specimen.identifier                                                                                                |                                                                                               
{:.grid}

<span class="badge badge-primary">Diagnostic Genomics</span>

| Name                                                  | Value Set / Data Type                                                   | Cardinality | HL7 v2 OML_O21 Message  | HL7 FHIR ServiceRequest   | 
|-------------------------------------------------------|-------------------------------------------------------------------------|-------------|-------------------------|---------------------------|
| (Order) Procedure Code - Genomic Test Code            | [Genomic Test Directory](ValueSet-GenomicTestCodes.html)                | 1..1        | [OBR](hl7v2.html#obr)-4 | ServiceRequest.code       |                               
{:.grid}


## Order Entry Questions

<div class="alert alert-info" role="alert">
<a href="Questionnaire-GenomicTestOrder.html" _target="_blank">Questionnaire - Genomic Test Order</a> 
</div>

## Specimen

<span class="badge badge-primary">Diagnostic</span>

<div class="alert alert-info" role="alert">
<a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
</div>

| Name                      | LOINC   | Value Set / Data Type                                                         | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest |
|---------------------------|---------|-------------------------------------------------------------------------------|-------------|--------------------------|-------------------------|
| Specimen ID               | 80398-1 |                                                                               | 0..*        |  | ServiceRequest.specimen | 

Note: it is likely that source systems will use ORM_01 and not include specimen details. In this case it is suggested that the specimen details are captured as 'Ask at Order Entry Questions' and so provided as OBX segments.


