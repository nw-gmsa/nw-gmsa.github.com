
## Diagnostic Order


### Patient Demographics


| Name                  | Value Set / Data Type                                                 | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest                                     | HL7 FHIR Resource (Message + RESTful)                                       |
|-----------------------|-----------------------------------------------------------------------|-------------|--------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|
| NHS Number            | [NHS Number](StructureDefinition-NHSIdentifier.html)                  | 0..1        | [PID](hl7v2.html#pid)-3  | ServiceRequest.subject.identifier                           | [Patient](StructureDefinition-Patient.html).identifier[nhsNumber]           |
| Medical Record Number | [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 0..1        | [PID](hl7v2.html#pid)-3  | if NHS Number not present ServiceRequest.subject.identifier | [Patient](StructureDefinition-Patient.html).identifier[MedicalRecordNumber] |
| Date of Birth         | [Date of Birth](StructureDefinition-DateOfBirth.html)                 | 0..1        | [PID](hl7v2.html#pid)-7  |                                                             | [Patient](StructureDefinition-Patient.html).birthDate                       |
| Postcode              | [Postcode](StructureDefinition-Postcode.html)                         | 0..1        | [PID](hl7v2.html#pid)-11 |                                                             | [Patient](StructureDefinition-Patient.html).address.postalCode              |
{:.grid}

### Hospital Spell

Treat as mandatory for reflex or subcontracted orders.

| Name                                  | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest             | HL7 FHIR Resource (Message + RESTful)                                        |
|---------------------------------------|---------------------------------------------------------------------------------------------|-------------|--------------------------|-------------------------------------|------------------------------------------------------------------------------|
| Hospital Service                      | [Service](ValueSet-service.html)                                                            | 0..1        | [PV1](hl7v2.html#pv1)-10 |                                     | Encounter.serviceType                                                        | 
| Case Identification or Account Number | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 0..1        | [PV1](hl7v2.html#pv1)-19 | ServiceRequest.encounter.identifier | Encounter.identifier [HospitalSpell](StructureDefinition-HospitalSpell.html) |
{:.grid}

### Diagnostic Workflow

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

### Diagnostic Genomics

| Name                                                  | Value Set / Data Type                                                   | Cardinality | HL7 v2 OML_O21 Message  | HL7 FHIR ServiceRequest   | 
|-------------------------------------------------------|-------------------------------------------------------------------------|-------------|-------------------------|---------------------------|
| (Order) Procedure Code - Genomic Test Code            | [Genomic Test Directory](ValueSet-GenomicTestCodes.html)                | 1..1        | [OBR](hl7v2.html#obr)-4 | ServiceRequest.code       |                               
{:.grid}
