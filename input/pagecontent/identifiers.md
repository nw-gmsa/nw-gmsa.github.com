
To amend an entry in these tables, amend the table directly on this GitHub page https://github.com/nw-gmsa/R4/blob/main/input/pagecontent/identifiers.md and submit a pull request.

## Patient 

| Organisation                                    | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR) | OID (FHIR, v3 and IHE) | Alternate name                       | 
|-------------------------------------------------|--------------------------------------|------------|---------------|------------------------|--------------------------------------|
| Alder Hey Children’s NHS Foundation Trust       | RBS                                  | MR         |               |                        |                                      |
| Liverpool Women’s Hospital NHS Foundation Trust | REP                                  | MR         |               |                        |                                      |
| The Christie NHS Foundation Trust               | RBV                                  | MR         |               |                        |                                      |
| Manchester University NHS Foundation Trust      | ROA                                  | MR         |               |                        | Equivalent to internal v2 type = EPI |

## ServiceRequest

| Organisation                                        | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR)                               | OID (FHIR, v3 and IHE) | Alternate name | 
|-----------------------------------------------------|--------------------------------------|------------|---------------------------------------------|------------------------|----------------|
| Alder Hey Children’s NHS Foundation Trust           | RBS                                  | PLAC       |                                             |                        |                |
| Liverpool Women’s Hospital NHS Foundation Trust     | REP                                  | PLAC         |                                             |                        |                |
| The Christie NHS Foundation Trust                   | RBV                                  | PLAC         |                                             |                        |                |
| Manchester University NHS Foundation Trust          | ROA                                  | PLAC         |                                             |                        |                |
| North West Genomic Medicine Service Alliance (GMSA) | 699X0                                | FILL       | https://fhir.nw-gmsa.nhs.uk/Id/FillerNumber |                        |                |

## Encounter 

| Organisation                                    | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR) | OID (FHIR, v3 and IHE) | Alternate name | 
|-------------------------------------------------|--------------------------------------|------------|---------------|------------------------|----------------|
| Alder Hey Children’s NHS Foundation Trust       | RBS                                  | VN         |               |                        |                |
| Liverpool Women’s Hospital NHS Foundation Trust | REP                                  | VN         |               |                        |                |
| The Christie NHS Foundation Trust               | RBV                                  | VN         |               |                        |                |
| Manchester University NHS Foundation Trust      | ROA                                  | VN         |               |                        |                |

## DiagnosticReport

| Organisation                                        | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR)                                | OID (FHIR, v3 and IHE) | Alternate name | 
|-----------------------------------------------------|--------------------------------------|------------|----------------------------------------------|------------------------|----------------|
| North West Genomic Medicine Service Alliance (GMSA) | 699X0                                |            | https://fhir.nw-gmsa.nhs.uk/Id/GenomicReport |                        |                |

## Specimen

| Organisation                                        | Assigning Authority - ODS Code (All) | Type (All) | System (FHIR)                                      | OID (FHIR, v3 and IHE) | Alternate name                       | 
|-----------------------------------------------------|--------------------------------------|------------|----------------------------------------------------|------------------------|--------------------------------------|
| Alder Hey Children’s NHS Foundation Trust           | RBS                                  | SID        |                                                    |                        |                                      |
|                                                     | RBS                                  | ASCN        |                                                    |                        |                                      |
| Liverpool Women’s Hospital NHS Foundation Trust     | REP                                  | SID        |                                                    |                        |                                      |
|                                                     | REP                                  | ASCN        |                                                    |                        |                                      |
| The Christie NHS Foundation Trust                   | RBV                                  | SID        |                                                    |                        |                                      |
|                                                     | RBV                                  | ASCN        |                                                    |                        |                                      |
| Manchester University NHS Foundation Trust          | ROA                                  | SID        |                                                    |                        | Equivalent to internal v2 type = EPI |
|                                                     | ROA                                  | ASCN        |                                                    |                        | Equivalent to internal v2 type = EPI |
| North West Genomic Medicine Service Alliance (GMSA) | 699X0                                | SID        | https://fhir.nw-gmsa.nhs.uk/Id/Specimen            |                        |                                      |
|                                                     | 699X0                                | ASCN       | https://fhir.nw-gmsa.nhs.uk/Id/AccessionIdentifier |                        |                                      |
