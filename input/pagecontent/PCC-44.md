
This API for the NW GMSA Clinical Data Repository is based on the following API contracts:

- [IHE Mobile Query Existing Data [PCC-44]](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html)
- [INTEROPen/NHS England Care Connect API](https://nhsconnect.github.io/CareConnectAPI) updated to FHIR R4.

The search parameters are based on [FHIR Search](https://hl7.org/fhir/R4/search.html) which provides detailed description of the parameters and value types.

## Condition

<table style="">
    <tr>
        <td>
            <div class="alert alert-info" role="alert">
            <b>FHIR Profile (schema):</b> <a href="StructureDefinition-Condition.html" _target="_blank">Condition</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#dg1" _target="_blank">DG1</a> 
            </div>
        </td>
	</tr>
</table>


### Read

<div class="alert alert-success" role="alert">
GET [base]/Condition/{id}
</div>

## Encounter


<table style="">
    <tr>
        <td>
           <div class="alert alert-info" role="alert">
            <b>FHIR Profile (schema):</b> <a href="StructureDefinition-Encounter.html" _target="_blank">Encounter</a> 
           </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#pv1" _target="_blank">PV1</a> 
            </div>
        </td>
	</tr>
</table>


This Encounter represents the overall episode or stay, for further information see [Interweave Encounter Grouping](https://fhir.interweavedigital.com/R4/StructureDefinition-Interweave-EncounterGrouping.html)

### Read

<div class="alert alert-success" role="alert">
GET [base]/Encounter/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Encounter?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                               | Note                               |
|--------------|-----------|------------------------------------------------------|------------------------------------|
| _lastUpdated | date      | GET [base]/Encounter?_lastUpdated=[date]             | date the resource was last updated |
| identifier   | token     | GET [base]/Encounter?identifier=[system&#124;][code] | Identifier(s) by which this encounter is known                                   |
| patient      | reference | GET [base]/Encounter?identifier=[id]                 | The patient present at the encounter                                   |
| date         | date     | GET [base]/Encounter?identifier=[date]               | A date within the actualPeriod the Encounter lasted                                   |



## DiagnosticReport

<div class="alert alert-info" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-DiagnosticReport.html" _target="_blank">DiagnosticReport</a> 
</div>

### Read

<div class="alert alert-success" role="alert">
GET [base]/DiagnosticReport/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/DiagnosticReport?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                                      | Note                                                                                                      |
|--------------|-----------|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/DiagnosticReport?_lastUpdated=[date]             |                                                                                                           |
| identifier   | token     | GET [base]/DiagnosticReport?identifier=[system&#124;][code] |                                                                                                           |
| patient      | reference | GET [base]/DiagnosticReport?patient=[id]                    | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |

## DocumentReference

<div class="alert alert-info" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-DocumentReference.html" _target="_blank">DocumentReference</a> 
</div>


### Read

<div class="alert alert-success" role="alert">
GET [base]/DocumentReference/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/DocumentReference?[parameter]=[value]]
</div>

## Observation

<div class="alert alert-info" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-Observation.html" _target="_blank">Observation</a> 
</div>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Observation/{id}
</div>

## Patient


<table style="">
    <tr>
        <td>
           <div class="alert alert-info" role="alert">
            <b>FHIR Profile (schema):</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
            </div>
        </td>
        <td>
            <div class="alert alert-secondary" role="alert">
                <b>Related to HL7 v2 Segment:</b> <a href="hl7v2.html#pid" _target="_blank">PID</a> 
            </div>
        </td>
	</tr>
</table>


### Read

<div class="alert alert-success" role="alert">
GET [base]/Patient/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Patient?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                         | Note                                                                                                      |
|--------------|-----------|------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/Patient?_lastUpdated=[date]      |                                                                                                           |
| identifier   | token     | GET [base]/Patient?identifier=[system&#124;][code] |                                                                                                           |

#### Example

Searching for a Patient via NHS Number.

```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9449305552
Accept: application/fhir+json
```

Searching for a Patient via Medical Record Number.

```
GET [base]/Patient?identifier=http://www.acme.org/patient/identifier|A12356565
Accept: application/fhir+json
```

## ServiceRequest

<div class="alert alert-info" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>

### Read

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest/{id}
</div>

### Search 

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                              | Note                                                                                                      |
|--------------|-----------|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/ServiceRequest?_lastUpdated=[date]```    |                                                                                                           |
| identifier   | token     | GET [base]/ServiceRequest?identifier=[[system&#124;][code]``` |                                                                                                           |
| patient      | reference | GET [base]/ServiceRequest?patient=[id]          | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |
| [assigner](SearchParameter-assigner.html) | token | GET [base]/ServiceRequest?assigner=[system&#124;][code] | |

#### Example

Searching for a ServiceRequest via Order Placer Number.

```
GET [base]/ServiceRequest?identifier=http://www.acme.org/servicerequest/identifier|1601737
Accept: application/fhir+json
```

Searching for a ServiceRequest via Order Placer Number and Assigning Authority. Note in this example the system for `assigner` and `identifier` have been omitted.

```
GET [base]/ServiceRequest?identifier=1601737&assigner=R0A
Accept: application/fhir+json
```


## Specimen

<div class="alert alert-info" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
</div>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Specimen/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Specimen?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                           | Note                                                                                                      |
|--------------|-----------|--------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | GET [base]/Specimen?_lastUpdated=[date]    |                                                                                                           |
| identifier   | token     | GET [base]/Specimen?identifier=[system&#124;][code] |                                                                                                           |
| patient      | reference | GET [base]/Specimen?patient=[id]           | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |


## Task

<div class="alert alert-info" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-Task.html" _target="_blank">Task</a> 
</div>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Task/{id}
</div>
