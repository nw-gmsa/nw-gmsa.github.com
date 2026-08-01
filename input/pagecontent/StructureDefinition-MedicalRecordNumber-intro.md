## Mapping

| Field              | HL7 FHIR Identifier        | Value / OID / URI                                                                                    | HL7 v2 CX          | HL7 FHIR Example                                      | HL7 v2 Example |
|--------------------|----------------------------|------------------------------------------------------------------------------------------------------|--------------------|-------------------------------------------------------|----------------|
| Number             | value                      | {local patient identifier}                                                                           | CX.1               | ABC1234                                               | ABC1234        |
| System             | system                     | FHIR prefers a URI. OID are also permitted, these are likely to be defined by PAS/EPR or within XDS. | -                  | https://fhir.alderhey.nhs.uk/Id/medical-record-number |                |
| Type               | type.coding.code           | MR (fixed)                                                                                           | CX.5 | MR                                                    | MR             |
|                    | type.coding.system        | http://terminology.hl7.org/CodeSystem/v2-0203                                                        | -                  | http://terminology.hl7.org/CodeSystem/v2-0203#        |                |             
| NHS Trust ODS Code | assigner.identifier.value  | {ods code}                                                                                           | CX.4               | RBS                                                   | RBS            |
|                    | assigner.identifier.system | https://fhir.nhs.uk/Id/ods-organization-code (fixed)                                                 | -                  | https://fhir.nhs.uk/Id/ods-organization-code          |                |
{:.grid}

## Example 

### HL7 v2 CX 

```aiignore
633^^^R0A^MR
```
### HL7 FHIR Identifier

```json
{
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "MR"
          }
        ]
      },
      "system" : "urn:oid:1.2.840.114350.1.13.611.3.7.5.737384.14",
      "value" : "633",
      "assigner" : {
        "identifier" : {
          "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
          "value" : "R0A"
        }
      }
    }
```

## Identifier.system

| Name                                                    | System                                       |
|---------------------------------------------------------|----------------------------------------------|
| Manchester University NHS Foundation Trust (MFT) - EPIC |  |
| Liverpool Women's NHS Foundation Trust (LWT) - Meditech |  |
| Alder Hey - Meditech                                    |  |
{:.grid}
