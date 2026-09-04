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
only publishes a **SNOMED CT to HPO** `ConceptMap` (`sct-to-hpo`) by name,
but does support querying it in the HPO-to-SNOMED direction directly via
`ConceptMap/sct-to-hpo/$translate?...&reverse=true` - see [nw-gmsa/Testing
notebook 13](https://github.com/nw-gmsa/Testing/blob/main/notebooks/13-snomed-to-hpo-genomic-clinical-indication.ipynb),
which uses the same server and surfaced this parameter. An initial pass of
this ConceptMap missed that: it instead found a candidate SNOMED CT concept
for each HPO term (`ValueSet/$expand` free-text search under the Clinical
finding (`404684003`) subtree) and forward-verified it through
`ConceptMap/sct-to-hpo/$translate` in the SNOMED-to-HPO direction - which
undercounted, since a genuinely-mapped HPO term can have a mapped SNOMED
code that isn't the one a text search happens to surface (e.g. Cataract
*is* mapped, to SNOMED `128306009`, not the `193570009` a plain text search
returns first). This version instead queries `reverse=true` directly for
every HPO code, with the `equivalence` value taken directly from that
server response (`equivalent` in every case found).

**27 of the 38 terms resolved this way; the remaining 11 do not appear in
the server's `sct-to-hpo` map even via `reverse=true`** - so these are
genuinely absent from the server's curated map, not an artefact of the
search methodology. Rather than assert an unverified equivalence,
unresolved terms are recorded below with `equivalence = unmatched` and no
target code.
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

// NWGMSA: Cataract - found via reverse=true; a plain text search on
// "Cataract" surfaces SCT 193570009, which is NOT the mapped code
* group.element[+]
  * code = #"HP:0000518" "Cataract"
  * target[+]
    * code = #128306009 "Cataract"
    * equivalence = #equivalent

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

// NWGMSA: AbnormalFacialShape - found via reverse=true
* group.element[+]
  * code = #"HP:0001999" "Abnormal facial shape"
  * target[+]
    * code = #112630007 "Abnormal facies"
    * equivalence = #equivalent

// NWGMSA: AbnormalityOfMetabolismHomeostasis
* group.element[+]
  * code = #"HP:0001939" "Abnormality of metabolism/homeostasis"
  * target[+]
    * equivalence = #unmatched

// NWGMSA: Microcephaly - found via reverse=true; a plain text search on
// "Microcephaly" surfaces SCT 1148757008, which is NOT the mapped code
* group.element[+]
  * code = #"HP:0000252" "Microcephaly"
  * target[+]
    * code = #1829003 "Microcephalus"
    * equivalence = #equivalent

// NWGMSA: Macrocephaly - found via reverse=true; a plain text search on
// "Macrocephaly" surfaces SCT 1145403003, which is NOT the mapped code
* group.element[+]
  * code = #"HP:0000256" "Macrocephaly"
  * target[+]
    * code = #19410003 "Macrocephaly"
    * equivalence = #equivalent

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
// even via reverse=true
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

// NWGMSA: CognitiveImpairment - not found in the server's sct-to-hpo map,
// even via reverse=true; SCT 386806002 "Impaired cognition" was separately
// ruled out (that code maps to HP:0001268 "Mental deterioration", not this
// term)
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

// NWGMSA: Chorea - not found in the server's sct-to-hpo map, even via
// reverse=true
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

// NWGMSA: CerebellarAtrophy - found via reverse=true
* group.element[+]
  * code = #"HP:0001272" "Cerebellar atrophy"
  * target[+]
    * code = #95646004 "Cerebellar degeneration"
    * equivalence = #equivalent

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
