Instance: GenomicClinicalIndicationToGenomicTestCode
InstanceOf: ConceptMap
Title: "Genomic Clinical Indication to Genomic Test Code (narrower)"
Description: """
Every `GenomicTestCode` (`England-GenomicTestDirectory`) entry belongs to
exactly one `GenomicClinicalIndication` entry, by construction (`<CI>.<n>`
under `<CI>`) - not an empirical mapping like the legacy/digital ConceptMaps
below, so every element uses `equivalence = #narrower` (the target, a specific
test, is always narrower in scope than the source, the clinical indication it
sits under), regardless of how many tests a given indication has.

Built by [nw-gmsa/Testing notebook 14](https://github.com/nw-gmsa/Testing/blob/main/notebooks/14-national-genomic-test-directory-codesystems.ipynb), checked against v9/v16 on 2026-09-05.
"""
Usage:  #definition

* name = "GenomicClinicalIndicationToGenomicTestCode"
* experimental = false
* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/GenomicClinicalIndicationToGenomicTestCode"
* version = "2026-09-05"
* status = #active

* group.source = "https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicClinicalIndication"
* group.sourceVersion = "2026-09-05"
* group.target = "https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory"
* group.targetVersion = "2026-09-05"

* group.element[+]
  * code = #M1 "Colorectal Carcinoma"
  * target[+]
    * code = #M1.1 "Colorectal Carcinoma, Multi-target NGS panel - small variant (KRAS, NRAS, BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M1.2 "Colorectal Carcinoma, KRAS hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M1.3 "Colorectal Carcinoma, NRAS hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M1.4 "Colorectal Carcinoma, MSI Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M1.5 "Colorectal Carcinoma, MLH1 promoter hypermethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M1.6 "Colorectal Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M1.7 "Colorectal Carcinoma, DPYD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M1.9 "Colorectal Carcinoma, Multi-target NGS panel - small variant (MLH1, MSH2, MSH6, PMS2, POLE, POLD1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M2 "Ovarian Carcinoma"
  * target[+]
    * code = #M2.1 "Ovarian Carcinoma, Multi-target NGS panel - small variant (BRCA1, BRCA2, SMARCA4)"
    * equivalence = #narrower
  * target[+]
    * code = #M2.3 "Ovarian Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M2.5 "Ovarian Carcinoma, HRD status (either positive for BRCA 1 and/or 2, or HRD positive)"
    * equivalence = #narrower
* group.element[+]
  * code = #M3 "Breast Cancer"
  * target[+]
    * code = #M3.12 "Breast Cancer, Tumour profiling tests to guide adjuvant chemotherapy decisions in early breast cancer"
    * equivalence = #narrower
  * target[+]
    * code = #M3.13 "Breast Cancer, Multi-target ctDNA NGS panel - small variant (ESR1, PIK3CA, AKT1, PTEN (SNV & CNV))"
    * equivalence = #narrower
  * target[+]
    * code = #M3.5 "Breast Cancer, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M3.6 "Breast Cancer, Multi-target NGS panel - small variant (PIK3CA, AKT1, PTEN (SNV & CNV))"
    * equivalence = #narrower
  * target[+]
    * code = #M3.7 "Breast Cancer, DPYD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M3.9 "Breast Cancer, ETV6-NTRK3 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M4 "Non-Small Cell Lung Cancer"
  * target[+]
    * code = #M4.1 "Non-Small Cell Lung Cancer, Multi-target NGS panel - small variant (EGFR, ALK, BRAF, KRAS, MET)"
    * equivalence = #narrower
  * target[+]
    * code = #M4.10 "Non-Small Cell Lung Cancer, EML4-ALK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M4.11 "Non-Small Cell Lung Cancer, ALK hotspot cDNA"
    * equivalence = #narrower
  * target[+]
    * code = #M4.13 "Non-Small Cell Lung Cancer, Combined Multi-target NGS panel - small variant (EGFR, ALK, BRAF, KRAS, MET exon 14 skipping) and structural variant (ROS1, RET, ALK, NTRK1, NTRK2, NTRK3, MET exon 14 skipping)"
    * equivalence = #narrower
  * target[+]
    * code = #M4.14 "Non-Small Cell Lung Cancer, Multi-target ctDNA combined Multi-target NGS panel - small variant (EGFR, ALK, BRAF, KRAS, MET exon 14 skipping and copy number variations) and structural variant (ROS1, RET, ALK, NTRK1, NTRK2, NTRK3, MET exon 14 skipping)"
    * equivalence = #narrower
  * target[+]
    * code = #M4.2 "Non-Small Cell Lung Cancer, Multi-target NGS panel - structural variant (ROS1, RET, EML4-ALK, NTRK1, NTRK1, NTRK3, MET)"
    * equivalence = #narrower
  * target[+]
    * code = #M4.3 "Non-Small Cell Lung Cancer, Multi-target NGS panel - copy number variant (MET)"
    * equivalence = #narrower
  * target[+]
    * code = #M4.4 "Non-Small Cell Lung Cancer, EGFR hotspot tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M4.5 "Non-Small Cell Lung Cancer, EGFR hotspot ctDNA"
    * equivalence = #narrower
  * target[+]
    * code = #M4.6 "Non-Small Cell Lung Cancer, ROS1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M4.7 "Non-Small Cell Lung Cancer, RET rearrangement FISH/RT-PC"
    * equivalence = #narrower
  * target[+]
    * code = #M4.8 "Non-Small Cell Lung Cancer, MET copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M5 "Mesothelioma"
  * target[+]
    * code = #M5.1 "Mesothelioma, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M5.2 "Mesothelioma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M5.3 "Mesothelioma, Multi-target NGS panel - copy number variant (CDKN2A)"
    * equivalence = #narrower
* group.element[+]
  * code = #M6 "Mucoepidermoid Carcinoma"
  * target[+]
    * code = #M6.1 "Mucoepidermoid Carcinoma, MAML2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M6.2 "Mucoepidermoid Carcinoma, Multi-target NGS panel - structural variant (MAML2, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M6.3 "Mucoepidermoid Carcinoma, Multi-target NGS panel - structural variant (MAML2)"
    * equivalence = #narrower
  * target[+]
    * code = #M6.5 "Mucoepidermoid Carcinoma, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M7 "Melanoma - Adult"
  * target[+]
    * code = #M7.1 "Melanoma - Adult, Multi-target NGS panel - small variant (BRAF, KIT, NRAS)"
    * equivalence = #narrower
  * target[+]
    * code = #M7.10 "Melanoma - Adult, Copy number variant detection to genomewide resolution"
    * equivalence = #narrower
  * target[+]
    * code = #M7.2 "Melanoma - Adult, BRAF hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M7.3 "Melanoma - Adult, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M7.5 "Melanoma - Adult, MYB & 6cen"
    * equivalence = #narrower
  * target[+]
    * code = #M7.6 "Melanoma - Adult, RREB1 (6p25)"
    * equivalence = #narrower
  * target[+]
    * code = #M7.7 "Melanoma - Adult, CCND1 (11q13)"
    * equivalence = #narrower
  * target[+]
    * code = #M7.8 "Melanoma - Adult, MYC & 8cen"
    * equivalence = #narrower
  * target[+]
    * code = #M7.9 "Melanoma - Adult, CDKN2A & 9cen"
    * equivalence = #narrower
* group.element[+]
  * code = #M8 "Gastrointestinal Stromal Tumour"
  * target[+]
    * code = #M8.1 "Gastrointestinal Stromal Tumour, Multi-target NGS panel - small variant (KIT, PDGFRA)"
    * equivalence = #narrower
  * target[+]
    * code = #M8.2 "Gastrointestinal Stromal Tumour, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M9 "Thyroid Papillary Carcinoma - Adult"
  * target[+]
    * code = #M9.1 "Thyroid Papillary Carcinoma - Adult, Multi-target NGS panel - small variant (BRAF, KRAS, NRAS, HRAS, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M9.2 "Thyroid Papillary Carcinoma - Adult, Multi-target NGS panel - structural variant (RET, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M9.3 "Thyroid Papillary Carcinoma - Adult, RET rearrangement FISH/RT-PC"
    * equivalence = #narrower
  * target[+]
    * code = #M9.4 "Thyroid Papillary Carcinoma - Adult, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M9.6 "Thyroid Papillary Carcinoma - Adult, TERT promoter hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M10 "Thyroid Follicular Carcinoma"
  * target[+]
    * code = #M10.1 "Thyroid Follicular Carcinoma, Multi-target NGS panel - small variant (KRAS, NRAS, HRAS)"
    * equivalence = #narrower
  * target[+]
    * code = #M10.2 "Thyroid Follicular Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3, RET)"
    * equivalence = #narrower
* group.element[+]
  * code = #M11 "Poorly Differentiated Anaplastic Thyroid Carcinoma"
  * target[+]
    * code = #M11.1 "Poorly Differentiated Anaplastic Thyroid Carcinoma, Multi-target NGS panel - small variant (TP53, BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M11.2 "Poorly Differentiated Anaplastic Thyroid Carcinoma, Multi-target NGS panel - copy number variant (TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M11.3 "Poorly Differentiated Anaplastic Thyroid Carcinoma, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M11.4 "Poorly Differentiated Anaplastic Thyroid Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3, RET, ALK)"
    * equivalence = #narrower
* group.element[+]
  * code = #M12 "Thyroid Medullary Carcinoma"
  * target[+]
    * code = #M12.1 "Thyroid Medullary Carcinoma, Multi-target NGS panel - small variant (RET)"
    * equivalence = #narrower
  * target[+]
    * code = #M12.2 "Thyroid Medullary Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M13 "Phaeochromocytoma"
  * target[+]
    * code = #M13.1 "Phaeochromocytoma, Multi-target NGS panel - small variant (RET)"
    * equivalence = #narrower
  * target[+]
    * code = #M13.2 "Phaeochromocytoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M14 "Adrenal Cortical Carcinoma"
  * target[+]
    * code = #M14.1 "Adrenal Cortical Carcinoma, Multi-target NGS panel - small variant (TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M14.2 "Adrenal Cortical Carcinoma, Multi-target NGS panel - copy number variant (TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M14.3 "Adrenal Cortical Carcinoma, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M14.4 "Adrenal Cortical Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M14.5 "Adrenal Cortical Carcinoma, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M15 "Head and Neck Squamous Cell Carcinoma"
  * target[+]
    * code = #M15.1 "Head and Neck Squamous Cell Carcinoma, Multi-target NGS panel - small variant (CDKN2A, EGFR, TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M15.2 "Head and Neck Squamous Cell Carcinoma, Multi-target NGS panel - structural variant (RET, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M15.3 "Head and Neck Squamous Cell Carcinoma, Multi-target NGS panel - copy number variant (CDKN2A, TP53"
    * equivalence = #narrower
  * target[+]
    * code = #M15.4 "Head and Neck Squamous Cell Carcinoma, RET rearrangement FISH/RT-PC"
    * equivalence = #narrower
  * target[+]
    * code = #M15.5 "Head and Neck Squamous Cell Carcinoma, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M15.6 "Head and Neck Squamous Cell Carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M15.7 "Head and Neck Squamous Cell Carcinoma, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M16 "Adenoid Cystic Carcinoma"
  * target[+]
    * code = #M16.1 "Adenoid Cystic Carcinoma, MYB-NFIB FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M16.2 "Adenoid Cystic Carcinoma, Multi-target NGS panel - structural variant (MYB-NFIB, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M16.4 "Adenoid Cystic Carcinoma, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M17 "Secretory Carcinoma (Salivary Gland)"
  * target[+]
    * code = #M17.1 "Secretory Carcinoma (Salivary Gland), ETV6-NTRK3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M17.2 "Secretory Carcinoma (Salivary Gland), Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M17.4 "Secretory Carcinoma (Salivary Gland), DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M18 "Renal Cell Carcinoma - Adult"
  * target[+]
    * code = #M18.1 "Renal Cell Carcinoma - Adult, TFE3 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M18.2 "Renal Cell Carcinoma - Adult, Multi-target NGS panel small variant (FH, SDHA, SDHB, SDHC, SDHD, VHL, ELOC (TCEB-1), TSC1/2, MET, BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M18.3 "Renal Cell Carcinoma - Adult, Chromosome 3 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M18.4 "Renal Cell Carcinoma - Adult, Chromosome 8 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M18.5 "Renal Cell Carcinoma - Adult, Chromosome 7 & 17 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M18.6 "Renal Cell Carcinoma - Adult, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3, TFE3, TFEB)"
    * equivalence = #narrower
  * target[+]
    * code = #M18.7 "Renal Cell Carcinoma - Adult, TFEB rearrangement FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M20 "Anaplastic Astrocytoma"
  * target[+]
    * code = #M20.1 "Anaplastic Astrocytoma, Paediatric, Multi-target NGS panel, small variant (BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M20.2 "Anaplastic Astrocytoma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M20.3 "Anaplastic Astrocytoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M20.4 "Anaplastic Astrocytoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M20.5 "Anaplastic Astrocytoma, Paediatric, Multi-target NGS panel, structural variant  (BRAF-KIAA1549, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M21 "Astrocytoma"
  * target[+]
    * code = #M21.1 "Astrocytoma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A,H3C2, BRAF, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M21.2 "Astrocytoma, Adult, Multi-target NGS panel, copy number variant (EGFR, CDKN2A, CDKN2B)"
    * equivalence = #narrower
  * target[+]
    * code = #M21.20 "Astrocytoma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M21.21 "Astrocytoma, Adult, Multi-target NGS panel, structural variant (EGFRvIII, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M21.22 "Astrocytoma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M21.23 "Astrocytoma, Adult, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M21.24 "Astrocytoma, Adult, CDKN2B copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M21.3 "Astrocytoma, Adult, EGFRvIII RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M21.5 "Astrocytoma, Adult, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M21.6 "Astrocytoma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M21.8 "Astrocytoma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M21.9 "Astrocytoma, Adult, IDH2 hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M22 "Diffuse Astrocytoma"
  * target[+]
    * code = #M22.1 "Diffuse Astrocytoma, Paediatric, Multi-target NGS panel, small variant (H3C2, H3C14, IDH1, IDH2)"
    * equivalence = #narrower
  * target[+]
    * code = #M22.10 "Diffuse Astrocytoma, Paediatric, MYB rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M22.11 "Diffuse Astrocytoma, Paediatric, MYBL1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M22.12 "Diffuse Astrocytoma, Paediatric, MN1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M22.2 "Diffuse Astrocytoma, Paediatric, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M22.3 "Diffuse Astrocytoma, Paediatric, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M22.4 "Diffuse Astrocytoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M22.5 "Diffuse Astrocytoma, Paediatric, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M22.6 "Diffuse Astrocytoma, Paediatric, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M22.7 "Diffuse Astrocytoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M22.8 "Diffuse Astrocytoma, Paediatric, Multi-target NGS panel, copy number variant (MYC)"
    * equivalence = #narrower
  * target[+]
    * code = #M22.9 "Diffuse Astrocytoma, Paediatric, Multi-target NGS panel, structural variant  (MYC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M23 "Diffuse Midline Glioma"
  * target[+]
    * code = #M23.1 "Diffuse Midline Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, TERT promoter,  H3-3A)"
    * equivalence = #narrower
  * target[+]
    * code = #M23.10 "Diffuse Midline Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M23.11 "Diffuse Midline Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M23.12 "Diffuse Midline Glioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M23.6 "Diffuse Midline Glioma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M23.7 "Diffuse Midline Glioma, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M23.8 "Diffuse Midline Glioma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M23.9 "Diffuse Midline Glioma, Adult, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M24 "Embryonal Tumours with Multi-Layered Rosettes"
  * target[+]
    * code = #M24.1 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, C19MC copy number  FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M24.2 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, TTYH1-C19MC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M24.3 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M24.4 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M24.5 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, Multi-target NGS panel, copy number variant (C19MC)"
    * equivalence = #narrower
  * target[+]
    * code = #M24.6 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, Multi-target NGS panel, structural variant  (TTYH1-C19MC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M25 "Ependymoma"
  * target[+]
    * code = #M25.1 "Ependymoma, Paediatric, Multi-target NGS panel, small variant (YAP1)"
    * equivalence = #narrower
  * target[+]
    * code = #M25.10 "Ependymoma, Paediatric, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M25.11 "Ependymoma, Paediatric, ZFTA rearrangements (several fusion partners)"
    * equivalence = #narrower
  * target[+]
    * code = #M25.2 "Ependymoma, Paediatric, YAP1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M25.3 "Ependymoma, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M25.4 "Ependymoma, Paediatric, YAP1-TFE3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M25.5 "Ependymoma, Paediatric, C11orf95-RELA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M25.6 "Ependymoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M25.7 "Ependymoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M25.8 "Ependymoma, Paediatric, Multi-target NGS panel, copy number variant (YAP1, MYCN)"
    * equivalence = #narrower
  * target[+]
    * code = #M25.9 "Ependymoma, Paediatric, Multi-target NGS panel, structural variant  (YAP1-C11orf95, YAP1-TFE3, C11orf95-RELA, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M26 "Ependymoma"
  * target[+]
    * code = #M26.1 "Ependymoma Supratentorial, Adult, YAP1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M26.2 "Ependymoma, Adult, RELA rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M26.3 "Ependymoma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M26.4 "Ependymoma, Adult, Multi-target NGS panel, structural variant  (YAP1, RELA, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M26.5 "Ependymoma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M26.6 "Ependymoma, Adult, ZFTA rearrangements (several fusion partners)"
    * equivalence = #narrower
* group.element[+]
  * code = #M27 "Glioblastoma"
  * target[+]
    * code = #M27.1 "Glioblastoma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3C2, BRAF, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M27.10 "Glioblastoma, Adult, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M27.11 "Glioblastoma, Adult, PTEN (10q23) copy number FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M27.12 "Glioblastoma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M27.13 "Glioblastoma, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M27.14 "Glioblastoma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M27.15 "Glioblastoma, Adult, Multi-target NGS panel, structural variant (EGFRvIII, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M27.16 "Glioblastoma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M27.2 "Glioblastoma, Adult, Multi-target NGS panel, copy number variant (EGFR, PDGFRA, MYC, PTEN, 1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M27.3 "Glioblastoma, Adult, EGFRvIII RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M27.5 "Glioblastoma, Adult, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M27.6 "Glioblastoma, Adult, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M27.7 "Glioblastoma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M27.9 "Glioblastoma, Adult, PDGFRA copy number FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M28 "Glioma"
  * target[+]
    * code = #M28.1 "Glioma, Adult, Multi-target NGS panel, small variant (H3C2, H3C3, H3C14, H3-3A, H3-3B, IDH1, IDH2, TP53, VHL, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M28.2 "Glioma, Adult, Multi-target NGS panel, copy number variant (EGFR, 1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M28.3 "Glioma, Adult, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M28.4 "Glioma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M28.5 "Glioma, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M28.6 "Glioma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M28.7 "Glioma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M28.8 "Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M28.9 "Glioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M29 "High Grade Glioma"
  * target[+]
    * code = #M29.1 "High Grade Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, TERT promoter, H3-3A, H3C2)"
    * equivalence = #narrower
  * target[+]
    * code = #M29.2 "High Grade Glioma, Adult, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M29.3 "High Grade Glioma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M29.4 "High Grade Glioma, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M29.5 "High Grade Glioma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M29.6 "High Grade Glioma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M29.7 "High Grade Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M29.8 "High Grade Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M29.9 "High Grade Glioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M30 "IDH-Wildtype Glioblastoma"
  * target[+]
    * code = #M30.1 "IDH-Wildtype Glioblastoma, Paediatric, Multi-target NGS panel, small variant (RB1, NF1)"
    * equivalence = #narrower
  * target[+]
    * code = #M30.2 "IDH-Wildtype Glioblastoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M30.3 "IDH-Wildtype Glioblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M30.4 "IDH-Wildtype Glioblastoma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M31 "Low Grade Glioma"
  * target[+]
    * code = #M31.1 "Low Grade Glioma, Adult, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M31.2 "Low Grade Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, TERT promoter, H3-3A, H3C2)"
    * equivalence = #narrower
  * target[+]
    * code = #M31.3 "Low Grade Glioma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M31.4 "Low Grade Glioma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M31.5 "Low Grade Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M31.6 "Low Grade Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M31.7 "Low Grade Glioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M32 "Low Grade Glioma/Glioneuronal Tumours"
  * target[+]
    * code = #M32.1 "Low Grade Glioma/Glioneuronal Tumours, Adult, Multi-target NGS panel, small variant (BRAF, IDH1, IDH2, TERT promoter, H3-3A, H3C2)"
    * equivalence = #narrower
  * target[+]
    * code = #M32.2 "Low Grade Glioma/Glioneuronal Tumours, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M32.3 "Low Grade Glioma/Glioneuronal Tumours, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M32.4 "Low Grade Glioma/Glioneuronal Tumours, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M32.5 "Low Grade Glioma/Glioneuronal Tumours, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M32.6 "Low Grade Glioma/Glioneuronal Tumours, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M33 "Meningioma"
  * target[+]
    * code = #M33.3 "Meningioma, Adult, Multi-target NGS panel, small variant (TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M33.4 "Meningioma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M33.5 "Meningioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M34 "Non-Midline Glioma"
  * target[+]
    * code = #M34.1 "Non-Midline Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, TERT promoter, H3-3A, H3C2)"
    * equivalence = #narrower
  * target[+]
    * code = #M34.2 "Non-Midline Glioma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M34.3 "Non-Midline Glioma, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M34.4 "Non-Midline Glioma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M34.5 "Non-Midline Glioma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M34.6 "Non-Midline Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M34.7 "Non-Midline Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M34.8 "Non-Midline Glioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M35 "OligodendroGlioma"
  * target[+]
    * code = #M35.1 "OligodendroGlioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3C2, BRAF, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M35.2 "OligodendroGlioma, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M35.4 "OligodendroGlioma, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M35.5 "OligodendroGlioma, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M35.6 "OligodendroGlioma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M35.7 "OligodendroGlioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M35.8 "OligodendroGlioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M35.9 "OligodendroGlioma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M36 "Pilocytic Astrocytoma"
  * target[+]
    * code = #M36.1 "Pilocytic Astrocytoma, Adult, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.10 "Pilocytic Astrocytoma, Adult, KIAA1549 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M36.11 "Pilocytic Astrocytoma, Adult, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M36.12 "Pilocytic Astrocytoma, Adult, Multi-target NGS panel, small variant (BRAF, CDKN2A)"
    * equivalence = #narrower
  * target[+]
    * code = #M36.13 "Pilocytic Astrocytoma, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M36.14 "Pilocytic Astrocytoma, Adult, Multi-target NGS panel, structural variant  (BRAF-KIAA1549, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B, BRAF-FXR1, BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M36.15 "Pilocytic Astrocytoma, Adult, Multi-target NGS panel, copy number variant (KIAA1549, CDKN2A)"
    * equivalence = #narrower
  * target[+]
    * code = #M36.16 "Pilocytic Astrocytoma, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M36.2 "Pilocytic Astrocytoma, Adult, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.3 "Pilocytic Astrocytoma, Adult, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.4 "Pilocytic Astrocytoma, Adult, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.5 "Pilocytic Astrocytoma, Adult, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.6 "Pilocytic Astrocytoma, Adult, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.7 "Pilocytic Astrocytoma, Adult, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.8 "Pilocytic Astrocytoma, Adult, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M36.9 "Pilocytic Astrocytoma, Adult, BRAF rearrangement FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M37 "Pineoblastoma"
  * target[+]
    * code = #M37.1 "Pineoblastoma, Paediatric, Multi-target NGS panel, small variant (DICER1)"
    * equivalence = #narrower
  * target[+]
    * code = #M37.2 "Pineoblastoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M37.3 "Pineoblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M37.4 "Pineoblastoma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M38 "Pituitary Tumours"
  * target[+]
    * code = #M38.1 "Pituitary Tumours, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M38.2 "Pituitary Tumours, Multi-target NGS panel, copy number variant (EGFR)"
    * equivalence = #narrower
  * target[+]
    * code = #M38.3 "Pituitary Tumours, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M38.4 "Pituitary Tumours, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M38.5 "Pituitary Tumours, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M38.6 "Pituitary Tumours, WGS Germline and Tumor"
    * equivalence = #narrower
* group.element[+]
  * code = #M39 "Rare Primitive Neuroectodermal Tumours Groups 2/3"
  * target[+]
    * code = #M39.1 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, Multi-target NGS panel, small variant (CDKN2A)"
    * equivalence = #narrower
  * target[+]
    * code = #M39.2 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M39.3 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M39.4 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M42 "Alveolar Rhabdomyosarcoma"
  * target[+]
    * code = #M42.1 "Alveolar Rhabdomyosarcoma, FOXO1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M42.2 "Alveolar Rhabdomyosarcoma, PAX3-FOXO1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M42.3 "Alveolar Rhabdomyosarcoma, PAX7-FOXO1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M42.4 "Alveolar Rhabdomyosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M42.5 "Alveolar Rhabdomyosarcoma, Multi-target NGS panel - structural variant (FOXO1, PAX3-FOXO1, PAX7-FOXO1  NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M43 "Alveolar Soft Part Sarcoma"
  * target[+]
    * code = #M43.1 "Alveolar Soft Part Sarcoma, TFE3 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M43.2 "Alveolar Soft Part Sarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M43.3 "Alveolar Soft Part Sarcoma, Multi-target NGS panel - structural variant (TFE3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M44 "Aneurysmal Bone Cyst"
  * target[+]
    * code = #M44.1 "Aneurysmal Bone Cyst, USP6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M44.2 "Aneurysmal Bone Cyst, Multi-target NGS panel - structural variant (USP6)"
    * equivalence = #narrower
* group.element[+]
  * code = #M45 "Angiomatoid Fibrous Histiocytoma"
  * target[+]
    * code = #M45.1 "Angiomatoid Fibrous Histiocytoma, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M45.2 "Angiomatoid Fibrous Histiocytoma, FUS rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M45.3 "Angiomatoid Fibrous Histiocytoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M45.4 "Angiomatoid Fibrous Histiocytoma, Multi-target NGS panel - structural variant (EWSR1, FUS, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M46 "Chondrosarcoma Conventional Central"
  * target[+]
    * code = #M46.1 "Chondrosarcoma Conventional Central, Multi-target NGS panel - small variant (IDH1, IDH2)"
    * equivalence = #narrower
  * target[+]
    * code = #M46.2 "Chondrosarcoma Conventional Central, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M46.3 "Chondrosarcoma Conventional Central, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M47 "Chondroblastoma"
  * target[+]
    * code = #M47.1 "Chondroblastoma, SNP Array"
    * equivalence = #narrower
  * target[+]
    * code = #M47.2 "Chondroblastoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M47.3 "Chondroblastoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M48 "Clear Cell Sarcoma of Soft Tissue"
  * target[+]
    * code = #M48.1 "Clear Cell Sarcoma of Soft Tissue, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M48.2 "Clear Cell Sarcoma of Soft Tissue, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M48.3 "Clear Cell Sarcoma of Soft Tissue, Multi-target NGS panel - structural variant (EWSR1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M49 "CNS Ewing Sarcoma Family Tumour With CIC Alteration"
  * target[+]
    * code = #M49.1 "CNS Ewing Sarcoma Family Tumour With CIC Alteration, Multi-target NGS panel - structural variant (CIC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M49.2 "CNS Ewing Sarcoma Family Tumour With CIC Alteration, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M50 "Dermatofibrosarcoma Protuberans"
  * target[+]
    * code = #M50.1 "Dermatofibrosarcoma Protuberans, COL1A1-PDGFB rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M50.2 "Dermatofibrosarcoma Protuberans, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M50.3 "Dermatofibrosarcoma Protuberans, Multi-target NGS panel - structural variant (COL1A1-PDGFB, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M51 "Desmoid-Type Fibromatosis"
  * target[+]
    * code = #M51.1 "Desmoid-Type Fibromatosis, Multi-target NGS panel - small variant (APC, CTNNB1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M52 "Desmoplastic Small Round Cell Tumour"
  * target[+]
    * code = #M52.1 "Desmoplastic Small Round Cell Tumour, WT1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M52.2 "Desmoplastic Small Round Cell Tumour, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M52.3 "Desmoplastic Small Round Cell Tumour, Multi-target NGS panel - structural variant (WT1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M53 "Endometrial Stromal Sarcoma"
  * target[+]
    * code = #M53.1 "Endometrial Stromal Sarcoma, EPC1-PHF1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M53.2 "Endometrial Stromal Sarcoma, JAZF1-PHF1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M53.3 "Endometrial Stromal Sarcoma, JAZF1-SUZ12 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M53.4 "Endometrial Stromal Sarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M53.5 "Endometrial Stromal Sarcoma, Multi-target NGS panel - structural variant (EPC1-PHF1, JAZF1-PHF1, JAZF1-SUZ12, NTRK1, NTRK2, NTRK3, ZC3H7B-BCOR)"
    * equivalence = #narrower
  * target[+]
    * code = #M53.7 "Endometrial Stromal Sarcoma, ZC3H7B-BCOR rearrangment FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M54 "Epithelioid Haemangioendothelioma"
  * target[+]
    * code = #M54.1 "Epithelioid Haemangioendothelioma, WWTR1-CAMTA1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M54.2 "Epithelioid Haemangioendothelioma, Multi-target NGS panel - structural variant (WWTR1-CAMTA1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M55 "Ewing Like Sarcoma/PNET"
  * target[+]
    * code = #M55.1 "Ewing Like Sarcoma/PNET, Multi-target NGS panel - structural variant (BCOR, BCOR-CCNB3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M55.2 "Ewing Like Sarcoma/PNET, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M55.3 "Ewing Like Sarcoma/PNET, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M56 "Ewing Sarcoma of Bone"
  * target[+]
    * code = #M56.1 "Ewing Sarcoma of Bone, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M56.2 "Ewing Sarcoma of Bone, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M56.3 "Ewing Sarcoma of Bone, Multi-target NGS panel - structural variant (EWSR1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M57 "Ewing-Like Soft-Tissue Sarcoma"
  * target[+]
    * code = #M57.1 "Ewing-Like Soft-Tissue Sarcoma, Multi-target NGS panel - structural variant (BCOR, BCOR-CCNB3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M57.2 "Ewing-Like Soft-Tissue Sarcoma, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M57.3 "Ewing-Like Soft-Tissue Sarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M58 "Extraskeletal Myxoid Chondrosarcoma"
  * target[+]
    * code = #M58.1 "Extraskeletal Myxoid Chondrosarcoma, NR4A3 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M58.2 "Extraskeletal Myxoid Chondrosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M58.3 "Extraskeletal Myxoid Chondrosarcoma, Multi-target NGS panel - structural variant (NR4A3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M59 "Fibrous Dysplasia/Myxomas (Mazabraud Syndrome)"
  * target[+]
    * code = #M59.1 "Fibrous Dysplasia/Myxomas (Mazabraud Syndrome), Multi-target NGS panel - small variant (GNAS)"
    * equivalence = #narrower
* group.element[+]
  * code = #M60 "Giant Cell Tumour of Bone"
  * target[+]
    * code = #M60.1 "Giant Cell Tumour of Bone, H3-3A hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M60.2 "Giant Cell Tumour of Bone, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M60.3 "Giant Cell Tumour of Bone, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M61 "High-Grade Neuroepithelial Tumour-Bcor Group"
  * target[+]
    * code = #M61.1 "High-Grade Neuroepithelial Tumour-Bcor Group, Multi-target NGS panel - structural variant (BCOR, BCOR-CCNB3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M61.2 "High-Grade Neuroepithelial Tumour-Bcor Group, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M61.3 "High-Grade Neuroepithelial Tumour-Bcor Group, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M62 "Infantile Fibrosarcoma"
  * target[+]
    * code = #M62.1 "Infantile Fibrosarcoma, ETV6-NTRK3 RT-PCR or FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M62.2 "Infantile Fibrosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M62.3 "Infantile Fibrosarcoma, Multi-target NGS panel - structural variant (ETV6-NTRK3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M63 "Inflammatory Myofibroblastic Tumour"
  * target[+]
    * code = #M63.1 "Inflammatory Myofibroblastic Tumour, TPM4-ALK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M63.2 "Inflammatory Myofibroblastic Tumour, TPM3-ALK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M63.3 "Inflammatory Myofibroblastic Tumour, Multi-target NGS panel - structural variant (ALK, TPM4-ALK, TPM3-ALK, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M63.4 "Inflammatory Myofibroblastic Tumour, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M64 "Low Grade Fibromyxoid Sarcoma"
  * target[+]
    * code = #M64.1 "Low Grade Fibromyxoid Sarcoma, FUS rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M64.2 "Low Grade Fibromyxoid Sarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M64.3 "Low Grade Fibromyxoid Sarcoma, Multi-target NGS panel - structural variant (FUS, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M65 "Mesenchymal Chondrosarcoma"
  * target[+]
    * code = #M65.1 "Mesenchymal Chondrosarcoma, HEY1-NCOA2 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M65.2 "Mesenchymal Chondrosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M65.3 "Mesenchymal Chondrosarcoma, Multi-target NGS panel - structural variant (HEY1-NCOA2, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M66 "Myoepithelial Tumours of Soft Tissue"
  * target[+]
    * code = #M66.1 "Myoepithelial Tumours of Soft Tissue, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M66.2 "Myoepithelial Tumours of Soft Tissue, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M66.3 "Myoepithelial Tumours of Soft Tissue, Multi-target NGS panel - structural variant (EWSR1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M67 "Myxoid/Round Cell Liposarcoma"
  * target[+]
    * code = #M67.1 "Myxoid/Round Cell Liposarcoma, DDIT3 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M67.2 "Myxoid/Round Cell Liposarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M67.3 "Myxoid/Round Cell Liposarcoma, Multi-target NGS panel - structural variant (DDIT3, MDM2, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M67.4 "Myxoid/Round Cell Liposarcoma, MDM2 amplification FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M68 "Myxoinflammatory Fibroblastic Sarcoma"
  * target[+]
    * code = #M68.1 "Myxoinflammatory Fibroblastic Sarcoma, TGFBR3-OGA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M68.2 "Myxoinflammatory Fibroblastic Sarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M68.3 "Myxoinflammatory Fibroblastic Sarcoma, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M68.4 "Myxoinflammatory Fibroblastic Sarcoma, Multi-target NGS panel - structural variant (TGFBR3-OGA, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M68.5 "Myxoinflammatory Fibroblastic Sarcoma, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M69 "Nodular Fasciitis"
  * target[+]
    * code = #M69.1 "Nodular Fasciitis, USP6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M69.2 "Nodular Fasciitis, Multi-target NGS panel - structural variant (USP6)"
    * equivalence = #narrower
* group.element[+]
  * code = #M70 "Osteosarcoma"
  * target[+]
    * code = #M70.1 "Osteosarcoma, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M70.2 "Osteosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M70.3 "Osteosarcoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M70.4 "Osteosarcoma, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M71 "Phosphaturic Mesenchymal Tumour"
  * target[+]
    * code = #M71.1 "Phosphaturic Mesenchymal Tumour, FN1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M71.2 "Phosphaturic Mesenchymal Tumour, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M71.3 "Phosphaturic Mesenchymal Tumour, Multi-target NGS panel - structural variant (FN1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M72 "Primitive Mesenchymal Myxoid Tumour of Infancy"
  * target[+]
    * code = #M72.1 "Primitive Mesenchymal Myxoid Tumour of Infancy, Multi-target NGS panel - structural variant (BCOR, BCOR-CCNB3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M72.2 "Primitive Mesenchymal Myxoid Tumour of Infancy, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M72.3 "Primitive Mesenchymal Myxoid Tumour of Infancy, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M73 "Pseudomyogenic Haemangioendothelioma"
  * target[+]
    * code = #M73.1 "Pseudomyogenic Haemangioendothelioma, SERPINE1-FOSB FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M73.2 "Pseudomyogenic Haemangioendothelioma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M73.3 "Pseudomyogenic Haemangioendothelioma, Multi-target NGS panel - structural variant (SERPINE1-FOSB, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M74 "Radiation Induced Angiosarcoma"
  * target[+]
    * code = #M74.1 "Radiation Induced Angiosarcoma, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M74.2 "Radiation Induced Angiosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M74.3 "Radiation Induced Angiosarcoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M74.4 "Radiation Induced Angiosarcoma, Multi-target NGS panel - copy number variant (MYC)"
    * equivalence = #narrower
* group.element[+]
  * code = #M75 "Round Cell Sarcoma Nos"
  * target[+]
    * code = #M75.1 "Round Cell Sarcoma Nos, Multi-target NGS panel - structural variant (BCOR, CIC, BCOR-CCNB3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M75.2 "Round Cell Sarcoma Nos, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M75.3 "Round Cell Sarcoma Nos, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M76 "Sclerosing Epithelioid Fibrosarcoma"
  * target[+]
    * code = #M76.1 "Sclerosing Epithelioid Fibrosarcoma, FUS rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M76.2 "Sclerosing Epithelioid Fibrosarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M76.3 "Sclerosing Epithelioid Fibrosarcoma, Multi-target NGS panel - structural variant (FUS, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M77 "Synovial Sarcoma"
  * target[+]
    * code = #M77.1 "Synovial Sarcoma, SS18 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M77.2 "Synovial Sarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M77.3 "Synovial Sarcoma, Multi-target NGS panel - structural variant (SS18, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M78 "Undifferentiated Round Cell Sarcoma of Infancy"
  * target[+]
    * code = #M78.1 "Undifferentiated Round Cell Sarcoma of Infancy, Multi-target NGS panel - structural variant (CIC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M78.2 "Undifferentiated Round Cell Sarcoma of Infancy, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M79 "Well Differentiated/Dedifferentiated Liposarcoma"
  * target[+]
    * code = #M79.1 "Well Differentiated/Dedifferentiated Liposarcoma, MDM2 amplification FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M79.2 "Well Differentiated/Dedifferentiated Liposarcoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M79.3 "Well Differentiated/Dedifferentiated Liposarcoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M79.4 "Well Differentiated/Dedifferentiated Liposarcoma, Multi-target NGS panel - copy number variant (MDM2, DDIT3)"
    * equivalence = #narrower
  * target[+]
    * code = #M79.6 "Well Differentiated/Dedifferentiated Liposarcoma, DDIT3 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M79.7 "Well Differentiated/Dedifferentiated Liposarcoma, DDIT3 copy number RT-PCR/ddPCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M80 "Acute Myeloid Leukaemia"
  * target[+]
    * code = #M80.1 "Acute Myeloid Leukaemia, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M80.10 "Acute Myeloid Leukaemia, MRD PML-RARA RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.11 "Acute Myeloid Leukaemia, MRD RUNX1-RUNX1T1 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.12 "Acute Myeloid Leukaemia, MRD CBFB-MYH11 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.13 "Acute Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.14 "Acute Myeloid Leukaemia, MRD other QF-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.15 "Acute Myeloid Leukaemia, BCR-ABL1 TKD NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M80.18 "Acute Myeloid Leukaemia, FLT3 ITD"
    * equivalence = #narrower
  * target[+]
    * code = #M80.19 "Acute Myeloid Leukaemia, Multi-target NGS panel, small variant (GATA1)"
    * equivalence = #narrower
  * target[+]
    * code = #M80.2 "Acute Myeloid Leukaemia, Multi-target NGS panel, small variant (NPM1, CEBPA, RUNX1, FLT3, IDH1, IDH2, KIT, WT1, ASXL1, SRSF2, STAG2, RAD21, TP53, KRAS, NRAS, KMT2A(MLL)-PTD), PPM1D, DDX41, PHF6, CUX1"
    * equivalence = #narrower
  * target[+]
    * code = #M80.21 "Acute Myeloid Leukaemia, FLT3 TKD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M80.22 "Acute Myeloid Leukaemia, NPM1 exon 12 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M80.23 "Acute Myeloid Leukaemia, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M80.24 "Acute Myeloid Leukaemia, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M80.25 "Acute Myeloid Leukaemia, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.26 "Acute Myeloid Leukaemia, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.27 "Acute Myeloid Leukaemia, Chr17/Chr17p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.28 "Acute Myeloid Leukaemia, Chr12/Chr12p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.29 "Acute Myeloid Leukaemia, t(15;17)(q24;q21) PML-RARA FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.3 "Acute Myeloid Leukaemia, Karyotype (To include detection of Complex karyotype, Monosomal karyotype)"
    * equivalence = #narrower
  * target[+]
    * code = #M80.30 "Acute Myeloid Leukaemia, t(8;21)(q22;q22) RUNX1-RUNX1T1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.31 "Acute Myeloid Leukaemia, inv(16)(p13.1q22) CBFB-MYH11 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.32 "Acute Myeloid Leukaemia, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 ( KMT2A) rearrangements FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.33 "Acute Myeloid Leukaemia, t(6;9)(p22;q34) DEK-NUP214 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.34 "Acute Myeloid Leukaemia, inv(3)(q21q26) GATA2-MECOM FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.35 "Acute Myeloid Leukaemia, t(1;22)(p13;q13) RBM15-MRTFA FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.36 "Acute Myeloid Leukaemia, t(9;22)(q34;q11) BCR-ABL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.37 "Acute Myeloid Leukaemia, t(3;5)(q25;q34) NPM1-MLF1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.38 "Acute Myeloid Leukaemia, t(5;11)(q35;p15.5) NUP98-NSD1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.39 "Acute Myeloid Leukaemia, t(7;12)(q36;p13) MNX1-ETV6 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.40 "Acute Myeloid Leukaemia, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.41 "Acute Myeloid Leukaemia, t(15;17)(q24;q21) PML-RARA RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.42 "Acute Myeloid Leukaemia, t(8;21)(q22;q22) RUNX1-RUNX1T1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.43 "Acute Myeloid Leukaemia, inv(16)(p13.1q22) CBFB-MYH11 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.44 "Acute Myeloid Leukaemia, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 (KMT2A) rearrangements RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.45 "Acute Myeloid Leukaemia, t(6;9)(p22;q34) DEK-NUP214 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.46 "Acute Myeloid Leukaemia, inv(3)(q21q26) GATA2-MECOM RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.47 "Acute Myeloid Leukaemia, t(1;22)(p13;q13) RBM15-MRTFA RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.48 "Acute Myeloid Leukaemia, t(9;22)(q34;q11) BCR-ABL1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.49 "Acute Myeloid Leukaemia, t(3;5)(q25;q34) NPM1-MLF1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.5 "Acute Myeloid Leukaemia, Other: See tests M80.25-M80.40 for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M80.50 "Acute Myeloid Leukaemia, t(5;11)(q35;p15.5) NUP98-NSD1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.51 "Acute Myeloid Leukaemia, t(7;12)(q36;p13) MNX1-ETV6 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.52 "Acute Myeloid Leukaemia, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M80.53 "Acute Myeloid Leukaemia, Multi-target NGS panel, copy number variant (Monosomal karyotype, del5/del5q, del7/del7q, del17/del17p, del12/del12p)"
    * equivalence = #narrower
  * target[+]
    * code = #M80.54 "Acute Myeloid Leukaemia, NUP98 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M80.55 "Acute Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR rare"
    * equivalence = #narrower
  * target[+]
    * code = #M80.56 "Acute Myeloid Leukaemia, MRD NPM1 RT-qPCR rare"
    * equivalence = #narrower
  * target[+]
    * code = #M80.57 "Acute Myeloid Leukaemia, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M80.58 "Acute Myeloid Leukaemia, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M80.7 "Acute Myeloid Leukaemia, Other RT-PCR: See tests M80.41-80.52 for individual specified RT-PCR targets."
    * equivalence = #narrower
  * target[+]
    * code = #M80.8 "Acute Myeloid Leukaemia, Multi-target NGS panel, structural variant (To include detection of  Complex karyotype)"
    * equivalence = #narrower
  * target[+]
    * code = #M80.9 "Acute Myeloid Leukaemia, MRD NPM1 RT-qPCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M81 "Transient Abnormal Myelopoiesis"
  * target[+]
    * code = #M81.1 "Transient Abnormal Myelopoiesis, Multi-target NGS panel, small variant (GATA1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M82 "Myelodysplasia"
  * target[+]
    * code = #M82.1 "Myelodysplasia, Multi-target NGS panel, small variant (TP53, SF3B1, IDH1, IDH2, NRAS, KRAS, TET2, SRSF2, ASXL1, DNMT3A, RUNX1, U2AF1, EZH2, BCOR, PTPN11, JAK2, SETBP1, PPM1D, DDX41, PHF6, CUX1, UBA1)"
    * equivalence = #narrower
  * target[+]
    * code = #M82.10 "Myelodysplasia, Chr13/Chr13q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.11 "Myelodysplasia, Chr11q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.12 "Myelodysplasia, Chr12p copy number FISH, t(12p) rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.13 "Myelodysplasia, Chr9q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.14 "Myelodysplasia, Chr17/Chr17p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.15 "Myelodysplasia, idic(X)(q13) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.16 "Myelodysplasia, Multi-target NGS panel, copy number variant (-7/del7q, -5/del5q, -13/del13q, del11q, del12p, del9q, del17/del17p & idic(X)(q13);-Y; del 20q; +8; +19,del(3q)"
    * equivalence = #narrower
  * target[+]
    * code = #M82.17 "Myelodysplasia, Multi-target NGS panel, structural variant (t(12p), t(17p);inv(3)/t(3q)/del(3q)"
    * equivalence = #narrower
  * target[+]
    * code = #M82.18 "Myelodysplasia, ChrY copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.19 "Myelodysplasia, Chr20/20q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.2 "Myelodysplasia, Karyotype (To include detection of complex karyotype, -7/del7q, -5/del5q, i(17q)/t(17p), -13/del13q, del11q, del12p/t(12p), del9q, del17/del17p & idic(X)(q13)); -Y; del 20q; +8; +19,(inv(3)/t(3q)/del(3q))"
    * equivalence = #narrower
  * target[+]
    * code = #M82.20 "Myelodysplasia, Chr8 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.21 "Myelodysplasia, Chr19 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.22 "Myelodysplasia, inv(3)/t(3q)/del(3q)"
    * equivalence = #narrower
  * target[+]
    * code = #M82.23 "Myelodysplasia, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M82.24 "Myelodysplasia, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M82.4 "Myelodysplasia, FISH copy number and rearrangement Other: See tests M82.7 -M82.22 for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M82.6 "Myelodysplasia, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M82.7 "Myelodysplasia, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.8 "Myelodysplasia, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M82.9 "Myelodysplasia, i(17q)/t(17p) FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M83 "Aplastic Anaemia"
  * target[+]
    * code = #M83.1 "Aplastic Anaemia, Karyotype (Genomewide)"
    * equivalence = #narrower
  * target[+]
    * code = #M83.3 "Aplastic Anaemia, FISH copy number and rearrangement"
    * equivalence = #narrower
  * target[+]
    * code = #M83.4 "Aplastic Anaemia, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M83.5 "Aplastic Anaemia, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M83.6 "Aplastic Anaemia, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M84 "Chronic Myeloid Leukaemia"
  * target[+]
    * code = #M84.1 "Chronic Myeloid Leukaemia, BCR-ABL1 multiplex"
    * equivalence = #narrower
  * target[+]
    * code = #M84.11 "Chronic Myeloid Leukaemia, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M84.12 "Chronic Myeloid Leukaemia, Chr8 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.13 "Chronic Myeloid Leukaemia, Chr19 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.14 "Chronic Myeloid Leukaemia, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.15 "Chronic Myeloid Leukaemia, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.16 "Chronic Myeloid Leukaemia, i(17q) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.17 "Chronic Myeloid Leukaemia, Chr12p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.18 "Chronic Myeloid Leukaemia, t(9;22)(q34;q11) BCR-ABL1 FISH and related abnormalities i.e. 2nd Ph+[+der(22)t(9;22)(q34;q11)], Ider(22)(q10)t(9;22)(q34;q11)"
    * equivalence = #narrower
  * target[+]
    * code = #M84.19 "Chronic Myeloid Leukaemia, Inv(3) MECOM FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.2 "Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M84.20 "Chronic Myeloid Leukaemia, 11q23 (KMT2A) rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.21 "Chronic Myeloid Leukaemia, Multi-target NGS panel, copy number variant (trisomy 8, trisomy 19, -7/7q, -5/5q, i(17q), 12p-)"
    * equivalence = #narrower
  * target[+]
    * code = #M84.22 "Chronic Myeloid Leukaemia, Multi-target NGS panel, structural variant (To include detection of t(9;22)(q34;q11) BCR-ABL1, 2nd Ph+[+der(22)t(9;22)(q34;q11)], Ider(22)(q10)t(9;22)(q34;q11), inv(3), 11q23 rearrangements)"
    * equivalence = #narrower
  * target[+]
    * code = #M84.23 "Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR rare"
    * equivalence = #narrower
  * target[+]
    * code = #M84.24 "Chronic Myeloid Leukaemia, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M84.25 "Chronic Myeloid Leukaemia, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M84.3 "Chronic Myeloid Leukaemia, BCR-ABL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M84.4 "Chronic Myeloid Leukaemia, Karyotype (To include detection of trisomy 8, trisomy 19, -7/7q, -5/5q, i(17q), 12p-& t(9;22)(q34;q11) BCR-ABL1, 2nd Ph+[+der(22)t(9;22)(q34;q11)], ider(22)(q10)t(9;22)(q34;q11), inv(3), 11q23 rearrangements)"
    * equivalence = #narrower
  * target[+]
    * code = #M84.6 "Chronic Myeloid Leukaemia, FISH copy number and rearrangement Other: See tests M84.12 M84.20 for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M84.8 "Chronic Myeloid Leukaemia, BCR-ABL1 TKD NGS"
    * equivalence = #narrower
* group.element[+]
  * code = #M85 "Myeloproliferative Neoplasm"
  * target[+]
    * code = #M85.1 "Myeloproliferative Neoplasm, Multi-target NGS limited panel, small variant (JAK2, CALR, MPL)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.10 "Myeloproliferative Neoplasm, PCM1-JAK2 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M85.11 "Myeloproliferative Neoplasm, BCR-ABL1 multiplex"
    * equivalence = #narrower
  * target[+]
    * code = #M85.12 "Myeloproliferative Neoplasm, Other RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M85.13 "Myeloproliferative Neoplasm, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M85.14 "Myeloproliferative Neoplasm, JAK2 V617F hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M85.15 "Myeloproliferative Neoplasm, JAK2  exon 12 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M85.16 "Myeloproliferative Neoplasm, CALR exon 9 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M85.17 "Myeloproliferative Neoplasm, MPL exon 10 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M85.19 "Myeloproliferative Neoplasm, Chr8 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.2 "Myeloproliferative Neoplasm, Multi-target NGS panel, small variant"
    * equivalence = #narrower
  * target[+]
    * code = #M85.20 "Myeloproliferative Neoplasm, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.21 "Myeloproliferative Neoplasm, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.22 "Myeloproliferative Neoplasm, i(17q) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.23 "Myeloproliferative Neoplasm, Chr12p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.24 "Myeloproliferative Neoplasm, t(9;22)(q34;q11) BCR-ABL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.25 "Myeloproliferative Neoplasm, PDGFRA rearrangement FISH (other than FIP1L1-PDGFRA see M85.7)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.26 "Myeloproliferative Neoplasm, PDGFRB rearrangement FISH (other than ETV6-PDGFRB see M85.9)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.27 "Myeloproliferative Neoplasm, FGFR1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.28 "Myeloproliferative Neoplasm, JAK2 rearrangement FISH (other than PCM1-JAK2 see M85.10)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.29 "Myeloproliferative Neoplasm, inv(3)/t(3;3) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.3 "Myeloproliferative Neoplasm, Karyotype (To include detection of complex karyotype)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.30 "Myeloproliferative Neoplasm, 11q23 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.31 "Myeloproliferative Neoplasm, ABL1 rearrangement FISH (other than BCR-ABL1 see M85.24)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.32 "Myeloproliferative Neoplasm, FLT3 rearragement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.33 "Myeloproliferative Neoplasm, RET rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.34 "Myeloproliferative Neoplasm, NTRK3 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M85.35 "Myeloproliferative Neoplasm, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M85.36 "Myeloproliferative Neoplasm, Multi-target NGS panel, copy number variant (cryptic deletion of 4q12, trisomy 8, -7/7q, -5/5q, i(17q), 12p-)"
    * equivalence = #narrower
  * target[+]
    * code = #M85.37 "Myeloproliferative Neoplasm, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M85.38 "Myeloproliferative Neoplasm, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M85.5 "Myeloproliferative Neoplasm, FISH copy number and rearrangement Other: See tests M85.18 -M85.34 for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M85.7 "Myeloproliferative Neoplasm, FIP1L1-PDGFRA (4q12) FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M85.8 "Myeloproliferative Neoplasm, FIP1L1-PDGFRA RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M85.9 "Myeloproliferative Neoplasm, ETV6-PDGFRB FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M86 "Systemic Mastocytosis"
  * target[+]
    * code = #M86.1 "Systemic Mastocytosis, Multi-target NGS panel, small variant (KIT)"
    * equivalence = #narrower
  * target[+]
    * code = #M86.2 "Systemic Mastocytosis, KIT D816 QF-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M86.3 "Systemic Mastocytosis, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M86.4 "Systemic Mastocytosis, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M86.5 "Systemic Mastocytosis, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M87 "Chronic Neutrophilic Leukaemia"
  * target[+]
    * code = #M87.1 "Chronic Neutrophilic Leukaemia, Multi-target NGS panel, small variant (CSF3R)"
    * equivalence = #narrower
* group.element[+]
  * code = #M88 "Juvenile Myelomonocytic Leukaemia"
  * target[+]
    * code = #M88.1 "Juvenile Myelomonocytic Leukaemia, Multi-target NGS panel, small variant (PTPN11, KRAS, NRAS, NF1, CBL)"
    * equivalence = #narrower
  * target[+]
    * code = #M88.10 "Juvenile Myelomonocytic Leukaemia, Multi-target NGS panel, copy number variant (-7/del7q, -5/del5q, trisomy 8)"
    * equivalence = #narrower
  * target[+]
    * code = #M88.11 "Juvenile Myelomonocytic Leukaemia, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M88.12 "Juvenile Myelomonocytic Leukaemia, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M88.2 "Juvenile Myelomonocytic Leukaemia, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M88.3 "Juvenile Myelomonocytic Leukaemia, Multi-target NGS panel, small variant"
    * equivalence = #narrower
  * target[+]
    * code = #M88.4 "Juvenile Myelomonocytic Leukaemia, Karyotype"
    * equivalence = #narrower
  * target[+]
    * code = #M88.5 "Juvenile Myelomonocytic Leukaemia, FISH copy number and rearrangement Other: See tests M88.7-M88.9 for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M88.7 "Juvenile Myelomonocytic Leukaemia, Chr8 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M88.8 "Juvenile Myelomonocytic Leukaemia, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M88.9 "Juvenile Myelomonocytic Leukaemia, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M89 "Acute Leukaemia Other"
  * target[+]
    * code = #M89.1 "Acute Leukaemia Other, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M89.10 "Acute Leukaemia Other, MRD PML-RARA RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.100 "Acute Leukaemia Other, t(7;11)(p15;p15) NUP98-HOXA13 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.101 "Acute Leukaemia Other, t(10;14)(q24;q11) TLX1-TRD RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.102 "Acute Leukaemia Other, t(7;10)(q34;q24) TRB-TLX1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.103 "Acute Leukaemia Other, t(5;14)(q35;q32.2) BCL11B-TLX3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.104 "Acute Leukaemia Other, Multi-target NGS panel, copy number variant"
    * equivalence = #narrower
  * target[+]
    * code = #M89.105 "Acute Leukaemia Other, NUP98 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.106 "Acute Leukaemia Other, MRD BCR-ABL1 RT-qPCR rare"
    * equivalence = #narrower
  * target[+]
    * code = #M89.107 "Acute Leukaemia Other, MRD NPM1 RT-qPCR rare"
    * equivalence = #narrower
  * target[+]
    * code = #M89.108 "Acute Leukaemia Other, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M89.109 "Acute Leukaemia Other, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M89.11 "Acute Leukaemia Other, MRD RUNX1-RUNX1T1 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.12 "Acute Leukaemia Other, MRD CBFB-MYH11 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.13 "Acute Leukaemia Other, MRD BCR-ABL1 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.14 "Acute Leukaemia Other, MRD other QF-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.15 "Acute Leukaemia Other, MRD target identification (Ig/TCR gene rearrangement by PCR & sequencing with MRD workup via QF-PCR)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.16 "Acute Leukaemia Other, MRD quantification (Ig/TCR gene rearrangement MRD QF-PCR )"
    * equivalence = #narrower
  * target[+]
    * code = #M89.17 "Acute Leukaemia Other, BCR-ABL1 TKD NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M89.2 "Acute Leukaemia Other, Karyotype (To include detection of Complex karyotype, Monosomal karyotype)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.20 "Acute Leukaemia Other, FLT3 TKD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M89.21 "Acute Leukaemia Other, NPM1 exon 12 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M89.22 "Acute Leukaemia Other, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M89.23 "Acute Leukaemia Other, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M89.24 "Acute Leukaemia Other, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.25 "Acute Leukaemia Other, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.26 "Acute Leukaemia Other, Chr17/Chr17p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.27 "Acute Leukaemia Other, Chr12/Chr12p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.28 "Acute Leukaemia Other, t(15;17)(q24;q21) PML-RARA FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.29 "Acute Leukaemia Other, t(8;21)(q22;q22) RUNX1-RUNX1T1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.3 "Acute Leukaemia Other, FISH copy number and rearrangement other"
    * equivalence = #narrower
  * target[+]
    * code = #M89.30 "Acute Leukaemia Other, inv(16)(p13.1q22) CBFB-MYH11 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.31 "Acute Leukaemia Other, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 ( KMT2A) rearrangements FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.32 "Acute Leukaemia Other, t(6;9)(p22;q34) DEK-NUP214 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.33 "Acute Leukaemia Other, inv(3)(q21q26) GATA2-MECOM FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.34 "Acute Leukaemia Other, t(1;22)(p13;q13) RBM15-MRTFA FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.35 "Acute Leukaemia Other, t(9;22)(q34;q11) BCR-ABL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.36 "Acute Leukaemia Other, t(3;5)(q25;q34) NPM1-MLF1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.37 "Acute Leukaemia Other, t(5;11)(q35;p15.5) NUP98-NSD1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.38 "Acute Leukaemia Other, t(7;12)(q36;p13) MNX1-ETV6 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.39 "Acute Leukaemia Other, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.4 "Acute Leukaemia Other, Multi-target NGS panel, small variant (NPM1, CEBPA, RUNX1, FLT3, IDH1, IDH2, KIT, WT1, ASXL1, SRSF2, STAG2, RAD21, TP53, KRAS, NRAS, KMT2A(MLL)-PTD, PPM1D, ETV6, NOTCH1, FBXW7, PTEN,  HRAS)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.40 "Acute Leukaemia Other, Global copy number change FISH (i.e. hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.41 "Acute Leukaemia Other, del(1)(p33p33) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.42 "Acute Leukaemia Other, iAMP21 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.5 "Acute Leukaemia Other, FLT3 ITD"
    * equivalence = #narrower
  * target[+]
    * code = #M89.52 "Acute Leukaemia Other, t(12;21)(p13;q22) ETV6-RUNX1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.53 "Acute Leukaemia Other,  t(1;19)(q23;p13) TCF3-PBX1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.54 "Acute Leukaemia Other, t(17;19)(q22;p13) TCF3-HLF FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.55 "Acute Leukaemia Other, t(4;11)(q21;q23) KMT2A-AFF1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.56 "Acute Leukaemia Other, t(11;19)(q23;p13.3) KMT2A-MLLT1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.57 "Acute Leukaemia Other, t(6;11)(q27;q23) KMT2A-AFDN FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.58 "Acute Leukaemia Other,  t(10;11)(p12;q23) KMT2A-MLLT10 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.59 "Acute Leukaemia Other, t(11;19)(q23;p13.1) KMT2A-ELL FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.6 "Acute Leukaemia Other, Other RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.60 "Acute Leukaemia Other, t(1;7)(p32;q11) TRB-TAL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.61 "Acute Leukaemia Other, t(11;14)(p15;q11) TRD-LMO1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.62 "Acute Leukaemia Other, t(7;11)(p15;p15) NUP98-HOXA13 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.63 "Acute Leukaemia Other, t(10;14)(q24;q11) TLX1-TRD FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.64 "Acute Leukaemia Other, t(7;10)(q34;q24) TRB-TLX1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.65 "Acute Leukaemia Other, t(5;14)(q35;q32.2) BCL11B-TLX3 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.66 "Acute Leukaemia Other, TAL1 rearrangement FISH (other than TRB-TAL1 see M91.45)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.67 "Acute Leukaemia Other, TLX1 rearrangement FISH (other than TLX1-TRD & TRB-TLX1 see M91.48 & M91.49)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.68 "Acute Leukaemia Other, PDGFRA rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.69 "Acute Leukaemia Other, PDGFRB rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.7 "Acute Leukaemia Other, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M89.70 "Acute Leukaemia Other, ABL1 rearrangement FISH (other than BCR-ABL1 see M91.10)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.71 "Acute Leukaemia Other, JAK2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.72 "Acute Leukaemia Other, KMT2A rearrangement FISH (other than specific rearrangements described in tests M91.30-91,44)"
    * equivalence = #narrower
  * target[+]
    * code = #M89.73 "Acute Leukaemia Other, ABL2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.74 "Acute Leukaemia Other, CSF1R rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.75 "Acute Leukaemia Other, 14q32 (IGH) rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.76 "Acute Leukaemia Other, CRLF2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.77 "Acute Leukaemia Other, EPOR rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M89.78 "Acute Leukaemia Other, t(15;17)(q24;q21) PML-RARA RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.79 "Acute Leukaemia Other, t(8;21)(q22;q22) RUNX1-RUNX1T1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.8 "Acute Leukaemia Other, BCR-ABL1 multiplex"
    * equivalence = #narrower
  * target[+]
    * code = #M89.80 "Acute Leukaemia Other, inv(16)(p13.1q22) CBFB-MYH11 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.81 "Acute Leukaemia Other, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 (KMT2A) rearrangements RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.82 "Acute Leukaemia Other, t(6;9)(p22;q34) DEK-NUP214 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.83 "Acute Leukaemia Other, inv(3)(q21q26) GATA2-MECOM RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.84 "Acute Leukaemia Other, t(1;22)(p13;q13)  RBM15-MRTFA RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.85 "Acute Leukaemia Other, t(9;22)(q34;q11) BCR-ABL1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.86 "Acute Leukaemia Other, t(3;5)(q25;q34) NPM1-MLF1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.87 "Acute Leukaemia Other, t(5;11)(q35;p15.5) NUP98-NSD1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.88 "Acute Leukaemia Other, t(7;12)(q36;p13) MNX1-ETV6 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.89 "Acute Leukaemia Other, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.9 "Acute Leukaemia Other, MRD NPM1 RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.90 "Acute Leukaemia Other, t(12;21)(p13;q22) ETV6-RUNX1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.91 "Acute Leukaemia Other,  t(1;19)(q23;p13) TCF3-PBX1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.92 "Acute Leukaemia Other, t(17;19)(q22;p13) TCF3-HLF RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.93 "Acute Leukaemia Other, t(4;11)(q21;q23) KMT2A-AFF1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.94 "Acute Leukaemia Other, t(11;19)(q23;p13.3) KMT2A-MLLT1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.95 "Acute Leukaemia Other, t(6;11)(q27;q23) KMT2A-AFDN RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.96 "Acute Leukaemia Other, t(10;11)(p12;q23) KMT2A-MLLT10 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.97 "Acute Leukaemia Other, t(11;19)(q23;p13.1) KMT2A-ELL RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.98 "Acute Leukaemia Other, t(1;7)(p32;q11) TRB-TAL1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M89.99 "Acute Leukaemia Other, t(11;14)(p15;q11) TRD-LMO1 RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M90 "Blastic Plasmacytoid Dendritic Cell Neoplasm"
  * target[+]
    * code = #M90.1 "Blastic Plasmacytoid Dendritic Cell Neoplasm, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M90.2 "Blastic Plasmacytoid Dendritic Cell Neoplasm, Karyotype (Genomewide)"
    * equivalence = #narrower
  * target[+]
    * code = #M90.3 "Blastic Plasmacytoid Dendritic Cell Neoplasm, FISH copy number and rearrangement"
    * equivalence = #narrower
  * target[+]
    * code = #M90.4 "Blastic Plasmacytoid Dendritic Cell Neoplasm, Multi-target NGS panel, small variant (NPM1, CEBPA, RUNX1, FLT3, IDH1, IDH2, KIT, WT1, ASXL1, SRSF2, STAG2, RAD21, TP53, KRAS, NRAS, KMT2A(MLL)-PTD)"
    * equivalence = #narrower
  * target[+]
    * code = #M90.5 "Blastic Plasmacytoid Dendritic Cell Neoplasm, FLT3 ITD"
    * equivalence = #narrower
  * target[+]
    * code = #M90.6 "Blastic Plasmacytoid Dendritic Cell Neoplasm, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M90.7 "Blastic Plasmacytoid Dendritic Cell Neoplasm, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M91 "Acute Lymphoblastic Leukaemia"
  * target[+]
    * code = #M91.1 "Acute Lymphoblastic Leukaemia, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M91.10 "Acute Lymphoblastic Leukaemia, BCR-ABL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.11 "Acute Lymphoblastic Leukaemia, BCR-ABL1 TKD NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M91.14 "Acute Lymphoblastic Leukaemia, MRD ALL RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.15 "Acute Lymphoblastic Leukaemia, Multi-target NGS panel, small variant (ETV6, NOTCH1, FBXW7, TP53, PTEN, KRAS, NRAS, HRAS)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.2 "Acute Lymphoblastic Leukaemia, Karyotype (To include detection of complex karyotype, hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy etc)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.22 "Acute Lymphoblastic Leukaemia, MRD target identification (Ig/TCR gene rearrangement by PCR & sequencing with MRD workup via QF-PCR)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.23 "Acute Lymphoblastic Leukaemia, MRD quantification (Ig/TCR gene rearrangement MRD QF-PCR)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.24 "Acute Lymphoblastic Leukaemia, Global copy number change FISH (i.e. hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.25 "Acute Lymphoblastic Leukaemia, del(1)(p33p33) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.26 "Acute Lymphoblastic Leukaemia, iAMP21 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.36 "Acute Lymphoblastic Leukaemia, t(12;21)(p13;q22) ETV6-RUNX1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.37 "Acute Lymphoblastic Leukaemia,  t(1;19)(q23;p13) TCF3-PBX1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.38 "Acute Lymphoblastic Leukaemia, t(17;19)(q22;p13) TCF3-HLF FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.39 "Acute Lymphoblastic Leukaemia, t(4;11)(q21;q23) KMT2A-AFF1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.4 "Acute Lymphoblastic Leukaemia, FISH copy number and rearrangement other: See tests M91.24-M91.62 for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M91.40 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.3) KMT2A-MLLT1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.41 "Acute Lymphoblastic Leukaemia, t(6;11)(q27;q23) KMT2A-AFDN FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.42 "Acute Lymphoblastic Leukaemia,  t(9;11)(p21;q23) KMT2A-MLLT3 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.43 "Acute Lymphoblastic Leukaemia,  t(10;11)(p12;q23) KMT2A-MLLT10 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.44 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.1) KMT2A-ELL FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.45 "Acute Lymphoblastic Leukaemia, t(1;7)(p32;q11) TRB-TAL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.46 "Acute Lymphoblastic Leukaemia, t(11;14)(p15;q11) TRD-LMO1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.47 "Acute Lymphoblastic Leukaemia, t(7;11)(p15;p15) NUP98-HOXA13 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.48 "Acute Lymphoblastic Leukaemia, t(10;14)(q24;q11) TLX1-TRD FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.49 "Acute Lymphoblastic Leukaemia, t(7;10)(q34;q24) TRB-TLX1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.50 "Acute Lymphoblastic Leukaemia, t(5;14)(q35;q32.2) BCL11B-TLX3 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.51 "Acute Lymphoblastic Leukaemia, TAL1 rearrangement FISH (other than TRB-TAL1 see M91.45)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.52 "Acute Lymphoblastic Leukaemia, TLX1 rearrangement FISH (other than TLX1-TRD & TRB-TLX1 see M91.48 & M91.49)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.53 "Acute Lymphoblastic Leukaemia, PDGFRA rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.54 "Acute Lymphoblastic Leukaemia, PDGFRB rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.55 "Acute Lymphoblastic Leukaemia, ABL1 rearrangement FISH (other than BCR-ABL1 see M91.10)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.56 "Acute Lymphoblastic Leukaemia, JAK2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.57 "Acute Lymphoblastic Leukaemia, KMT2A rearrangement FISH (other than specific rearrangements described in tests M91.30-91,44)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.58 "Acute Lymphoblastic Leukaemia, ABL2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.59 "Acute Lymphoblastic Leukaemia, CSF1R rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.6 "Acute Lymphoblastic Leukaemia, Other RT-PCR: See tests M91-63-M91.77 for individual specified RT-PCR targets"
    * equivalence = #narrower
  * target[+]
    * code = #M91.60 "Acute Lymphoblastic Leukaemia, 14q32(IGH) rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.61 "Acute Lymphoblastic Leukaemia, CRLF2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.62 "Acute Lymphoblastic Leukaemia, EPOR rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.63 "Acute Lymphoblastic Leukaemia, t(12;21)(p13;q22) ETV6-RUNX1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.64 "Acute Lymphoblastic Leukaemia, t(1;19)(q23;p13) TCF3-PBX1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.65 "Acute Lymphoblastic Leukaemia, t(17;19)(q22;p13) TCF3-HLF RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.66 "Acute Lymphoblastic Leukaemia, t(4;11)(q21;q23) KMT2A-AFF1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.67 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.3) KMT2A-MLLT1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.68 "Acute Lymphoblastic Leukaemia, t(6;11)(q27;q23) KMT2A-AFDN RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.69 "Acute Lymphoblastic Leukaemia, t(9;11)(p21;q23) KMT2A-MLLT3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.7 "Acute Lymphoblastic Leukaemia, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M91.70 "Acute Lymphoblastic Leukaemia,  t(10;11)(p12;q23) KMT2A-MLLT10 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.71 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.1) KMT2A-ELL RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.72 "Acute Lymphoblastic Leukaemia, t(1;7)(p32;q11) TRB-TAL1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.73 "Acute Lymphoblastic Leukaemia, t(11;14)(p15;q11) TRD-LMO1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.74 "Acute Lymphoblastic Leukaemia, t(7;11)(p15;p15) NUP98-HOXA13 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.75 "Acute Lymphoblastic Leukaemia, t(10;14)(q24;q11) TLX1-TRD RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.76 "Acute Lymphoblastic Leukaemia, t(7;10)q34;q24) TRB-TLX1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.77 "Acute Lymphoblastic Leukaemia, t(5;14)(q35;q32.2) BCL11B-TLX3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M91.78 "Acute Lymphoblastic Leukaemia, Multi-target NGS panel, copy number variant (to include hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy etc.)"
    * equivalence = #narrower
  * target[+]
    * code = #M91.79 "Acute Lymphoblastic Leukaemia, MRD BCR-ABL1 RT-qPCR rare"
    * equivalence = #narrower
  * target[+]
    * code = #M91.8 "Acute Lymphoblastic Leukaemia, BCR-ABL1 multiplex"
    * equivalence = #narrower
  * target[+]
    * code = #M91.80 "Acute Lymphoblastic Leukaemia, TPMT"
    * equivalence = #narrower
  * target[+]
    * code = #M91.81 "Acute Lymphoblastic Leukaemia, NUDT15"
    * equivalence = #narrower
  * target[+]
    * code = #M91.82 "Acute Lymphoblastic Leukaemia, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M91.83 "Acute Lymphoblastic Leukaemia, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M91.84 "Acute Lymphoblastic Leukaemia, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.85 "Acute Lymphoblastic Leukaemia, t(8;14)(q34;q32) IGH-MYC FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.86 "Acute Lymphoblastic Leukaemia, t(2;8)(p12;q24) IGK-MYC FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.87 "Acute Lymphoblastic Leukaemia, t(8;22)(q24;q11) IGL-MYC FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.88 "Acute Lymphoblastic Leukaemia, BCL2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.89 "Acute Lymphoblastic Leukaemia, BCL6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M91.9 "Acute Lymphoblastic Leukaemia, MRD BCR-ABL1 RT-qPCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M92 "Plasma Cell Dyscrasia"
  * target[+]
    * code = #M92.1 "Plasma Cell Dyscrasia, Multi-target NGS panel, small variant (KRAS, NRAS, BRAF, TP53, DIS3, TENT5C, IRF4)"
    * equivalence = #narrower
  * target[+]
    * code = #M92.10 "Plasma Cell Dyscrasia, del(1p) copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M92.11 "Plasma Cell Dyscrasia, gain(1q) copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M92.12 "Plasma Cell Dyscrasia, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M92.13 "Plasma Cell Dyscrasia, Multi-target NGS panel (To include hyperdiploidy, del(1p), gain(1q), del17p)"
    * equivalence = #narrower
  * target[+]
    * code = #M92.14 "Plasma Cell Dyscrasia, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M92.2 "Plasma Cell Dyscrasia, t(4;14) IGH-FGFR3FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M92.3 "Plasma Cell Dyscrasia, t(6;14)  IGH-CCND3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M92.4 "Plasma Cell Dyscrasia, t(11;14)(q13;q32)  IGH-CCND1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M92.5 "Plasma Cell Dyscrasia, t(14;16) IGH-MAF FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M92.6 "Plasma Cell Dyscrasia, t(14;20)  IGH-MAFB FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M92.7 "Plasma Cell Dyscrasia, Multi-target NGS panel, structural variant (To include IGH-FGFR3, IGH-CCND3, IGH-CCND1, IGH-MAF, IGH-MAFB, MYC rearrangements)"
    * equivalence = #narrower
  * target[+]
    * code = #M92.8 "Plasma Cell Dyscrasia, IGH rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M92.9 "Plasma Cell Dyscrasia, Hyperdiploidy copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M93 "Lymphoma"
  * target[+]
    * code = #M93.3 "Lymphoma, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M93.4 "Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M93.5 "Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M93.6 "Lymphoma, Multi-target NGS panel-small variant (BTK, PLCG2, RAS, MAP2K1, BCL2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M94 "Chronic Lymphocytic Leukaemia"
  * target[+]
    * code = #M94.1 "Chronic Lymphocytic Leukaemia, Multi-target NGS panel, small variant (TP53,BTK, PLCG2, BCL2)"
    * equivalence = #narrower
  * target[+]
    * code = #M94.10 "Chronic Lymphocytic Leukaemia, chromosome 12 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M94.2 "Chronic Lymphocytic Leukaemia, Multi-target NGS panel, copy number variant (TP53,ATM, DLEU2/7, RB1, trisomy 12)"
    * equivalence = #narrower
  * target[+]
    * code = #M94.4 "Chronic Lymphocytic Leukaemia, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M94.5 "Chronic Lymphocytic Leukaemia, Ig gene (heavy & light chain) rearrangement & hypermutation detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M94.6 "Chronic Lymphocytic Leukaemia, Ig gene (heavy & light chain) rearrangement & hypermutation detection NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M94.7 "Chronic Lymphocytic Leukaemia, TP53 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M94.8 "Chronic Lymphocytic Leukaemia, 11q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M94.9 "Chronic Lymphocytic Leukaemia, 13q copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M95 "B cell Non-Hodgkin Lymphoma"
  * target[+]
    * code = #M95.1 "B Cell Non-Hodgkin Lymphoma, Ig gene (heavy & light chain) rearrangement & hypermutation detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M95.10 "B Cell Non-Hodgkin Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M95.11 "B Cell Non-Hodgkin Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M95.12 "B cell Non-Hodgkin Lymphoma, MYD88 (L265P) hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M95.2 "B Cell Non-Hodgkin Lymphoma, Ig gene (heavy & light chain) rearrangement & hypermutation detection NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M95.3 "B Cell Non-Hodgkin Lymphoma, Ig rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M95.4 "B Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, small variant (EZH2)"
    * equivalence = #narrower
  * target[+]
    * code = #M95.5 "B Cell Non-Hodgkin Lymphoma, EZH2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M95.6 "B Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, small variant (BTK, PLCG2)"
    * equivalence = #narrower
  * target[+]
    * code = #M95.7 "B Cell Non-Hodgkin Lymphoma, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M95.8 "B Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, structural variant (Ig)"
    * equivalence = #narrower
  * target[+]
    * code = #M95.9 "B Cell Non-Hodgkin Lymphoma, Mutli-target NGS panel, copy number (EZH2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M96 "Burkitt Lymphoma"
  * target[+]
    * code = #M96.1 "Burkitt Lymphoma, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M96.10 "Burkitt Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M96.2 "Burkitt Lymphoma, t(8;14)(q34;q32) IGH-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M96.3 "Burkitt Lymphoma, t(2;8)(p12;q24) IGK-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M96.4 "Burkitt Lymphoma, t(8;22)(q24;q11) IGL-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M96.5 "Burkitt Lymphoma, BCL2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M96.6 "Burkitt Lymphoma, BCL6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M96.7 "Burkitt Lymphoma, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M96.8 "Burkitt Lymphoma, Multi-target NGS panel, structural variant (IGH-MYC, IGK-MYC, IGL-MYC, other rearrangements of MYC,  BCL2, BCL6)"
    * equivalence = #narrower
  * target[+]
    * code = #M96.9 "Burkitt Lymphoma, WGS Tumour First"
    * equivalence = #narrower
* group.element[+]
  * code = #M97 "Burkitt Like Lymphoma with 11q Abnormalities"
  * target[+]
    * code = #M97.1 "Burkitt Like Lymphoma with 11q Abnormalities, 11q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M97.2 "Burkitt Like Lymphoma with 11q Abnormalities, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M97.3 "Burkitt Like Lymphoma with 11q Abnormalities, Multi-target NGS panel, copy number variant (11q)"
    * equivalence = #narrower
  * target[+]
    * code = #M97.4 "Burkitt Like Lymphoma with 11q Abnormalities, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M97.5 "Burkitt Like Lymphoma with 11q Abnormalities, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M98 "Large B Cell Like Lymphoma with IRF4 Rearrangement"
  * target[+]
    * code = #M98.1 "Large B Cell Like Lymphoma with IRF4 Rearrangement, IRF4 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M98.2 "Large B Cell Like Lymphoma with IRF4 Rearrangement, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M98.3 "Large B Cell Like Lymphoma with IRF4 Rearrangement, Multi-target NGS panel, structural variant (IRF4)"
    * equivalence = #narrower
  * target[+]
    * code = #M98.4 "Large B Cell Like Lymphoma with IRF4 Rearrangement, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M98.5 "Large B Cell Like Lymphoma with IRF4 Rearrangement, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M99 "High Grade Lymphoma"
  * target[+]
    * code = #M99.1 "High Grade Lymphoma, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M99.10 "High Grade Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M99.11 "High Grade Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M99.2 "High Grade Lymphoma, t(8;14)(q34;q32) IGH-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M99.3 "High Grade Lymphoma, t(2;8)(p12;q24) IGK-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M99.4 "High Grade Lymphoma, t(8;22)(q24;q11) IGL-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M99.5 "High Grade Lymphoma, BCL2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M99.6 "High Grade Lymphoma, t(14;18)(q32;q21) IGH-BCL2 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M99.7 "High Grade Lymphoma, BCL6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M99.8 "High Grade Lymphoma, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M99.9 "High Grade Lymphoma, Mutli-target NGS panel, structural variant (IGH-MYC, IGK-MYC, IGL-MYC, IGH-BCL2, other rearrangements of MYC, BCL2, BCL6)"
    * equivalence = #narrower
* group.element[+]
  * code = #M100 "Primary Mediastinal B Cell Lymphoma"
  * target[+]
    * code = #M100.1 "Primary Mediastinal B Cell Lymphoma, CD274, PDCD1LG2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M100.2 "Primary Mediastinal B Cell Lymphoma, CD274, PDCD1LG2 Copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M100.3 "Primary Mediastinal B Cell Lymphoma, REL copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M100.4 "Primary Mediastinal B Cell Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M100.5 "Primary Mediastinal B Cell Lymphoma, Multi-target NGS panel, copy number variant (CD274, PDCD1LG2, REL)"
    * equivalence = #narrower
  * target[+]
    * code = #M100.6 "Primary Mediastinal B Cell Lymphoma, Multi-target NGS panel, rearrangement (CD274, PDCD1LG2)"
    * equivalence = #narrower
  * target[+]
    * code = #M100.7 "Primary Mediastinal B Cell Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M100.8 "Primary Mediastinal B Cell Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M101 "ALK Positive Large B Cell Lymphoma"
  * target[+]
    * code = #M101.1 "ALK Positive Large B Cell Lymphoma, ALK rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M101.2 "ALK Positive Large B Cell Lymphoma, t(2;17)(p23;q23) CLTC-ALK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M101.3 "ALK Positive Large B Cell Lymphoma, t(2;5)(p23;q35) ALK-NPM1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M101.4 "ALK Positive Large B Cell Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M101.5 "ALK Positive Large B Cell Lymphoma, Multi-target NGS panel, structural variant (CLTC-ALK, ALK-NPM1, other ALK rearrangements)"
    * equivalence = #narrower
  * target[+]
    * code = #M101.6 "ALK Positive Large B Cell Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M101.7 "ALK Positive Large B Cell Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M102 "Mantle Cell Lymphoma"
  * target[+]
    * code = #M102.1 "Mantle Cell Lymphoma, t(11;14)(q13;q32) IGH-CCND1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M102.2 "Mantle Cell Lymphoma, CCND1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M102.3 "Mantle Cell Lymphoma, CCND2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M102.4 "Mantle Cell Lymphoma, Multi-target NGS panel, structural variant (IGH-CCND1, other CCND1 rearrangements, CCND2)"
    * equivalence = #narrower
  * target[+]
    * code = #M102.5 "Mantle Cell Lymphoma, Multi-target NGS panel, small variant (TP53)"
    * equivalence = #narrower
* group.element[+]
  * code = #M103 "Follicular Lymphoma"
  * target[+]
    * code = #M103.1 "Follicular Lymphoma, t(14;18)(q32;q21) IGH-BCL2 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M103.2 "Follicular Lymphoma, BCL2 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M103.3 "Follicular Lymphoma, BCL6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M103.4 "Follicular Lymphoma, Multi-target NGS panel, small variant (CARD11, CREBBP, EZH2, ARID1A, EP300, MEF2B, FOXO1)"
    * equivalence = #narrower
  * target[+]
    * code = #M103.5 "Follicular Lymphoma, Multi-target NGS panel, structural variant (IGH-BCL2, BCL2, BCL6)"
    * equivalence = #narrower
* group.element[+]
  * code = #M104 "Lymphoplasmacytic Lymphoma/Waldenstrom Macroglobulinaemia"
  * target[+]
    * code = #M104.1 "Lymphoplasmacytic Lymphoma/Waldenstrom Macroglobulinaemia, Multi-target NGS panel, small variant (MYD88, CXCR4)"
    * equivalence = #narrower
  * target[+]
    * code = #M104.2 "Lymphoplasmacytic Lymphoma/Waldenstrom Macroglobulinaemia, MYD88 hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M105 "Igm Monoclonal Gammopathy of Uncertain Significance"
  * target[+]
    * code = #M105.1 "Igm Monoclonal Gammopathy of Uncertain Significance, Multi-target NGS panel, small variant (MYD88, CXCR4)"
    * equivalence = #narrower
  * target[+]
    * code = #M105.2 "Igm Monoclonal Gammopathy of Uncertain Significance, MYD88 hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M106 "Intra-Ocular Lymphoma"
  * target[+]
    * code = #M106.1 "Intra-Ocular Lymphoma, MYD88 hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M107 "Malt-Lymphoma"
  * target[+]
    * code = #M107.1 "Malt-Lymphoma, t(11;18)(q21;q21) BIRC3-MALT1  FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M107.10 "Malt-Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M107.2 "Malt-Lymphoma, t(1;14)(p22;q32) IGH-BCL10 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M107.3 "Malt-Lymphoma, t(14;18)(q32;q21) IGH-MALT1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M107.4 "Malt-Lymphoma, MALT1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M107.5 "Malt-Lymphoma, BCL10 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M107.6 "Malt-Lymphoma, FOXP1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M107.7 "Malt-Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M107.8 "Malt-Lymphoma, Multi-target NGS panel, structural variant (BIRC3-MALT1, IGH-BCL10, IGH-MALT1, other MALT rearrangements, other BCL10 rearrangements, FOXP1)"
    * equivalence = #narrower
  * target[+]
    * code = #M107.9 "Malt-Lymphoma, WGS Tumour First"
    * equivalence = #narrower
* group.element[+]
  * code = #M108 "Hairy Cell Leukaemia"
  * target[+]
    * code = #M108.1 "Hairy Cell Leukaemia, Multi-target NGS panel, small variant (BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M108.2 "Hairy Cell Leukaemia, BRAF V600 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M108.5 "Hairy Cell Leukaemia, Ig gene hypermutation detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M108.6 "Hairy Cell Leukaemia, Ig gene hypermutation detection NGS"
    * equivalence = #narrower
* group.element[+]
  * code = #M109 "Hairy Cell Leukaemia"
  * target[+]
    * code = #M109.1 "Hairy Cell Leukaemia, Vh4-34 Variant, Ig gene (heavy chain) rearrangement detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M109.2 "Hairy Cell Leukaemia, Vh4-34 Variant, Ig gene (heavy chain) rearrangement detection NGS"
    * equivalence = #narrower
* group.element[+]
  * code = #M110 "Paediatric Type Follicular Lymphoma"
  * target[+]
    * code = #M110.1 "Paediatric Type Follicular Lymphoma, Multi-target NGS panel, small variant (MAP2K1)"
    * equivalence = #narrower
  * target[+]
    * code = #M110.2 "Paediatric Type Follicular Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M110.3 "Paediatric Type Follicular Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M110.4 "Paediatric Type Follicular Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M111 "T Cell Non-Hodgkin Lymphoma"
  * target[+]
    * code = #M111.1 "T Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, small variant (RHOA, DNMT3A, IDH2, TET2)"
    * equivalence = #narrower
  * target[+]
    * code = #M111.2 "T Cell Non-Hodgkin Lymphoma, TCR gene rearrangement detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M111.3 "T Cell Non-Hodgkin Lymphoma, TCR gene rearrangement detection NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M111.4 "T Cell Non-Hodgkin Lymphoma, TCR rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M111.5 "T Cell Non-Hodgkin Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M111.6 "T Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, structural variant (TCR rearrangement)"
    * equivalence = #narrower
  * target[+]
    * code = #M111.7 "T Cell Non-Hodgkin Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M111.8 "T Cell Non-Hodgkin Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M112 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes)"
  * target[+]
    * code = #M112.3 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), IRF4/DUSP22 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M112.4 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), TP63 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M112.5 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M112.6 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), Multi-target NGS panel, structural variant (IRF4/DUSP22, TP63)"
    * equivalence = #narrower
  * target[+]
    * code = #M112.7 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M112.8 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M113 "T Prolymphocytic Leukaemia"
  * target[+]
    * code = #M113.1 "T Prolymphocytic Leukaemia, TCL1A rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M113.2 "T Prolymphocytic Leukaemia, Chr8 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M113.3 "T Prolymphocytic Leukaemia, Multi-target NGS panel, structural variant (TCL1A, Chr8)"
    * equivalence = #narrower
  * target[+]
    * code = #M113.6 "T Prolymphocytic Leukaemia, Karyotype (to include TCL1 rearrangements t(X;14))"
    * equivalence = #narrower
* group.element[+]
  * code = #M114 "Large Granular Lymphocyte Leukaemia"
  * target[+]
    * code = #M114.1 "Large Granular Lymphocyte Leukaemia, Multi-target NGS panel, small variant (STAT3, STAT5B)"
    * equivalence = #narrower
* group.element[+]
  * code = #M115 "NK Cell/Gamma-Delta T Cell Lymphoma"
  * target[+]
    * code = #M115.1 "NK Cell/Gamma-Delta T Cell Lymphoma, Multi-target NGS panel, small variant (STAT3, STAT5B)"
    * equivalence = #narrower
  * target[+]
    * code = #M115.2 "NK Cell/Gamma-Delta T Cell Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M115.3 "NK Cell/Gamma-Delta T Cell Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M115.4 "NK Cell/Gamma-Delta T Cell Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M116 "Hepatosplenic T Cell Lymphoma"
  * target[+]
    * code = #M116.1 "Hepatosplenic T Cell Lymphoma, Multi-target NGS panel, small variant (STAT3, STAT5B)"
    * equivalence = #narrower
  * target[+]
    * code = #M116.2 "Hepatosplenic T Cell Lymphoma, i7q rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M116.3 "Hepatosplenic T Cell Lymphoma, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M116.4 "Hepatosplenic T Cell Lymphoma, Multi-target NGS panel, structural variant (i17q)"
    * equivalence = #narrower
  * target[+]
    * code = #M116.5 "Hepatosplenic T Cell Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M116.6 "Hepatosplenic T Cell Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M117 "Histiocytosis"
  * target[+]
    * code = #M117.1 "Histiocytosis, Multi-target NGS panel, small variant (BRAF, MAP2K1, NRAS, KRAS, HRAS, ERBB3, ARAF, MAP3K1, PIK3CA, PIK3CD)"
    * equivalence = #narrower
  * target[+]
    * code = #M117.12 "Histiocytosis, NTRK1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M117.16 "Histiocytosis, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M117.17 "Histiocytosis, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M117.18 "Histiocytosis, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M117.19 "Histiocytosis, High Sensitivity BRAF"
    * equivalence = #narrower
  * target[+]
    * code = #M117.2 "Histiocytosis, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M117.3 "Histiocytosis, ALK rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M117.7 "Histiocytosis, BRAF rearrangement FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M118 "Any patient undergoing Allogeneic Haematopoietic Stem Cell transplantation"
  * target[+]
    * code = #M118.1 "Any patient undergoing Allogeneic Haematopoietic Stem Cell transplantation, STR Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M118.2 "Any patient undergoing Allogeneic Haematopoietic Stem Cell transplantation, Sex chromosome FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M119 "Paediatric Tumours"
  * target[+]
    * code = #M119.1 "Paediatric Tumours, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M119.2 "Paediatric Tumours, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M119.4 "Paediatric Tumours, DPYD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M119.5 "Paediatric Tumours, Multi-target NGS-small variant (ABL1, ACVR1, AKT1, ALK, AMER1, APC, ARID1A, ARID1B, ASXL1, ATM, ATR, ATRX, BARD1, BBC3, BCOR, BRAF, BRCA1, BRCA2, BRIP1, CCND1, CCND2, CCNE1, CDK12, CDK4, CDK6, CDKN1A, CDKN2A, CDKN2B, CHEK1, CHEK2, CIC, CREBBP, CTNNB1, DAXX, DDX3X, DICER1, DROSHA, EGFR, EMSY, EPHB2, ERBB2, EZH2, FANCI, FANCL, FBXW7, FGFR1, FGFR2, FGFR3, FGFR4, GPR161, H3F3A, HIST1H3B, HIST1H3C, HIST2H3C, HRAS, IDH1, IDH2, IGF1R, KIAA1549 (CNV), KIT, KMT2A, KRAS, LIN28B, MAP2K1, MAP2K2, MAPK1, MDM2, MDM4, MET, MLH1, MRE11A, MSH2, MSH6, MYC, MYCL, MYCN, MYOD1, NF1, NF2, NRAS, PALB2, PDGFRA, PHOX2B, PIK3CA, PIK3R1, PIN1, PMS1, PMS2, PPM1D, PPP2R2A, PRKAR1A, PTCH1, PTCH2, PTEN, PTPN11, RAD51B, RAD51C, RAD51D, RAD54L, RAF1, RB1, RET, SETD2, SMARCA4, SMARCB1, SMARCE1, SMO, SUFU, TERT, TFE3, TP53, TSC1, TSC2, VHL, WT1, YAP1, YWHAE (CNV))"
    * equivalence = #narrower
* group.element[+]
  * code = #M120 "Atypical Teratoid/Rhabdoid Tumour"
  * target[+]
    * code = #M120.1 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, Multi-target NGS panel, small variant (SMARCA4, SMARCB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M120.10 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.11 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.12 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.13 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.14 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.15 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M120.16 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M120.17 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, Multi-target NGS panel, copy number variant (SMARCA4, SMARCB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M120.18 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M120.2 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCA4 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M120.3 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M120.4 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M120.5 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M120.6 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M120.7 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.8 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M120.9 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M124 "Clear Cell Kidney Sarcoma - Paediatric"
  * target[+]
    * code = #M124.1 "Clear Cell Kidney Sarcoma - Paediatric, Multi-target NGS panel - small variant (BCOR)"
    * equivalence = #narrower
  * target[+]
    * code = #M124.10 "Clear Cell Kidney Sarcoma - Paediatric, Multi-target NGS panel - structural variant (BCOR, NUTM2B-YWHAE, NUTM2E-YWHAE, NUTM1-YWHAE, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M124.11 "Clear Cell Kidney Sarcoma - Paediatric, Multi-target NGS panel - copy number variant (BCOR, YWHAE)"
    * equivalence = #narrower
  * target[+]
    * code = #M124.2 "Clear Cell Kidney Sarcoma - Paediatric, BCOR seq"
    * equivalence = #narrower
  * target[+]
    * code = #M124.3 "Clear Cell Kidney Sarcoma - Paediatric, BCOR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M124.4 "Clear Cell Kidney Sarcoma - Paediatric, BCOR rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M124.5 "Clear Cell Kidney Sarcoma - Paediatric, NUTM2B-YWHAE FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M124.6 "Clear Cell Kidney Sarcoma - Paediatric, NUTM2E-YWHAE FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M124.7 "Clear Cell Kidney Sarcoma - Paediatric, NUTM1-YWHAE FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M124.8 "Clear Cell Kidney Sarcoma - Paediatric, YWHAE copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M124.9 "Clear Cell Kidney Sarcoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M126 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration"
  * target[+]
    * code = #M126.1 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, MN1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M126.2 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M126.3 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, Multi-target NGS panel, structural variant (MN1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M126.4 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M127 "Congenital Mesoblastic Nephroma - Paediatric"
  * target[+]
    * code = #M127.1 "Congenital Mesoblastic Nephroma - Paediatric, NTRK3-ETV6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M127.3 "Congenital Mesoblastic Nephroma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M127.4 "Congenital Mesoblastic Nephroma - Paediatric, Multi-target NGS panel - structural variant (NTRK3-ETV6, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M130 "Cribriform Neuroepithelial Tumour"
  * target[+]
    * code = #M130.1 "Cribriform Neuroepithelial Tumour, Paediatric, Multi-target NGS panel, small variant (SMARCB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M130.2 "Cribriform Neuroepithelial Tumour, Paediatric, SMARCB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M130.3 "Cribriform Neuroepithelial Tumour, Paediatric, SMARCB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M130.4 "Cribriform Neuroepithelial Tumour, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M130.5 "Cribriform Neuroepithelial Tumour, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M130.6 "Cribriform Neuroepithelial Tumour, Paediatric, Multi-target NGS panel, copy number variant (SMARCB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M130.7 "Cribriform Neuroepithelial Tumour, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M131 "Cystic Nephroma - Paediatric"
  * target[+]
    * code = #M131.1 "Cystic Nephroma - Paediatric, Multi-target NGS panel - small variant (DICER1)"
    * equivalence = #narrower
  * target[+]
    * code = #M131.2 "Cystic Nephroma - Paediatric, DICER1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M131.3 "Cystic Nephroma - Paediatric, DICER1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M131.4 "Cystic Nephroma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M131.5 "Cystic Nephroma - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M131.6 "Cystic Nephroma - Paediatric, Multi-target NGS panel - copy number variant (DICER1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M132 "Desmoplastic Infantile Gangliogliomas"
  * target[+]
    * code = #M132.1 "Desmoplastic Infantile Gangliogliomas, Paediatric, Multi-target NGS panel, small variant (BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M132.10 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.11 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M132.12 "Desmoplastic Infantile Gangliogliomas, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M132.13 "Desmoplastic Infantile Gangliogliomas, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M132.2 "Desmoplastic Infantile Gangliogliomas, Paediatric, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M132.3 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.4 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.5 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.6 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.7 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.8 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M132.9 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M133 "Desmoplastic Medulloblastoma"
  * target[+]
    * code = #M133.1 "Desmoplastic Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (SUFU)"
    * equivalence = #narrower
  * target[+]
    * code = #M133.2 "Desmoplastic Medulloblastoma, Paediatric, SUFU seq"
    * equivalence = #narrower
  * target[+]
    * code = #M133.3 "Desmoplastic Medulloblastoma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M133.4 "Desmoplastic Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M133.5 "Desmoplastic Medulloblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M136 "Fibrolamellar Hepatocellular Carcinoma"
  * target[+]
    * code = #M136.1 "Fibrolamellar Hepatocellular Carcinoma, Paediatric, DNAJB1-PRKACA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M136.2 "Fibrolamellar Hepatocellular Carcinoma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M136.3 "Fibrolamellar Hepatocellular Carcinoma, Paediatric, Multi-target NGS panel, structural variant (DNAJB1-PRKACA, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M136.5 "Fibrolamellar Hepatocellular Carcinoma, Paediatric, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M137 "Ganglioglioma"
  * target[+]
    * code = #M137.1 "Ganglioglioma, Paediatric, Multi-target NGS panel, small variant (BRAF)"
    * equivalence = #narrower
  * target[+]
    * code = #M137.10 "Ganglioglioma, Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.11 "Ganglioglioma, Paediatric, KIAA1549 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M137.12 "Ganglioglioma, Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M137.13 "Ganglioglioma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M137.14 "Ganglioglioma, Paediatric, Multi-target NGS panel, copy number variant (KIAA1549)"
    * equivalence = #narrower
  * target[+]
    * code = #M137.15 "Ganglioglioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M137.2 "Ganglioglioma, Paediatric, Multi-target NGS panel, structural variant (BRAF-KIAA1549, BRAF-FXR1, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B, BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M137.3 "Ganglioglioma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.4 "Ganglioglioma, Paediatric, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.5 "Ganglioglioma, Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.6 "Ganglioglioma, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.7 "Ganglioglioma, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.8 "Ganglioglioma, Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M137.9 "Ganglioglioma, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M138 "Glial Tumours"
  * target[+]
    * code = #M138.1 "Glial Tumours, Paediatric, Multi-target NGS panel, small variant (ATRX)"
    * equivalence = #narrower
  * target[+]
    * code = #M138.2 "Glial Tumours, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M138.3 "Glial Tumours, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M138.4 "Glial Tumours, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M139 "Glioblastoma"
  * target[+]
    * code = #M139.1 "Glioblastoma, Paediatric, Multi-target NGS panel, small variant (BRAF, CDKN2A, FGFR4)"
    * equivalence = #narrower
  * target[+]
    * code = #M139.10 "Glioblastoma, Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.12 "Glioblastoma, Paediatric, CDKN2A seq"
    * equivalence = #narrower
  * target[+]
    * code = #M139.13 "Glioblastoma, Paediatric, FGFR4 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M139.14 "Glioblastoma, Paediatric, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M139.15 "Glioblastoma, Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M139.16 "Glioblastoma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M139.17 "Glioblastoma, Paediatric, Multi-target NGS panel, copy number variant (CDKN2A)"
    * equivalence = #narrower
  * target[+]
    * code = #M139.18 "Glioblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M139.2 "Glioblastoma, Paediatric, Multi-target NGS panel, structural variant (BRAF-KIAA1549, BRAF-FXR1, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B,  BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M139.3 "Glioblastoma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.4 "Glioblastoma, Paediatric, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.5 "Glioblastoma, Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.6 "Glioblastoma, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.7 "Glioblastoma, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.8 "Glioblastoma, Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M139.9 "Glioblastoma, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M143 "Lung - Paediatric"
  * target[+]
    * code = #M143.1 "Lung - Paediatric, Multi-target NGS panel - small variant (H3-3A, H3-3B)"
    * equivalence = #narrower
  * target[+]
    * code = #M143.2 "Lung - Paediatric, H3-3A seq"
    * equivalence = #narrower
  * target[+]
    * code = #M143.3 "Lung - Paediatric, H3-3B seq"
    * equivalence = #narrower
  * target[+]
    * code = #M143.4 "Lung - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M143.5 "Lung - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M145 "Medulloblastoma"
  * target[+]
    * code = #M145.1 "Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (ALK, BCOR, PTCH1, PTCH2, PTEN, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M145.10 "Medulloblastoma, Paediatric, BCOR rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M145.11 "Medulloblastoma, Paediatric, C19MC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M145.12 "Medulloblastoma, Paediatric, PTEN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M145.13 "Medulloblastoma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M145.14 "Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (ALK, BCOR, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M145.15 "Medulloblastoma, Paediatric, Multi-target NGS panel, copy number variant (ALK, BCOR, C19MC, PTEN)"
    * equivalence = #narrower
  * target[+]
    * code = #M145.16 "Medulloblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M145.2 "Medulloblastoma, Paediatric, ALK seq"
    * equivalence = #narrower
  * target[+]
    * code = #M145.3 "Medulloblastoma, Paediatric, BCOR seq"
    * equivalence = #narrower
  * target[+]
    * code = #M145.4 "Medulloblastoma, Paediatric, PTCH1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M145.5 "Medulloblastoma, Paediatric, PTCH2 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M145.6 "Medulloblastoma, Paediatric, TERT promoter seq"
    * equivalence = #narrower
  * target[+]
    * code = #M145.7 "Medulloblastoma, Paediatric, ALK copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M145.8 "Medulloblastoma, Paediatric, ALK rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M145.9 "Medulloblastoma, Paediatric, BCOR copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M146 "Medulloblastoma Group 3"
  * target[+]
    * code = #M146.1 "Medulloblastoma Group 3, Paediatric, Multi-target NGS panel, small variant (SMARCA4, DDX3X)"
    * equivalence = #narrower
  * target[+]
    * code = #M146.2 "Medulloblastoma Group 3, Paediatric, SMARCA4 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M146.3 "Medulloblastoma Group 3, Paediatric, DDX3X seq"
    * equivalence = #narrower
  * target[+]
    * code = #M146.4 "Medulloblastoma Group 3, Paediatric, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M146.5 "Medulloblastoma Group 3, Paediatric, PVT1-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M146.6 "Medulloblastoma Group 3, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M146.7 "Medulloblastoma Group 3, Paediatric, Multi-target NGS panel, structural variant (PVT1-MYC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M146.8 "Medulloblastoma Group 3, Paediatric, Multi-target NGS panel, copy number variant (SMARCA4)"
    * equivalence = #narrower
  * target[+]
    * code = #M146.9 "Medulloblastoma Group 3, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M147 "Medulloblastoma Group 3/4"
  * target[+]
    * code = #M147.1 "Medulloblastoma Group 3/4, Paediatric, Multi-target NGS panel, small variant (MYCN, EZH2)"
    * equivalence = #narrower
  * target[+]
    * code = #M147.10 "Medulloblastoma Group 3/4, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M147.2 "Medulloblastoma Group 3/4, Paediatric, MYCN seq"
    * equivalence = #narrower
  * target[+]
    * code = #M147.3 "Medulloblastoma Group 3/4, Paediatric, EZH2 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M147.4 "Medulloblastoma Group 3/4, Paediatric, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M147.5 "Medulloblastoma Group 3/4, Paediatric, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M147.6 "Medulloblastoma Group 3/4, Paediatric, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M147.7 "Medulloblastoma Group 3/4, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M147.8 "Medulloblastoma Group 3/4, Paediatric, Multi-target NGS panel, structural variant (MYC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M147.9 "Medulloblastoma Group 3/4, Paediatric, Multi-target NGS panel, copy number variant (MYCN, MYC)"
    * equivalence = #narrower
* group.element[+]
  * code = #M148 "Medulloblastoma TP53 WT"
  * target[+]
    * code = #M148.1 "Medulloblastoma TP53 WT, Paediatric, Multi-target NGS panel, small variant (YAP1, PTCH1)"
    * equivalence = #narrower
  * target[+]
    * code = #M148.10 "Medulloblastoma TP53 WT, Paediatric, Multi-target NGS panel, copy number variant (YAP1, PTCH1)"
    * equivalence = #narrower
  * target[+]
    * code = #M148.11 "Medulloblastoma TP53 WT, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M148.2 "Medulloblastoma TP53 WT, Paediatric, YAP1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M148.3 "Medulloblastoma TP53 WT, Paediatric, PTCH1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M148.4 "Medulloblastoma TP53 WT, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M148.5 "Medulloblastoma TP53 WT, Paediatric, YAP1-TFE3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M148.6 "Medulloblastoma TP53 WT, Paediatric, YAP1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M148.7 "Medulloblastoma TP53 WT, Paediatric, PTCH1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M148.8 "Medulloblastoma TP53 WT, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M148.9 "Medulloblastoma TP53 WT, Paediatric, Multi-target NGS panel, structural variant (YAP1-C11orf95, YAP1-TFE3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M149 "Melanotic Tumours - Paediatric"
  * target[+]
    * code = #M149.1 "Melanotic Tumours - Paediatric, Multi-target NGS panel - small variant (NRAS)"
    * equivalence = #narrower
  * target[+]
    * code = #M149.2 "Melanotic Tumours - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M149.3 "Melanotic Tumours - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M150 "Meningioma"
  * target[+]
    * code = #M150.1 "Meningioma, Paediatric, Multi-target NGS panel, small variant (SMARCE1, AKT1, NF2, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M150.2 "Meningioma, Paediatric, SMARCE1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M150.3 "Meningioma, Paediatric, AKT1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M150.4 "Meningioma, Paediatric, NF2 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M150.5 "Meningioma, Paediatric, TERT promoter seq"
    * equivalence = #narrower
  * target[+]
    * code = #M150.6 "Meningioma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M150.7 "Meningioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M150.8 "Meningioma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M151 "Midline Carcinoma - Paediatric"
  * target[+]
    * code = #M151.1 "Midline Carcinoma - Paediatric, NUTM1-BRD2 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M151.2 "Midline Carcinoma - Paediatric, NUTM1-BRD3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M151.3 "Midline Carcinoma - Paediatric, NUTM1-BRD4 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M151.4 "Midline Carcinoma - Paediatric, NUTM1-CIC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M151.5 "Midline Carcinoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M151.6 "Midline Carcinoma - Paediatric, Multi-target NGS panel - structural variant (NUTM1-BRD2, NUTM1-BRD3, NUTM1-BRD4, NUTM1-CIC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M152 "Neuroblastoma - Paediatric"
  * target[+]
    * code = #M152.1 "Neuroblastoma - Paediatric, SNP Array"
    * equivalence = #narrower
  * target[+]
    * code = #M152.10 "Neuroblastoma - Paediatric, 17q rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.11 "Neuroblastoma - Paediatric, 11q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.12 "Neuroblastoma - Paediatric, 1p36 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.13 "Neuroblastoma - Paediatric, ALK rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.14 "Neuroblastoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M152.15 "Neuroblastoma - Paediatric, MYCN seq"
    * equivalence = #narrower
  * target[+]
    * code = #M152.16 "Neuroblastoma - Paediatric, Multi-target NGS panel - structural variant (17q, ALK, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M152.17 "Neuroblastoma - Paediatric, Multi-target NGS panel - copy number variant (MYCN, ALK, 17q, 11q, 1p36)"
    * equivalence = #narrower
  * target[+]
    * code = #M152.18 "Neuroblastoma - Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M152.19 "Neuroblastoma - Paediatric, TERT promoter rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.2 "Neuroblastoma - Paediatric, Multi-target NGS panel - small variant (ALK, ATRX, FGFR1, MYCN, NRAS, PHOX2B, TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M152.3 "Neuroblastoma - Paediatric, ALK seq"
    * equivalence = #narrower
  * target[+]
    * code = #M152.4 "Neuroblastoma - Paediatric, FGFR1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M152.5 "Neuroblastoma - Paediatric, PHOX2B seq"
    * equivalence = #narrower
  * target[+]
    * code = #M152.6 "Neuroblastoma - Paediatric, TP53 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M152.7 "Neuroblastoma - Paediatric, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.8 "Neuroblastoma - Paediatric, ALK copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M152.9 "Neuroblastoma - Paediatric, 17q copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M153 "Nodular Brain Tumour"
  * target[+]
    * code = #M153.1 "Nodular Brain Tumour, Paediatric, Multi-target NGS panel, small variant (SMO)"
    * equivalence = #narrower
  * target[+]
    * code = #M153.2 "Nodular Brain Tumour, Paediatric, SMO seq"
    * equivalence = #narrower
  * target[+]
    * code = #M153.3 "Nodular Brain Tumour, Paediatric, SMO copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M153.4 "Nodular Brain Tumour, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M153.5 "Nodular Brain Tumour, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M153.6 "Nodular Brain Tumour, Paediatric, Multi-target NGS panel, copy number variant (SMO)"
    * equivalence = #narrower
  * target[+]
    * code = #M153.7 "Nodular Brain Tumour, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M155 "Oligoastrocytoma"
  * target[+]
    * code = #M155.1 "Oligoastrocytoma, Paediatric, Multi-target NGS panel, small variant (KIT)"
    * equivalence = #narrower
  * target[+]
    * code = #M155.2 "Oligoastrocytoma, Paediatric, KIT copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M155.3 "Oligoastrocytoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M155.4 "Oligoastrocytoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M155.5 "Oligoastrocytoma, Paediatric, Multi-target NGS panel, copy number variant (KIT)"
    * equivalence = #narrower
  * target[+]
    * code = #M155.6 "Oligoastrocytoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M156 "Oligodendroglioma"
  * target[+]
    * code = #M156.1 "Oligodendroglioma, Paediatric, Multi-target NGS panel, small variant (RB1, ATRX)"
    * equivalence = #narrower
  * target[+]
    * code = #M156.10 "Oligodendroglioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M156.2 "Oligodendroglioma, Paediatric, ATRX seq"
    * equivalence = #narrower
  * target[+]
    * code = #M156.3 "Oligodendroglioma, Paediatric, RB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M156.4 "Oligodendroglioma, Paediatric, Multi-target NGS panel, copy number variant (1p19q, RB1, ATRX)"
    * equivalence = #narrower
  * target[+]
    * code = #M156.5 "Oligodendroglioma, Paediatric, 1p19q codel FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M156.6 "Oligodendroglioma, Paediatric, RB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M156.7 "Oligodendroglioma, Paediatric, ATRX copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M156.8 "Oligodendroglioma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M156.9 "Oligodendroglioma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M157 "Thyroid Papillary Carcinoma - Paediatric"
  * target[+]
    * code = #M157.1 "Thyroid Papillary Carcinoma - Paediatric, Multi-target NGS panel - small variant (RET)"
    * equivalence = #narrower
  * target[+]
    * code = #M157.2 "Thyroid Papillary Carcinoma - Paediatric, RET seq"
    * equivalence = #narrower
  * target[+]
    * code = #M157.3 "Thyroid Papillary Carcinoma - Paediatric, Multi-target NGS panel - structural variant (RET, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M157.4 "Thyroid Papillary Carcinoma - Paediatric, RET rearrangement FISH/RT-PC"
    * equivalence = #narrower
  * target[+]
    * code = #M157.5 "Thyroid Papillary Carcinoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M158 "Pilocytic Astrocytoma"
  * target[+]
    * code = #M158.1 "Pilocytic Astrocytoma, Paediatric, Multi-target NGS panel, small variant (RAF1)"
    * equivalence = #narrower
  * target[+]
    * code = #M158.2 "Pilocytic Astrocytoma, Paediatric, RAF1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M158.3 "Pilocytic Astrocytoma, Paediatric, RAF1-SRGAP3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M158.4 "Pilocytic Astrocytoma, Paediatric, RAF1-NF1A FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M158.5 "Pilocytic Astrocytoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M158.6 "Pilocytic Astrocytoma, Paediatric, Multi-target NGS panel, structural variant (RAF1-SRGAP3, RAF1-NF1A, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M158.7 "Pilocytic Astrocytoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M159 "Pituitary Blastoma"
  * target[+]
    * code = #M159.1 "Pituitary Blastoma, Paediatric, Multi-target NGS panel, small variant (DICER1)"
    * equivalence = #narrower
  * target[+]
    * code = #M159.2 "Pituitary Blastoma, Paediatric, DICER1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M159.3 "Pituitary Blastoma, Paediatric, DICER1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M159.4 "Pituitary Blastoma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M159.5 "Pituitary Blastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M159.6 "Pituitary Blastoma, Paediatric, Multi-target NGS panel, copy number variant (DICER1)"
    * equivalence = #narrower
  * target[+]
    * code = #M159.7 "Pituitary Blastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M160 "Pleomorphic Xanthoastrocytoma"
  * target[+]
    * code = #M160.1 "Pleomorphic Xanthoastrocytoma, Paediatric, Multi-target NGS panel, small variant (BRAF, H3-3A)"
    * equivalence = #narrower
  * target[+]
    * code = #M160.10 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.11 "Pleomorphic Xanthoastrocytoma, Paediatric, H3-3A seq"
    * equivalence = #narrower
  * target[+]
    * code = #M160.12 "Pleomorphic Xanthoastrocytoma, Paediatric, KIAA1549 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M160.13 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M160.14 "Pleomorphic Xanthoastrocytoma, Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M160.15 "Pleomorphic Xanthoastrocytoma, Paediatric, Multi-target NGS panel, copy number variant (KIAA1549)"
    * equivalence = #narrower
  * target[+]
    * code = #M160.16 "Pleomorphic Xanthoastrocytoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M160.2 "Pleomorphic Xanthoastrocytoma, Paediatric, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M160.3 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.4 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.5 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.6 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.7 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.8 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M160.9 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M161 "Pleuropulmonary Blastoma - Paediatric"
  * target[+]
    * code = #M161.1 "Pleuropulmonary Blastoma - Paediatric, Multi-target NGS panel - small variant (DICER1)"
    * equivalence = #narrower
  * target[+]
    * code = #M161.2 "Pleuropulmonary Blastoma - Paediatric, DICER1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M161.3 "Pleuropulmonary Blastoma - Paediatric, DICER1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M161.4 "Pleuropulmonary Blastoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M161.5 "Pleuropulmonary Blastoma - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M161.6 "Pleuropulmonary Blastoma - Paediatric, Multi-target NGS panel - copy number variant (DICER1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M162 "Primitive Neuroectodermal Tumours"
  * target[+]
    * code = #M162.1 "Primitive Neuroectodermal Tumours, Paediatric, Multi-target NGS panel, small variant (MSH6, PMS2, PTEN)"
    * equivalence = #narrower
  * target[+]
    * code = #M162.10 "Primitive Neuroectodermal Tumours, Paediatric, Multi-target NGS panel, copy number variant (MYC, MSH6, PTEN)"
    * equivalence = #narrower
  * target[+]
    * code = #M162.11 "Primitive Neuroectodermal Tumours, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M162.2 "Primitive Neuroectodermal Tumours, Paediatric, MSH6 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M162.3 "Primitive Neuroectodermal Tumours, Paediatric, PMS2 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M162.4 "Primitive Neuroectodermal Tumours, Paediatric, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M162.5 "Primitive Neuroectodermal Tumours, Paediatric, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M162.6 "Primitive Neuroectodermal Tumours, Paediatric, MSH6 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M162.7 "Primitive Neuroectodermal Tumours, Paediatric, PTEN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M162.8 "Primitive Neuroectodermal Tumours, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M162.9 "Primitive Neuroectodermal Tumours, Paediatric, Multi-target NGS panel, structural variant (MYC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M165 "Renal Tumours - Paediatric"
  * target[+]
    * code = #M165.1 "Renal Tumours - Paediatric, Multi-target NGS panel - small variant (CTNNB1, DAXX, ATRX)"
    * equivalence = #narrower
  * target[+]
    * code = #M165.2 "Renal Tumours - Paediatric, ATRX seq"
    * equivalence = #narrower
  * target[+]
    * code = #M165.3 "Renal Tumours - Paediatric, CTNNB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M165.4 "Renal Tumours - Paediatric, DAXX seq"
    * equivalence = #narrower
  * target[+]
    * code = #M165.5 "Renal Tumours - Paediatric, ATRX copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M165.6 "Renal Tumours - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M165.7 "Renal Tumours - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M165.8 "Renal Tumours - Paediatric, Multi-target NGS panel - copy number variant (ATRX)"
    * equivalence = #narrower
* group.element[+]
  * code = #M166 "Retinoblastoma - Paediatric"
  * target[+]
    * code = #M166.1 "Retinoblastoma - Paediatric, Multi-target NGS panel - small variant (RB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M166.2 "Retinoblastoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M166.3 "Retinoblastoma - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M166.4 "Retinoblastoma - Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M167 "Rhabdoid Tumours - Paediatric"
  * target[+]
    * code = #M167.1 "Rhabdoid Tumours - Paediatric, Multi-target NGS panel - small variant (SMARCB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M167.2 "Rhabdoid Tumours - Paediatric, SMARCB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M167.3 "Rhabdoid Tumours - Paediatric, SMARCB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M167.4 "Rhabdoid Tumours - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M167.5 "Rhabdoid Tumours - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M167.6 "Rhabdoid Tumours - Paediatric, Multi-target NGS panel - copy number variant (SMARCB1)"
    * equivalence = #narrower
* group.element[+]
  * code = #M168 "Rosette-Forming Glioneuronal Tumour"
  * target[+]
    * code = #M168.1 "Rosette-Forming Glioneuronal Tumour, Paediatric, Multi-target NGS panel, small variant (PIK3CA, FGFR1)"
    * equivalence = #narrower
  * target[+]
    * code = #M168.2 "Rosette-Forming Glioneuronal Tumour, Paediatric, FGFR1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M168.3 "Rosette-Forming Glioneuronal Tumour, Paediatric, FGFR1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M168.4 "Rosette-Forming Glioneuronal Tumour, Paediatric, FGFR1 ITD FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M168.5 "Rosette-Forming Glioneuronal Tumour, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M168.6 "Rosette-Forming Glioneuronal Tumour, Paediatric, Multi-target NGS panel, structural variant (FGFR1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M168.7 "Rosette-Forming Glioneuronal Tumour, Paediatric, Multi-target NGS panel, copy number variant (FGFR1 ITD)"
    * equivalence = #narrower
  * target[+]
    * code = #M168.8 "Rosette-Forming Glioneuronal Tumour, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M169 "Secondary Glioblastoma"
  * target[+]
    * code = #M169.1 "Secondary Glioblastoma, Paediatric, Multi-target NGS panel, small variant (IDH1, IDH2)"
    * equivalence = #narrower
  * target[+]
    * code = #M169.2 "Secondary Glioblastoma, Paediatric, IDH1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M169.3 "Secondary Glioblastoma, Paediatric, IDH2 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M169.4 "Secondary Glioblastoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M169.5 "Secondary Glioblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M169.6 "Secondary Glioblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M170 "SHH Medulloblastoma"
  * target[+]
    * code = #M170.1 "SHH Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (SMO, DDX3X)"
    * equivalence = #narrower
  * target[+]
    * code = #M170.2 "SHH Medulloblastoma, Paediatric, SMO seq"
    * equivalence = #narrower
  * target[+]
    * code = #M170.3 "SHH Medulloblastoma, Paediatric, DDX3X seq"
    * equivalence = #narrower
  * target[+]
    * code = #M170.4 "SHH Medulloblastoma, Paediatric, SMO copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M170.5 "SHH Medulloblastoma, Paediatric, DDX3X copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M170.6 "SHH Medulloblastoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M170.7 "SHH Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M170.8 "SHH Medulloblastoma, Paediatric, Multi-target NGS panel, copy number variant (SMO, DDX3X)"
    * equivalence = #narrower
  * target[+]
    * code = #M170.9 "SHH Medulloblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M171 "SHH Medulloblastoma"
  * target[+]
    * code = #M171.1 "SHH Medulloblastoma, TP53 WT, Paediatric, Multi-target NGS panel, small variant (SUFU, TERT promoter, PTCH1)"
    * equivalence = #narrower
  * target[+]
    * code = #M171.10 "SHH Medulloblastoma, TP53 WT, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M171.2 "SHH Medulloblastoma, TP53 WT, Paediatric, PTCH1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M171.3 "SHH Medulloblastoma, TP53 WT, Paediatric, SUFU seq"
    * equivalence = #narrower
  * target[+]
    * code = #M171.4 "SHH Medulloblastoma, TP53 WT, Paediatric, TERT promoter seq"
    * equivalence = #narrower
  * target[+]
    * code = #M171.5 "SHH Medulloblastoma, TP53 WT, Paediatric, PTCH1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M171.6 "SHH Medulloblastoma, TP53 WT, Paediatric, TERT copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M171.7 "SHH Medulloblastoma, TP53 WT, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M171.8 "SHH Medulloblastoma, TP53 WT, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M171.9 "SHH Medulloblastoma, TP53 WT, Paediatric, Multi-target NGS panel, copy number variant (PTCH1, TERT)"
    * equivalence = #narrower
* group.element[+]
  * code = #M172 "SHH Medulloblastoma"
  * target[+]
    * code = #M172.1 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, Multi-target NGS panel, small variant (TP53, MYCN)"
    * equivalence = #narrower
  * target[+]
    * code = #M172.2 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, TP53 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M172.3 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, MYCN seq"
    * equivalence = #narrower
  * target[+]
    * code = #M172.4 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M172.5 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M172.6 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M172.7 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M172.8 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, Multi-target NGS panel, copy number variant (TP53, MYCN)"
    * equivalence = #narrower
  * target[+]
    * code = #M172.9 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M173 "t(6;11) Translocation-Associated Renal Cell Carcinoma - Paediatric"
  * target[+]
    * code = #M173.1 "t(6;11) Translocation-Associated Renal Cell Carcinoma - Paediatric, TFEB-MALAT1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M173.2 "t(6;11) Translocation-Associated Renal Cell Carcinoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M173.3 "t(6;11) Translocation-Associated Renal Cell Carcinoma - Paediatric, Multi-target NGS panel - structural variant (TFEB-MALAT1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M174 "Testicular - Paediatric"
  * target[+]
    * code = #M174.1 "Testicular - Paediatric, Multi-target NGS panel - small variant (PRKAR1A)"
    * equivalence = #narrower
  * target[+]
    * code = #M174.2 "Testicular - Paediatric, PRKAR1A seq"
    * equivalence = #narrower
  * target[+]
    * code = #M174.3 "Testicular - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M174.4 "Testicular - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M178 "Wilms Tumours - Paediatric"
  * target[+]
    * code = #M178.1 "Wilms Tumours - Paediatric, Multi-target NGS panel - small variant (DROSHA)"
    * equivalence = #narrower
  * target[+]
    * code = #M178.2 "Wilms Tumours - Paediatric, DROSHA seq"
    * equivalence = #narrower
  * target[+]
    * code = #M178.3 "Wilms Tumours - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M178.4 "Wilms Tumours - Paediatric, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M179 "WNT Medulloblastoma"
  * target[+]
    * code = #M179.1 "WNT Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (DDX3X, CTNNB1, SMARCA4, TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M179.10 "WNT Medulloblastoma, Paediatric, Multi-target NGS panel, copy number variant (SMARCA4, TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M179.11 "WNT Medulloblastoma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M179.2 "WNT Medulloblastoma, Paediatric, DDX3X seq"
    * equivalence = #narrower
  * target[+]
    * code = #M179.3 "WNT Medulloblastoma, Paediatric, CTNNB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M179.4 "WNT Medulloblastoma, Paediatric, SMARCA4 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M179.5 "WNT Medulloblastoma, Paediatric, TP53 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M179.6 "WNT Medulloblastoma, Paediatric, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M179.7 "WNT Medulloblastoma, Paediatric, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M179.8 "WNT Medulloblastoma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M179.9 "WNT Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M180 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric"
  * target[+]
    * code = #M180.1 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, Multi-target NGS panel - small variant (TFE3)"
    * equivalence = #narrower
  * target[+]
    * code = #M180.2 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, TFE3 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M180.3 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, TFE3-ASPSCR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M180.4 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, TFE3-MITF FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M180.5 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, TFE3-PRCC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M180.6 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M180.7 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric, Multi-target NGS panel - structural variant (TFE3-ASPSCR1, TFE3-MITF,  TFE3-PRCC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M181 "Hairy Cell Leukaemia"
  * target[+]
    * code = #M181.1 "Hairy Cell Leukaemia, Non-Classical Variant, Multi-target NGS panel, small variant (MAP2K1)"
    * equivalence = #narrower
  * target[+]
    * code = #M181.4 "Hairy Cell Leukaemia, Non-Classical Variant, Ig gene hypermutation detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M181.5 "Hairy Cell Leukaemia, Non-Classical Variant, Ig gene hypermutation detection NGS"
    * equivalence = #narrower
* group.element[+]
  * code = #M182 "ALK Positive Anaplastic Large Cell Lymphoma"
  * target[+]
    * code = #M182.1 "ALK Positive Anaplastic Large Cell Lymphoma, t(2;5)(p23;q35) ALK-NPM1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M182.2 "ALK Positive Anaplastic Large Cell Lymphoma, ALK rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M182.3 "ALK Positive Anaplastic Large Cell Lymphoma, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M182.4 "ALK Positive Anaplastic Large Cell Lymphoma, Multi-target NGS panel, structural variant (ALK-NPM1, other ALK rearrangements)"
    * equivalence = #narrower
  * target[+]
    * code = #M182.5 "ALK Positive Anaplastic Large Cell Lymphoma, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M182.6 "ALK Positive Anaplastic Large Cell Lymphoma, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M183 "Diffuse Midline Glioma"
  * target[+]
    * code = #M183.1 "Diffuse Midline Glioma, Paediatric, Multi-target NGS panel, small variant (H3-3A, NF1, TERT promoter)"
    * equivalence = #narrower
  * target[+]
    * code = #M183.2 "Diffuse Midline Glioma, Paediatric, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M183.3 "Diffuse Midline Glioma, Paediatric, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M183.4 "Diffuse Midline Glioma, Paediatric, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M183.5 "Diffuse Midline Glioma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M183.6 "Diffuse Midline Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M183.7 "Diffuse Midline Glioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M183.8 "Diffuse Midline Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q, MYC, MYCN)"
    * equivalence = #narrower
  * target[+]
    * code = #M183.9 "Diffuse Midline Glioma, Paediatric, Multi-target NGS panel, structural variant (MYC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M184 "Glioma"
  * target[+]
    * code = #M184.1 "Glioma, Paediatric, Multi-target NGS panel, small variant (H3-3B, H3C2, H3C3, H3C14, IDH1, IDH2, TP53, VHL)"
    * equivalence = #narrower
  * target[+]
    * code = #M184.2 "Glioma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M184.3 "Glioma, Paediatric, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M184.4 "Glioma, Paediatric, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M184.5 "Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M184.6 "Glioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M184.7 "Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M184.8 "Glioma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M185 "High Grade Glioma"
  * target[+]
    * code = #M185.1 "High Grade Glioma, Paediatric, Multi-target NGS panel, small variant (CDKN2B)"
    * equivalence = #narrower
  * target[+]
    * code = #M185.2 "High Grade Glioma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M185.3 "High Grade Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M185.4 "High Grade Glioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M185.5 "High Grade Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
* group.element[+]
  * code = #M186 "Low Grade Glioma"
  * target[+]
    * code = #M186.1 "Low Grade Glioma, Paediatric, Multi-target NGS panel, small variant (TSC1, TSC2, IDH1, IDH2, FGFR1)"
    * equivalence = #narrower
  * target[+]
    * code = #M186.2 "Low Grade Glioma, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M186.3 "Low Grade Glioma, Paediatric, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M186.4 "Low Grade Glioma, Paediatric, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M186.5 "Low Grade Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M186.6 "Low Grade Glioma, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M186.7 "Low Grade Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q)"
    * equivalence = #narrower
  * target[+]
    * code = #M186.8 "Low Grade Glioma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M187 "Uveal melanoma"
  * target[+]
    * code = #M187.1 "Uveal melanoma, 1p, 3, 6, 8 MLPA"
    * equivalence = #narrower
  * target[+]
    * code = #M187.2 "Uveal melanoma, BRAF hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M187.3 "Uveal melanoma, Multi-target NGS panel - small variant (BRAF, NRAS, NF1)"
    * equivalence = #narrower
  * target[+]
    * code = #M187.4 "Uveal melanoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M189 "Brain Tumour"
  * target[+]
    * code = #M189.1 "Brain Tumour, No Further Morphological Classification, Paediatric, Multi-target NGS panel, small variant (IDH1, IDH2, BRAF, H3C2, H3C3, H3C14, H3-3A, H3-3B, TERT promoter, TP53, VHL, YAP1, SMARCA4, SMARCB1, DDX3X, CTNNB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M189.10 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M189.11 "Brain Tumour, No Further Morphological Classification, Paediatric, SNP Array"
    * equivalence = #narrower
  * target[+]
    * code = #M189.12 "Brain Tumour, No Further Morphological Classification, Paediatric, C19MC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M189.13 "Brain Tumour, No Further Morphological Classification, Paediatric, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M189.14 "Brain Tumour, No Further Morphological Classification, Paediatric, SMARCB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M189.15 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M189.16 "Brain Tumour, No Further Morphological Classification, Paediatric, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M189.17 "Brain Tumour, No Further Morphological Classification, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M189.18 "Brain Tumour, No Further Morphological Classification, Paediatric, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M189.19 "Brain Tumour, No Further Morphological Classification, Paediatric, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M189.2 "Brain Tumour, No Further Morphological Classification, Paediatric, Multi-target NGS panel, structural variant (CIC, BCOR, BCOR-CCNB3, C11orf95-RELA, YAP1-C11orf95, YAP1-TFE3, EWSR1, MN1, RELA, YAP1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M189.20 "Brain Tumour, No Further Morphological Classification, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M189.21 "Brain Tumour, No Further Morphological Classification, Paediatric, Multi-target NGS panel, copy number variant  (C19MC, SMARCA4, SMARCB1, YAP1)"
    * equivalence = #narrower
  * target[+]
    * code = #M189.3 "Brain Tumour, No Further Morphological Classification, Paediatric, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M189.4 "Brain Tumour, No Further Morphological Classification, Paediatric, C11orf95-RELA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M189.5 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M189.6 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1-TFE3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M189.7 "Brain Tumour, No Further Morphological Classification, Paediatric, EWSR1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M189.8 "Brain Tumour, No Further Morphological Classification, Paediatric, MN1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M189.9 "Brain Tumour, No Further Morphological Classification, Paediatric, RELA rearrangement FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M190 "Embryonal Tumour Differential"
  * target[+]
    * code = #M190.1 "Embryonal Tumour Differential, Adult and Paediatric, Multi-target NGS panel, small variant (CDKN2A, DICER1, RB1, YAP1, SMARCA4, SMARCB1, MSH6, PMS2, PTEN, ATRX)"
    * equivalence = #narrower
  * target[+]
    * code = #M190.10 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.11 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.12 "Embryonal Tumour Differential, Adult and Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.13 "Embryonal Tumour Differential, Adult and Paediatric, C11orf95-RELA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.14 "Embryonal Tumour Differential, Adult and Paediatric, RELA rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.15 "Embryonal Tumour Differential, Adult and Paediatric, TTYH1-C19MC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.16 "Embryonal Tumour Differential, Adult and Paediatric, YAP1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.17 "Embryonal Tumour Differential, Adult and Paediatric, YAP1-C11orf95 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.18 "Embryonal Tumour Differential, Adult and Paediatric, YAP1-TFE3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.19 "Embryonal Tumour Differential, Adult and Paediatric, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.2 "Embryonal Tumour Differential, Adult and Paediatric, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M190.20 "Embryonal Tumour Differential, Adult and Paediatric, MN1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.21 "Embryonal Tumour Differential, Adult and Paediatric, SNP Array"
    * equivalence = #narrower
  * target[+]
    * code = #M190.22 "Embryonal Tumour Differential, Adult and Paediatric, C19MC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.23 "Embryonal Tumour Differential, Adult and Paediatric, DICER1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.24 "Embryonal Tumour Differential, Adult and Paediatric, MSH6 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.25 "Embryonal Tumour Differential, Adult and Paediatric, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.26 "Embryonal Tumour Differential, Adult and Paediatric, PTEN (10q23) copy number FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.27 "Embryonal Tumour Differential, Adult and Paediatric, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.28 "Embryonal Tumour Differential, Adult and Paediatric, SMARCB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M190.3 "Embryonal Tumour Differential, Adult and Paediatric, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.30 "Embryonal Tumour Differential, Adult and Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M190.31 "Embryonal Tumour Differential, Adult and Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M190.32 "Embryonal Tumour Differential, Adult and Paediatric, Multi-target NGS panel, copy number variant  (C19MC, DICER1, MSH6, MYC, PTEN, SMARCA4, SMARCB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M190.4 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.5 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.6 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.7 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.8 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-FRX1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M190.9 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M191 "Low Grade Intrinsic Brain Tumour Differential"
  * target[+]
    * code = #M191.1 "Low Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3-3B, H3C2, H3C3, H3C14, BRAF, TERT promoter, CDKN2B, TP53, VHL, NF1)"
    * equivalence = #narrower
  * target[+]
    * code = #M191.10 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M191.11 "Low Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, copy number variant  (1p, 19q, EGFR, CDKN2A, PTEN)"
    * equivalence = #narrower
  * target[+]
    * code = #M191.12 "Low Grade Intrinsic Brain Tumour Differential, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.13 "Low Grade Intrinsic Brain Tumour Differential, Adult, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M191.14 "Low Grade Intrinsic Brain Tumour Differential, Adult, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M191.15 "Low Grade Intrinsic Brain Tumour Differential, Adult, EGFRvIII RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.16 "Low Grade Intrinsic Brain Tumour Differential, Adult, PTEN (10q23) copy number FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.17 "Low Grade Intrinsic Brain Tumour Differential, Adult, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M191.18 "Low Grade Intrinsic Brain Tumour Differential, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M191.19 "Low Grade Intrinsic Brain Tumour Differential, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M191.2 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.20 "Low Grade Intrinsic Brain Tumour Differential, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M191.21 "Low Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M191.22 "Low Grade Intrinsic Brain Tumour Differential, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M191.3 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.4 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.5 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.6 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.7 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.8 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M191.9 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M192 "High Grade Intrinsic Brain Tumour Differential"
  * target[+]
    * code = #M192.1 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX,  H3-3A, H3-3B, H3C2, H3C3,  H3C14, BRAF, TERT promoter, CDKN2B, TP53, VHL, NF1)"
    * equivalence = #narrower
  * target[+]
    * code = #M192.10 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M192.11 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, copy number variant (EGFR)"
    * equivalence = #narrower
  * target[+]
    * code = #M192.12 "High Grade Intrinsic Brain Tumour Differential, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.13 "High Grade Intrinsic Brain Tumour Differential, Adult, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M192.14 "High Grade Intrinsic Brain Tumour Differential, Adult, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M192.15 "High Grade Intrinsic Brain Tumour Differential, Adult, EGFRvIII RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.16 "High Grade Intrinsic Brain Tumour Differential, Adult, PTEN (10q23) copy number FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.17 "High Grade Intrinsic Brain Tumour Differential, Adult, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M192.18 "High Grade Intrinsic Brain Tumour Differential, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M192.19 "High Grade Intrinsic Brain Tumour Differential, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M192.2 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.20 "High Grade Intrinsic Brain Tumour Differential, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M192.21 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M192.22 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, copy number variant  (1p, 19q, EGFR, CDKN2A, PTEN)"
    * equivalence = #narrower
  * target[+]
    * code = #M192.23 "High Grade Intrinsic Brain Tumour Differential, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M192.3 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.4 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.5 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.6 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.7 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.8 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M192.9 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M193 "Unable To Grade Intrinsic Brain Tumour"
  * target[+]
    * code = #M193.1 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3-3B, H3C2, H3C3, H3C14, BRAF, TERT promoter, CDKN2B, TP53, VHL, NF1)"
    * equivalence = #narrower
  * target[+]
    * code = #M193.10 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M193.11 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, copy number variant (EGFR)"
    * equivalence = #narrower
  * target[+]
    * code = #M193.12 "Unable To Grade Intrinsic Brain Tumour, Adult, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.13 "Unable To Grade Intrinsic Brain Tumour, Adult, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M193.14 "Unable To Grade Intrinsic Brain Tumour, Adult, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M193.15 "Unable To Grade Intrinsic Brain Tumour, Adult, EGFRvIII RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.16 "Unable To Grade Intrinsic Brain Tumour, Adult, PTEN (10q23) copy number FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.17 "Unable To Grade Intrinsic Brain Tumour, Adult, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M193.18 "Unable To Grade Intrinsic Brain Tumour, Adult, IDH1 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M193.19 "Unable To Grade Intrinsic Brain Tumour, Adult, IDH2 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M193.2 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.20 "Unable To Grade Intrinsic Brain Tumour, Adult, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M193.21 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M193.22 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, copy number variant  (1p, 19q, EGFR, CDKN2A, PTEN)"
    * equivalence = #narrower
  * target[+]
    * code = #M193.23 "Unable To Grade Intrinsic Brain Tumour, Adult, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M193.3 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.4 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.5 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.6 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-FXR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.7 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.8 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M193.9 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M194 "Medulloblastoma all Subtypes"
  * target[+]
    * code = #M194.1 "Medulloblastoma all Subtypes, Multi-target NGS panel, small variant (ALK, BCOR, CTNNB1, DDX3X, DDX3X, EZH2, MYCN,  PTCH1, PTCH2, PTEN, SMARCA4, SMO, SUFU, TERT promoter, TP53,  YAP1)"
    * equivalence = #narrower
  * target[+]
    * code = #M194.10 "Medulloblastoma all Subtypes, BCOR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.11 "Medulloblastoma all Subtypes, C19MC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.12 "Medulloblastoma all Subtypes, DDX3X copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.13 "Medulloblastoma all Subtypes, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.14 "Medulloblastoma all Subtypes, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.15 "Medulloblastoma all Subtypes, PTCH1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.16 "Medulloblastoma all Subtypes, PTEN (10q23) copy number FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M194.17 "Medulloblastoma all Subtypes, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.18 "Medulloblastoma all Subtypes, SMO copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.19 "Medulloblastoma all Subtypes, TERT copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.2 "Medulloblastoma all Subtypes, ALK rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.20 "Medulloblastoma all Subtypes, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.21 "Medulloblastoma all Subtypes, YAP1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.22 "Medulloblastoma all Subtypes, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M194.23 "Medulloblastoma all Subtypes, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M194.24 "Medulloblastoma all Subtypes, Multi-target NGS panel, structural variant (ALK, BCOR, MYC, PVT1-MYC, YAP1-C11orf95, YAP1-TFE3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M194.25 "Medulloblastoma all Subtypes, Multi-target NGS panel, copy number variant  (ALK, BCOR, C19MC, DDX3X, MYC, MYCN, PTCH1, PTEN, SMARCA4, SMO, TERT, TP53, YAP1)"
    * equivalence = #narrower
  * target[+]
    * code = #M194.3 "Medulloblastoma all Subtypes, BCOR rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.4 "Medulloblastoma all Subtypes, MYC rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M194.5 "Medulloblastoma all Subtypes, PVT1-MYC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M194.6 "Medulloblastoma all Subtypes, YAP1-C11orf95 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M194.7 "Medulloblastoma all Subtypes, YAP1-TFE3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M194.8 "Medulloblastoma all Subtypes, SNP Array"
    * equivalence = #narrower
  * target[+]
    * code = #M194.9 "Medulloblastoma all Subtypes, ALK copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M195 "Craniopharyngioma"
  * target[+]
    * code = #M195.1 "Craniopharyngioma, Adult and Paediatric, Multi-target NGS panel, small variant (BRAF, CTNNB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M195.2 "Craniopharyngioma, Adult and Paediatric, MGMT promoter hyperMethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M195.3 "Craniopharyngioma, Adult and Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M195.4 "Craniopharyngioma, Adult and Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M195.5 "Craniopharyngioma, Adult and Paediatric, DNA Methylation"
    * equivalence = #narrower
* group.element[+]
  * code = #M196 "Bone Forming Soft Tissue Tumour Differential"
  * target[+]
    * code = #M196.1 "Bone Forming Soft Tissue Tumour Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M196.2 "Bone Forming Soft Tissue Tumour Differential, USP6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M196.3 "Bone Forming Soft Tissue Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M196.4 "Bone Forming Soft Tissue Tumour Differential, Multi-target NGS panel - structural variant (USP6, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M196.5 "Bone Forming Soft Tissue Tumour Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M197 "Round Cell Sarcoma of Soft Tissue Differential"
  * target[+]
    * code = #M197.1 "Round Cell Sarcoma of Soft Tissue Differential, Multi-target NGS panel - structural variant (BCOR, CIC, DDIT3, EWSR1, FOXO1, WT1, BCOR-CCNB3, HEY1-NCOA2, PAX3-FOXO1, PAX7-FOXO1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M197.10 "Round Cell Sarcoma of Soft Tissue Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M197.2 "Round Cell Sarcoma of Soft Tissue Differential, DDIT3 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.3 "Round Cell Sarcoma of Soft Tissue Differential, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.4 "Round Cell Sarcoma of Soft Tissue Differential, FOXO1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.5 "Round Cell Sarcoma of Soft Tissue Differential, WT1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.6 "Round Cell Sarcoma of Soft Tissue Differential, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.7 "Round Cell Sarcoma of Soft Tissue Differential, HEY1-NCOA2 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.8 "Round Cell Sarcoma of Soft Tissue Differential, PAX3-FOXO1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M197.9 "Round Cell Sarcoma of Soft Tissue Differential, PAX7-FOXO1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M198 "Vascular Soft Tissue Tumour Differential"
  * target[+]
    * code = #M198.1 "Vascular Soft Tissue Tumour Differential, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M198.2 "Vascular Soft Tissue Tumour Differential, SERPINE1-FOSB FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M198.3 "Vascular Soft Tissue Tumour Differential, WWTR1-CAMTA1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M198.4 "Vascular Soft Tissue Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M198.5 "Vascular Soft Tissue Tumour Differential, Multi-target NGS panel - structural variant (SERPINE1-FOSB, WWTR1-CAMTA1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M198.6 "Vascular Soft Tissue Tumour Differential, Multi-target NGS panel - copy number variant (MYC)"
    * equivalence = #narrower
* group.element[+]
  * code = #M199 "Spindle Cell Soft Tissue Tumour Differential"
  * target[+]
    * code = #M199.1 "Spindle Cell Soft Tissue Tumour Differential, Multi-target NGS panel - small variant (APC, CTNNB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M199.10 "Spindle Cell Soft Tissue Tumour Differential, TPM4-ALK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M199.11 "Spindle Cell Soft Tissue Tumour Differential, ETV6-NTRK3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M199.12 "Spindle Cell Soft Tissue Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M199.13 "Spindle Cell Soft Tissue Tumour Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
  * target[+]
    * code = #M199.2 "Spindle Cell Soft Tissue Tumour Differential, Multi-target NGS panel - structural variant (ALK, BCOR, CIC, EWSR1, FUS, SS18, USP6, COL1A1-PDGFB, TPM3-ALK, TPM4-ALK, ETV6-NTRK3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M199.3 "Spindle Cell Soft Tissue Tumour Differential, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M199.4 "Spindle Cell Soft Tissue Tumour Differential, FUS rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M199.5 "Spindle Cell Soft Tissue Tumour Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M199.6 "Spindle Cell Soft Tissue Tumour Differential, SS18 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M199.7 "Spindle Cell Soft Tissue Tumour Differential, USP6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M199.8 "Spindle Cell Soft Tissue Tumour Differential, COL1A1-PDGFB rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M199.9 "Spindle Cell Soft Tissue Tumour Differential, TPM3-ALK FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M200 "Myxoid Soft Tissue Tumour Differential"
  * target[+]
    * code = #M200.1 "Myxoid Soft Tissue Tumour Differential, Multi-target NGS panel - structural variant (BCOR, DDIT3, FUS, NR4A3, TGFBR3-OGA, BCOR-CCNB3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M200.2 "Myxoid Soft Tissue Tumour Differential, DDIT3 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M200.3 "Myxoid Soft Tissue Tumour Differential, FUS rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M200.4 "Myxoid Soft Tissue Tumour Differential, NR4A3 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M200.5 "Myxoid Soft Tissue Tumour Differential, TGFBR3-OGA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M200.6 "Myxoid Soft Tissue Tumour Differential, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M200.7 "Myxoid Soft Tissue Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M201 "Adipocytic Soft Tissue Tumour Differential"
  * target[+]
    * code = #M201.1 "Adipocytic Soft Tissue Tumour Differential, DDIT3 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M201.2 "Adipocytic Soft Tissue Tumour Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M201.3 "Adipocytic Soft Tissue Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M201.4 "Adipocytic Soft Tissue Tumour Differential, Multi-target NGS panel - structural variant (DDIT3, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M201.5 "Adipocytic Soft Tissue Tumour Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M202 "Epithelioid Soft Tissue Tumour Differential"
  * target[+]
    * code = #M202.1 "Epithelioid Soft Tissue Tumour Differential, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M202.2 "Epithelioid Soft Tissue Tumour Differential, FUS rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M202.3 "Epithelioid Soft Tissue Tumour Differential, SS18 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M202.4 "Epithelioid Soft Tissue Tumour Differential, TFE3 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M202.5 "Epithelioid Soft Tissue Tumour Differential, WWTR1-CAMTA1  RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M202.6 "Epithelioid Soft Tissue Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M202.7 "Epithelioid Soft Tissue Tumour Differential, Multi-target NGS panel - structural variant (EWSR1, FUS, SS18, TFE3, WWTR1-CAMTA1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M203 "Uterine Sarcomas (Inc Endometrial)"
  * target[+]
    * code = #M203.1 "Uterine Sarcomas (Inc Endometrial), EPC1-PHF1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M203.2 "Uterine Sarcomas (Inc Endometrial), JAZF1-PHF1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M203.3 "Uterine Sarcomas (Inc Endometrial), JAZF1-SUZ12 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M203.4 "Uterine Sarcomas (Inc Endometrial), NUTM2B-YWHAE FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M203.5 "Uterine Sarcomas (Inc Endometrial), WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M203.6 "Uterine Sarcomas (Inc Endometrial), Multi-target NGS panel - structural variant (EPC1-PHF1, JAZF1-PHF1, JAZF1-SUZ12, NUTM2B-YWHAE, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M204 "Undifferentiated tumour"
  * target[+]
    * code = #M204.1 "Undifferentiated tumour, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M204.2 "Undifferentiated tumour, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M205 "Cartilage Forming Bone Tumour Differential"
  * target[+]
    * code = #M205.1 "Cartilage Forming Bone Tumour Differential, Multi-target NGS panel - small variant (H3-3A, H3-3B, IDH1, IDH2)"
    * equivalence = #narrower
  * target[+]
    * code = #M205.2 "Cartilage Forming Bone Tumour Differential, H3-3B hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M205.3 "Cartilage Forming Bone Tumour Differential, H3-3A seq"
    * equivalence = #narrower
  * target[+]
    * code = #M205.4 "Cartilage Forming Bone Tumour Differential, H3-3B seq"
    * equivalence = #narrower
  * target[+]
    * code = #M205.5 "Cartilage Forming Bone Tumour Differential, HEY1-NCOA2 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M205.6 "Cartilage Forming Bone Tumour Differential, SNP Array"
    * equivalence = #narrower
  * target[+]
    * code = #M205.7 "Cartilage Forming Bone Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M205.8 "Cartilage Forming Bone Tumour Differential, Multi-target NGS panel - structural variant (HEY1-NCOA2, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M206 "Bone Forming Bone Tumour Differential"
  * target[+]
    * code = #M206.1 "Bone Forming Bone Tumour Differential, Multi-target NGS panel - small variant (H3-3A, H3-3B)"
    * equivalence = #narrower
  * target[+]
    * code = #M206.2 "Bone Forming Bone Tumour Differential, H3-3B hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M206.3 "Bone Forming Bone Tumour Differential, H3-3A seq"
    * equivalence = #narrower
  * target[+]
    * code = #M206.4 "Bone Forming Bone Tumour Differential, H3-3B seq"
    * equivalence = #narrower
  * target[+]
    * code = #M206.5 "Bone Forming Bone Tumour Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M206.6 "Bone Forming Bone Tumour Differential, USP6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M206.7 "Bone Forming Bone Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M206.8 "Bone Forming Bone Tumour Differential, Multi-target NGS panel - structural variant (USP6, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M206.9 "Bone Forming Bone Tumour Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M207 "Osteoclast-Rich Bone Tumour Differential"
  * target[+]
    * code = #M207.1 "Osteoclast-Rich Bone Tumour Differential, Multi-target NGS panel - small variant (H3-3B)"
    * equivalence = #narrower
  * target[+]
    * code = #M207.2 "Osteoclast-Rich Bone Tumour Differential, H3-3B seq"
    * equivalence = #narrower
  * target[+]
    * code = #M207.3 "Osteoclast-Rich Bone Tumour Differential, H3-3B hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M207.4 "Osteoclast-Rich Bone Tumour Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M207.5 "Osteoclast-Rich Bone Tumour Differential, USP6 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M207.6 "Osteoclast-Rich Bone Tumour Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M207.7 "Osteoclast-Rich Bone Tumour Differential, Multi-target NGS panel - structural variant (USP6, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M207.8 "Osteoclast-Rich Bone Tumour Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M208 "Round Cell Sarcoma of Bone Differential"
  * target[+]
    * code = #M208.1 "Round Cell Sarcoma of Bone Differential, Multi-target NGS panel - structural variant (BCOR, CIC, EWSR1, WT1, BCOR-CCNB3, HEY1-NCOA2, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M208.2 "Round Cell Sarcoma of Bone Differential, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M208.3 "Round Cell Sarcoma of Bone Differential, WT1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M208.4 "Round Cell Sarcoma of Bone Differential, BCOR-CCNB3 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M208.5 "Round Cell Sarcoma of Bone Differential, HEY1-NCOA2 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M208.6 "Round Cell Sarcoma of Bone Differential, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M209 "Vascular Tumour of Bone Differential"
  * target[+]
    * code = #M209.1 "Vascular Tumour of Bone Differential, MYC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M209.2 "Vascular Tumour of Bone Differential, SERPINE1-FOSB FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M209.3 "Vascular Tumour of Bone Differential, WWTR1-CAMTA1 RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M209.4 "Vascular Tumour of Bone Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M209.5 "Vascular Tumour of Bone Differential, Multi-target NGS panel - structural variant (SERPINE1-FOSB, WWTR1-CAMTA1, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M209.6 "Vascular Tumour of Bone Differential, Multi-target NGS panel - copy number variant (MYC)"
    * equivalence = #narrower
* group.element[+]
  * code = #M210 "Spindle Cell Tumour of Bone Differential"
  * target[+]
    * code = #M210.1 "Spindle Cell Tumour of Bone Differential, Multi-target NGS panel - structural variant (ALK, BCOR, CIC, EWSR1, FUS, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M210.2 "Spindle Cell Tumour of Bone Differential, EWSR1 rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M210.3 "Spindle Cell Tumour of Bone Differential, FUS rearrangement FISH or RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M210.4 "Spindle Cell Tumour of Bone Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M210.5 "Spindle Cell Tumour of Bone Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M210.6 "Spindle Cell Tumour of Bone Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M211 "Fibro-Osseous Tumour of Bone Differential"
  * target[+]
    * code = #M211.1 "Fibro-Osseous Tumour of Bone Differential, Multi-target NGS panel - small variant (GNAS)"
    * equivalence = #narrower
  * target[+]
    * code = #M211.2 "Fibro-Osseous Tumour of Bone Differential, MDM2 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M211.3 "Fibro-Osseous Tumour of Bone Differential, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M211.4 "Fibro-Osseous Tumour of Bone Differential, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M211.5 "Fibro-Osseous Tumour of Bone Differential, Multi-target NGS panel - copy number variant (MDM2)"
    * equivalence = #narrower
* group.element[+]
  * code = #M212 "Renal Tumour Differential - Paediatric"
  * target[+]
    * code = #M212.1 "Renal Tumour Differential - Paediatric, Multi-target NGS panel - small variant (CTNNB1, DAXX, ATRX, TP53, TFE3)"
    * equivalence = #narrower
  * target[+]
    * code = #M212.10 "Renal Tumour Differential - Paediatric, TFEB-MALAT1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M212.11 "Renal Tumour Differential - Paediatric, TFE3-ASPSCR1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M212.12 "Renal Tumour Differential - Paediatric, TFE3-MITF FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M212.13 "Renal Tumour Differential - Paediatric, TFE3-PRCC FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M212.14 "Renal Tumour Differential - Paediatric, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M212.15 "Renal Tumour Differential - Paediatric, Multi-target NGS panel - structural variant (TFEB-MALAT1, TFE3-ASPSCR1, TFE3-MITF, TFE3-PRCC, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M212.16 "Renal Tumour Differential - Paediatric, Multi-target NGS panel - copy number variant (ATRX, TP53, WT1)"
    * equivalence = #narrower
  * target[+]
    * code = #M212.2 "Renal Tumour Differential - Paediatric, ATRX seq"
    * equivalence = #narrower
  * target[+]
    * code = #M212.3 "Renal Tumour Differential - Paediatric, CTNNB1 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M212.4 "Renal Tumour Differential - Paediatric, DAXX seq"
    * equivalence = #narrower
  * target[+]
    * code = #M212.5 "Renal Tumour Differential - Paediatric, TFE3 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M212.6 "Renal Tumour Differential - Paediatric, TP53 seq"
    * equivalence = #narrower
  * target[+]
    * code = #M212.7 "Renal Tumour Differential - Paediatric, ATRX copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M212.8 "Renal Tumour Differential - Paediatric, del(17p) TP53 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M212.9 "Renal Tumour Differential - Paediatric, WT1 copy number FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M213 "Glial and Glioneuronal Tumour Differential"
  * target[+]
    * code = #M213.1 "Glial and Glioneuronal Tumour Differential, Paediatric, Multi-target NGS panel, small variant (SMARCA4, SMARCB1, DDX3X, CTNNB1, CDKN2A, TP53, RAF1, PIK3CA, FGFR1, FGFR4, KIT,  BRAF, H3-3A, ALK, ATRX, NRAS, PHOX2B)"
    * equivalence = #narrower
  * target[+]
    * code = #M213.10 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.11 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-MACF1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.12 "Glial and Glioneuronal Tumour Differential, Paediatric, ALK-NPM1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.13 "Glial and Glioneuronal Tumour Differential, Paediatric, C11orf95-RELA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.14 "Glial and Glioneuronal Tumour Differential, Paediatric, EWSR1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.15 "Glial and Glioneuronal Tumour Differential, Paediatric, FGFR1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.16 "Glial and Glioneuronal Tumour Differential, Paediatric, RAF1-NF1A FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.17 "Glial and Glioneuronal Tumour Differential, Paediatric, RAF1-SRGAP3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.18 "Glial and Glioneuronal Tumour Differential, Paediatric, RELA rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.19 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1 rearrangement FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.2 "Glial and Glioneuronal Tumour Differential, Paediatric, Multi-target NGS panel, structural variant (BRAF-KIAA1549, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B, BRAF-FXR1, BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, ALK, C1"
    * equivalence = #narrower
  * target[+]
    * code = #M213.20 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.21 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1-TFE3 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.22 "Glial and Glioneuronal Tumour Differential, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q, EGFR, ALK, C19MC, CDKN2A,  FGFR1, KIAA1549, KIT, MYCN, PDGFRA, SMARCA4, SMARCB1, YAP1)"
    * equivalence = #narrower
  * target[+]
    * code = #M213.23 "Glial and Glioneuronal Tumour Differential, Paediatric, 1p19q codel FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.24 "Glial and Glioneuronal Tumour Differential, Paediatric, ALK copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.25 "Glial and Glioneuronal Tumour Differential, Paediatric, C19MC copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.26 "Glial and Glioneuronal Tumour Differential, Paediatric, CDKN2A copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.27 "Glial and Glioneuronal Tumour Differential, Paediatric, EGFR copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.28 "Glial and Glioneuronal Tumour Differential, Paediatric, FGFR1 ITD FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.29 "Glial and Glioneuronal Tumour Differential, Paediatric, KIAA1549 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.3 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.30 "Glial and Glioneuronal Tumour Differential, Paediatric, KIT copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.31 "Glial and Glioneuronal Tumour Differential, Paediatric, MYCN copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.32 "Glial and Glioneuronal Tumour Differential, Paediatric, PDGFRA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.33 "Glial and Glioneuronal Tumour Differential, Paediatric, SMARCA4 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.34 "Glial and Glioneuronal Tumour Differential, Paediatric, SMARCB1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.35 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M213.36 "Glial and Glioneuronal Tumour Differential, Paediatric, EGFRvIII RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.37 "Glial and Glioneuronal Tumour Differential, Paediatric, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M213.38 "Glial and Glioneuronal Tumour Differential, Paediatric, DNA Methylation"
    * equivalence = #narrower
  * target[+]
    * code = #M213.4 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-AGK FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.5 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.6 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.7 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-FAM118B FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.8 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-FRX1 FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M213.9 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M215 "Endometrial Cancer"
  * target[+]
    * code = #M215.1 "Endometrial Cancer, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M215.2 "Endometrial Cancer, MLH1 promoter hypermethylation"
    * equivalence = #narrower
  * target[+]
    * code = #M215.4 "Endometrial Cancer, Multi-target NGS panel - small variant (MLH1, MSH2, MSH6, PMS2)"
    * equivalence = #narrower
  * target[+]
    * code = #M215.5 "Endometrial Cancer, Multi-target NGS panel-small variant detection (POLE)"
    * equivalence = #narrower
* group.element[+]
  * code = #M217 "Urothelial Carcinoma"
  * target[+]
    * code = #M217.1 "Urothelial Carcinoma, Multi-target NGS panel - small variant (FGFR3, FGFR2)"
    * equivalence = #narrower
  * target[+]
    * code = #M217.2 "Urothelial Carcinoma, Multi-target NGS panel - copy number variant (FGFR3, FGFR2)"
    * equivalence = #narrower
  * target[+]
    * code = #M217.3 "Urothelial Carcinoma, Multi-target NGS panel - structural variant (FGFR3, FGFR2, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M218 "Prostate Cancer"
  * target[+]
    * code = #M218.1 "Prostate Cancer, Multi-target NGS panel - small variant (BRCA1, BRCA2) for somatic/tissue testing"
    * equivalence = #narrower
  * target[+]
    * code = #M218.2 "Prostate Cancer, Multi-target NGS panel - structural variant (TMPRSS2-ERG, NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M218.3 "Prostate Cancer, TMPRSS2-ERG FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M219 "Pancreatic Cancer"
  * target[+]
    * code = #M219.1 "Pancreatic Cancer, Multi-target NGS panel - small variant (BRCA1, BRCA2)"
    * equivalence = #narrower
  * target[+]
    * code = #M219.2 "Pancreatic Cancer, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M219.3 "Pancreatic Cancer, DPYD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M219.5 "Pancreatic Cancer, MSI Testing"
    * equivalence = #narrower
* group.element[+]
  * code = #M220 "Cholangiocarcinoma"
  * target[+]
    * code = #M220.1 "Cholangiocarcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3, FGFR2)"
    * equivalence = #narrower
  * target[+]
    * code = #M220.3 "Cholangiocarcinoma, DPYD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M220.5 "Cholangiocarcinoma, MSI Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M220.6 "Cholangiocarcinoma, Multi-target NGS panel -small variant (IDH1)"
    * equivalence = #narrower
  * target[+]
    * code = #M220.7 "Cholangiocarcinoma, FGFR2 rearrangement FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M221 "Spitzoid tumour"
  * target[+]
    * code = #M221.1 "Spitzoid tumour, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M222 "Hepatocellular carcinoma"
  * target[+]
    * code = #M222.2 "Hepatocellular carcinoma, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M222.4 "Hepatocellular carcinoma, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M224 "MDS/MPN"
  * target[+]
    * code = #M224.1 "MDS/MPN, Multi-target NGS panel, small variant"
    * equivalence = #narrower
  * target[+]
    * code = #M224.10 "MDS/MPN, BCR-ABL1 multiplex"
    * equivalence = #narrower
  * target[+]
    * code = #M224.11 "MDS/MPN, Other RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M224.13 "MDS/MPN, JAK2 V617F hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M224.14 "MDS/MPN, JAK2 exon 12 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M224.15 "MDS/MPN, CALR exon 9 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M224.16 "MDS/MPN, MPL exon 10 hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M224.18 "MDS/MPN, Chr8 copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.19 "MDS/MPN, Chr7/Chr7q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.2 "MDS/MPN, Karyotype (To include detection of complex karyotype)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.20 "MDS/MPN, Chr5/Chr5q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.21 "MDS/MPN, i(17q)/t(17p) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.22 "MDS/MPN, Chr12p copy number FISH, t(12p) rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.23 "MDS/MPN, t(9;22)(q34;q11) BCR-ABL1 FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.24 "MDS/MPN, PDGFRA rearrangement FISH (other than FIP1L1-PDGFRA see M85.7)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.25 "MDS/MPN, PDGFRB rearrangement FISH (other than ETV6-PDGFRB see M85.9)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.26 "MDS/MPN, FGFR1 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.27 "MDS/MPN, JAK2 rearrangement FISH (other than PCM1-JAK2 see M85.10)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.28 "MDS/MPN, inv(3)/t(3;3) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.29 "MDS/MPN, 11q23 (KMT2A) rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.3 "MDS/MPN, FISH copy number and rearrangement Other: See tests M224. -M224. for individual specified FISH targets."
    * equivalence = #narrower
  * target[+]
    * code = #M224.30 "MDS/MPN, ABL1 rearrangement FISH (other than BCR-ABL1 see M85.24)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.31 "MDS/MPN, FLT3 rearragement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.32 "MDS/MPN, RET rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.33 "MDS/MPN, NTRK3 rearrangement FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.34 "MDS/MPN, Chr13/Chr13q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.35 "MDS/MPN, Chr11q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.36 "MDS/MPN, Chr9q copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.37 "MDS/MPN, Chr17/Chr17p copy number FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.38 "MDS/MPN, idic(X)(q13) FISH"
    * equivalence = #narrower
  * target[+]
    * code = #M224.39 "MDS/MPN, Multi-target NGS panel, copy number variant (-7/del7q, -5/del5q, -13/del13q, del11q, del12p, del9q, del17/del17p/i(17q) & idic(X)(q13), cryptic deletion of 4q12, trisomy 8)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.4 "MDS/MPN, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M224.40 "MDS/MPN, Multi-target NGS panel, structural variant"
    * equivalence = #narrower
  * target[+]
    * code = #M224.41 "MDS/MPN, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M224.42 "MDS/MPN, WGS Follow-up Germline"
    * equivalence = #narrower
  * target[+]
    * code = #M224.5 "MDS/MPN, Multi-target NGS limited panel, small variant (JAK2, CALR, MPL)"
    * equivalence = #narrower
  * target[+]
    * code = #M224.6 "MDS/MPN, FIP1L1-PDGFRA FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M224.7 "MDS/MPN, FIP1L1-PDGFRA RT-qPCR"
    * equivalence = #narrower
  * target[+]
    * code = #M224.8 "MDS/MPN, ETV6-PDGFRB FISH/RT-PCR"
    * equivalence = #narrower
  * target[+]
    * code = #M224.9 "MDS/MPN, PCM1-JAK2 FISH/RT-PCR"
    * equivalence = #narrower
* group.element[+]
  * code = #M225 "Suspected Lymphoma"
  * target[+]
    * code = #M225.1 "Suspected Lymphoma, Ig gene (heavy & light chain) rearrangement detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M225.2 "Suspected Lymphoma, Ig gene (heavy & light chain) rearrangement detection NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M225.3 "Suspected Lymphoma, TCR gene rearrangement detection multiplex seq"
    * equivalence = #narrower
  * target[+]
    * code = #M225.4 "Suspected Lymphoma, TCR gene rearrangement detection NGS"
    * equivalence = #narrower
  * target[+]
    * code = #M225.5 "Suspected Lymphoma, Karyotype"
    * equivalence = #narrower
* group.element[+]
  * code = #M226 "Carcinoma of Unknown Primary"
  * target[+]
    * code = #M226.1 "Carcinoma of Unknown Primary, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M226.3 "Carcinoma of Unknown Primary, DPYD hotspot"
    * equivalence = #narrower
  * target[+]
    * code = #M226.4 "Carcinoma of Unknown Primary, WGS Germline and Tumour"
    * equivalence = #narrower
  * target[+]
    * code = #M226.5 "Carcinoma of Unknown Primary, Multi-target NGS panel-structural variant (ALK, EML4, FGFR2, FGFR3, MAML2, MET * (including exon 14 skipping), MYB, NFIB, NTRK1, NTRK2, NTRK3, RET,ROS1, TFE3, TMPRSS2, ERG)"
    * equivalence = #narrower
  * target[+]
    * code = #M226.6 "Carcinoma of Unknown Primary, Multi-target NGS panel -small variant (AKT1, APC, ALK, BRCA1, BRCA2, BRAF, CDKN2A, CTNNB1, DICER1, EGFR, ELOC, ESR1, FGFR2, FGFR3, FH, FOXL2, HRAS, IDH1, KIT, KRAS, MLH1, MSH2, MSH6, MET (including exon 14 skipping), NF1, NRAS, PDGFRA, PIK3CA, POLD1, POLE, PMS2, PTEN, RB1, RET, SDHA, SHDB, SDHC, SDHD, SMARCA4, TP53, TSC1, TSC2, TERT (promoter), VKL, NF2, CDK12) and copy number variant (CDKN2A, FGFR2, FGFR3, MET, PTEN, TP53)"
    * equivalence = #narrower
  * target[+]
    * code = #M226.7 "Carcinoma of Unknown Primary, Multi-target ctDNA NGS panel - small variant (AKT1, APC, ALK, BRCA1, BRCA2, BRAF, CDKN2A, CTNNB1, EGFR, ESR1, HRAS, IDH1, FGFR2, FGFR3, KIT, KRAS, MLH1, NF1, NRAS, PDGFRA, PIK3CA, PTEN, RB1, RET, TSC1, TP53, TERT (promoter), VHL) , copy number variant (BRCA1, BRCA2, PTEN) , structural variant (ALK, BRAF, EML4, FGFR2, FGFR3, NTRK1, NTRK2, NTRK3, ROS1, MET (including exon 14 skipping), RET)"
    * equivalence = #narrower
* group.element[+]
  * code = #M227 "Solid tumour other (i.e. specific histology not listed elsewhere in the test directory)"
  * target[+]
    * code = #M227.1 "Solid tumour other (i.e. specific histology not listed elsewhere in the test directory), Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
  * target[+]
    * code = #M227.3 "Solid tumour other (i.e. specific histology not listed elsewhere in the test directory), DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M231 "Small cell lung cancer"
  * target[+]
    * code = #M231.1 "Small cell lung cancer, Multi-target NGS panel - copy number variant (RB1)"
    * equivalence = #narrower
  * target[+]
    * code = #M231.2 "Small cell lung cancer, Multi-target NGS panel - structural variant (NTRK1, NTRK2, NTRK3)"
    * equivalence = #narrower
* group.element[+]
  * code = #M232 "Solid Tumour Exhausted all Standards of Care Testing and Treatment- Adult"
  * target[+]
    * code = #M232.1 "Solid Tumour Exhausted all Standards of Care Testing and Treatment- Adult, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M233 "High Grade Ovarian Carcinoma"
  * target[+]
    * code = #M233.1 "High Grade Ovarian Carcinoma, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M234 "Triple Negative Breast Cancer"
  * target[+]
    * code = #M234.1 "Triple Negative Breast Cancer, WGS Germline and Tumour"
    * equivalence = #narrower
* group.element[+]
  * code = #M235 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment"
  * target[+]
    * code = #M235.1 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment, WGS Germline and Tumor"
    * equivalence = #narrower
  * target[+]
    * code = #M235.2 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment, WGS Tumour First"
    * equivalence = #narrower
  * target[+]
    * code = #M235.3 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment, WGS Follow-up Germline"
    * equivalence = #narrower
* group.element[+]
  * code = #M236 "Oesophageal Cancer"
  * target[+]
    * code = #M236.1 "Oesophageal Cancer, MSI Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M236.2 "Oesophageal Cancer, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M237 "Gastric Cancer"
  * target[+]
    * code = #M237.1 "Gastric Cancer, MSI Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M237.2 "Gastric Cancer, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M238 "Small Bowel Cancer"
  * target[+]
    * code = #M238.1 "Small Bowel Cancer, MSI Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M238.2 "Small Bowel Cancer, DPYD hotspot"
    * equivalence = #narrower
* group.element[+]
  * code = #M239 "Thyroid Hurtle Cell Carcinoma"
  * target[+]
    * code = #M239.1 "Thyroid Hurtle Cell Carcinoma, Multi-target NGS panel - structural variant (RET)"
    * equivalence = #narrower
* group.element[+]
  * code = #M240 "Non-invasive follicular thyroid neoplasm with papillary like nuclei"
  * target[+]
    * code = #M240.1 "Non-invasive follicular thyroid neoplasm with papillary like nuclei, Multi-target NGS panel - small variant (BRAF,HRAS,NRAS,KRAS)"
    * equivalence = #narrower
* group.element[+]
  * code = #M241 "Conjunctival melanoma"
  * target[+]
    * code = #M241.1 "Conjunctival melanoma, MYB & 6cen"
    * equivalence = #narrower
  * target[+]
    * code = #M241.2 "Conjunctival melanoma, RREB1 (6p25)"
    * equivalence = #narrower
  * target[+]
    * code = #M241.3 "Conjunctival melanoma, CCND1 (11q13)"
    * equivalence = #narrower
  * target[+]
    * code = #M241.4 "Conjunctival melanoma, MYC & 8cen"
    * equivalence = #narrower
  * target[+]
    * code = #M241.5 "Conjunctival melanoma, CDKN2A & 9cen"
    * equivalence = #narrower
* group.element[+]
  * code = #M242 "Any patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected)"
  * target[+]
    * code = #M242.1 "Any patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected), STR Testing"
    * equivalence = #narrower
  * target[+]
    * code = #M242.2 "Any patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected), Sex chromosome FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M243 "Thymic Carcinoma"
  * target[+]
    * code = #M243.1 "Thymic Carcinoma, Multi-target NGS panel (KIT)"
    * equivalence = #narrower
* group.element[+]
  * code = #M244 "In all tumours eligible for NTRK1/2/3 testing"
  * target[+]
    * code = #M244.1 "In all tumours eligible for NTRK1/2/3 testing, FISH"
    * equivalence = #narrower
* group.element[+]
  * code = #M245 "Ovarian sex cord stromal tumours"
  * target[+]
    * code = #M245.1 "Ovarian sex cord stromal tumours, Multi-target NGS panel-small variant (FOXL2, CTNNB1, APC, DICER1)"
    * equivalence = #narrower
* group.element[+]
  * code = #R14 "Acutely unwell children with a likely monogenic disorder"
  * target[+]
    * code = #R14.1 "Acutely unwell children with a likely monogenic disorder (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R15 "Primary immunodeficiency or monogenic inflammatory bowel disease"
  * target[+]
    * code = #R15.4 "Primary immunodeficiency or monogenic inflammatory bowel disease (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R15.5 "Primary immunodeficiency or monogenic inflammatory bowel disease (WES)"
    * equivalence = #narrower
* group.element[+]
  * code = #R16 "Severe combined immunodeficiency with adenosine deaminase deficiency"
  * target[+]
    * code = #R16.1 "Severe combined immunodeficiency with adenosine deaminase deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R17 "Lymphoproliferative syndrome with absent SAP expression"
  * target[+]
    * code = #R17.1 "Lymphoproliferative syndrome with absent SAP expression (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R18 "Haemophagocytic syndrome with absent XIAP expression"
  * target[+]
    * code = #R18.1 "Haemophagocytic syndrome with absent XIAP expression (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R19 "Autoimmune lymphoproliferative syndrome with defective apoptosis"
  * target[+]
    * code = #R19.1 "Autoimmune lymphoproliferative syndrome with defective apoptosis (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R20 "Wiskott-Aldrich syndrome"
  * target[+]
    * code = #R20.1 "Wiskott-Aldrich syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R21 "Fetal anomalies with a likely genetic cause"
  * target[+]
    * code = #R21.1 "Fetal anomalies with a likely genetic cause (Common aneuploidy testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R21.2 "Fetal anomalies with a likely genetic cause (Large Panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R21.3 "Fetal anomalies with a likely genetic cause (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R22 "Fetus with a likely chromosomal abnormality"
  * target[+]
    * code = #R22.1 "Fetus with a likely chromosomal abnormality (Common aneuploidy testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R22.2 "Fetus with a likely chromosomal abnormality (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R23 "Apert syndrome"
  * target[+]
    * code = #R23.1 "Apert syndrome (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R24 "Achondroplasia"
  * target[+]
    * code = #R24.1 "Achondroplasia (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R25 "Thanatophoric dysplasia"
  * target[+]
    * code = #R25.1 "Thanatophoric dysplasia (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R26 "Likely common aneuploidy"
  * target[+]
    * code = #R26.1 "Likely common aneuploidy (Common aneuploidy testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R27 "Paediatric disorders"
  * target[+]
    * code = #R27.3 "Paediatric disorders (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R28 "Congenital malformation and dysmorphism syndromes"
  * target[+]
    * code = #R28.1 "Congenital malformation and dysmorphism syndromes (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R31 "Bilateral congenital or childhood onset cataracts"
  * target[+]
    * code = #R31.3 "Bilateral congenital or childhood onset cataracts (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R32 "Retinal disorders"
  * target[+]
    * code = #R32.2 "Retinal disorders (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R33 "Possible X-linked retinitis pigmentosa"
  * target[+]
    * code = #R33.1 "Possible X-linked retinitis pigmentosa (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R36 "Structural eye disease"
  * target[+]
    * code = #R36.2 "Structural eye disease (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R38 "Sporadic aniridia"
  * target[+]
    * code = #R38.2 "Sporadic aniridia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R39 "Albinism or congenital nystagmus"
  * target[+]
    * code = #R39.1 "Albinism or congenital nystagmus (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R41 "Optic neuropathy"
  * target[+]
    * code = #R41.1 "Optic neuropathy (WES or Medium panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R41.3 "Optic neuropathy (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R42 "Leber hereditary optic neuropathy"
  * target[+]
    * code = #R42.1 "Leber hereditary optic neuropathy (Targeted variant testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R42.2 "Leber hereditary optic neuropathy (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R43 "Blepharophimosis ptosis and epicanthus inversus"
  * target[+]
    * code = #R43.1 "Blepharophimosis ptosis and epicanthus inversus (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R43.2 "Blepharophimosis ptosis and epicanthus inversus (MLPA or equivalent)"
    * equivalence = #narrower
  * target[+]
    * code = #R43.3 "Blepharophimosis ptosis and epicanthus inversus (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R45 "Stickler syndrome"
  * target[+]
    * code = #R45.1 "Stickler syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R46 "Congenital fibrosis of the extraocular muscles"
  * target[+]
    * code = #R46.1 "Congenital fibrosis of the extraocular muscles (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R47 "Angelman syndrome"
  * target[+]
    * code = #R47.1 "Angelman syndrome (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R48 "Prader-Willi syndrome"
  * target[+]
    * code = #R48.1 "Prader-Willi syndrome (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R49 "Beckwith-Wiedemann syndrome"
  * target[+]
    * code = #R49.1 "Beckwith-Wiedemann syndrome (Methylation testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R49.3 "Beckwith-Wiedemann syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R50 "Isolated hemihypertrophy or macroglossia"
  * target[+]
    * code = #R50.1 "Isolated hemihypertrophy or macroglossia (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R52 "Short stature - SHOX deficiency"
  * target[+]
    * code = #R52.1 "Short stature - SHOX deficiency (MLPA or equivalent)"
    * equivalence = #narrower
  * target[+]
    * code = #R52.2 "Short stature - SHOX deficiency (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R54 "Hereditary ataxia with onset in adulthood"
  * target[+]
    * code = #R54.3 "Hereditary ataxia with onset in adulthood (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R54.4 "Hereditary ataxia with onset in adulthood (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R55 "Hereditary ataxia with onset in childhood"
  * target[+]
    * code = #R55.4 "Hereditary ataxia with onset in childhood (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R56 "Adult onset dystonia, chorea or related movement disorder"
  * target[+]
    * code = #R56.3 "Adult onset dystonia, chorea or related movement disorder (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R57 "Childhood onset dystonia, chorea or related movement disorder"
  * target[+]
    * code = #R57.5 "Childhood onset dystonia, chorea or related movement disorder (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R60 "Adult onset hereditary spastic paraplegia"
  * target[+]
    * code = #R60.3 "Adult onset hereditary spastic paraplegia (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R61 "Childhood onset hereditary spastic paraplegia"
  * target[+]
    * code = #R61.4 "Childhood onset hereditary spastic paraplegia (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R62 "Adult onset leukodystrophy"
  * target[+]
    * code = #R62.2 "Adult onset leukodystrophy (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R63 "Possible mitochondrial disorder - nuclear genes"
  * target[+]
    * code = #R63.1 "Possible mitochondrial disorder - nuclear genes (WES or Large Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R64 "MELAS or MIDD"
  * target[+]
    * code = #R64.1 "MELAS or MIDD (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R65 "Aminoglycoside exposure posing risk to hearing"
  * target[+]
    * code = #R65.1 "Aminoglycoside exposure posing risk to hearing (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R66 "Paroxysmal central nervous system disorders"
  * target[+]
    * code = #R66.1 "Paroxysmal central nervous system disorders (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R67 "Monogenic hearing loss"
  * target[+]
    * code = #R67.1 "Monogenic hearing loss (WES or Large Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R68 "Huntington disease"
  * target[+]
    * code = #R68.1 "Huntington disease (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R69 "Hypotonic infant"
  * target[+]
    * code = #R69.5 "Hypotonic infant (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R70 "Spinal muscular atrophy type 1 diagnostic test"
  * target[+]
    * code = #R70.1 "Spinal muscular atrophy type 1 diagnostic test (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R71 "Spinal muscular atrophy type 1 rare variant testing"
  * target[+]
    * code = #R71.1 "Spinal muscular atrophy type 1 rare variant testing (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R72 "Myotonic dystrophy type 1"
  * target[+]
    * code = #R72.1 "Myotonic dystrophy type 1 (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R73 "Duchenne or Becker muscular dystrophy"
  * target[+]
    * code = #R73.1 "Duchenne or Becker muscular dystrophy (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R73.2 "Duchenne or Becker muscular dystrophy (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R74 "Facioscapulohumeral muscular dystrophy"
  * target[+]
    * code = #R74.1 "Facioscapulohumeral muscular dystrophy (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R75 "Oculopharyngeal muscular dystrophy"
  * target[+]
    * code = #R75.1 "Oculopharyngeal muscular dystrophy (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R76 "Skeletal muscle channelopathy"
  * target[+]
    * code = #R76.1 "Skeletal muscle channelopathy (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R77 "Hereditary neuropathy - PMP22 copy number"
  * target[+]
    * code = #R77.1 "Hereditary neuropathy - PMP22 copy number (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R78 "Hereditary neuropathy or pain disorder"
  * target[+]
    * code = #R78.4 "Hereditary neuropathy or pain disorder (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R78.5 "Hereditary neuropathy or pain disorder (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R79 "Congenital muscular dystrophy"
  * target[+]
    * code = #R79.1 "Congenital muscular dystrophy (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R80 "Congenital myaesthenic syndrome"
  * target[+]
    * code = #R80.1 "Congenital myaesthenic syndrome (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R81 "Congenital myopathy"
  * target[+]
    * code = #R81.1 "Congenital myopathy (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R82 "Limb girdle muscular dystrophies, myofibrillar myopathies and distal myopathies"
  * target[+]
    * code = #R82.1 "Limb girdle muscular dystrophies, myofibrillar myopathies and distal myopathies (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R83 "Arthrogryposis"
  * target[+]
    * code = #R83.3 "Arthrogryposis (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R84 "Cerebellar anomalies"
  * target[+]
    * code = #R84.4 "Cerebellar anomalies (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R85 "Holoprosencephaly - NOT chromosomal"
  * target[+]
    * code = #R85.2 "Holoprosencephaly - NOT chromosomal (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R86 "Hydrocephalus"
  * target[+]
    * code = #R86.3 "Hydrocephalus (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R87 "Cerebral malformation"
  * target[+]
    * code = #R87.3 "Cerebral malformation (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R88 "Severe microcephaly"
  * target[+]
    * code = #R88.3 "Severe microcephaly (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R89 "Ultra-rare and atypical monogenic disorders"
  * target[+]
    * code = #R89.3 "Ultra-rare and atypical monogenic disorders (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R90 "Bleeding and platelet disorders"
  * target[+]
    * code = #R90.1 "Bleeding and platelet disorders (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R91 "Cytopenia - NOT Fanconi anaemia"
  * target[+]
    * code = #R91.1 "Cytopenia - NOT Fanconi anaemia (WES or Medium Panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R91.2 "Cytopenia - NOT Fanconi anaemia (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R92 "Rare anaemia"
  * target[+]
    * code = #R92.1 "Rare anaemia (MLPA or equivalent)"
    * equivalence = #narrower
  * target[+]
    * code = #R92.2 "Rare anaemia (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R92.3 "Rare anaemia (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R93 "Sickle cell, thalassaemia and other haemoglobinopathies"
  * target[+]
    * code = #R93.1 "Sickle cell, thalassaemia and other haemoglobinopathies (MLPA or equivalent)"
    * equivalence = #narrower
  * target[+]
    * code = #R93.2 "Sickle cell, thalassaemia and other haemoglobinopathies (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R95 "Iron overload - hereditary haemochromatosis testing"
  * target[+]
    * code = #R95.1 "Iron overload - hereditary haemochromatosis testing (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R96 "Iron metabolism disorders - NOT common HFE  variants"
  * target[+]
    * code = #R96.1 "Iron metabolism disorders - NOT common HFE  variants (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R97 "Thrombophilia with a likely monogenic cause"
  * target[+]
    * code = #R97.1 "Thrombophilia with a likely monogenic cause (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R98 "Likely inborn error of metabolism"
  * target[+]
    * code = #R98.2 "Likely inborn error of metabolism (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R98.3 "Likely inborn error of metabolism (WES)"
    * equivalence = #narrower
* group.element[+]
  * code = #R99 "Common craniosynostosis syndromes"
  * target[+]
    * code = #R99.1 "Common craniosynostosis syndromes (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R99.2 "Common craniosynostosis syndromes (Exon level CNV detection by MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R100 "Rare syndromic craniosynostosis or isolated multisuture synostosis"
  * target[+]
    * code = #R100.3 "Rare syndromic craniosynostosis or isolated multisuture synostosis (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R101 "Ehlers Danlos syndrome with a likely monogenic cause"
  * target[+]
    * code = #R101.1 "Ehlers Danlos syndrome with a likely monogenic cause (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R102 "Osteogenesis imperfecta"
  * target[+]
    * code = #R102.1 "Osteogenesis imperfecta (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R104 "Skeletal dysplasia"
  * target[+]
    * code = #R104.3 "Skeletal dysplasia (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R104.4 "Skeletal dysplasia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R105 "MCADD - Medium-chain acyl-CoA dehydrogenase deficiency – common variant newborn screening follow up"
  * target[+]
    * code = #R105.1 "MCADD - Medium-chain acyl-CoA dehydrogenase deficiency – common variant newborn screening follow up (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R106 "Alstrom syndrome"
  * target[+]
    * code = #R106.1 "Alstrom syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R107 "Bardet Biedl syndrome"
  * target[+]
    * code = #R107.1 "Bardet Biedl syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R109 "Childhood onset leukodystrophy"
  * target[+]
    * code = #R109.3 "Childhood onset leukodystrophy (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R110 "Segmental overgrowth disorders - Deep sequencing"
  * target[+]
    * code = #R110.1 "Segmental overgrowth disorders - Deep sequencing (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R111 "X-inactivation testing"
  * target[+]
    * code = #R111.1 "X-inactivation testing (X-inactivation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R112 "Factor II deficiency"
  * target[+]
    * code = #R112.1 "Factor II deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R115 "Factor V deficiency"
  * target[+]
    * code = #R115.1 "Factor V deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R115.2 "Factor V deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R116 "Factor VII deficiency"
  * target[+]
    * code = #R116.1 "Factor VII deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R116.2 "Factor VII deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R117 "Factor VIII deficiency"
  * target[+]
    * code = #R117.1 "Factor VIII deficiency (Targeted variant testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R117.2 "Factor VIII deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R117.3 "Factor VIII deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R118 "Factor IX deficiency"
  * target[+]
    * code = #R118.1 "Factor IX deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R118.2 "Factor IX deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R119 "Factor X deficiency"
  * target[+]
    * code = #R119.1 "Factor X deficiency (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R119.2 "Factor X deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R120 "Factor XI deficiency"
  * target[+]
    * code = #R120.1 "Factor XI deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R120.2 "Factor XI deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R121 "von Willebrand disease"
  * target[+]
    * code = #R121.1 "von Willebrand disease (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R121.2 "von Willebrand disease (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R122 "Factor XIII deficiency"
  * target[+]
    * code = #R122.1 "Factor XIII deficiency (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R123 "Combined vitamin K-dependent clotting factor deficiency"
  * target[+]
    * code = #R123.1 "Combined vitamin K-dependent clotting factor deficiency (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R124 "Combined factor V and VIII deficiency"
  * target[+]
    * code = #R124.1 "Combined factor V and VIII deficiency (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R125 "Thoracic aortic aneurysm or dissection"
  * target[+]
    * code = #R125.1 "Thoracic aortic aneurysm or dissection (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R127 "Long QT syndrome"
  * target[+]
    * code = #R127.1 "Long QT syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R128 "Brugada syndrome and cardiac sodium channel disease"
  * target[+]
    * code = #R128.1 "Brugada syndrome and cardiac sodium channel disease (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R129 "Catecholaminergic polymorphic VT"
  * target[+]
    * code = #R129.1 "Catecholaminergic polymorphic VT (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R130 "Short QT syndrome"
  * target[+]
    * code = #R130.1 "Short QT syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R131 "Hypertrophic cardiomyopathy"
  * target[+]
    * code = #R131.1 "Hypertrophic cardiomyopathy (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R132 "Dilated and Arrhythmogenic cardiomyopathy"
  * target[+]
    * code = #R132.1 "Dilated and Arrhythmogenic cardiomyopathy (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R133 "Arrhythmogenic right ventricular cardiomyopathy"
  * target[+]
    * code = #R133.1 "Arrhythmogenic right ventricular cardiomyopathy (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R134 "Familial hypercholesterolaemia"
  * target[+]
    * code = #R134.1 "Familial hypercholesterolaemia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R135 "Paediatric or syndromic cardiomyopathy"
  * target[+]
    * code = #R135.2 "Paediatric or syndromic cardiomyopathy (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R135.3 "Paediatric or syndromic cardiomyopathy (WES)"
    * equivalence = #narrower
* group.element[+]
  * code = #R136 "Primary lymphoedema"
  * target[+]
    * code = #R136.1 "Primary lymphoedema (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R137 "Congenital heart disease - microarray"
  * target[+]
    * code = #R137.1 "Congenital heart disease - microarray (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R138 "Sudden unexplained death or survivors of a cardiac event"
  * target[+]
    * code = #R138.1 "Sudden unexplained death or survivors of a cardiac event (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R139 "Laterality disorders and isomerism"
  * target[+]
    * code = #R139.1 "Laterality disorders and isomerism (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R140 "Elastin-related phenotypes"
  * target[+]
    * code = #R140.1 "Elastin-related phenotypes (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R141 "Monogenic diabetes"
  * target[+]
    * code = #R141.1 "Monogenic diabetes (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R142 "Glucokinase-related fasting hyperglycaemia"
  * target[+]
    * code = #R142.1 "Glucokinase-related fasting hyperglycaemia (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R143 "Neonatal diabetes"
  * target[+]
    * code = #R143.1 "Neonatal diabetes (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R143.3 "Neonatal diabetes (Methylation testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R143.4 "Neonatal diabetes (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R144 "Congenital hyperinsulinism"
  * target[+]
    * code = #R144.1 "Congenital hyperinsulinism (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R144.2 "Congenital hyperinsulinism (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R145 "Congenital hypothyroidism"
  * target[+]
    * code = #R145.1 "Congenital hypothyroidism (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R146 "Differences in sex development"
  * target[+]
    * code = #R146.1 "Differences in sex development (Microarray)"
    * equivalence = #narrower
  * target[+]
    * code = #R146.2 "Differences in sex development (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R148 "Hypogonadotropic hypogonadism"
  * target[+]
    * code = #R148.1 "Hypogonadotropic hypogonadism (Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R149 "Severe early-onset obesity"
  * target[+]
    * code = #R149.1 "Severe early-onset obesity (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R150 "Congenital adrenal hypoplasia"
  * target[+]
    * code = #R150.1 "Congenital adrenal hypoplasia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R151 "Familial hyperparathyroidism or Hypocalciuric hypercalcaemia"
  * target[+]
    * code = #R151.1 "Familial hyperparathyroidism or Hypocalciuric hypercalcaemia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R153 "Familial hypoparathyroidism"
  * target[+]
    * code = #R153.1 "Familial hypoparathyroidism (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R154 "Hypophosphataemia or rickets"
  * target[+]
    * code = #R154.1 "Hypophosphataemia or rickets (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R155 "Autoimmune Polyendocrine Syndrome"
  * target[+]
    * code = #R155.1 "Autoimmune Polyendocrine Syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R156 "Carney complex"
  * target[+]
    * code = #R156.1 "Carney complex (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R157 "IPEX - Immunodysregulation Polyendocrinopathy and Enteropathy, X-Linked"
  * target[+]
    * code = #R157.1 "IPEX - Immunodysregulation Polyendocrinopathy and Enteropathy, X-Linked (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R158 "Severe insulin resistance and lipodystrophy syndromes"
  * target[+]
    * code = #R158.1 "Severe insulin resistance and lipodystrophy syndromes (Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R159 "Pituitary hormone deficiency"
  * target[+]
    * code = #R159.1 "Pituitary hormone deficiency (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R160 "Primary pigmented nodular adrenocortical disease"
  * target[+]
    * code = #R160.1 "Primary pigmented nodular adrenocortical disease (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R162 "Familial tumoral calcinosis"
  * target[+]
    * code = #R162.1 "Familial tumoral calcinosis (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R163 "Ectodermal dysplasia"
  * target[+]
    * code = #R163.1 "Ectodermal dysplasia (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R164 "Epidermolysis bullosa and congenital skin fragility"
  * target[+]
    * code = #R164.1 "Epidermolysis bullosa and congenital skin fragility (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R165 "Ichthyosis and erythrokeratoderma"
  * target[+]
    * code = #R165.1 "Ichthyosis and erythrokeratoderma (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R166 "Palmoplantar keratodermas"
  * target[+]
    * code = #R166.1 "Palmoplantar keratodermas (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R167 "Autosomal recessive primary hypertrophic osteoarthropathy"
  * target[+]
    * code = #R167.1 "Autosomal recessive primary hypertrophic osteoarthropathy (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R168 "Non-acute porphyrias"
  * target[+]
    * code = #R168.1 "Non-acute porphyrias (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R169 "Acute intermittent porphyria"
  * target[+]
    * code = #R169.1 "Acute intermittent porphyria (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R170 "Variegate porphyria"
  * target[+]
    * code = #R170.1 "Variegate porphyria (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R171 "Cholestasis"
  * target[+]
    * code = #R171.1 "Cholestasis (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R172 "Wilson disease"
  * target[+]
    * code = #R172.1 "Wilson disease (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R173 "Polycystic liver disease"
  * target[+]
    * code = #R173.1 "Polycystic liver disease (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R175 "Pancreatitis"
  * target[+]
    * code = #R175.1 "Pancreatitis (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R176 "Gilbert syndrome"
  * target[+]
    * code = #R176.1 "Gilbert syndrome (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R180 "Congenital adrenal hyperplasia diagnostic test"
  * target[+]
    * code = #R180.1 "Congenital adrenal hyperplasia diagnostic test (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R180.2 "Congenital adrenal hyperplasia diagnostic test (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R181 "Congenital adrenal hyperplasia carrier testing"
  * target[+]
    * code = #R181.1 "Congenital adrenal hyperplasia carrier testing (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R181.2 "Congenital adrenal hyperplasia carrier testing (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R182 "Hyperthyroidism"
  * target[+]
    * code = #R182.1 "Hyperthyroidism (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R183 "Glucocorticoid-remediable aldosteronism (GRA)"
  * target[+]
    * code = #R183.1 "Glucocorticoid-remediable aldosteronism (GRA) (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R184 "Cystic fibrosis diagnostic test"
  * target[+]
    * code = #R184.1 "Cystic fibrosis diagnostic test (Targeted variant testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R184.2 "Cystic fibrosis diagnostic test (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R184.3 "Cystic fibrosis diagnostic test (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R185 "Cystic fibrosis carrier testing"
  * target[+]
    * code = #R185.1 "Cystic fibrosis carrier testing (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R186 "Hereditary haemorrhagic telangiectasia"
  * target[+]
    * code = #R186.1 "Hereditary haemorrhagic telangiectasia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R188 "Pulmonary arterial hypertension"
  * target[+]
    * code = #R188.1 "Pulmonary arterial hypertension (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R189 "Respiratory ciliopathies including non-CF bronchiectasis"
  * target[+]
    * code = #R189.1 "Respiratory ciliopathies including non-CF bronchiectasis (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R190 "Pneumothorax - familial"
  * target[+]
    * code = #R190.1 "Pneumothorax - familial (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R191 "Alpha-1-antitrypsin deficiency"
  * target[+]
    * code = #R191.1 "Alpha-1-antitrypsin deficiency (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R193 "Cystic renal disease"
  * target[+]
    * code = #R193.4 "Cystic renal disease (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R194 "Haematuria"
  * target[+]
    * code = #R194.1 "Haematuria (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R195 "Proteinuric renal disease"
  * target[+]
    * code = #R195.3 "Proteinuric renal disease (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R196 "CFHR5 nephropathy"
  * target[+]
    * code = #R196.1 "CFHR5 nephropathy (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R197 "Membranoproliferative glomerulonephritis including C3 glomerulopathy"
  * target[+]
    * code = #R197.1 "Membranoproliferative glomerulonephritis including C3 glomerulopathy (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R197.2 "Membranoproliferative glomerulonephritis including C3 glomerulopathy (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R198 "Renal tubulopathies"
  * target[+]
    * code = #R198.1 "Renal tubulopathies (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R199 "Congenital anomalies of the kidney and urinary tract - familial"
  * target[+]
    * code = #R199.1 "Congenital anomalies of the kidney and urinary tract - familial (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R201 "Atypical haemolytic uraemic syndrome"
  * target[+]
    * code = #R201.1 "Atypical haemolytic uraemic syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R202 "Tubulointerstitial kidney disease"
  * target[+]
    * code = #R202.1 "Tubulointerstitial kidney disease (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R204 "Hereditary Systemic Amyloidosis"
  * target[+]
    * code = #R204.1 "Hereditary Systemic Amyloidosis (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R207 "Inherited ovarian cancer (without breast cancer)"
  * target[+]
    * code = #R207.1 "Inherited ovarian cancer (without breast cancer) (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R208 "Inherited breast cancer and ovarian cancer"
  * target[+]
    * code = #R208.1 "Inherited breast cancer and ovarian cancer (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R210 "Inherited MMR deficiency (Lynch syndrome)"
  * target[+]
    * code = #R210.2 "Inherited MMR deficiency (Lynch syndrome) (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R210.4 "Inherited MMR deficiency (Lynch syndrome) (Methylation testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R210.6 "Inherited MMR deficiency (Lynch syndrome) (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R211 "Inherited polyposis and early onset colorectal cancer - germline testing"
  * target[+]
    * code = #R211.1 "Inherited polyposis and early onset colorectal cancer - germline testing (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R211.3 "Inherited polyposis and early onset colorectal cancer - germline testing (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R212 "Peutz Jeghers Syndrome"
  * target[+]
    * code = #R212.1 "Peutz Jeghers Syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R213 "PTEN Hamartoma Tumor Syndrome"
  * target[+]
    * code = #R213.1 "PTEN Hamartoma Tumor Syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R214 "Nevoid Basal Cell Carcinoma Syndrome or Gorlin syndrome"
  * target[+]
    * code = #R214.1 "Nevoid Basal Cell Carcinoma Syndrome or Gorlin syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R215 "Hereditary diffuse gastric cancer"
  * target[+]
    * code = #R215.1 "Hereditary diffuse gastric cancer (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R216 "Li Fraumeni Syndrome"
  * target[+]
    * code = #R216.1 "Li Fraumeni Syndrome (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R217 "Endocrine neoplasia"
  * target[+]
    * code = #R217.1 "Endocrine neoplasia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R218 "Multiple endocrine neoplasia type 2"
  * target[+]
    * code = #R218.1 "Multiple endocrine neoplasia type 2 (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R219 "Retinoblastoma"
  * target[+]
    * code = #R219.1 "Retinoblastoma (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R219.2 "Retinoblastoma (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R221 "Familial tumours of the nervous system"
  * target[+]
    * code = #R221.1 "Familial tumours of the nervous system (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R221.2 "Familial tumours of the nervous system (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R222 "Neurofibromatosis type 1"
  * target[+]
    * code = #R222.1 "Neurofibromatosis type 1 (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R222.2 "Neurofibromatosis type 1 (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R223 "Inherited phaeochromocytoma and paraganglioma excluding NF1"
  * target[+]
    * code = #R223.1 "Inherited phaeochromocytoma and paraganglioma excluding NF1 (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R224 "Inherited renal cancer"
  * target[+]
    * code = #R224.1 "Inherited renal cancer (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R225 "Von Hippel Lindau syndrome"
  * target[+]
    * code = #R225.1 "Von Hippel Lindau syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R226 "Inherited parathyroid cancer"
  * target[+]
    * code = #R226.1 "Inherited parathyroid cancer (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R227 "Xeroderma pigmentosum, Trichothiodystrophy or Cockayne syndrome"
  * target[+]
    * code = #R227.1 "Xeroderma pigmentosum, Trichothiodystrophy or Cockayne syndrome (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R227.2 "Xeroderma pigmentosum, Trichothiodystrophy or Cockayne syndrome (DNA repair defect testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R228 "Tuberous sclerosis"
  * target[+]
    * code = #R228.1 "Tuberous sclerosis (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R228.2 "Tuberous sclerosis (MLPA or equivalent)"
    * equivalence = #narrower
  * target[+]
    * code = #R228.3 "Tuberous sclerosis (Small panel - deep sequencing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R229 "Confirmed Fanconi anaemia or Bloom syndrome - variant testing"
  * target[+]
    * code = #R229.1 "Confirmed Fanconi anaemia or Bloom syndrome - variant testing (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R230 "Multiple monogenic benign skin tumours"
  * target[+]
    * code = #R230.1 "Multiple monogenic benign skin tumours (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R231 "Neuronal ceroid lipofuscinosis"
  * target[+]
    * code = #R231.2 "Neuronal ceroid lipofuscinosis (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R232 "Haemophagocytic syndrome with absent perforin expression"
  * target[+]
    * code = #R232.1 "Haemophagocytic syndrome with absent perforin expression (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R233 "Agammaglobulinaemia with absent BTK expression"
  * target[+]
    * code = #R233.1 "Agammaglobulinaemia with absent BTK expression (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R234 "Severe combined immunodeficiency with PNP deficiency"
  * target[+]
    * code = #R234.1 "Severe combined immunodeficiency with PNP deficiency (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R235 "SCID with features of gamma chain deficiency"
  * target[+]
    * code = #R235.1 "SCID with features of gamma chain deficiency (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R236 "Pigmentary skin disorders"
  * target[+]
    * code = #R236.1 "Pigmentary skin disorders (WES or Large panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R236.2 "Pigmentary skin disorders (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R237 "Cutaneous photosensitivity with a likely genetic cause"
  * target[+]
    * code = #R237.1 "Cutaneous photosensitivity with a likely genetic cause (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R239 "Incontinentia pigmenti"
  * target[+]
    * code = #R239.1 "Incontinentia pigmenti (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R239.2 "Incontinentia pigmenti (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R240 "Diagnostic testing for known variant(s)"
  * target[+]
    * code = #R240.1 "Diagnostic testing for known variant(s) (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R242 "Predictive testing for known familial variant(s)"
  * target[+]
    * code = #R242.1 "Predictive testing for known familial variant(s) (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R244 "Carrier testing for known familial variant(s)"
  * target[+]
    * code = #R244.1 "Carrier testing for known familial variant(s) (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R246 "Carrier testing at population risk for partners of known carriers of nationally agreed autosomal recessive disorders"
  * target[+]
    * code = #R246.1 "Carrier testing at population risk for partners of known carriers of nationally agreed autosomal recessive disorders (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R249 "NIPD using paternal exclusion testing for very rare conditions where familial variant is known"
  * target[+]
    * code = #R249.1 "NIPD using paternal exclusion testing for very rare conditions where familial variant is known (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R250 "NIPD for congenital adrenal hyperplasia - CYP21A2 haplotype testing"
  * target[+]
    * code = #R250.1 "NIPD for congenital adrenal hyperplasia - CYP21A2 haplotype testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R251 "Non-invasive prenatal sexing"
  * target[+]
    * code = #R251.1 "Non-invasive prenatal sexing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R252 "SMA carrier testing at population risk for partners of known carriers"
  * target[+]
    * code = #R252.1 "SMA carrier testing at population risk for partners of known carriers (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R253 "Cystic fibrosis newborn screening follow-up"
  * target[+]
    * code = #R253.1 "Cystic fibrosis newborn screening follow-up (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R254 "Familial melanoma"
  * target[+]
    * code = #R254.1 "Familial melanoma (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R255 "Epidermodysplasia verruciformis"
  * target[+]
    * code = #R255.1 "Epidermodysplasia verruciformis (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R256 "Nephrocalcinosis or nephrolithiasis"
  * target[+]
    * code = #R256.1 "Nephrocalcinosis or nephrolithiasis (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R257 "Unexplained young onset end-stage renal disease"
  * target[+]
    * code = #R257.2 "Unexplained young onset end-stage renal disease (WGS)"
    * equivalence = #narrower
  * target[+]
    * code = #R257.3 "Unexplained young onset end-stage renal disease (WES)"
    * equivalence = #narrower
* group.element[+]
  * code = #R258 "Cytopenia - Fanconi breakage testing indicated"
  * target[+]
    * code = #R258.1 "Cytopenia - Fanconi breakage testing indicated (DNA repair defect testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R258.2 "Cytopenia - Fanconi breakage testing indicated (Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R259 "Nijmegen breakage syndrome"
  * target[+]
    * code = #R259.1 "Nijmegen breakage syndrome (DNA repair defect testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R259.2 "Nijmegen breakage syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R260 "Fanconi anaemia or Bloom syndrome - chromosome breakage testing"
  * target[+]
    * code = #R260.1 "Fanconi anaemia or Bloom syndrome - chromosome breakage testing (DNA repair defect testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R262 "Corneal dystrophy"
  * target[+]
    * code = #R262.1 "Corneal dystrophy (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R263 "Confirmation of uniparental disomy"
  * target[+]
    * code = #R263.1 "Confirmation of uniparental disomy (UPD testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R264 "Identity testing"
  * target[+]
    * code = #R264.1 "Identity testing (Identity testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R265 "Chromosomal mosaicism - karyotype"
  * target[+]
    * code = #R265.1 "Chromosomal mosaicism - karyotype (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R268 "Kagami-Ogata syndrome - paternal uniparental disomy 14"
  * target[+]
    * code = #R268.1 "Kagami-Ogata syndrome - paternal uniparental disomy 14 (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R270 "Smith-Lemli-Opitz syndrome"
  * target[+]
    * code = #R270.1 "Smith-Lemli-Opitz syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R270.2 "Smith-Lemli-Opitz syndrome (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R271 "Neuronal ceroid lipofuscinosis type 2"
  * target[+]
    * code = #R271.1 "Neuronal ceroid lipofuscinosis type 2 (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R272 "Gaucher disease"
  * target[+]
    * code = #R272.1 "Gaucher disease (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R273 "Glycogen storage disease V"
  * target[+]
    * code = #R273.1 "Glycogen storage disease V (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R274 "Glycogen storage disease"
  * target[+]
    * code = #R274.1 "Glycogen storage disease (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R275 "Glutaric acidaemia I newborn screening follow up"
  * target[+]
    * code = #R275.1 "Glutaric acidaemia I newborn screening follow up (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R276 "Lysosomal storage disorder"
  * target[+]
    * code = #R276.1 "Lysosomal storage disorder (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R277 "Mucopolysaccharidosis type IH/S"
  * target[+]
    * code = #R277.1 "Mucopolysaccharidosis type IH/S (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R278 "Mucopolysaccharidosis type II"
  * target[+]
    * code = #R278.1 "Mucopolysaccharidosis type II (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R278.2 "Mucopolysaccharidosis type II (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R279 "Isovaleric acidaemia newborn screening follow up"
  * target[+]
    * code = #R279.1 "Isovaleric acidaemia newborn screening follow up (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R280 "Krabbe disease – GALC deficiency"
  * target[+]
    * code = #R280.1 "Krabbe disease – GALC deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R280.2 "Krabbe disease – GALC deficiency (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R281 "Krabbe disease - Saposin A deficiency"
  * target[+]
    * code = #R281.1 "Krabbe disease - Saposin A deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R282 "Niemann-Pick disease type A or B"
  * target[+]
    * code = #R282.1 "Niemann-Pick disease type A or B (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R283 "Phenylketonuria"
  * target[+]
    * code = #R283.1 "Phenylketonuria (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R285 "Sandhoff disease"
  * target[+]
    * code = #R285.1 "Sandhoff disease (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R286 "Tay-Sachs disease"
  * target[+]
    * code = #R286.1 "Tay-Sachs disease (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R287 "Mucopolysaccharidosis type IVA"
  * target[+]
    * code = #R287.1 "Mucopolysaccharidosis type IVA (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R288 "GM1 Gangliosidosis and Mucopolysaccharidosis Type IVB"
  * target[+]
    * code = #R288.1 "GM1 Gangliosidosis and Mucopolysaccharidosis Type IVB (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R289 "Mucolipidosis II and III Alpha/Beta"
  * target[+]
    * code = #R289.1 "Mucolipidosis II and III Alpha/Beta (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R290 "Mucopolysaccharidosis type VI"
  * target[+]
    * code = #R290.1 "Mucopolysaccharidosis type VI (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R291 "Mucopolysaccharidosis type IIIA"
  * target[+]
    * code = #R291.1 "Mucopolysaccharidosis type IIIA (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R292 "Mucopolysaccharidosis type IIIB"
  * target[+]
    * code = #R292.1 "Mucopolysaccharidosis type IIIB (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R293 "Albright hereditary osteodystrophy, pseudohypoparathyroidism, pseudopseudohypoparathyroidism, acrodysostosis and osteoma cutis"
  * target[+]
    * code = #R293.1 "Albright hereditary osteodystrophy, pseudohypoparathyroidism, pseudopseudohypoparathyroidism, acrodysostosis and osteoma cutis (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R293.2 "Albright hereditary osteodystrophy, pseudohypoparathyroidism, pseudopseudohypoparathyroidism, acrodysostosis and osteoma cutis (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R294 "Ataxia telangiectasia - DNA repair testing"
  * target[+]
    * code = #R294.1 "Ataxia telangiectasia - DNA repair testing (DNA repair defect testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R295 "Ataxia telangiectasia - variant testing"
  * target[+]
    * code = #R295.1 "Ataxia telangiectasia - variant testing (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R296 "RNA analysis of variants"
  * target[+]
    * code = #R296.1 "RNA analysis of variants (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R298 "Possible structural or mosaic chromosomal abnormality - FISH"
  * target[+]
    * code = #R298.1 "Possible structural or mosaic chromosomal abnormality - FISH (FISH)"
    * equivalence = #narrower
* group.element[+]
  * code = #R299 "Possible mitochondrial disorder - mitochondrial DNA rearrangement testing"
  * target[+]
    * code = #R299.1 "Possible mitochondrial disorder - mitochondrial DNA rearrangement testing (Other)"
    * equivalence = #narrower
  * target[+]
    * code = #R299.2 "Possible mitochondrial disorder - mitochondrial DNA rearrangement testing (Other)"
    * equivalence = #narrower
  * target[+]
    * code = #R299.3 "Possible mitochondrial disorder - mitochondrial DNA rearrangement testing (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R300 "Possible mitochondrial disorder - whole mitochondrial genome sequencing"
  * target[+]
    * code = #R300.1 "Possible mitochondrial disorder - whole mitochondrial genome sequencing (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R301 "Possible mitochondrial disorder - mitochondrial DNA depletion testing"
  * target[+]
    * code = #R301.1 "Possible mitochondrial disorder - mitochondrial DNA depletion testing (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R304 "NIPD for cystic fibrosis - haplotype testing"
  * target[+]
    * code = #R304.1 "NIPD for cystic fibrosis - haplotype testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R305 "NIPD for cystic fibrosis - variant testing"
  * target[+]
    * code = #R305.1 "NIPD for cystic fibrosis - variant testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R306 "NIPD for Apert syndrome - variant testing"
  * target[+]
    * code = #R306.1 "NIPD for Apert syndrome - variant testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R307 "NIPD for Crouzon syndrome with acanthosis nigricans - variant testing"
  * target[+]
    * code = #R307.1 "NIPD for Crouzon syndrome with acanthosis nigricans - variant testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R308 "NIPD for FGFR2-related craniosynostosis syndromes - variant testing"
  * target[+]
    * code = #R308.1 "NIPD for FGFR2-related craniosynostosis syndromes - variant testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R309 "NIPD for FGFR3-related skeletal dysplasias - variant testing"
  * target[+]
    * code = #R309.1 "NIPD for FGFR3-related skeletal dysplasias - variant testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R310 "NIPD for Duchenne and Becker muscular dystrophy - haplotype testing"
  * target[+]
    * code = #R310.1 "NIPD for Duchenne and Becker muscular dystrophy - haplotype testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R311 "NIPD for spinal muscular atrophy - variant testing"
  * target[+]
    * code = #R311.1 "NIPD for spinal muscular atrophy - variant testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R312 "Parental sequencing for lethal autosomal recessive disorders"
  * target[+]
    * code = #R312.1 "Parental sequencing for lethal autosomal recessive disorders (WES or Large panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R313 "Neutropaenia consistent with ELANE variants"
  * target[+]
    * code = #R313.1 "Neutropaenia consistent with ELANE variants (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R314 "Ambiguous genitalia"
  * target[+]
    * code = #R314.1 "Ambiguous genitalia (Common aneuploidy testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R314.2 "Ambiguous genitalia (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R315 "POLG-related disorder"
  * target[+]
    * code = #R315.1 "POLG-related disorder (Targeted variant testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R315.2 "POLG-related disorder (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R316 "Pyruvate dehydrogenase (PDH) deficiency"
  * target[+]
    * code = #R316.1 "Pyruvate dehydrogenase (PDH) deficiency (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R317 "Mitochondrial liver disease, including transient infantile liver failure"
  * target[+]
    * code = #R317.1 "Mitochondrial liver disease, including transient infantile liver failure (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R318 "Recurrent miscarriage with products of conception available for testing"
  * target[+]
    * code = #R318.1 "Recurrent miscarriage with products of conception available for testing (Common aneuploidy testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R318.2 "Recurrent miscarriage with products of conception available for testing (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R319 "Calcium-sensing receptor phenotypes"
  * target[+]
    * code = #R319.1 "Calcium-sensing receptor phenotypes (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R320 "Invasive prenatal diagnosis requiring fetal sexing"
  * target[+]
    * code = #R320.1 "Invasive prenatal diagnosis requiring fetal sexing (Common aneuploidy testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R321 "Maternal cell contamination testing"
  * target[+]
    * code = #R321.1 "Maternal cell contamination testing (Identity testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R322 "Skin fibroblasts to be cultured and stored"
  * target[+]
    * code = #R322.1 "Skin fibroblasts to be cultured and stored (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R323 "Sitosterolaemia"
  * target[+]
    * code = #R323.1 "Sitosterolaemia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R324 "Familial Chylomicronaemia Syndrome (FCS)"
  * target[+]
    * code = #R324.1 "Familial Chylomicronaemia Syndrome (FCS) (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R325 "Lysosomal acid lipase deficiency"
  * target[+]
    * code = #R325.1 "Lysosomal acid lipase deficiency (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R326 "Vascular skin disorders"
  * target[+]
    * code = #R326.1 "Vascular skin disorders (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R327 "Mosaic skin disorders - deep sequencing"
  * target[+]
    * code = #R327.1 "Mosaic skin disorders - deep sequencing (Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R328 "Progressive cardiac conduction disease"
  * target[+]
    * code = #R328.1 "Progressive cardiac conduction disease (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R329 "Familial dysalbuminaemic hyperthyroxinaemia"
  * target[+]
    * code = #R329.1 "Familial dysalbuminaemic hyperthyroxinaemia (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R330 "Alveolar capillary dysplasia with misalignment of pulmonary veins"
  * target[+]
    * code = #R330.1 "Alveolar capillary dysplasia with misalignment of pulmonary veins (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R331 "Intestinal failure or congenital diarrhoea"
  * target[+]
    * code = #R331.1 "Intestinal failure or congenital diarrhoea (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R332 "Rare genetic inflammatory skin disorders"
  * target[+]
    * code = #R332.1 "Rare genetic inflammatory skin disorders (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R333 "Central congenital hypoventilation"
  * target[+]
    * code = #R333.1 "Central congenital hypoventilation (STR testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R333.2 "Central congenital hypoventilation (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R334 "Cystinosis"
  * target[+]
    * code = #R334.1 "Cystinosis (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R335 "Fabry disease"
  * target[+]
    * code = #R335.1 "Fabry disease (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R335.2 "Fabry disease (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R336 "Cerebral vascular malformations"
  * target[+]
    * code = #R336.1 "Cerebral vascular malformations (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R337 "CADASIL"
  * target[+]
    * code = #R337.1 "CADASIL (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R338 "Monitoring for G(M)CSF escape variants"
  * target[+]
    * code = #R338.1 "Monitoring for G(M)CSF escape variants (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R340 "Amelogenesis imperfecta"
  * target[+]
    * code = #R340.1 "Amelogenesis imperfecta (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R341 "Hereditary angioedema types I and II"
  * target[+]
    * code = #R341.1 "Hereditary angioedema types I and II (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R343 "Chromosomal mosaicism - microarray"
  * target[+]
    * code = #R343.1 "Chromosomal mosaicism - microarray (Microarray)"
    * equivalence = #narrower
* group.element[+]
  * code = #R344 "Primary hyperaldosteronism - KCNJ5"
  * target[+]
    * code = #R344.1 "Primary hyperaldosteronism - KCNJ5 (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R345 "Facioscapulohumeral muscular dystrophy - extended testing"
  * target[+]
    * code = #R345.1 "Facioscapulohumeral muscular dystrophy - extended testing (Methylation testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R345.2 "Facioscapulohumeral muscular dystrophy - extended testing (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R345.3 "Facioscapulohumeral muscular dystrophy - extended testing (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R346 "DNA to be stored"
  * target[+]
    * code = #R346.1 "DNA to be stored (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R347 "Inherited predisposition to acute myeloid leukaemia (AML)"
  * target[+]
    * code = #R347.1 "Inherited predisposition to acute myeloid leukaemia (AML) (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R350 "MERRF syndrome"
  * target[+]
    * code = #R350.1 "MERRF syndrome (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R351 "NARP syndrome or maternally inherited Leigh syndrome"
  * target[+]
    * code = #R351.1 "NARP syndrome or maternally inherited Leigh syndrome (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R351.2 "NARP syndrome or maternally inherited Leigh syndrome (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R352 "Mitochondrial DNA maintenance disorder"
  * target[+]
    * code = #R352.1 "Mitochondrial DNA maintenance disorder (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R353 "Mitochondrial disorder with complex I deficiency"
  * target[+]
    * code = #R353.1 "Mitochondrial disorder with complex I deficiency (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R354 "Mitochondrial disorder with complex II deficiency"
  * target[+]
    * code = #R354.1 "Mitochondrial disorder with complex II deficiency (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R355 "Mitochondrial disorder with complex III deficiency"
  * target[+]
    * code = #R355.1 "Mitochondrial disorder with complex III deficiency (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R356 "Mitochondrial disorder with complex IV deficiency"
  * target[+]
    * code = #R356.1 "Mitochondrial disorder with complex IV deficiency (WES or Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R357 "Mitochondrial disorder with complex V deficiency"
  * target[+]
    * code = #R357.1 "Mitochondrial disorder with complex V deficiency (WES or Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R361 "Sickle cell, thalassaemia and other haemoglobinopathies trait or carrier testing"
  * target[+]
    * code = #R361.1 "Sickle cell, thalassaemia and other haemoglobinopathies trait or carrier testing (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R361.2 "Sickle cell, thalassaemia and other haemoglobinopathies trait or carrier testing (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R363 "Inherited predisposition to GIST"
  * target[+]
    * code = #R363.1 "Inherited predisposition to GIST (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R364 "DICER1-related cancer predisposition"
  * target[+]
    * code = #R364.1 "DICER1-related cancer predisposition (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R365 "Fumarate hydratase-related tumour syndromes"
  * target[+]
    * code = #R365.1 "Fumarate hydratase-related tumour syndromes (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R366 "Inherited susceptibility to acute lymphoblastoid leukaemia (ALL)"
  * target[+]
    * code = #R366.1 "Inherited susceptibility to acute lymphoblastoid leukaemia (ALL) (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R367 "Inherited pancreatic cancer"
  * target[+]
    * code = #R367.1 "Inherited pancreatic cancer (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R368 "Hereditary angioedema type III"
  * target[+]
    * code = #R368.1 "Hereditary angioedema type III (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R370 "Validation of unaccredited findings"
  * target[+]
    * code = #R370.1 "Validation of unaccredited findings (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R371 "Malignant hyperthermia"
  * target[+]
    * code = #R371.1 "Malignant hyperthermia (small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R372 "Newborn screening for sickle cell disease in a transfused baby"
  * target[+]
    * code = #R372.1 "Newborn screening for sickle cell disease in a transfused baby (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R373 "RNA to be stored"
  * target[+]
    * code = #R373.1 "RNA to be stored (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R374 "Other sample to be stored"
  * target[+]
    * code = #R374.1 "Other sample to be stored (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R375 "Family follow-up testing to aid variant interpretation"
  * target[+]
    * code = #R375.1 "Family follow-up testing to aid variant interpretation (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R376 "Segmental or atypical neurofibromatosis type 1 testing"
  * target[+]
    * code = #R376.1 "Segmental or atypical neurofibromatosis type 1 testing (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R376.2 "Segmental or atypical neurofibromatosis type 1 testing (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R380 "Niemann Pick disease type C"
  * target[+]
    * code = #R380.1 "Niemann Pick disease type C (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R380.2 "Niemann Pick disease type C (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R381 "Other rare neuromuscular disorders"
  * target[+]
    * code = #R381.2 "Other rare neuromuscular disorders (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R382 "Hypochondroplasia"
  * target[+]
    * code = #R382.1 "Hypochondroplasia (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R383 "Linkage testing for Huntington disease"
  * target[+]
    * code = #R383.1 "Linkage testing for Huntington disease (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R384 "Generalised arterial calcification in infancy"
  * target[+]
    * code = #R384.1 "Generalised arterial calcification in infancy (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R387 "Reanalysis of existing data"
  * target[+]
    * code = #R387.1 "Reanalysis of existing data (Other)"
    * equivalence = #narrower
* group.element[+]
  * code = #R389 "NIPD - pre-pregnancy test work-up"
  * target[+]
    * code = #R389.1 "NIPD - pre-pregnancy test work-up (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R390 "Multiple exostoses"
  * target[+]
    * code = #R390.1 "Multiple exostoses (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R390.2 "Multiple exostoses (MLPA or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R391 "Barth syndrome"
  * target[+]
    * code = #R391.1 "Barth syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R394 "Mitochondrial neurogastrointestinal encephalopathy"
  * target[+]
    * code = #R394.1 "Mitochondrial neurogastrointestinal encephalopathy (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R395 "Thiamine metabolism dysfunction syndrome 2"
  * target[+]
    * code = #R395.1 "Thiamine metabolism dysfunction syndrome 2 (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R396 "Mitochondrial Complex V deficiency, TMEM70 type"
  * target[+]
    * code = #R396.1 "Mitochondrial Complex V deficiency, TMEM70 type (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R397 "Maternally inherited cardiomyopathy"
  * target[+]
    * code = #R397.1 "Maternally inherited cardiomyopathy (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R401 "Common aneuploidy testing - prenatal"
  * target[+]
    * code = #R401.1 "Common aneuploidy testing - prenatal (Common aneuploidy testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R402 "Premature ovarian insufficiency"
  * target[+]
    * code = #R402.1 "Premature ovarian insufficiency (Karyotype or equivalent)"
    * equivalence = #narrower
  * target[+]
    * code = #R402.2 "Premature ovarian insufficiency (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R403 "MCADD - Medium-chain acyl-CoA dehydrogenase deficiency – full ACADM sequencing newborn screening follow up"
  * target[+]
    * code = #R403.1 "MCADD - Medium-chain acyl-CoA dehydrogenase deficiency – full ACADM sequencing newborn screening follow up (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R404 "Testing of unaffected individuals for inherited cancer predisposition syndromes"
  * target[+]
    * code = #R404.1 "Testing of unaffected individuals for inherited cancer predisposition syndromes (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
  * target[+]
    * code = #R404.3 "Testing of unaffected individuals for inherited cancer predisposition syndromes (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R405 "Hereditary Erythrocytosis"
  * target[+]
    * code = #R405.1 "Hereditary Erythrocytosis (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R406 "Thrombocythaemia"
  * target[+]
    * code = #R406.1 "Thrombocythaemia (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R409 "Linkage testing for other recognisable Mendelian disorders"
  * target[+]
    * code = #R409.1 "Linkage testing for other recognisable Mendelian disorders (Linkage analysis)"
    * equivalence = #narrower
* group.element[+]
  * code = #R410 "Myotonic dystrophy type 2 (DM2)"
  * target[+]
    * code = #R410.1 "Myotonic dystrophy type 2 (DM2) (STR testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R411 "Y chromosome microdeletion"
  * target[+]
    * code = #R411.1 "Y chromosome microdeletion (Targeted variant testing or equivalent)"
    * equivalence = #narrower
* group.element[+]
  * code = #R412 "Fetal anomalies with a likely genetic cause - non urgent"
  * target[+]
    * code = #R412.1 "Fetal anomalies with a likely genetic cause - non urgent (WES or Large Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R413 "Autoinflammatory Disorders"
  * target[+]
    * code = #R413.1 "Autoinflammatory Disorders (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R414 "APC associated Polyposis"
  * target[+]
    * code = #R414.1 "APC associated Polyposis (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R416 "Syndromic and non syndromic craniosynostosis involving midline sutures"
  * target[+]
    * code = #R416.1 "Syndromic and non syndromic craniosynostosis involving midline sutures (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R417 "Multi Locus Imprinting Disorder (MLID)"
  * target[+]
    * code = #R417.1 "Multi Locus Imprinting Disorder (MLID) (MLPA)"
    * equivalence = #narrower
  * target[+]
    * code = #R417.2 "Multi Locus Imprinting Disorder (MLID) (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R419 "Acute Rhabdomyolysis"
  * target[+]
    * code = #R419.1 "Acute Rhabdomyolysis (Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R420 "Pseudoxanthoma elasticum"
  * target[+]
    * code = #R420.1 "Pseudoxanthoma elasticum (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R421 "Pulmonary Fibrosis, Familial"
  * target[+]
    * code = #R421.1 "Pulmonary Fibrosis, Familial (Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R422 "BAP1 associated tumour predisposition syndrome"
  * target[+]
    * code = #R422.1 "BAP1 associated tumour predisposition syndrome (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R423 "NIPD for Retinoblastoma - haplotype testing"
  * target[+]
    * code = #R423.1 "NIPD for Retinoblastoma - haplotype testing (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R424 "Subcutaneous panniculitis T-cell lymphoma (SPTCL)"
  * target[+]
    * code = #R424.1 "Subcutaneous panniculitis T-cell lymphoma (SPTCL) (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R426 "Pulmonary alveolar microlithiasis"
  * target[+]
    * code = #R426.1 "Pulmonary alveolar microlithiasis (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R428 "Patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected)"
  * target[+]
    * code = #R428.1 "Patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected) (STR testing)"
    * equivalence = #narrower
  * target[+]
    * code = #R428.2 "Patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected) (FISH)"
    * equivalence = #narrower
* group.element[+]
  * code = #R430 "Inherited prostate cancer"
  * target[+]
    * code = #R430.1 "Inherited prostate cancer (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R431 "Genome-wide DNA Methylation Profiling to Aid Variant Interpretation"
  * target[+]
    * code = #R431.1 "Genome-wide DNA Methylation Profiling to Aid Variant Interpretation (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R433 "Monogenic diabetes, subtype glucokinase - NIPT"
  * target[+]
    * code = #R433.1 "Monogenic diabetes, subtype glucokinase - NIPT (NIPD)"
    * equivalence = #narrower
* group.element[+]
  * code = #R436 "Hereditary alpha tryptasaemia"
  * target[+]
    * code = #R436.1 "Hereditary alpha tryptasaemia (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R438 "Paediatric pseudo-obstruction syndrome"
  * target[+]
    * code = #R438.1 "Paediatric pseudo-obstruction syndrome (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R440 "Hereditary isolated diabetes insipidus"
  * target[+]
    * code = #R440.1 "Hereditary isolated diabetes insipidus (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R441 "Unexplained death in infancy and sudden unexplained death in childhood"
  * target[+]
    * code = #R441.1 "Unexplained death in infancy and sudden unexplained death in childhood (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R442 "Variant re-interpretation"
  * target[+]
    * code = #R442.1 "Variant re-interpretation (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R443 "Confirmation test"
  * target[+]
    * code = #R443.1 "Confirmation test (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R444 "NICE approved PARP inhibitor treatment"
  * target[+]
    * code = #R444.1 "NICE approved PARP inhibitor treatment (Small panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R444.2 "NICE approved PARP inhibitor treatment (Small panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R445 "T21, T18 and T13 aneuploidy testing - NIPT (previous history)"
  * target[+]
    * code = #R445.1 "T21, T18 and T13 aneuploidy testing - NIPT (previous history) (NIPT)"
    * equivalence = #narrower
* group.element[+]
  * code = #R446 "APOL1 kidney donor testing"
  * target[+]
    * code = #R446.1 "APOL1 kidney donor testing (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R447 "Validation of WGS Diagnostic discovery"
  * target[+]
    * code = #R447.1 "Validation of WGS Diagnostic discovery (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R448 "Prenatal testing"
  * target[+]
    * code = #R448.1 "Prenatal testing (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R449 "Diagnostic testing for Glutaric acidaemia I"
  * target[+]
    * code = #R449.1 "Diagnostic testing for Glutaric acidaemia I (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R450 "Diagnostic testing for Isovaleric acidaemia"
  * target[+]
    * code = #R450.1 "Diagnostic testing for Isovaleric acidaemia (Single gene sequencing >=10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R451 "Diagnostic testing for MCADD - Medium-chain acyl-CoA dehydrogenase deficiency – full ACADM sequencing"
  * target[+]
    * code = #R451.1 "Diagnostic testing for MCADD - Medium-chain acyl-CoA dehydrogenase deficiency – full ACADM sequencing (Single gene sequencing <10 amplicons)"
    * equivalence = #narrower
* group.element[+]
  * code = #R452 "Silver russell syndrome and Temple Syndrome"
  * target[+]
    * code = #R452.1 "Silver russell syndrome and Temple Syndrome (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R453 "Monogenic short stature"
  * target[+]
    * code = #R453.1 "Monogenic short stature (WES or Medium panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R454 "Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy"
  * target[+]
    * code = #R454.1 "Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy (Targeted variant testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R456 "Embryonal tumour of possible germline origin"
  * target[+]
    * code = #R456.1 "Embryonal tumour of possible germline origin (WES or Medium Panel)"
    * equivalence = #narrower
  * target[+]
    * code = #R456.2 "Embryonal tumour of possible germline origin (Methylation testing)"
    * equivalence = #narrower
* group.element[+]
  * code = #R457 "Sarcoma of possible germline origin"
  * target[+]
    * code = #R457.1 "Sarcoma of possible germline origin (Small Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R458 "Young onset or familial dementia"
  * target[+]
    * code = #R458.1 "Young onset or familial dementia (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R459 "Young onset or complex Parkinson disease"
  * target[+]
    * code = #R459.1 "Young onset or complex Parkinson disease (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R460 "Amyotrophic lateral sclerosis"
  * target[+]
    * code = #R460.1 "Amyotrophic lateral sclerosis (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R461 "Cerebral amyloid angiopathy"
  * target[+]
    * code = #R461.1 "Cerebral amyloid angiopathy (WGS)"
    * equivalence = #narrower
* group.element[+]
  * code = #R462 "Childhood interstitial lung disease"
  * target[+]
    * code = #R462.1 "Childhood interstitial lung disease (Medium Panel)"
    * equivalence = #narrower
* group.element[+]
  * code = #R463 "Cytogenetic characterisation of a genomic abnormality – Karyotype or Targeted Chromosome Analysis"
  * target[+]
    * code = #R463.1 "Cytogenetic characterisation of a genomic abnormality – Karyotype or Targeted Chromosome Analysis (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R464 "Recurrent miscarriage where products of conception are not available for testing - parental karyotype"
  * target[+]
    * code = #R464.1 "Recurrent miscarriage where products of conception are not available for testing - parental karyotype (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R465 "Familial cytogenetic rearrangement - Karyotype or Targeted Chromosome Analysis"
  * target[+]
    * code = #R465.1 "Familial cytogenetic rearrangement - Karyotype or Targeted Chromosome Analysis (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R466 "Unexplained infertility - karyotype"
  * target[+]
    * code = #R466.1 "Unexplained infertility - karyotype (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R467 "Gamete donors - karyotype"
  * target[+]
    * code = #R467.1 "Gamete donors - karyotype (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R468 "Possible sex chromosome aneuploidy or structural rearrangement – Targeted Chromosome Analysis"
  * target[+]
    * code = #R468.1 "Possible sex chromosome aneuploidy or structural rearrangement – Targeted Chromosome Analysis (Karyotype)"
    * equivalence = #narrower
* group.element[+]
  * code = #R470 "T21, T18, and T13 aneuploidy testing - NIPT NHS Fetal Anomaly Screening Programme (FASP)"
  * target[+]
    * code = #R470.1 "T21, T18, and T13 aneuploidy testing - NIPT NHS Fetal Anomaly Screening Programme (FASP) (NIPT)"
    * equivalence = #narrower
* group.element[+]
  * code = #R471 "Neurodegenerative Disorders, adult onset – Prenatal Exclusion Testing"
  * target[+]
    * code = #R471.1 "Neurodegenerative Disorders, adult onset – Prenatal Exclusion Testing (Linkage analysis)"
    * equivalence = #narrower
  * target[+]
    * code = #R471.2 "Neurodegenerative Disorders, adult onset – Prenatal Exclusion Testing (Linkage analysis)"
    * equivalence = #narrower
  * target[+]
    * code = #R471.3 "Neurodegenerative Disorders, adult onset – Prenatal Exclusion Testing (Linkage analysis)"
    * equivalence = #narrower
  * target[+]
    * code = #R471.4 "Neurodegenerative Disorders, adult onset – Prenatal Exclusion Testing (Linkage analysis)"
    * equivalence = #narrower
