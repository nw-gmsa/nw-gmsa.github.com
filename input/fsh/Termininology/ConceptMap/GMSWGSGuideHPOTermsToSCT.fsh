Instance: GMSWGSGuideHPOTermsToSCT
InstanceOf: ConceptMap
Title: "GMS WGS Guide HPO Terms to SNOMED CT"
Description: """
HPO (Human Phenotype Ontology) to SNOMED CT mapping for the 38 terms in
[GMSWGSGuideHPOTermsVS](ValueSet-GMSWGSGuideHPOTermsVS.html) - see
[Questionnaire-GMSWGSRareDisease](Questionnaire-GMSWGSRareDisease.html)'s
`NOS/HPOTerm` item.

Built against the Genomics England terminology server
(https://re-docs.genomicsengland.co.uk/terminology_server/,
`https://ontoserver.aws.gel.ac/fhir`), HPO release `20191108`. That server
only publishes a **SNOMED CT to HPO** `ConceptMap` (`sct-to-hpo`), not the
reverse - `$translate` in the HPO-to-SNOMED direction returns no result
even for codes that genuinely are the target of a real entry. This
ConceptMap was therefore built by finding a candidate SNOMED CT concept for
each HPO term (`ValueSet/$expand` free-text search under the Clinical
finding (`404684003`) subtree) and forward-verifying it through
`ConceptMap/sct-to-hpo/$translate` - keeping only candidates that the
server's own map confirms translate to the exact target HPO code, with the
`equivalence` value taken directly from that server response (`equivalent`
in every case found).

**22 of the 38 terms resolved this way; the remaining 16 do not appear in
the server's `sct-to-hpo` map** - despite genuine, plausible-looking SNOMED
CT candidates existing for several of them (e.g. `193570009` "Cataract",
`1148757008` "Microcephaly", `1145403003` "Macrocephaly", `105986008`
"Skeletal dysplasia", `271700006` "Chorea") - the server's map is a curated
subset, not exhaustive HPO coverage, and none of those candidates are
included in it. Rather than assert an unverified equivalence, unresolved
terms are recorded below with `equivalence = unmatched` and no target code.
"""
Usage:  #definition

* name = "GMSWGSGuideHPOTermsToSCT"
* experimental = true
* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/GMSWGSGuideHPOTermsToSCT"
* version = "0.0.1"
* status = #draft

* sourceUri = "http://purl.obolibrary.org/obo/hp.owl"

* group.source = "http://purl.obolibrary.org/obo/hp.owl"
* group.sourceVersion = "20191108"
* group.target = "http://snomed.info/sct"
* group.targetVersion = "http://snomed.info/sct/83821000000107/version/20240605"

// --- Cardiology ---

// NWGMSA: HypertrophicCardiomyopathy
* group.element[+]
  * code = #"HP:0001639" "Hypertrophic cardiomyopathy"
  * target[+]
    * code = #233873004 "Hypertrophic cardiomyopathy"
    * equivalence = #equivalent

// NWGMSA: DilatedCardiomyopathy
* group.element[+]
  * code = #"HP:0001644" "Dilated cardiomyopathy"
  * target[+]
    * code = #399020009 "Dilated cardiomyopathy"
    * equivalence = #equivalent

// NWGMSA: Cardiomyopathy
* group.element[+]
  * code = #"HP:0001638" "Cardiomyopathy"
  * target[+]
    * code = #85898001 "Cardiomyopathy"
    * equivalence = #equivalent

// --- Immunology - none found in the server's sct-to-hpo map ---

// NWGMSA: Immunodeficiency
* group.element[+]
  * code = #"HP:0002721" "Immunodeficiency"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: AbnormalLymphocyteCount
* group.element[+]
  * code = #"HP:0040088" "Abnormal lymphocyte count"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: AbnormalityOfHumoralImmunity
* group.element[+]
  * code = #"HP:0005368" "Abnormality of humoral immunity"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: AbnormalInflammatoryResponse
* group.element[+]
  * code = #"HP:0012647" "Abnormal inflammatory response"
  * target[+]
    * equivalence = #unmatched

// --- Ophthalmology ---

// NWGMSA: Cataract - not found in the server's sct-to-hpo map, despite
// SCT 193570009 "Cataract" being an exact-looking candidate
* group.element[+]
  * code = #"HP:0000518" "Cataract"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: RetinalDystrophy
* group.element[+]
  * code = #"HP:0000556" "Retinal dystrophy"
  * target[+]
    * code = #314407005 "Retinal dystrophy"
    * equivalence = #equivalent

// NWGMSA: MacularDystrophy
* group.element[+]
  * code = #"HP:0007754" "Macular dystrophy"
  * target[+]
    * equivalence = #unmatched

// --- Renal ---

// NWGMSA: MultipleRenalCysts
* group.element[+]
  * code = #"HP:0005562" "Multiple renal cysts"
  * target[+]
    * code = #253883006 "Multiple renal cysts"
    * equivalence = #equivalent

// NWGMSA: HepaticCysts
* group.element[+]
  * code = #"HP:0001407" "Hepatic cysts"
  * target[+]
    * code = #85057007 "Liver cyst"
    * equivalence = #equivalent

// --- Developmental ---

// NWGMSA: IntellectualDisabilityModerate
* group.element[+]
  * code = #"HP:0002342" "Intellectual disability, moderate"
  * target[+]
    * code = #61152003 "Moderate learning disability"
    * equivalence = #equivalent

// NWGMSA: IntellectualDisabilityProfound
* group.element[+]
  * code = #"HP:0002187" "Intellectual disability, profound"
  * target[+]
    * code = #31216003 "Profound learning disability"
    * equivalence = #equivalent

// NWGMSA: IntellectualDisabilitySevere
* group.element[+]
  * code = #"HP:0010864" "Intellectual disability, severe"
  * target[+]
    * code = #40700009 "Severe learning disability"
    * equivalence = #equivalent

// NWGMSA: GlobalDevelopmentalDelay
* group.element[+]
  * code = #"HP:0001263" "Global developmental delay"
  * target[+]
    * code = #224958001 "Global developmental delay"
    * equivalence = #equivalent

// NWGMSA: GeneralizedHypotonia
* group.element[+]
  * code = #"HP:0001290" "Generalized hypotonia"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: FailureToThrive
* group.element[+]
  * code = #"HP:0001508" "Failure to thrive"
  * target[+]
    * code = #54840006 "Failure to thrive"
    * equivalence = #equivalent

// NWGMSA: AbnormalFacialShape
* group.element[+]
  * code = #"HP:0001999" "Abnormal facial shape"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: AbnormalityOfMetabolismHomeostasis
* group.element[+]
  * code = #"HP:0001939" "Abnormality of metabolism/homeostasis"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: Microcephaly - not found in the server's sct-to-hpo map, despite
// SCT 1148757008 "Microcephaly" being an exact-looking candidate
* group.element[+]
  * code = #"HP:0000252" "Microcephaly"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: Macrocephaly - not found in the server's sct-to-hpo map, despite
// SCT 1145403003 "Macrocephaly" being an exact-looking candidate
* group.element[+]
  * code = #"HP:0000256" "Macrocephaly"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: TallStature
* group.element[+]
  * code = #"HP:0000098" "Tall stature"
  * target[+]
    * code = #248328003 "Tall stature"
    * equivalence = #equivalent

// NWGMSA: ShortStature
* group.element[+]
  * code = #"HP:0004322" "Short stature"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: SkeletalDysplasia - not found in the server's sct-to-hpo map,
// despite SCT 105986008 "Skeletal dysplasia" being an exact-looking candidate
* group.element[+]
  * code = #"HP:0002652" "Skeletal dysplasia"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: HearingImpairment
* group.element[+]
  * code = #"HP:0000365" "Hearing impairment"
  * target[+]
    * code = #15188001 "Hearing loss"
    * equivalence = #equivalent

// --- Neurology ---

// NWGMSA: MuscularDystrophy
* group.element[+]
  * code = #"HP:0003560" "Muscular dystrophy"
  * target[+]
    * code = #73297009 "Muscular dystrophy"
    * equivalence = #equivalent

// NWGMSA: Myopathy
* group.element[+]
  * code = #"HP:0003198" "Myopathy"
  * target[+]
    * code = #129565002 "Disorder of muscle"
    * equivalence = #equivalent

// NWGMSA: Myotonia
* group.element[+]
  * code = #"HP:0002486" "Myotonia"
  * target[+]
    * code = #3434004 "Myotonia"
    * equivalence = #equivalent

// NWGMSA: PeripheralNeuropathy
* group.element[+]
  * code = #"HP:0009830" "Peripheral neuropathy"
  * target[+]
    * code = #302226006 "Peripheral nerve disease"
    * equivalence = #equivalent

// NWGMSA: CognitiveImpairment - not found in the server's sct-to-hpo map;
// SCT 386806002 "Impaired cognition" was ruled out (that code maps to
// HP:0001268 "Mental deterioration", not this term)
* group.element[+]
  * code = #"HP:0100543" "Cognitive impairment"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: Spasticity
* group.element[+]
  * code = #"HP:0001257" "Spasticity"
  * target[+]
    * code = #221360009 "Spasticity"
    * equivalence = #equivalent

// NWGMSA: Chorea - not found in the server's sct-to-hpo map, despite
// SCT 271700006 "Chorea" being an exact-looking candidate
* group.element[+]
  * code = #"HP:0002072" "Chorea"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: Dystonia
* group.element[+]
  * code = #"HP:0001332" "Dystonia"
  * target[+]
    * code = #15802004 "Dystonia"
    * equivalence = #equivalent

// NWGMSA: Ataxia (the worked example from the server's own documentation)
* group.element[+]
  * code = #"HP:0001251" "Ataxia"
  * target[+]
    * code = #20262006 "Ataxia"
    * equivalence = #equivalent

// NWGMSA: CerebellarAtrophy
* group.element[+]
  * code = #"HP:0001272" "Cerebellar atrophy"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: CerebellarHypoplasia
* group.element[+]
  * code = #"HP:0001321" "Cerebellar hypoplasia"
  * target[+]
    * code = #16026008 "Congenital cerebellar hypoplasia"
    * equivalence = #equivalent

// NWGMSA: Seizure
* group.element[+]
  * code = #"HP:0001250" "Seizure"
  * target[+]
    * code = #91175000 "Seizure"
    * equivalence = #equivalent
