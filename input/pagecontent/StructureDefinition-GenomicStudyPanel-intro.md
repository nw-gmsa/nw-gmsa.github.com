<div class="alert alert-info" role="alert">
<b>HL7 Genomic Reporting:</b> <a href="https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-genomic-study.html" _target="_blank">Genomic Study</a>
</div>

## Reference

- HL7 v2 [Lab Result Interface (LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) TBC Section 1

## Data 

Extract, full list can be found in [Variables that apply to the overall study](https://loinc.org/81306-3)


| Name                                                                      | LOINC   | Value Set / Data Type                                                                                                | Cardinality | HL7 v2 OBX-4 | HL7 FHIR               | Example | 
|---------------------------------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------|-------------|--------------|------------------------|---------|
|                                                                           | 81306-3 |                                                                                                                      |             | | Observation.code       |  |
| Gene disease assessed / Clinical Indication                               | 51967-8 | [Genomic Clinical Indication Codes](ValueSet-GenomicClinicalIndicationCodes.html)                                                                                | 0..1        |              | Observation.hasMemeber | |
| Discrete variation analysis overall interpretation / Genomic Test Outcome | 51968-6 | [Genomic Test Outcome Codes](ValueSet-GenomicTestOutcomeCodes.html) and [Variant Assess](https://loinc.org/LL1971-2) | 1..1        |              |    Observation.hasMemeber                    | |
{:.grid}

