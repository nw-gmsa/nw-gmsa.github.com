## NHS Data Dictionary and Model

No NHS Data Dictionary entry for the general (pathology/genomics) specimen
accession number - it is a laboratory-assigned identifier, not a nationally
defined one. The closest NHS Data Dictionary analogue is
[RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html),
which applies to imaging studies rather than specimens.

**Ubiquitous terms:** Accession Number, Lab Number, Case Number, Specimen
Number.

## Mapping

- **HL7 FHIR** Specimen.accessionIdentifier (type = ACSN)
- **HL7 v2** Accession ID (SPM-30)
- **IHE XDS** referenceIdList

In pathology and genomics, the accession number refers to the Specimen. 
In imaging the accession number refers to the imaging test [RADIOLOGICAL ACCESSION NUMBER](https://www.datadictionary.nhs.uk/data_elements/radiological_accession_number.html)  

| Ubiquitous Term | Field    | HL7 FHIR Identifier | OID                                          | HL7 v2 CX | HL7 FHIR Example                                   | HL7 v2 Example |
|------------------|----------|----------------------|-----------------------------------------------|-----------|-----------------------------------------------------|----------------|
| Accession Number | Value    | value               | none - locally assigned by the laboratory     | EI.1      | ABC1234                                            | ABC1234        |
| -                | Type     | type                |                                                |           | http://terminology.hl7.org/CodeSystem/v2-0203#ACSN |                |
| ODS Code         | ODS Code | assigner.identifier | `2.16.840.1.113883.2.1.3.2.4.18.48`           | EI.2      | https://fhir.nhs.uk/Id/ods-organization-code#RBS   | RBS            |
| -                | System   | system              | none - locally assigned by the laboratory     | N/a       | https://fhir.example.org/Id/medical-record-number  | N/a            |
{:.grid}

## Examples

### HL7 v2 EI

```aiignore
ABC1234^R0A
```

### HL7 FHIR Identifier

```json
{
  "type": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code": "ACSN"
      }
    ]
  },
  "value": "ABC1234",
  "assigner": {
    "identifier": {
      "system": "https://fhir.nhs.uk/Id/ods-organization-code",
      "value": "R0A"
    }
  }
}
```
