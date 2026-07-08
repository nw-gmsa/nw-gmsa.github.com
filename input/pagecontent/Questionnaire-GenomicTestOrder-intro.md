## References

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


| Name                  | LOINC | Value Set / Data Type                                                 | Cardinality | HL7 v2 OML_O21 Message  | HL7 FHIR ServiceRequest                                                                                | HL7 FHIR Resource (Message + RESTful)                                      |
|-----------------------|-------|-----------------------------------------------------------------------|-------------|-------------------------|--------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| NHS Number            |       | [NHS Number](StructureDefinition-NHSIdentifier.html)                  | 0..1        | [PID](hl7v2.html#pid)-3 | [ServiceRequest](StructureDefinition-ServiceRequest.html).subject.identifier                           | [Patient](StructureDefinition-Patient.html).identifier[nhsNumber]          |
| Medical Record Number |       | [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 0..1        | [PID](hl7v2.html#pid)-3 | if NHS Number not present [ServiceRequest](StructureDefinition-ServiceRequest.html).subject.identifier | [Patient](StructureDefinition-Patient.html).identifier[MedicalRecordNumber] |
| Date of Birth         |       | [Date of Birth](StructureDefinition-DateOfBirth.html)              | 0..1        | [PID](hl7v2.html#pid)-7    |                                                                                                        | [Patient](StructureDefinition-Patient.html).birthDate                      |
| Postcode              |       | [Postcode](StructureDefinition-Postcode.html)                      | 0..1        | [PID](hl7v2.html#pid)-11   |                                                                                                        | [Patient](StructureDefinition-Patient.html).address.postalCode             |
{:.grid}

<span class="badge badge-info">Hospital Spell</span>

Treat as mandatory for reflex or subcontracted orders.

| Name                                  | LOINC   | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest                                                        | HL7 FHIR Resource (Message + RESTful)                                        |
|---------------------------------------|---------|---------------------------------------------------------------------------------------------|-------------|--------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Hospital Service                      |         | [Service](ValueSet-service.html)                                                            | 0..1        | [PV1](hl7v2.html#pv1)-10 |                                                                                | Encounter.serviceType                                                        | 
| Case Identification or Account Number | 56797-4 | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 0..1        | [PV1](hl7v2.html#pv1)-19 | [ServiceRequest](StructureDefinition-ServiceRequest.html).encounter.identifier | Encounter.identifier [HospitalSpell](StructureDefinition-HospitalSpell.html) |
{:.grid}



<span class="badge badge-primary">Diagnostic Workflow</span>

| Name                        | LOINC | Value Set / Data Type                                                              | Cardinality | HL7 v2 OML_O21 Message            | HL7 FHIR [ServiceRequest](StructureDefinition-ServiceRequest.html)                                                                                                                                        | HL7 FHIR Resource (Message + RESTful)                                                  |
|-----------------------------|-------|------------------------------------------------------------------------------------|-------------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Order Identifier (Placer)   |       | [Order Identifier](StructureDefinition-OrderIdentifier.html)                       | 1..1        | [ORC](hl7v2.html#orc)-2           | ServiceRequest.identifier[OrderIdentifier]                                                                                                                                                                                            |                                                                                        |
| Filler Order Number         |       |                                                                                    | 0..1        | [ORC](hl7v2.html#orc)-3           | ServiceRequest.identifier[OrderFillerNumber]                                                                                                                                 |                                                                                        |
| (Placer) Order Group Number |       | [Order Group Number](StructureDefinition-OrderGroupNumber.html)                    | 0..1        | [ORC](hl7v2.html#orc)-4           | ServiceRequest.requisition.identifier                                                                                                                                        |                                                                                        |              
| (Order) Procedure Code                  |       | Diagnostic Domain specific - See below                                             | 1..1        | [OBR](hl7v2.html#obr)-4           | ServiceRequest.code                                                                                                                                                          |                                                                                        |
| Order date                  |       |                                                                                    | 0..1        | [ORC](hl7v2.html#orc)-9           | ServiceRequest.authoredOn                                                                                                                                                    |                                                                                        |
| Ordering Practitioner       |       | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 0..1        | [ORC](hl7v2.html#orc)-12          | ServiceRequest.requester[PractitionerRole]                                                                                                                                   | [PractitionerRole](StructureDefinition-PractitionerRole.html).practitoner              |                                                                                            
| Ordering Facility           |       | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 1..1        | [ORC](hl7v2.html#orc)-21          | If Order has requesting practitioner ServiceRequest.requester[PractitionerRole] <br/> else ServiceRequest.requester[Organization] | [PractitionerRole](StructureDefinition-PractitionerRole.html).organization <br/> else [Organization](StructureDefinition-Organization.html)  |
| performer                   |       | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 0..1        | implied by destination of message | ServiceRequest.performer                                                                                                                                                     | [Organization](StructureDefinition-Organization.html)                                  |
| Suspected Condition         |       | Domain specific - See below (Generally SNOMED Condition code)                      | *..*        | [DG1](hl7v2.html#dg1)-3           | ServiceRequest.reasonCode                                                                                                                                                    |                                                                                        |
| Supporting Information      |       | Domain specific - See below                                                        | 0..*        | [OBX](hl7v2.html#obx)             |ServiceRequest.supportingInformation                                                                                                                                         | Varies                                                                                 |
| Notes                       |       |                                                                                    | 0..*        | [NTE](hl7v2.html#nte)             | ServiceRequest.note                                                                                                                                                          |                                                                                        |
| Specimen                    |       | See Specimen below                                                                 | 0..*        | [SPM](hl7v2.html#spm)             | ServiceRequest.specimen.identifier                                                                                                                                           | [Specimen](StructureDefinition-Specimen.html)                                          |  
{:.grid}

<span class="badge badge-primary">Diagnostic Genomics</span>

| Name                                                  | LOINC   | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message            | HL7 FHIR ServiceRequest                                               | HL7 FHIR Resource (Message + RESTful)                                                                                       |
|-------------------------------------------------------|---------|---------------------------------------------------------------------------------------------|-------------|-----------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| (Order) Procedure Code - Genomic Test Code                        |         | [Genomic Test Directory](ValueSet-GenomicTestCodes.html)                              | 1..1        | [OBR](hl7v2.html#obr)-4           | [ServiceRequest](StructureDefinition-ServiceRequest.html).code                                                                  |                                                                                                                             |
| Suspected Condition - Clinical Indication / CITT code |         | [Genomic Condition Codes](ValueSet-GenomicClinicalIndicationCodes.html)                            | *..*        | [DG1](hl7v2.html#dg1)-3           | [ServiceRequest](StructureDefinition-ServiceRequest.html).reasonCode                                                            |                                                                                                                             |
{:.grid}

## Specimen

<span class="badge badge-primary">Diagnostic</span>

| Name                      | LOINC   | Value Set / Data Type                                                         | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest | HL7 FHIR [Specimen](StructureDefinition-Specimen.html)                           |
|---------------------------|---------|-------------------------------------------------------------------------------|-------------|--------------------------|-------------------------|----------------------------------------------------------------------------------|
| Specimen ID               | 80398-1 |                                                                               | 0..*        | [SPM](hl7v2.html#spm)-2  | specimen                | Specimen.identifier[PlacerSpecimenNumber]                                        |
| Specimen Type             |         | [Specimen Type](ValueSet-specimen-type.html)                                  | 1..1        | [SPM](hl7v2.html#spm)-4  |                         | Specimen.type                               |
| Specimen Source Site      |         | [Specimen Body Site](ValueSet-specimen-bodysite.html)                         | 0..1        | [SPM](hl7v2.html#spm)-8  |                         | Specimen.collection.bodySite                |
| Specimen Accession Number | 80398-1 | [Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) | 0..*        | [SPM](hl7v2.html#spm)-30 |                         | Specimen.accessionIdentifier                |
| Shipment Tracking Number  | 97209-1 | [Shipment Tracking Number](StructureDefinition-ShipmentTrackingNumber.html)   | 0..*        | [SPM](hl7v2.html#spm)-32 |                         | Specimen.identifier[ShipmentTrackingNumber] | 
| Specimen Collection Date  |         |    | 0..1        | [SPM](hl7v2.html#spm)-17 |                         | Specimen.collection.collectedDateTime       |
| Specimen Received Date    |         |         | 0..1        | [SPM](hl7v2.html#spm)-18 |                         | Specimen.receivedTime                       |
{:.grid}

Note: it is likely that source systems will use ORM_01 and not include specimen details. In this case it is suggested that the specimen details are captured as 'Ask at Order Entry Questions' and so provided as OBX segments.

## Order Entry Questions

<span class="badge badge-primary">Diagnostic Genomics</span>

| Name                                                                   | Code System            | Answer ValueSet                      | Cardinality | HL7 v2 OML_O21 Message | OBX-2 Value Type | HL7 FHIR Resource (Message + RESTful)                                    |
|------------------------------------------------------------------------|------------------------|--------------------------------------|-------------|------------------------|------------------|--------------------------------------------------------------------------|
| Patient is from consanguineous union?                                  | SNOMED 842009          | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Confirm that a pathology report will be provided alongside the sample. | SNOMED 74996004        | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Neonatal/Prenatal/Neither?                                             | SNOMED 118185001       | [Pregnancy](ValueSet-Pregnancy.html) | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| Pregnant                                                               |                        |                                      |             |                        |                  |  
| - Does this test relate to a pregnancy with > 1 fetus?                 | SNOMED 370386005       | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |
| - Patient expected delivery date                                       | SNOMED 161714006       |                                      | 0..1        | [OBX](hl7v2.html#obx)  | DT               | [Observation](StructureDefinition-Observation.html).valueDateTime        |
| - Patient gestation                                                    | SNOMED 598151000005105 |                                      | 0..1        | [OBX](hl7v2.html#obx)  | NM               | [Observation](StructureDefinition-Observation.html).valueQuantity        |
| Is this test for a pregnancy loss?                                     | SNOMED 17369002        | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |   
| Is this test for a deceased infant?                                    | SNOMED 419099009       | [YesNoUnknown](ValueSet-YNU.html)    | 0..1        | [OBX](hl7v2.html#obx)  | CE               | [Observation](StructureDefinition-Observation.html).valueCodeableConcept |                         
{:.grid}
