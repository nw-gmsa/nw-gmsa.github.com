<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Use Case 

TODO

## Process Flow 

See [Work Order Management (LAB-4)](LTW.html#work-order-management-lab-4)

## Data Mapping

| Name                                                                                | Optionality                        | FHIR Task             | FHIR                                                      | HL7 v2 (OML_O21)              | iGene    | StarLIMS | Other GMSA       |
|-------------------------------------------------------------------------------------|------------------------------------|-----------------------|-----------------------------------------------------------|-------------------------------|----------|----------|------------------|
| [NHS Number](StructureDefinition-NHSIdentifier.html)                                | 0..1                               |                       | ServiceRequest.subject.identifier <br/>Patient.identifier | PID-3                         |          |          | Mandatory?       |
| [Medical Record Number](StructureDefinition-MedicalRecordNumber.html)               | 0..1                               | Task.for.identifier   | Patient.identifier                                        | (PID-2)                       |  |          |                  |
| [Patient Identifier](StructureDefinition-PatientIdentifier.html)                    | 1..1                               | Task.for.identifier   | ServiceRequest.subject <br/>Patient.identifier                              | PID-2                         | P-Number |          |                  |
| [Order Number](StructureDefinition-OrderIdentifier.html)                            | 1..1                               | Task.focus.identifier | ServiceRequest.identifier                                 | ORC-2 Order Number            | T-Number |          |                  |
| [Original Order/Referral Number (Placer)](StructureDefinition-OrderIdentifier.html) | 0..1                               |                       | ServiceRequest.basedOn.identifier                         |                               |          |          |                  |
| [Original Order/Referral Number (Filler)](StructureDefinition-OrderIdentifier.html) | 1..1                               | Task.groupIdentifier  | ServiceRequest.basedOn.identifier                         |                               | R-Number |          |                  |
| Order Requester Name (and Professional Code)                                        | 0..1                               | Task.requester        | ServiceRequest.requester                                  | ORC-12	Ordering Provider      |          |          |                  |
| Test Performer                                                                      | 0..1 (mandatory for external GMSA) | Task.owner            | ServiceRequest.performer                                  | ORC-21	Ordering Facility Name |          |          | ODS Code of GMSA |
| Date / Time of the order                                                            | 1..1                               | Task.authoredOn       | ServiceRequest.authoredOn                                 | ORC-9 Order Date/Time         |          |          |                  |
| [Test Code](ValueSet-GenomicTestCodes.html)                                         | 0..1 (probably mandatory)          |                       | ServiceRequest.code                                       | OBR-4 Universal Test ID       |          |          |                  |
| Comment                                                                             | 0..*                               | Task.note             | ServiceRequest.note                                       | NTE-3 Comment                 |          |          |                  |
| Specimen Number (Order Placer)                                                      | 1..1                               |                       | Specimen.identifier                                       | SPM-2 Specimen ID             | S-Number |          |                  |
| [Specimen Type](ValueSet-specimen-type.html)                                        | 1..1                               |                       | Specimen.type                                             | SPM-4 Specimen Type           |          |          |                  | 
{:.grid}
