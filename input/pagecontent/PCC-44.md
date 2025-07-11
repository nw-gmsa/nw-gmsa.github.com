
## Condition

### Read

<div class="alert alert-success" role="alert">
GET [base]/Condition/{id}
</div>

## Encounter

### Read

<div class="alert alert-success" role="alert">
GET [base]/Encounter/{id}
</div>


## DiagnosticReport

### Read

<div class="alert alert-success" role="alert">
GET [base]/DiagnosticReport/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/DiagnosticReport?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                                       | Note                                                                                                      |
|--------------|-----------|--------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | ```GET [base]/DiagnosticReport?_lastUpdated=[date]```        |                                                                                                           |
| identifier   | token     | ```GET [base]/DiagnosticReport?identifier=[system] [code]``` |                                                                                                           |
| patient      | reference | ```GET [base]/DiagnosticReport?patient=[id]```               | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |

## DocumentReference

### Read

<div class="alert alert-success" role="alert">
GET [base]/DocumentReference/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/DocumentReference?[parameter]=[value]]
</div>

## Observation

### Read

<div class="alert alert-success" role="alert">
GET [base]/Observation/{id}
</div>

## Patient

<div class="alert alert-success" role="alert">
<b>FHIR Profile (schema):</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>

### Read

<div class="alert alert-success" role="alert">
GET [base]/Patient/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Patient?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                             | Note                                                                                                      |
|--------------|-----------|----------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | ```GET [base]/Patient?_lastUpdated=[date]```       |                                                                                                           |
| identifier   | token     | ```GET [base]/Patient?identifier=[system][code]``` |                                                                                                           |

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

### Read

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest/{id}
</div>

### Search 

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                                     | Note                                                                                                      |
|--------------|-----------|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | ```GET [base]/ServiceRequest?_lastUpdated=[date]```        |                                                                                                           |
| identifier   | token     | ```GET [base]/ServiceRequest?identifier=[system] [code]``` |                                                                                                           |
| patient      | reference | ```GET [base]/ServiceRequest?patient=[id]```               | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |

## Specimen

### Read

<div class="alert alert-success" role="alert">
GET [base]/Specimen/{id}
</div>

### Search

<div class="alert alert-success" role="alert">
GET [base]/Specimen?[parameter]=[value]]
</div>

| Parameter    | Type      | Search                                                     | Note                                                                                                      |
|--------------|-----------|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | date      | ```GET [base]/Specimen?_lastUpdated=[date]```        |                                                                                                           |
| identifier   | token     | ```GET [base]/Specimen?identifier=[system] [code]``` |                                                                                                           |
| patient      | reference | ```GET [base]/Specimen?patient=[id]```               | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |


## Task

### Read

<div class="alert alert-success" role="alert">
GET [base]/Task/{id}
</div>
