CodeSystem: GMSWGSGuideHPOTerms
Id: GMSWGSGuideHPOTerms
Title: "GMS WGS Rare Disease Form - Guide HPO Terms"
Description: """
**Local, non-authoritative list** - the 38 example HPO (Human Phenotype
Ontology) terms shown as a guide on page 2 of the [GMS WGS Test Request
Form - Rare
Disease](https://mft.nhs.uk/app/uploads/2026/05/GMS-WGS-Test-Order-Form-Rare-Disease.pdf),
under "The following list of HPO terms is provided as a guide but is not
an exhaustive list. More terms are available at https://hpo.jax.org" - see
[Questionnaire-GMSWGSRareDisease](Questionnaire-GMSWGSRareDisease.html).

That list is rendered as an **image** on the form (a table screenshot), not
as selectable text or coded values - it carries no HPO IDs (`HP:0000000`
style identifiers), only free-text term labels grouped by clinical
specialty (Cardiology, Immunology, Ophthalmology, Renal, Developmental,
Neurology). This CodeSystem reproduces those same 38 labels as **local**
codes only, using this IG's own NWGMSA-style local coding convention (a
short PascalCase code plus the form's own display text) - it is **not**
the Human Phenotype Ontology itself, and none of these codes are HPO IDs.
Deliberately no `HP:0000000`-style codes are asserted here, since
confirming each term's correct HPO ID would need checking against
https://hpo.jax.org term-by-term rather than being guessed - see [Genomic
Test Order - Common Fields We May Have
Missed](Questionnaire-GenomicTestOrder.html#common-fields-we-may-have-missed)
for the same open question (no confirmed FHIR CodeSystem binding for HPO
exists anywhere in this IG yet).

The real `HP:0000000` codes for all 38 terms **have** since been confirmed
against the Genomics England terminology server
(`https://ontoserver.aws.gel.ac/fhir`) - see [GMSWGSGuideHPOTermsToSCT
ConceptMap](ConceptMap-GMSWGSGuideHPOTermsToSCT.html), which maps each
confirmed HPO code to SNOMED CT (22 of 38 resolved; the rest are not in
that server's own `sct-to-hpo` map). This CodeSystem's own codes remain the
local slugs above, not the confirmed HPO codes - replacing them is a
separate decision not made here.

Real usage should resolve terms against the live HPO ontology (canonically
`http://purl.obolibrary.org/obo/hp.owl`) rather than being limited to this
list - the source form itself says as much. This CodeSystem exists only so
the form's own 38 suggested terms can be offered as quick-pick options
(`#open-choice`) alongside free text, not as a substitute for real HPO
terminology.
"""
* ^caseSensitive = true
* ^experimental = true
* ^status = #draft
* ^content = #complete

// Cardiology
* #HypertrophicCardiomyopathy "Hypertrophic cardiomyopathy"
* #DilatedCardiomyopathy "Dilated cardiomyopathy"
* #Cardiomyopathy "Cardiomyopathy"

// Immunology
* #Immunodeficiency "Immunodeficiency"
* #AbnormalLymphocyteCount "Abnormal lymphocyte count"
* #AbnormalityOfHumoralImmunity "Abnormality of humoral immunity"
* #AbnormalInflammatoryResponse "Abnormal inflammatory response"

// Ophthalmology (form's own heading is spelled "Opthalmology")
* #Cataract "Cataract"
* #RetinalDystrophy "Retinal dystrophy"
* #MacularDystrophy "Macular dystrophy"

// Renal
* #MultipleRenalCysts "Multiple renal cysts"
* #HepaticCysts "Hepatic cysts"

// Developmental
* #IntellectualDisabilityModerate "Intellectual disability, moderate"
* #IntellectualDisabilityProfound "Intellectual disability, profound"
* #IntellectualDisabilitySevere "Intellectual disability, severe"
* #GlobalDevelopmentalDelay "Global developmental delay"
* #GeneralizedHypotonia "Generalized hypotonia"
* #FailureToThrive "Failure to thrive"
* #AbnormalFacialShape "Abnormal facial shape"
* #AbnormalityOfMetabolismHomeostasis "Abnormality of metabolism/homeostasis"
* #Microcephaly "Microcephaly"
* #Macrocephaly "Macrocephaly"
* #TallStature "Tall stature"
* #ShortStature "Short stature"
* #SkeletalDysplasia "Skeletal dysplasia"
* #HearingImpairment "Hearing impairment"

// Neurology
* #MuscularDystrophy "Muscular dystrophy"
* #Myopathy "Myopathy"
* #Myotonia "Myotonia"
* #PeripheralNeuropathy "Peripheral neuropathy"
* #CognitiveImpairment "Cognitive impairment"
* #Spasticity "Spasticity"
* #Chorea "Chorea"
* #Dystonia "Dystonia"
* #Ataxia "Ataxia"
* #CerebellarAtrophy "Cerebellar atrophy"
* #CerebellarHypoplasia "Cerebellar hypoplasia"
* #Seizure "Seizure"
