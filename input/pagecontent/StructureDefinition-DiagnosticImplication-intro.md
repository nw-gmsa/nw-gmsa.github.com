
<div class="alert alert-info" role="alert">
<b>HL7 Genomic Reporting:</b> <a href="https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html" _target="_blank">Diagnostic Implication</a>
</div>

## Reference 

- HL7 v2 [Lab Result Interface (LRI)](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) TBC Section 2

## Data Elements

| Name                                                   | LOINC   | Value Set / Data Type                                                                                                                                                                                                                                           | Example        | Cardinality | HL7 v2 OBX-4 | FHIR Observation Profile                                                                                                                                    |
|--------------------------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|-------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Genetic sequence variation clinical significance [Imp] | 53037-8 | [ACMG_Clinical significance of genetic variation](https://loinc.org/LL4034-6)                                                                                                                                                                                   | Pathogenic    | 0..1        | 2a           | [Diagnostic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html).component[clinical-significance] |
| Probable Associated Phenotype                          | 81259-4 | NHS England [Genomic Clinical Indication Codes](ValueSet-GenomicClinicalIndicationCodes.html) <br/> or [SNOMED Genomic Disorder Carrier](ValueSet-GenomicDisorderCarrier.html) <br/> or [SNOMED Genetic Finding Detected](ValueSet-GenomicFindingDetected.html) | Lynch syndrome | 0..1        | 2a           | [Diagnostic Implication](https://build.fhir.org/ig/HL7/genomics-reporting/StructureDefinition-diagnostic-implication.html).component[predicted-phenotype]   |
{:.grid}
