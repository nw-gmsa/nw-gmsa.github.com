
## Condition

## Encounter

## DiagnosticReport

## Observation

## ServiceRequest

### Read

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest/{id}
</div>

### Search

#### _lastUpdated

<div class="alert alert-success" role="alert">
GET [base]/ServiceRequest?_lastUpdated=[date]
</div>

#### identifier

```
GET [base]/ServiceRequest?identifier=[system]|[code]
```

#### patient

```
GET [base]/ServiceRequest?patient=[id]
```

`id` is the logical id of the patient on the server which can be obtained by a [Patient](#patient) query.

### Specimen

### Task
