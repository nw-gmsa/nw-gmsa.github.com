ValueSet: GMSWGSGuideHPOTermsVS
Id: GMSWGSGuideHPOTermsVS
Title: "GMS WGS Rare Disease Form - Guide HPO Terms"
Description: """
The 38 example HPO (Human Phenotype Ontology) terms shown as a guide
(rendered as an image, not selectable text, so no codes were available
directly from the form itself) on page 2 of the [GMS WGS Test Request Form
- Rare
Disease](https://mft.nhs.uk/app/uploads/2026/05/GMS-WGS-Test-Order-Form-Rare-Disease.pdf).

Unlike the CodeSystem this ValueSet previously drew from, these **are**
real HPO codes (`http://purl.obolibrary.org/obo/hp.owl`, release
`20191108`) - confirmed against the Genomics England terminology server
(`https://ontoserver.aws.gel.ac/fhir`) via `CodeSystem/$lookup`, not
guessed. See [GMSWGSGuideHPOTermsToSCT
ConceptMap](ConceptMap-GMSWGSGuideHPOTermsToSCT.html) for the SNOMED CT
mapping built from the same verification pass (22 of these 38 resolved;
the rest have no entry in that server's own `sct-to-hpo` map).

Bound as `#open-choice` on
[Questionnaire-GMSWGSRareDisease](Questionnaire-GMSWGSRareDisease.html)'s
`NOS/HPOTerm` item, so these 38 terms are offered as quick picks without
preventing free-text/other-code entry of any other HPO term, consistent
with the source form's own "guide ... not an exhaustive list" wording.
"""
* ^experimental = true

// Cardiology

* $hpo#"HP:0001639" "Hypertrophic cardiomyopathy"
* $hpo#"HP:0001644" "Dilated cardiomyopathy"
* $hpo#"HP:0001638" "Cardiomyopathy"

// Immunology

* $hpo#"HP:0002721" "Immunodeficiency"
* $hpo#"HP:0040088" "Abnormal lymphocyte count"
* $hpo#"HP:0005368" "Abnormality of humoral immunity"
* $hpo#"HP:0012647" "Abnormal inflammatory response"

// Ophthalmology (form's own heading is spelled "Opthalmology")

* $hpo#"HP:0000518" "Cataract"
* $hpo#"HP:0000556" "Retinal dystrophy"
* $hpo#"HP:0007754" "Macular dystrophy"

// Renal

* $hpo#"HP:0005562" "Multiple renal cysts"
* $hpo#"HP:0001407" "Hepatic cysts"

// Developmental

* $hpo#"HP:0002342" "Intellectual disability, moderate"
* $hpo#"HP:0002187" "Intellectual disability, profound"
* $hpo#"HP:0010864" "Intellectual disability, severe"
* $hpo#"HP:0001263" "Global developmental delay"
* $hpo#"HP:0001290" "Generalized hypotonia"
* $hpo#"HP:0001508" "Failure to thrive"
* $hpo#"HP:0001999" "Abnormal facial shape"
* $hpo#"HP:0001939" "Abnormality of metabolism/homeostasis"
* $hpo#"HP:0000252" "Microcephaly"
* $hpo#"HP:0000256" "Macrocephaly"
* $hpo#"HP:0000098" "Tall stature"
* $hpo#"HP:0004322" "Short stature"
* $hpo#"HP:0002652" "Skeletal dysplasia"
* $hpo#"HP:0000365" "Hearing impairment"

// Neurology

* $hpo#"HP:0003560" "Muscular dystrophy"
* $hpo#"HP:0003198" "Myopathy"
* $hpo#"HP:0002486" "Myotonia"
* $hpo#"HP:0009830" "Peripheral neuropathy"
* $hpo#"HP:0100543" "Cognitive impairment"
* $hpo#"HP:0001257" "Spasticity"
* $hpo#"HP:0002072" "Chorea"
* $hpo#"HP:0001332" "Dystonia"
* $hpo#"HP:0001251" "Ataxia"
* $hpo#"HP:0001272" "Cerebellar atrophy"
* $hpo#"HP:0001321" "Cerebellar hypoplasia"
* $hpo#"HP:0001250" "Seizure"
