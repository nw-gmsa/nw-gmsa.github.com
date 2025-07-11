
## Condition

## Encounter

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


## Observation

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

### Specimen


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


### Task
