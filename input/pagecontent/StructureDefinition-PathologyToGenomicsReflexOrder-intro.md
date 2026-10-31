<div class="alert alert-danger" role="alert">
This is for information/analysis purposes only and is not a planned piece of work.
</div>

A logical model of the data in a reflex order from pathology to genomics,
extracted from the [Pathology to Genomics Reflex](https://nw-gmsa.github.io/use-cases/PathologyToGenomicsReflex.html)
use case. It is not a FHIR profile and is not exchanged as is - the **Mappings**
tab shows where each element goes in HL7 v2, in this IG's FHIR profiles and in
[COSD Pathology](https://nhsd-proxy.openprescribing.net/ndrs/data/data-sets/cosd/cosd-pathology-user-guide-v5.0/core---pathology) (v5).

| Part | Elements | Defined by |
|---|---|---|
| Reflex order | patient, order numbers, hospital spell, pathology laboratory, pathologist, requesting clinician, copy report to, genomic test, consent, specimen | Probably part of the [diagnostic canonical model](diagnostic-core.html) - see [Genomic Test Order](Questionnaire-GenomicTestOrder.html) |
| Pathology report semantics | pathologyReport, ihcResult | Partly defined nationally by COSD Pathology, for the cancer registry. Neoplastic cell content (on `specimen`) is not in COSD |
{:.grid}

Elements marked **Open** in their definitions are still to be agreed - see the use case.
