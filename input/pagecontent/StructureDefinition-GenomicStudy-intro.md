<div class="alert alert-info" role="alert">
<b>HL7 Genomic Reporting:</b> <a href="https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html" _target="_blank">Genomic Study</a>
</div>

## Reference

- HL7 v2 [Lab Result Interface (LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) TBC Section 1

## Data Elements


| Name                                        | LOINC             | Value Set / Data Type                                                                                                            | Example   | Cardinality | HL7 v2 OBX-4 | FHIR Profile                                                                                                                  |
|---------------------------------------------|-------------------|---------------------------------------------------------------------------------------------------------------------|-----------|-------------|------------|-------------------------------------------------------------------------------------------------------------------------------|
| Analysis method [Type]                      | Might be 81304-8  | [Genomic Study Type ValueSet](https://build.fhir.org/ig/HL7/genomics-reporting/ValueSet-genomic-study-type-vs.html) | SNP Array | 0..1        |            | [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).code  |
| Gene disease assessed / Clinical Indication | 51967-8           |                                                                                                                     |           | 1..1        | 1.a        | [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).reasonCode                                                                    |
| Genomic Test Outcome                        | TESTCOME (NWGMSA) | [Genomic Test Outcome Codes](ValueSet-GenomicTestOutcomeCodes.html)                                                 |           |             |            | [Genomic Study](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html).outcome                                                                       |                                                                                                                                                                                 |
{:.grid}

