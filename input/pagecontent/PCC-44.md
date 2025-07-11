
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

| Parameter    | Search                                                       | Note                                                                                                      |
|--------------|--------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | ```GET [base]/DiagnosticReport?_lastUpdated=[date]```        |                                                                                                           |
| identifier   | ```GET [base]/DiagnosticReport?identifier=[system] [code]``` |                                                                                                           |
| patient      | ```GET [base]/DiagnosticReport?patient=[id]```               | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |


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

| Parameter    | Search                                                     | Note                                                                                                      |
|--------------|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| _lastUpdated | ```GET [base]/ServiceRequest?_lastUpdated=[date]```        |                                                                                                           |
| identifier   | ```GET [base]/ServiceRequest?identifier=[system] [code]``` |                                                                                                           |
| patient      | ```GET [base]/ServiceRequest?patient=[id]```               | `id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query. |


### Specimen

### Task
