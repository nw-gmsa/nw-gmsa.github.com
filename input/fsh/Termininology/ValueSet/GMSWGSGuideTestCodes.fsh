ValueSet: GMSWGSGuideTestCodesVS
Id: GMSWGSGuideTestCodesVS
Title: "GMS WGS Rare Disease Form - Guide Test Codes"
Description: """
The [Genomic Test Code](CodeSystem-GenomicTestCode.html) (`$GTD`,
`England-GenomicTestDirectory`) `R*` codes whose display text names Whole Genome
Sequencing (WGS) specifically - 37 codes, all Rare & Inherited Disease. A candidate
guide list for [GMS WGS Rare
Disease](Questionnaire-GMSWGSRareDisease.html)'s Test Directory Clinical Indication
item, which is currently bound to the full [GenomicTestCodes](ValueSet-GenomicTestCodes.html)
ValueSet (every test family, not just WGS) - the same relationship [GMS WGS Guide HPO
Terms](ValueSet-GMSWGSGuideHPOTermsVS.html) has to that Questionnaire's HPO Terms item: a
curated, form-specific subset of a much larger external code list, not a replacement for
it.

Excludes `R447.1` "Validation of WGS Diagnostic discovery (Targeted variant testing)" -
its display text names WGS, but it's a targeted follow-up/confirmation test *of* a WGS
finding, not itself an order for WGS.
"""
* ^experimental = true

* $GTD#R14.1 "Acutely unwell children with a likely monogenic disorder (WGS)"
* $GTD#R15.4 "Primary immunodeficiency or monogenic inflammatory bowel disease (WGS)"
* $GTD#R27.3 "Paediatric disorders (WGS)"
* $GTD#R31.3 "Bilateral congenital or childhood onset cataracts (WGS)"
* $GTD#R32.2 "Retinal disorders (WGS)"
* $GTD#R36.2 "Structural eye disease (WGS)"
* $GTD#R54.3 "Hereditary ataxia with onset in adulthood (WGS)"
* $GTD#R55.4 "Hereditary ataxia with onset in childhood (WGS)"
* $GTD#R56.3 "Adult onset dystonia, chorea or related movement disorder (WGS)"
* $GTD#R57.5 "Childhood onset dystonia, chorea or related movement disorder (WGS)"
* $GTD#R60.3 "Adult onset hereditary spastic paraplegia (WGS)"
* $GTD#R61.4 "Childhood onset hereditary spastic paraplegia (WGS)"
* $GTD#R62.2 "Adult onset leukodystrophy (WGS)"
* $GTD#R69.5 "Hypotonic infant (WGS)"
* $GTD#R78.4 "Hereditary neuropathy or pain disorder (WGS)"
* $GTD#R83.3 "Arthrogryposis (WGS)"
* $GTD#R84.4 "Cerebellar anomalies (WGS)"
* $GTD#R85.2 "Holoprosencephaly - NOT chromosomal (WGS)"
* $GTD#R86.3 "Hydrocephalus (WGS)"
* $GTD#R87.3 "Cerebral malformation (WGS)"
* $GTD#R88.3 "Severe microcephaly (WGS)"
* $GTD#R89.3 "Ultra-rare and atypical monogenic disorders (WGS)"
* $GTD#R98.2 "Likely inborn error of metabolism (WGS)"
* $GTD#R100.3 "Rare syndromic craniosynostosis or isolated multisuture synostosis (WGS)"
* $GTD#R104.3 "Skeletal dysplasia (WGS)"
* $GTD#R109.3 "Childhood onset leukodystrophy (WGS)"
* $GTD#R135.2 "Paediatric or syndromic cardiomyopathy (WGS)"
* $GTD#R143.4 "Neonatal diabetes (WGS)"
* $GTD#R193.4 "Cystic renal disease (WGS)"
* $GTD#R195.3 "Proteinuric renal disease (WGS)"
* $GTD#R257.2 "Unexplained young onset end-stage renal disease (WGS)"
* $GTD#R381.2 "Other rare neuromuscular disorders (WGS)"
* $GTD#R441.1 "Unexplained death in infancy and sudden unexplained death in childhood (WGS)"
* $GTD#R458.1 "Young onset or familial dementia (WGS)"
* $GTD#R459.1 "Young onset or complex Parkinson disease (WGS)"
* $GTD#R460.1 "Amyotrophic lateral sclerosis (WGS)"
* $GTD#R461.1 "Cerebral amyloid angiopathy (WGS)"
