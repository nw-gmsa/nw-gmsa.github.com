Instance: GenomicTestCodeToDigitalGenomicTestServices
InstanceOf: ConceptMap
Title: "Genomic Test Code (M*) to Digital Genomic Test Services (GT)"
Description: """
Legacy `M*` test codes (`GenomicTestCode`/`England-GenomicTestDirectory`) for
Haematological Oncology and Cancer CNS, mapped to the `GT*` codes that replace
them - taken directly from the `Legacy 'M' codes` column in NHS England's
Haematological Oncology (v1.1) and Cancer CNS (v2) national genomic test
directories, not inferred. Not 1:1 throughout: several old `M*` tests were
consolidated into one `GT` code (`equivalence = #equivalent`), and a smaller
number split or shared across more than one `GT` code, recorded as multiple
`target`s with `equivalence = #relatedto` rather than an arbitrary pick.

Built by [nw-gmsa/Testing notebook 14](https://github.com/nw-gmsa/Testing/blob/main/notebooks/14-national-genomic-test-directory-codesystems.ipynb), checked against v1.1/v2 on 2026-09-05.
"""
Usage:  #definition

* name = "GenomicTestCodeToDigitalGenomicTestServices"
* experimental = false
* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/GenomicTestCodeToDigitalGenomicTestServices"
* version = "2026-09-05"
* status = #active

* group.source = "https://fhir.nhs.uk/CodeSystem/England-GenomicTestDirectory"
* group.sourceVersion = "2026-09-05"
* group.target = "https://fhir.nhs.uk/CodeSystem/England-DigitalGenomicTestServices"
* group.targetVersion = "2026-09-05"

* group.element[+]
  * code = #M1.6 "Colorectal Carcinoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M2.3 "Ovarian Carcinoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M3.5 "Breast Cancer, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M5.1 "Mesothelioma, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M5.2 "Mesothelioma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M7.3 "Melanoma, Adult, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M7.9 "Melanoma, Adult, CDKN2A & 9cen"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M8.2 "Gastrointestinal Stromal Tumour, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M9.4 "Thyroid Papillary Carcinoma, Adult, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M11.3 "Poorly Differentiated Anaplastic Thyroid Carcinoma, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M12.2 "Thyroid Medullary Carcinoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M13.2 "Phaeochromocytoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M14.3 "Adrenal Cortical Carcinoma, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M14.4 "Adrenal Cortical Carcinoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M15.5 "Head and Neck Squamous Cell Carcinoma, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M15.6 "Head and Neck Squamous Cell Carcinoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M17.2 "Secretory Carcinoma (Salivary Gland), Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M20.1 "Anaplastic Astrocytoma, Paediatric, Multi-target NGS panel, small variant (BRAF)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M20.2 "Anaplastic Astrocytoma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M20.3 "Anaplastic Astrocytoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M20.4 "Anaplastic Astrocytoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M20.5 "Anaplastic Astrocytoma, Paediatric, Multi-target NGS panel, structural variant  (BRAF-KIAA1549, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.1 "Astrocytoma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A,H3C2, BRAF, TERT promoter)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.2 "Astrocytoma, Adult, Multi-target NGS panel, copy number variant (EGFR, CDKN2A, CDKN2B)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.3 "Astrocytoma, Adult, EGFRvIII RT-PCR"
  * target[+]
    * code = #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.5 "Astrocytoma, Adult, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.6 "Astrocytoma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.8 "Astrocytoma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.9 "Astrocytoma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.20 "Astrocytoma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.21 "Astrocytoma, Adult, Multi-target NGS panel, structural variant (EGFRvIII, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.22 "Astrocytoma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.23 "Astrocytoma, Adult, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M21.24 "Astrocytoma, Adult, CDKN2B copy number FISH"
  * target[+]
    * code = #GT1129 "CDKN2B CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.1 "Diffuse Astrocytoma, Paediatric, Multi-target NGS panel, small variant (H3C2, H3C14, IDH1, IDH2)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.2 "Diffuse Astrocytoma, Paediatric, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.3 "Diffuse Astrocytoma, Paediatric, MYC rearrangement FISH"
  * target[+]
    * code = #GT27 "MYC rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.4 "Diffuse Astrocytoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.5 "Diffuse Astrocytoma, Paediatric, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.6 "Diffuse Astrocytoma, Paediatric, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.7 "Diffuse Astrocytoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.8 "Diffuse Astrocytoma, Paediatric, Multi-target NGS panel, copy number variant (MYC)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.9 "Diffuse Astrocytoma, Paediatric, Multi-target NGS panel, structural variant  (MYC, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.10 "Diffuse Astrocytoma, Paediatric, MYB rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT778 "MYB rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.11 "Diffuse Astrocytoma, Paediatric, MYBL1 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT1138 "MYBL1 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M22.12 "Diffuse Astrocytoma, Paediatric, MN1 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT1280 "MN1 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.1 "Diffuse Midline Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, TERT promoter,  H3-3A)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.6 "Diffuse Midline Glioma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.7 "Diffuse Midline Glioma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.8 "Diffuse Midline Glioma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.9 "Diffuse Midline Glioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.10 "Diffuse Midline Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.11 "Diffuse Midline Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M23.12 "Diffuse Midline Glioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M24.1 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, C19MC copy number  FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #relatedto
* group.element[+]
  * code = #M24.2 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, TTYH1-C19MC FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M24.3 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M24.4 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M24.5 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, Multi-target NGS panel, copy number variant (C19MC)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M24.6 "Embryonal Tumours with Multi-Layered Rosettes, Paediatric, Multi-target NGS panel, structural variant  (TTYH1-C19MC, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.1 "Ependymoma, Paediatric, Multi-target NGS panel, small variant (YAP1)"
  * target[+]
    * code = #GT1260 "Ependymal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.2 "Ependymoma, Paediatric, YAP1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.3 "Ependymoma, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.4 "Ependymoma, Paediatric, YAP1-TFE3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.5 "Ependymoma, Paediatric, C11orf95-RELA FISH/RT-PCR"
  * target[+]
    * code = #GT1332 "ZFTA rearrangements FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.6 "Ependymoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.7 "Ependymoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.8 "Ependymoma, Paediatric, Multi-target NGS panel, copy number variant (YAP1, MYCN)"
  * target[+]
    * code = #GT1260 "Ependymal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.9 "Ependymoma, Paediatric, Multi-target NGS panel, structural variant  (YAP1-C11orf95, YAP1-TFE3, C11orf95-RELA, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1418 "Ependymal Tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.10 "Ependymoma, Paediatric, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M25.11 "Ependymoma, Paediatric, ZFTA rearrangements (several fusion partners)"
  * target[+]
    * code = #GT1332 "ZFTA rearrangements FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M26.1 "Ependymoma Supratentorial, Adult, YAP1 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT583 "YAP1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M26.2 "Ependymoma, Adult, RELA rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT453 "RELA rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M26.3 "Ependymoma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M26.4 "Ependymoma, Adult, Multi-target NGS panel, structural variant  (YAP1, RELA, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1418 "Ependymal Tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M26.5 "Ependymoma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M26.6 "Ependymoma, Adult, ZFTA rearrangements (several fusion partners)"
  * target[+]
    * code = #GT1332 "ZFTA rearrangements FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.1 "Glioblastoma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3C2, BRAF, TERT promoter)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.2 "Glioblastoma, Adult, Multi-target NGS panel, copy number variant (EGFR, PDGFRA, MYC, PTEN, 1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.3 "Glioblastoma, Adult, EGFRvIII RT-PCR"
  * target[+]
    * code = #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.5 "Glioblastoma, Adult, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.6 "Glioblastoma, Adult, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.7 "Glioblastoma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.9 "Glioblastoma, Adult, PDGFRA copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.10 "Glioblastoma, Adult, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.11 "Glioblastoma, Adult, PTEN (10q23) copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.12 "Glioblastoma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.13 "Glioblastoma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.14 "Glioblastoma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.15 "Glioblastoma, Adult, Multi-target NGS panel, structural variant (EGFRvIII, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M27.16 "Glioblastoma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.1 "Glioma, Adult, Multi-target NGS panel, small variant (H3C2, H3C3, H3C14, H3-3A, H3-3B, IDH1, IDH2, TP53, VHL, TERT promoter)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.2 "Glioma, Adult, Multi-target NGS panel, copy number variant (EGFR, 1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.3 "Glioma, Adult, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.4 "Glioma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.5 "Glioma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.6 "Glioma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.7 "Glioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.8 "Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M28.9 "Glioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.1 "High Grade Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, TERT promoter, H3-3A, H3C2)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.2 "High Grade Glioma, Adult, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.3 "High Grade Glioma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.4 "High Grade Glioma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.5 "High Grade Glioma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.6 "High Grade Glioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.7 "High Grade Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.8 "High Grade Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M29.9 "High Grade Glioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M30.1 "IDH-Wildtype Glioblastoma, Paediatric, Multi-target NGS panel, small variant (RB1, NF1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M30.2 "IDH-Wildtype Glioblastoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M30.3 "IDH-Wildtype Glioblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M30.4 "IDH-Wildtype Glioblastoma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.1 "Low Grade Glioma, Adult, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.2 "Low Grade Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, TERT promoter, H3-3A, H3C2)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.3 "Low Grade Glioma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.4 "Low Grade Glioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.5 "Low Grade Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.6 "Low Grade Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M31.7 "Low Grade Glioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M32.1 "Low Grade Glioma/Glioneuronal Tumours, Adult, Multi-target NGS panel, small variant (BRAF, IDH1, IDH2, TERT promoter, H3-3A, H3C2)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M32.2 "Low Grade Glioma/Glioneuronal Tumours, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M32.3 "Low Grade Glioma/Glioneuronal Tumours, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M32.4 "Low Grade Glioma/Glioneuronal Tumours, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M32.5 "Low Grade Glioma/Glioneuronal Tumours, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M32.6 "Low Grade Glioma/Glioneuronal Tumours, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M33.3 "Meningioma, Adult, Multi-target NGS panel, small variant (TERT promoter)"
  * target[+]
    * code = #GT1420 "Meningiomas Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M33.4 "Meningioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M33.5 "Meningioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT259 "Meningioma WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.1 "Non-Midline Glioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, TERT promoter, H3-3A, H3C2)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.2 "Non-Midline Glioma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.3 "Non-Midline Glioma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.4 "Non-Midline Glioma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.5 "Non-Midline Glioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.6 "Non-Midline Glioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.7 "Non-Midline Glioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M34.8 "Non-Midline Glioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.1 "OligodendroGlioma, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3C2, BRAF, TERT promoter)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.2 "OligodendroGlioma, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.4 "OligodendroGlioma, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.5 "OligodendroGlioma, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.6 "OligodendroGlioma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.7 "OligodendroGlioma, Adult, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.8 "OligodendroGlioma, Adult, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M35.9 "OligodendroGlioma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.1 "Pilocytic Astrocytoma, Adult, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.2 "Pilocytic Astrocytoma, Adult, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.3 "Pilocytic Astrocytoma, Adult, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.4 "Pilocytic Astrocytoma, Adult, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.5 "Pilocytic Astrocytoma, Adult, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.6 "Pilocytic Astrocytoma, Adult, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.7 "Pilocytic Astrocytoma, Adult, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.8 "Pilocytic Astrocytoma, Adult, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.9 "Pilocytic Astrocytoma, Adult, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.10 "Pilocytic Astrocytoma, Adult, KIAA1549 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.11 "Pilocytic Astrocytoma, Adult, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.12 "Pilocytic Astrocytoma, Adult, Multi-target NGS panel, small variant (BRAF, CDKN2A)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.13 "Pilocytic Astrocytoma, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.14 "Pilocytic Astrocytoma, Adult, Multi-target NGS panel, structural variant  (BRAF-KIAA1549, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B, BRAF-FXR1, BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.15 "Pilocytic Astrocytoma, Adult, Multi-target NGS panel, copy number variant (KIAA1549, CDKN2A)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M36.16 "Pilocytic Astrocytoma, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M37.1 "Pineoblastoma, Paediatric, Multi-target NGS panel, small variant (DICER1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M37.2 "Pineoblastoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M37.3 "Pineoblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M37.4 "Pineoblastoma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M38.1 "Pituitary Tumours, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M38.2 "Pituitary Tumours, Multi-target NGS panel, copy number variant (EGFR)"
  * target[+]
    * code = #GT1405 "Tumours of the Sellar Region and Pituitary Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M38.3 "Pituitary Tumours, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M38.4 "Pituitary Tumours, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M38.5 "Pituitary Tumours, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M38.6 "Pituitary Tumours, WGS Germline and Tumor"
  * target[+]
    * code = #GT1433 "Tumours of the Sellar Region and Pituitary Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M39.1 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, Multi-target NGS panel, small variant (CDKN2A)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M39.2 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M39.3 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M39.4 "Rare Primitive Neuroectodermal Tumours Groups 2/3, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M45.1 "Angiomatoid Fibrous Histiocytoma, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M46.3 "Chondrosarcoma Conventional Central, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M47.1 "Chondroblastoma, SNP Array"
  * target[+]
    * code = #GT854 "SNP Array"
    * equivalence = #equivalent
* group.element[+]
  * code = #M47.3 "Chondroblastoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M48.1 "Clear Cell Sarcoma of Soft Tissue, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M54.1 "Epithelioid Haemangioendothelioma, WWTR1-CAMTA1 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M55.2 "Ewing Like Sarcoma/PNET, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M56.1 "Ewing Sarcoma of Bone, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M57.2 "Ewing-Like Soft-Tissue Sarcoma, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M60.3 "Giant Cell Tumour of Bone, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M61.2 "High-Grade Neuroepithelial Tumour-Bcor Group, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M66.1 "Myoepithelial Tumours of Soft Tissue, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M70.3 "Osteosarcoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M72.2 "Primitive Mesenchymal Myxoid Tumour of Infancy, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M73.1 "Pseudomyogenic Haemangioendothelioma, SERPINE1-FOSB FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M74.1 "Radiation Induced Angiosarcoma, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M74.3 "Radiation Induced Angiosarcoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M75.2 "Round Cell Sarcoma Nos, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M79.3 "Well Differentiated/Dedifferentiated Liposarcoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.1 "Acute Myeloid Leukaemia, WGS Germline and Tumor"
  * target[+]
    * code = #GT726 "WGS Germline & Tumour - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.2 "Acute Myeloid Leukaemia, Multi-target NGS panel, small variant (NPM1, CEBPA, RUNX1, FLT3, IDH1, IDH2, KIT, WT1, ASXL1, SRSF2, STAG2, RAD21, TP53, KRAS, NRAS, KMT2A(MLL)-PTD), PPM1D, DDX41, PHF6, CUX1"
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.3 "Acute Myeloid Leukaemia, Karyotype (To include detection of Complex karyotype, Monosomal karyotype)"
  * target[+]
    * code = #GT1096 "Karyotype - AML, ALL & CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT17 "SNP Array - AML"
    * equivalence = #relatedto
* group.element[+]
  * code = #M80.5 "Acute Myeloid Leukaemia, Other: See tests M80.25-M80.40 for individual specified FISH targets."
  * target[+]
    * code = #GT716 "Other FISH Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.7 "Acute Myeloid Leukaemia, Other RT-PCR: See tests M80.41-80.52 for individual specified RT-PCR targets."
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.8 "Acute Myeloid Leukaemia, Multi-target NGS panel, structural variant (To include detection of  Complex karyotype)"
  * target[+]
    * code = #GT185 "Next Generation Sequencing Panel - Structural Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.9 "Acute Myeloid Leukaemia, MRD NPM1 RT-qPCR"
  * target[+]
    * code = #GT1062 "MRD NPM1 - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.10 "Acute Myeloid Leukaemia, MRD PML-RARA RT-qPCR"
  * target[+]
    * code = #GT475 "MRD PML::RARA - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.11 "Acute Myeloid Leukaemia, MRD RUNX1-RUNX1T1 RT-qPCR"
  * target[+]
    * code = #GT343 "MRD RUNX1::RUNX1T1 - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.12 "Acute Myeloid Leukaemia, MRD CBFB-MYH11 RT-qPCR"
  * target[+]
    * code = #GT870 "MRD CBFB::MYH11 - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.13 "Acute Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR"
  * target[+]
    * code = #GT31 "MRD BCR::ABL1 - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.14 "Acute Myeloid Leukaemia, MRD other QF-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.15 "Acute Myeloid Leukaemia, BCR-ABL1 TKD NGS"
  * target[+]
    * code = #GT303 "BCR::ABL1 TKD Variants - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.18 "Acute Myeloid Leukaemia, FLT3 ITD"
  * target[+]
    * code = #GT533 "FLT3 ITD Targeted Assay - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.19 "Acute Myeloid Leukaemia, Multi-target NGS panel, small variant (GATA1)"
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.21 "Acute Myeloid Leukaemia, FLT3 TKD hotspot"
  * target[+]
    * code = #GT916 "FLT3 TKD Targeted Assay - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.22 "Acute Myeloid Leukaemia, NPM1 exon 12 hotspot"
  * target[+]
    * code = #GT921 "NPM1 Hotspot (exon 12) - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.23 "Acute Myeloid Leukaemia, IDH1 hotspot"
  * target[+]
    * code = #GT494 "IDH1 Hotspot (R132 Variants) - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.24 "Acute Myeloid Leukaemia, IDH2 hotspot"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
* group.element[+]
  * code = #M80.25 "Acute Myeloid Leukaemia, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1294 "Chromosome 5 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.26 "Acute Myeloid Leukaemia, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT700 "Chromosome 7 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.27 "Acute Myeloid Leukaemia, Chr17/Chr17p copy number FISH"
  * target[+]
    * code = #GT1064 "Chromosome 17 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.28 "Acute Myeloid Leukaemia, Chr12/Chr12p copy number FISH"
  * target[+]
    * code = #GT14 "Chromosome 12 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.29 "Acute Myeloid Leukaemia, t(15;17)(q24;q21) PML-RARA FISH"
  * target[+]
    * code = #GT133 "PML::RARA, t(15;17)(q24;q21) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.30 "Acute Myeloid Leukaemia, t(8;21)(q22;q22) RUNX1-RUNX1T1 FISH"
  * target[+]
    * code = #GT101 "RUNX1::RUNX1T1, t(8;21)(q22;q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.31 "Acute Myeloid Leukaemia, inv(16)(p13.1q22) CBFB-MYH11 FISH"
  * target[+]
    * code = #GT275 "CBFB::MYH11, inv(16)(p13.1q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.32 "Acute Myeloid Leukaemia, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 ( KMT2A) rearrangements FISH"
  * target[+]
    * code = #GT258 "MLLT3::KMT2A, t(9;11)(p21;q23) & other KMT2A rearrangements FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.33 "Acute Myeloid Leukaemia, t(6;9)(p22;q34) DEK-NUP214 FISH"
  * target[+]
    * code = #GT61 "DEK::NUP214, t(6;9)(p22;q34) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.34 "Acute Myeloid Leukaemia, inv(3)(q21q26) GATA2-MECOM FISH"
  * target[+]
    * code = #GT157 "GATA2::MECOM, inv(3)(q21q26) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.35 "Acute Myeloid Leukaemia, t(1;22)(p13;q13) RBM15-MRTFA FISH"
  * target[+]
    * code = #GT112 "RBM15::MRTFA, t(1;22)(p13;q13) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.36 "Acute Myeloid Leukaemia, t(9;22)(q34;q11) BCR-ABL1 FISH"
  * target[+]
    * code = #GT1033 "BCR::ABL1, t(9;22)(q34;q11) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.37 "Acute Myeloid Leukaemia, t(3;5)(q25;q34) NPM1-MLF1 FISH"
  * target[+]
    * code = #GT180 "NPM1::MLF1, t(3;5)(q25;q34) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.38 "Acute Myeloid Leukaemia, t(5;11)(q35;p15.5) NUP98-NSD1 FISH"
  * target[+]
    * code = #GT74 "NUP98::NSD1, t(5;11)(q35;p15.5) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.39 "Acute Myeloid Leukaemia, t(7;12)(q36;p13) MNX1-ETV6 FISH"
  * target[+]
    * code = #GT656 "MNX1::ETV6, t(7;12)(q36;p13) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.40 "Acute Myeloid Leukaemia, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 FISH"
  * target[+]
    * code = #GT289 "CBFA2T3::GLIS2, inv(16)(p13.3q24.3) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.41 "Acute Myeloid Leukaemia, t(15;17)(q24;q21) PML-RARA RT-PCR"
  * target[+]
    * code = #GT133 "PML::RARA, t(15;17)(q24;q21) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.42 "Acute Myeloid Leukaemia, t(8;21)(q22;q22) RUNX1-RUNX1T1 RT-PCR"
  * target[+]
    * code = #GT101 "RUNX1::RUNX1T1, t(8;21)(q22;q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.43 "Acute Myeloid Leukaemia, inv(16)(p13.1q22) CBFB-MYH11 RT-PCR"
  * target[+]
    * code = #GT275 "CBFB::MYH11, inv(16)(p13.1q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.44 "Acute Myeloid Leukaemia, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 (KMT2A) rearrangements RT-PCR"
  * target[+]
    * code = #GT258 "MLLT3::KMT2A, t(9;11)(p21;q23) & other KMT2A rearrangements FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.45 "Acute Myeloid Leukaemia, t(6;9)(p22;q34) DEK-NUP214 RT-PCR"
  * target[+]
    * code = #GT61 "DEK::NUP214, t(6;9)(p22;q34) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.46 "Acute Myeloid Leukaemia, inv(3)(q21q26) GATA2-MECOM RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.47 "Acute Myeloid Leukaemia, t(1;22)(p13;q13) RBM15-MRTFA RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.48 "Acute Myeloid Leukaemia, t(9;22)(q34;q11) BCR-ABL1 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.49 "Acute Myeloid Leukaemia, t(3;5)(q25;q34) NPM1-MLF1 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.50 "Acute Myeloid Leukaemia, t(5;11)(q35;p15.5) NUP98-NSD1 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.51 "Acute Myeloid Leukaemia, t(7;12)(q36;p13) MNX1-ETV6 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.52 "Acute Myeloid Leukaemia, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.53 "Acute Myeloid Leukaemia, Multi-target NGS panel, copy number variant (Monosomal karyotype, del5/del5q, del7/del7q, del17/del17p, del12/del12p)"
  * target[+]
    * code = #GT629 "Next Generation Sequencing Panel - Copy Number Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.54 "Acute Myeloid Leukaemia, NUP98 rearrangement FISH"
  * target[+]
    * code = #GT1166 "NUP98, 11p15 FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.55 "Acute Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR rare"
  * target[+]
    * code = #GT673 "MRD BCR::ABL1 Rare Transcripts - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.56 "Acute Myeloid Leukaemia, MRD NPM1 RT-qPCR rare"
  * target[+]
    * code = #GT1228 "MRD NPM1 Rare Transcripts - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.57 "Acute Myeloid Leukaemia, WGS Tumour First"
  * target[+]
    * code = #GT24 "WGS Tumour First - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M80.58 "Acute Myeloid Leukaemia, WGS Follow-up Germline"
  * target[+]
    * code = #GT802 "WGS Follow-up Germline - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M81.1 "Transient Abnormal Myelopoiesis, Multi-target NGS panel, small variant (GATA1)"
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.1 "Myelodysplasia, Multi-target NGS panel, small variant (TP53, SF3B1, IDH1, IDH2, NRAS, KRAS, TET2, SRSF2, ASXL1, DNMT3A, RUNX1, U2AF1, EZH2, BCOR, PTPN11, JAK2, SETBP1, PPM1D, DDX41, PHF6, CUX1, UBA1)"
  * target[+]
    * code = #GT1297 "Next Generation Sequencing Panel - Small Variants - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.2 "Myelodysplasia, Karyotype (To include detection of complex karyotype, -7/del7q, -5/del5q, i(17q)/t(17p), -13/del13q, del11q, del12p/t(12p), del9q, del17/del17p & idic(X)(q13)); -Y; del 20q; +8; +19,(inv(3)/t(3q)/del(3q))"
  * target[+]
    * code = #GT1375 "Karyotype - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT635 "SNP Array - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M82.4 "Myelodysplasia, FISH copy number and rearrangement Other: See tests M82.7 -M82.22 for individual specified FISH targets."
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.6 "Myelodysplasia, WGS Germline and Tumor"
  * target[+]
    * code = #GT1312 "WGS Germline & Tumour - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.7 "Myelodysplasia, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.8 "Myelodysplasia, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.9 "Myelodysplasia, i(17q)/t(17p) FISH"
  * target[+]
    * code = #GT595 "Chromosome 17 CNV FISH - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.10 "Myelodysplasia, Chr13/Chr13q copy number FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.11 "Myelodysplasia, Chr11q copy number FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.12 "Myelodysplasia, Chr12p copy number FISH, t(12p) rearrangement FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.13 "Myelodysplasia, Chr9q copy number FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.14 "Myelodysplasia, Chr17/Chr17p copy number FISH"
  * target[+]
    * code = #GT595 "Chromosome 17 CNV FISH - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.15 "Myelodysplasia, idic(X)(q13) FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.16 "Myelodysplasia, Multi-target NGS panel, copy number variant (-7/del7q, -5/del5q, -13/del13q, del11q, del12p, del9q, del17/del17p & idic(X)(q13);-Y; del 20q; +8; +19,del(3q)"
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.17 "Myelodysplasia, Multi-target NGS panel, structural variant (t(12p), t(17p);inv(3)/t(3q)/del(3q)"
  * target[+]
    * code = #GT701 "Next Generation Sequencing Panel - Structural Variants - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.18 "Myelodysplasia, ChrY copy number FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.19 "Myelodysplasia, Chr20/20q copy number FISH"
  * target[+]
    * code = #GT1302 "Chromosome 20 CNV FISH - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.20 "Myelodysplasia, Chr8 copy number FISH"
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.21 "Myelodysplasia, Chr19 copy number FISH"
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.22 "Myelodysplasia, inv(3)/t(3q)/del(3q)"
  * target[+]
    * code = #GT172 "MECOM, 3q21 FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82.23 "Myelodysplasia, WGS Tumour First"
  * target[+]
    * code = #GT1439 "WGS Tumour First - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT889 "WGS Tumour First - MDS/MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M82.24 "Myelodysplasia, WGS Follow-up Germline"
  * target[+]
    * code = #GT1023 "WGS Follow-up Germline - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M83.1 "Aplastic Anaemia, Karyotype (Genomewide)"
  * target[+]
    * code = #GT1375 "Karyotype - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M83.3 "Aplastic Anaemia, FISH copy number and rearrangement"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1302 "Chromosome 20 CNV FISH - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT172 "MECOM, 3q21 FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT595 "Chromosome 17 CNV FISH - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M83.4 "Aplastic Anaemia, WGS Germline and Tumor"
  * target[+]
    * code = #GT1382 "WGS Germline & Tumour - AA"
    * equivalence = #equivalent
* group.element[+]
  * code = #M83.5 "Aplastic Anaemia, WGS Tumour First"
  * target[+]
    * code = #GT1340 "WGS Tumour First - AA"
    * equivalence = #equivalent
* group.element[+]
  * code = #M83.6 "Aplastic Anaemia, WGS Follow-up Germline"
  * target[+]
    * code = #GT304 "WGS Follow-up Germline - AA"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.1 "Chronic Myeloid Leukaemia, BCR-ABL1 multiplex"
  * target[+]
    * code = #GT649 "BCR::ABL1 multiplex - CML, ALL or AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.2 "Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR"
  * target[+]
    * code = #GT31 "MRD BCR::ABL1 - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.3 "Chronic Myeloid Leukaemia, BCR-ABL1 FISH"
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.4 "Chronic Myeloid Leukaemia, Karyotype (To include detection of trisomy 8, trisomy 19, -7/7q, -5/5q, i(17q), 12p-& t(9;22)(q34;q11) BCR-ABL1, 2nd Ph+[+der(22)t(9;22)(q34;q11)], ider(22)(q10)t(9;22)(q34;q11), inv(3), 11q23 rearrangements)"
  * target[+]
    * code = #GT1096 "Karyotype - AML, ALL & CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1265 "SNP Array - CML"
    * equivalence = #relatedto
* group.element[+]
  * code = #M84.6 "Chronic Myeloid Leukaemia, FISH copy number and rearrangement Other: See tests M84.12 M84.20 for individual specified FISH targets."
  * target[+]
    * code = #GT1193 "Other FISH Targets - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.8 "Chronic Myeloid Leukaemia, BCR-ABL1 TKD NGS"
  * target[+]
    * code = #GT303 "BCR::ABL1 TKD Variants - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.11 "Chronic Myeloid Leukaemia, WGS Germline and Tumor"
  * target[+]
    * code = #GT538 "WGS Germline & Tumour - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.12 "Chronic Myeloid Leukaemia, Chr8 copy number FISH"
  * target[+]
    * code = #GT1034 "Chromosome 8 CNV FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.13 "Chronic Myeloid Leukaemia, Chr19 copy number FISH"
  * target[+]
    * code = #GT71 "Chromosome 19 CNV FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.14 "Chronic Myeloid Leukaemia, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT73 "Chromosome 7 CNV FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.15 "Chronic Myeloid Leukaemia, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1424 "Chromosome 5 CNV FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.16 "Chronic Myeloid Leukaemia, i(17q) FISH"
  * target[+]
    * code = #GT1345 "Chromosome 17 CNV FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.17 "Chronic Myeloid Leukaemia, Chr12p copy number FISH"
  * target[+]
    * code = #GT1193 "Other FISH Targets - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.18 "Chronic Myeloid Leukaemia, t(9;22)(q34;q11) BCR-ABL1 FISH and related abnormalities i.e. 2nd Ph+[+der(22)t(9;22)(q34;q11)], Ider(22)(q10)t(9;22)(q34;q11)"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M84.19 "Chronic Myeloid Leukaemia, Inv(3) MECOM FISH"
  * target[+]
    * code = #GT690 "MECOM, 3q21 FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.20 "Chronic Myeloid Leukaemia, 11q23 (KMT2A) rearrangement FISH"
  * target[+]
    * code = #GT478 "KMT2A, 11q23 FISH - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.21 "Chronic Myeloid Leukaemia, Multi-target NGS panel, copy number variant (trisomy 8, trisomy 19, -7/7q, -5/5q, i(17q), 12p-)"
  * target[+]
    * code = #GT1414 "Next Generation Sequencing Panel - Copy Number Variant - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.22 "Chronic Myeloid Leukaemia, Multi-target NGS panel, structural variant (To include detection of t(9;22)(q34;q11) BCR-ABL1, 2nd Ph+[+der(22)t(9;22)(q34;q11)], Ider(22)(q10)t(9;22)(q34;q11), inv(3), 11q23 rearrangements)"
  * target[+]
    * code = #GT99 "Next Generation Sequencing Panel - Structural Variants - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.23 "Chronic Myeloid Leukaemia, MRD BCR-ABL1 RT-qPCR rare"
  * target[+]
    * code = #GT673 "MRD BCR::ABL1 Rare Transcripts - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.24 "Chronic Myeloid Leukaemia, WGS Tumour First"
  * target[+]
    * code = #GT1373 "WGS Tumour First - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M84.25 "Chronic Myeloid Leukaemia, WGS Follow-up Germline"
  * target[+]
    * code = #GT1357 "WGS Follow-up Germline - CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.1 "Myeloproliferative Neoplasm, Multi-target NGS limited panel, small variant (JAK2, CALR, MPL)"
  * target[+]
    * code = #GT717 "Next Generation Sequencing Panel - Small Variants (Limited) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.2 "Myeloproliferative Neoplasm, Multi-target NGS panel, small variant"
  * target[+]
    * code = #GT1426 "Next Generation Sequencing Panel - Small Variant - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT819 "Next Generation Sequencing Panel - Small Variants - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85.3 "Myeloproliferative Neoplasm, Karyotype (To include detection of complex karyotype)"
  * target[+]
    * code = #GT100 "SNP Array - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1233 "Karyotype - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85.5 "Myeloproliferative Neoplasm, FISH copy number and rearrangement Other: See tests M85.18 -M85.34 for individual specified FISH targets."
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.7 "Myeloproliferative Neoplasm, FIP1L1-PDGFRA (4q12) FISH/RT-PCR"
  * target[+]
    * code = #GT468 "FIP1L1::PDGFRA, 4q12 FISH - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85.8 "Myeloproliferative Neoplasm, FIP1L1-PDGFRA RT-qPCR"
  * target[+]
    * code = #GT662 "MRD FIP1L1::PDGFRA - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85.9 "Myeloproliferative Neoplasm, ETV6-PDGFRB FISH/RT-PCR"
  * target[+]
    * code = #GT1282 "ETV6::PDGFRB, t(5;12)(q33;p13) FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.10 "Myeloproliferative Neoplasm, PCM1-JAK2 FISH/RT-PCR"
  * target[+]
    * code = #GT818 "PCM1::JAK2, t(8;9)(p22;q24) FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.11 "Myeloproliferative Neoplasm, BCR-ABL1 multiplex"
  * target[+]
    * code = #GT649 "BCR::ABL1 multiplex - CML, ALL or AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.12 "Myeloproliferative Neoplasm, Other RT-PCR"
  * target[+]
    * code = #GT614 "Other RT-PCR Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.13 "Myeloproliferative Neoplasm, WGS Germline and Tumor"
  * target[+]
    * code = #GT552 "WGS Germline & Tumour - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.14 "Myeloproliferative Neoplasm, JAK2 V617F hotspot"
  * target[+]
    * code = #GT986 "JAK2 Hotspot (V617F) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.15 "Myeloproliferative Neoplasm, JAK2  exon 12 hotspot"
  * target[+]
    * code = #GT965 "JAK2 Hotspot (exon 12) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.16 "Myeloproliferative Neoplasm, CALR exon 9 hotspot"
  * target[+]
    * code = #GT1042 "CALR Hotspot (exon 9) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.17 "Myeloproliferative Neoplasm, MPL exon 10 hotspot"
  * target[+]
    * code = #GT326 "MPL Hotspot (exon 10) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.19 "Myeloproliferative Neoplasm, Chr8 copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85.20 "Myeloproliferative Neoplasm, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85.21 "Myeloproliferative Neoplasm, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.22 "Myeloproliferative Neoplasm, i(17q) FISH"
  * target[+]
    * code = #GT355 "Chromosome 17 CNV FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.23 "Myeloproliferative Neoplasm, Chr12p copy number FISH"
  * target[+]
    * code = #GT1015 "Chromosome 12 CNV FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.24 "Myeloproliferative Neoplasm, t(9;22)(q34;q11) BCR-ABL1 FISH"
  * target[+]
    * code = #GT763 "BCR::ABL1, t(9;22)(q34;q11) FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.25 "Myeloproliferative Neoplasm, PDGFRA rearrangement FISH (other than FIP1L1-PDGFRA see M85.7)"
  * target[+]
    * code = #GT373 "PDGFRA, 4q21 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.26 "Myeloproliferative Neoplasm, PDGFRB rearrangement FISH (other than ETV6-PDGFRB see M85.9)"
  * target[+]
    * code = #GT1355 "PDGFRB, 5q32 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.27 "Myeloproliferative Neoplasm, FGFR1 rearrangement FISH"
  * target[+]
    * code = #GT147 "FGFR1, 8p11 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.28 "Myeloproliferative Neoplasm, JAK2 rearrangement FISH (other than PCM1-JAK2 see M85.10)"
  * target[+]
    * code = #GT13 "JAK2, 9q24 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.29 "Myeloproliferative Neoplasm, inv(3)/t(3;3) FISH"
  * target[+]
    * code = #GT172 "MECOM, 3q21 FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.30 "Myeloproliferative Neoplasm, 11q23 rearrangement FISH"
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.31 "Myeloproliferative Neoplasm, ABL1 rearrangement FISH (other than BCR-ABL1 see M85.24)"
  * target[+]
    * code = #GT152 "ABL1, 9q34 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.32 "Myeloproliferative Neoplasm, FLT3 rearragement FISH"
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.33 "Myeloproliferative Neoplasm, RET rearrangement FISH"
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.34 "Myeloproliferative Neoplasm, NTRK3 rearrangement FISH"
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.35 "Myeloproliferative Neoplasm, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.36 "Myeloproliferative Neoplasm, Multi-target NGS panel, copy number variant (cryptic deletion of 4q12, trisomy 8, -7/7q, -5/5q, i(17q), 12p-)"
  * target[+]
    * code = #GT736 "Next Generation Sequencing Panel - Copy Number Variants - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.37 "Myeloproliferative Neoplasm, WGS Tumour First"
  * target[+]
    * code = #GT543 "WGS Tumour First - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.38 "Myeloproliferative Neoplasm, WGS Follow-up Germline"
  * target[+]
    * code = #GT1236 "WGS Follow-up Germline - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M85.39 ""
  * target[+]
    * code = #GT1497 "MRD JAK2 Hotspot (V617F) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M86.1 "Systemic Mastocytosis, Multi-target NGS panel, small variant (KIT)"
  * target[+]
    * code = #GT819 "Next Generation Sequencing Panel - Small Variants - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M86.2 "Systemic Mastocytosis, KIT D816 QF-PCR"
  * target[+]
    * code = #GT246 "KIT Hotspot (D816) High Sensitivity - Systemic Mastocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M86.3 "Systemic Mastocytosis, WGS Germline and Tumor"
  * target[+]
    * code = #GT1063 "WGS Germline & Tumour - Systemic mastocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M86.4 "Systemic Mastocytosis, WGS Tumour First"
  * target[+]
    * code = #GT12 "WGS Tumour First - Systemic mastocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M86.5 "Systemic Mastocytosis, WGS Follow-up Germline"
  * target[+]
    * code = #GT1029 "WGS Follow-up Germline - Systemic Mastocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M87.1 "Chronic Neutrophilic Leukaemia, Multi-target NGS panel, small variant (CSF3R)"
  * target[+]
    * code = #GT819 "Next Generation Sequencing Panel - Small Variants - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.1 "Juvenile Myelomonocytic Leukaemia, Multi-target NGS panel, small variant (PTPN11, KRAS, NRAS, NF1, CBL)"
  * target[+]
    * code = #GT1297 "Next Generation Sequencing Panel - Small Variants - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.2 "Juvenile Myelomonocytic Leukaemia, WGS Germline and Tumor"
  * target[+]
    * code = #GT1238 "WGS Germline & Tumour - JMML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.3 "Juvenile Myelomonocytic Leukaemia, Multi-target NGS panel, small variant"
  * target[+]
    * code = #GT1297 "Next Generation Sequencing Panel - Small Variants - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.4 "Juvenile Myelomonocytic Leukaemia, Karyotype"
  * target[+]
    * code = #GT1375 "Karyotype - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.5 "Juvenile Myelomonocytic Leukaemia, FISH copy number and rearrangement Other: See tests M88.7-M88.9 for individual specified FISH targets."
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.7 "Juvenile Myelomonocytic Leukaemia, Chr8 copy number FISH"
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.8 "Juvenile Myelomonocytic Leukaemia, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.9 "Juvenile Myelomonocytic Leukaemia, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.10 "Juvenile Myelomonocytic Leukaemia, Multi-target NGS panel, copy number variant (-7/del7q, -5/del5q, trisomy 8)"
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.11 "Juvenile Myelomonocytic Leukaemia, WGS Tumour First"
  * target[+]
    * code = #GT702 "WGS Tumour First - JMML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88.12 "Juvenile Myelomonocytic Leukaemia, WGS Follow-up Germline"
  * target[+]
    * code = #GT1114 "WGS Follow-up Germline - JMML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.1 "Acute Leukaemia Other, WGS Germline and Tumor"
  * target[+]
    * code = #GT670 "WGS Germline & Tumour - Acute leukaemia other"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.2 "Acute Leukaemia Other, Karyotype (To include detection of Complex karyotype, Monosomal karyotype)"
  * target[+]
    * code = #GT1096 "Karyotype - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.3 "Acute Leukaemia Other, FISH copy number and rearrangement other"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT716 "Other FISH Targets - AML"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.4 "Acute Leukaemia Other, Multi-target NGS panel, small variant (NPM1, CEBPA, RUNX1, FLT3, IDH1, IDH2, KIT, WT1, ASXL1, SRSF2, STAG2, RAD21, TP53, KRAS, NRAS, KMT2A(MLL)-PTD, PPM1D, ETV6, NOTCH1, FBXW7, PTEN,  HRAS)"
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT849 "Next Generation Sequencing Panel - Small Variants - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.5 "Acute Leukaemia Other, FLT3 ITD"
  * target[+]
    * code = #GT533 "FLT3 ITD Targeted Assay - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.6 "Acute Leukaemia Other, Other RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.7 "Acute Leukaemia Other, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT185 "Next Generation Sequencing Panel - Structural Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT329 "Next Generation Sequencing Panel - Structural Variants - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.8 "Acute Leukaemia Other, BCR-ABL1 multiplex"
  * target[+]
    * code = #GT649 "BCR::ABL1 multiplex - CML, ALL or AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.9 "Acute Leukaemia Other, MRD NPM1 RT-qPCR"
  * target[+]
    * code = #GT1062 "MRD NPM1 - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.10 "Acute Leukaemia Other, MRD PML-RARA RT-qPCR"
  * target[+]
    * code = #GT475 "MRD PML::RARA - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.11 "Acute Leukaemia Other, MRD RUNX1-RUNX1T1 RT-qPCR"
  * target[+]
    * code = #GT343 "MRD RUNX1::RUNX1T1 - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.12 "Acute Leukaemia Other, MRD CBFB-MYH11 RT-qPCR"
  * target[+]
    * code = #GT870 "MRD CBFB::MYH11 - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.13 "Acute Leukaemia Other, MRD BCR-ABL1 RT-qPCR"
  * target[+]
    * code = #GT31 "MRD BCR::ABL1 - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.14 "Acute Leukaemia Other, MRD other QF-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.15 "Acute Leukaemia Other, MRD target identification (Ig/TCR gene rearrangement by PCR & sequencing with MRD workup via QF-PCR)"
  * target[+]
    * code = #GT332 "MRD Target Identification - T-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT738 "MRD Target Identification - B-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.16 "Acute Leukaemia Other, MRD quantification (Ig/TCR gene rearrangement MRD QF-PCR )"
  * target[+]
    * code = #GT1149 "MRD Quantification - T-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1247 "MRD Quantification - B-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.17 "Acute Leukaemia Other, BCR-ABL1 TKD NGS"
  * target[+]
    * code = #GT303 "BCR::ABL1 TKD Variants - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.20 "Acute Leukaemia Other, FLT3 TKD hotspot"
  * target[+]
    * code = #GT916 "FLT3 TKD Targeted Assay - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.21 "Acute Leukaemia Other, NPM1 exon 12 hotspot"
  * target[+]
    * code = #GT921 "NPM1 Hotspot (exon 12) - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.22 "Acute Leukaemia Other, IDH1 hotspot"
  * target[+]
    * code = #GT494 "IDH1 Hotspot (R132 Variants) - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.23 "Acute Leukaemia Other, IDH2 hotspot"
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.24 "Acute Leukaemia Other, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1294 "Chromosome 5 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.25 "Acute Leukaemia Other, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT700 "Chromosome 7 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.26 "Acute Leukaemia Other, Chr17/Chr17p copy number FISH"
  * target[+]
    * code = #GT1064 "Chromosome 17 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.27 "Acute Leukaemia Other, Chr12/Chr12p copy number FISH"
  * target[+]
    * code = #GT14 "Chromosome 12 CNV FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.28 "Acute Leukaemia Other, t(15;17)(q24;q21) PML-RARA FISH"
  * target[+]
    * code = #GT133 "PML::RARA, t(15;17)(q24;q21) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.29 "Acute Leukaemia Other, t(8;21)(q22;q22) RUNX1-RUNX1T1 FISH"
  * target[+]
    * code = #GT101 "RUNX1::RUNX1T1, t(8;21)(q22;q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.30 "Acute Leukaemia Other, inv(16)(p13.1q22) CBFB-MYH11 FISH"
  * target[+]
    * code = #GT275 "CBFB::MYH11, inv(16)(p13.1q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.31 "Acute Leukaemia Other, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 ( KMT2A) rearrangements FISH"
  * target[+]
    * code = #GT258 "MLLT3::KMT2A, t(9;11)(p21;q23) & other KMT2A rearrangements FISH or RT-PCR - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT844 "KMT2A::MLLT3, t(9;11)(p21;q23) FISH - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.32 "Acute Leukaemia Other, t(6;9)(p22;q34) DEK-NUP214 FISH"
  * target[+]
    * code = #GT61 "DEK::NUP214, t(6;9)(p22;q34) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.33 "Acute Leukaemia Other, inv(3)(q21q26) GATA2-MECOM FISH"
  * target[+]
    * code = #GT157 "GATA2::MECOM, inv(3)(q21q26) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.34 "Acute Leukaemia Other, t(1;22)(p13;q13) RBM15-MRTFA FISH"
  * target[+]
    * code = #GT112 "RBM15::MRTFA, t(1;22)(p13;q13) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.35 "Acute Leukaemia Other, t(9;22)(q34;q11) BCR-ABL1 FISH"
  * target[+]
    * code = #GT1033 "BCR::ABL1, t(9;22)(q34;q11) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.36 "Acute Leukaemia Other, t(3;5)(q25;q34) NPM1-MLF1 FISH"
  * target[+]
    * code = #GT180 "NPM1::MLF1, t(3;5)(q25;q34) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.37 "Acute Leukaemia Other, t(5;11)(q35;p15.5) NUP98-NSD1 FISH"
  * target[+]
    * code = #GT74 "NUP98::NSD1, t(5;11)(q35;p15.5) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.38 "Acute Leukaemia Other, t(7;12)(q36;p13) MNX1-ETV6 FISH"
  * target[+]
    * code = #GT656 "MNX1::ETV6, t(7;12)(q36;p13) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.39 "Acute Leukaemia Other, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 FISH"
  * target[+]
    * code = #GT289 "CBFA2T3::GLIS2, inv(16)(p13.3q24.3) FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.40 "Acute Leukaemia Other, Global copy number change FISH (i.e. hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy)"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT716 "Other FISH Targets - AML"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.41 "Acute Leukaemia Other, del(1)(p33p33) FISH"
  * target[+]
    * code = #GT10 "TAL1, 1p33 FISH - T-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.42 "Acute Leukaemia Other, iAMP21 FISH"
  * target[+]
    * code = #GT548 "ETV6::RUNX1, t(12;21)(p13;q22) & iAMP21 FISH - B-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.52 "Acute Leukaemia Other, t(12;21)(p13;q22) ETV6-RUNX1 FISH"
  * target[+]
    * code = #GT548 "ETV6::RUNX1, t(12;21)(p13;q22) & iAMP21 FISH - B-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.53 "Acute Leukaemia Other,  t(1;19)(q23;p13) TCF3-PBX1 FISH"
  * target[+]
    * code = #GT315 "TCF3, 19p13 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.54 "Acute Leukaemia Other, t(17;19)(q22;p13) TCF3-HLF FISH"
  * target[+]
    * code = #GT315 "TCF3, 19p13 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.55 "Acute Leukaemia Other, t(4;11)(q21;q23) KMT2A-AFF1 FISH"
  * target[+]
    * code = #GT1191 "KMT2A::AFF1, t(4;11)(q21;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.56 "Acute Leukaemia Other, t(11;19)(q23;p13.3) KMT2A-MLLT1 FISH"
  * target[+]
    * code = #GT1309 "KMT2A::MLLT1, t(11;19)(q23;p13.3) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.57 "Acute Leukaemia Other, t(6;11)(q27;q23) KMT2A-AFDN FISH"
  * target[+]
    * code = #GT512 "KMT2A::AFDN, t(6;11)(q27;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.58 "Acute Leukaemia Other,  t(10;11)(p12;q23) KMT2A-MLLT10 FISH"
  * target[+]
    * code = #GT1308 "KMT2A::MLLT10, t(10;11)(p12;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.59 "Acute Leukaemia Other, t(11;19)(q23;p13.1) KMT2A-ELL FISH"
  * target[+]
    * code = #GT1300 "KMT2A::ELL, t(11;19)(q23;p13.1) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.60 "Acute Leukaemia Other, t(1;7)(p32;q11) TRB-TAL1 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.61 "Acute Leukaemia Other, t(11;14)(p15;q11) TRD-LMO1 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.62 "Acute Leukaemia Other, t(7;11)(p15;p15) NUP98-HOXA13 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.63 "Acute Leukaemia Other, t(10;14)(q24;q11) TLX1-TRD FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.64 "Acute Leukaemia Other, t(7;10)(q34;q24) TRB-TLX1 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.65 "Acute Leukaemia Other, t(5;14)(q35;q32.2) BCL11B-TLX3 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.66 "Acute Leukaemia Other, TAL1 rearrangement FISH (other than TRB-TAL1 see M91.45)"
  * target[+]
    * code = #GT10 "TAL1, 1p33 FISH - T-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.67 "Acute Leukaemia Other, TLX1 rearrangement FISH (other than TLX1-TRD & TRB-TLX1 see M91.48 & M91.49)"
  * target[+]
    * code = #GT239 "TLX1::, 10q24 FISH - T-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.68 "Acute Leukaemia Other, PDGFRA rearrangement FISH"
  * target[+]
    * code = #GT1089 "PDGFRA, 4q12 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.69 "Acute Leukaemia Other, PDGFRB rearrangement FISH"
  * target[+]
    * code = #GT1180 "PDGFRB / CSF1R, 5q32 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.70 "Acute Leukaemia Other, ABL1 rearrangement FISH (other than BCR-ABL1 see M91.10)"
  * target[+]
    * code = #GT85 "ABL1, 9q34 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.71 "Acute Leukaemia Other, JAK2 rearrangement FISH"
  * target[+]
    * code = #GT52 "JAK2, 9p24.1 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.72 "Acute Leukaemia Other, KMT2A rearrangement FISH (other than specific rearrangements described in tests M91.30-91,44)"
  * target[+]
    * code = #GT258 "MLLT3::KMT2A, t(9;11)(p21;q23) & other KMT2A rearrangements FISH or RT-PCR - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT301 "KMT2A, 11q23 FISH - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.73 "Acute Leukaemia Other, ABL2 rearrangement FISH"
  * target[+]
    * code = #GT296 "ABL2, 1q25 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.74 "Acute Leukaemia Other, CSF1R rearrangement FISH"
  * target[+]
    * code = #GT1180 "PDGFRB / CSF1R, 5q32 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.75 "Acute Leukaemia Other, 14q32 (IGH) rearrangement FISH"
  * target[+]
    * code = #GT56 "IGH, 14q32 FISH - B-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.76 "Acute Leukaemia Other, CRLF2 rearrangement FISH"
  * target[+]
    * code = #GT7 "CRLF2, Xp22/Yp11 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.77 "Acute Leukaemia Other, EPOR rearrangement FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.78 "Acute Leukaemia Other, t(15;17)(q24;q21) PML-RARA RT-PCR"
  * target[+]
    * code = #GT133 "PML::RARA, t(15;17)(q24;q21) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.79 "Acute Leukaemia Other, t(8;21)(q22;q22) RUNX1-RUNX1T1 RT-PCR"
  * target[+]
    * code = #GT101 "RUNX1::RUNX1T1, t(8;21)(q22;q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.80 "Acute Leukaemia Other, inv(16)(p13.1q22) CBFB-MYH11 RT-PCR"
  * target[+]
    * code = #GT275 "CBFB::MYH11, inv(16)(p13.1q22) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.81 "Acute Leukaemia Other, t(9;11)(p21;q23) MLLT3-KMT2A & other 11q23.3 (KMT2A) rearrangements RT-PCR"
  * target[+]
    * code = #GT258 "MLLT3::KMT2A, t(9;11)(p21;q23) & other KMT2A rearrangements FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.82 "Acute Leukaemia Other, t(6;9)(p22;q34) DEK-NUP214 RT-PCR"
  * target[+]
    * code = #GT61 "DEK::NUP214, t(6;9)(p22;q34) FISH or RT-PCR - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.83 "Acute Leukaemia Other, inv(3)(q21q26) GATA2-MECOM RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.84 "Acute Leukaemia Other, t(1;22)(p13;q13)  RBM15-MRTFA RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.85 "Acute Leukaemia Other, t(9;22)(q34;q11) BCR-ABL1 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.86 "Acute Leukaemia Other, t(3;5)(q25;q34) NPM1-MLF1 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.87 "Acute Leukaemia Other, t(5;11)(q35;p15.5) NUP98-NSD1 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.88 "Acute Leukaemia Other, t(7;12)(q36;p13) MNX1-ETV6 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.89 "Acute Leukaemia Other, inv(16)(p13.3q24.3) CBFA2T3-GLIS2 RT-PCR"
  * target[+]
    * code = #GT351 "Other RT-PCR Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.90 "Acute Leukaemia Other, t(12;21)(p13;q22) ETV6-RUNX1 RT-PCR"
  * target[+]
    * code = #GT577 "ETV6::RUNX1, t(12;21)(p13;q22) RT-PCR - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.91 "Acute Leukaemia Other,  t(1;19)(q23;p13) TCF3-PBX1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.92 "Acute Leukaemia Other, t(17;19)(q22;p13) TCF3-HLF RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.93 "Acute Leukaemia Other, t(4;11)(q21;q23) KMT2A-AFF1 RT-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.94 "Acute Leukaemia Other, t(11;19)(q23;p13.3) KMT2A-MLLT1 RT-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.95 "Acute Leukaemia Other, t(6;11)(q27;q23) KMT2A-AFDN RT-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.96 "Acute Leukaemia Other, t(10;11)(p12;q23) KMT2A-MLLT10 RT-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.97 "Acute Leukaemia Other, t(11;19)(q23;p13.1) KMT2A-ELL RT-PCR"
  * target[+]
    * code = #GT703 "Other MRD Targets - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89.98 "Acute Leukaemia Other, t(1;7)(p32;q11) TRB-TAL1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.99 "Acute Leukaemia Other, t(11;14)(p15;q11) TRD-LMO1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.100 "Acute Leukaemia Other, t(7;11)(p15;p15) NUP98-HOXA13 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.101 "Acute Leukaemia Other, t(10;14)(q24;q11) TLX1-TRD RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.102 "Acute Leukaemia Other, t(7;10)(q34;q24) TRB-TLX1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.103 "Acute Leukaemia Other, t(5;14)(q35;q32.2) BCL11B-TLX3 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.104 "Acute Leukaemia Other, Multi-target NGS panel, copy number variant"
  * target[+]
    * code = #GT629 "Next Generation Sequencing Panel - Copy Number Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.105 "Acute Leukaemia Other, NUP98 rearrangement FISH"
  * target[+]
    * code = #GT1166 "NUP98, 11p15 FISH - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.106 "Acute Leukaemia Other, MRD BCR-ABL1 RT-qPCR rare"
  * target[+]
    * code = #GT673 "MRD BCR::ABL1 Rare Transcripts - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.107 "Acute Leukaemia Other, MRD NPM1 RT-qPCR rare"
  * target[+]
    * code = #GT1228 "MRD NPM1 Rare Transcripts - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.108 "Acute Leukaemia Other, WGS Tumour First"
  * target[+]
    * code = #GT254 "WGS Tumour First - Acute leukaemia other"
    * equivalence = #equivalent
* group.element[+]
  * code = #M89.109 "Acute Leukaemia Other, WGS Follow-up Germline"
  * target[+]
    * code = #GT825 "WGS Follow-up Germline - Acute Leukaemia Other"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.1 "Blastic Plasmacytoid Dendritic Cell Neoplasm, WGS Germline and Tumor"
  * target[+]
    * code = #GT517 "WGS Germline & Tumour - BPDCN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.2 "Blastic Plasmacytoid Dendritic Cell Neoplasm, Karyotype (Genomewide)"
  * target[+]
    * code = #GT1096 "Karyotype - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.3 "Blastic Plasmacytoid Dendritic Cell Neoplasm, FISH copy number and rearrangement"
  * target[+]
    * code = #GT716 "Other FISH Targets - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.4 "Blastic Plasmacytoid Dendritic Cell Neoplasm, Multi-target NGS panel, small variant (NPM1, CEBPA, RUNX1, FLT3, IDH1, IDH2, KIT, WT1, ASXL1, SRSF2, STAG2, RAD21, TP53, KRAS, NRAS, KMT2A(MLL)-PTD)"
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.5 "Blastic Plasmacytoid Dendritic Cell Neoplasm, FLT3 ITD"
  * target[+]
    * code = #GT533 "FLT3 ITD Targeted Assay - AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.6 "Blastic Plasmacytoid Dendritic Cell Neoplasm, WGS Tumour First"
  * target[+]
    * code = #GT879 "WGS Tumour First - BPDCN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M90.7 "Blastic Plasmacytoid Dendritic Cell Neoplasm, WGS Follow-up Germline"
  * target[+]
    * code = #GT1221 "WGS Follow-up Germline - BPDCN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.1 "Acute Lymphoblastic Leukaemia, WGS Germline and Tumor"
  * target[+]
    * code = #GT183 "WGS Germline & Tumour - T-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT467 "WGS Germline & Tumour - B-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.2 "Acute Lymphoblastic Leukaemia, Karyotype (To include detection of complex karyotype, hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy etc)"
  * target[+]
    * code = #GT1096 "Karyotype - AML, ALL & CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT295 "SNP Array - B-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT527 "SNP Array - T-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.4 "Acute Lymphoblastic Leukaemia, FISH copy number and rearrangement other: See tests M91.24-M91.62 for individual specified FISH targets."
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.6 "Acute Lymphoblastic Leukaemia, Other RT-PCR: See tests M91-63-M91.77 for individual specified RT-PCR targets"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.7 "Acute Lymphoblastic Leukaemia, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT329 "Next Generation Sequencing Panel - Structural Variants - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.8 "Acute Lymphoblastic Leukaemia, BCR-ABL1 multiplex"
  * target[+]
    * code = #GT649 "BCR::ABL1 multiplex - CML, ALL or AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.9 "Acute Lymphoblastic Leukaemia, MRD BCR-ABL1 RT-qPCR"
  * target[+]
    * code = #GT31 "MRD BCR::ABL1 - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.10 "Acute Lymphoblastic Leukaemia, BCR-ABL1 FISH"
  * target[+]
    * code = #GT1163 "BCR::ABL1, t(9;22)(q34;q11) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.11 "Acute Lymphoblastic Leukaemia, BCR-ABL1 TKD NGS"
  * target[+]
    * code = #GT303 "BCR::ABL1 TKD Variants - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.14 "Acute Lymphoblastic Leukaemia, MRD ALL RT-qPCR"
  * target[+]
    * code = #GT214 "Other MRD Targets - B-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT985 "Other MRD Targets - T-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.15 "Acute Lymphoblastic Leukaemia, Multi-target NGS panel, small variant (ETV6, NOTCH1, FBXW7, TP53, PTEN, KRAS, NRAS, HRAS)"
  * target[+]
    * code = #GT849 "Next Generation Sequencing Panel - Small Variants - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.22 "Acute Lymphoblastic Leukaemia, MRD target identification (Ig/TCR gene rearrangement by PCR & sequencing with MRD workup via QF-PCR)"
  * target[+]
    * code = #GT332 "MRD Target Identification - T-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT738 "MRD Target Identification - B-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.23 "Acute Lymphoblastic Leukaemia, MRD quantification (Ig/TCR gene rearrangement MRD QF-PCR)"
  * target[+]
    * code = #GT1149 "MRD Quantification - T-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1247 "MRD Quantification - B-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.24 "Acute Lymphoblastic Leukaemia, Global copy number change FISH (i.e. hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy)"
  * target[+]
    * code = #GT160 "Ploidy Status CNV FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.25 "Acute Lymphoblastic Leukaemia, del(1)(p33p33) FISH"
  * target[+]
    * code = #GT10 "TAL1, 1p33 FISH - T-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.26 "Acute Lymphoblastic Leukaemia, iAMP21 FISH"
  * target[+]
    * code = #GT548 "ETV6::RUNX1, t(12;21)(p13;q22) & iAMP21 FISH - B-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.36 "Acute Lymphoblastic Leukaemia, t(12;21)(p13;q22) ETV6-RUNX1 FISH"
  * target[+]
    * code = #GT548 "ETV6::RUNX1, t(12;21)(p13;q22) & iAMP21 FISH - B-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.37 "Acute Lymphoblastic Leukaemia,  t(1;19)(q23;p13) TCF3-PBX1 FISH"
  * target[+]
    * code = #GT874 "TCF3::PBX1, t(1;19)(q23;p13) & TCF3::HLF, t(17;19)(q22;p13) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.38 "Acute Lymphoblastic Leukaemia, t(17;19)(q22;p13) TCF3-HLF FISH"
  * target[+]
    * code = #GT315 "TCF3, 19p13 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.39 "Acute Lymphoblastic Leukaemia, t(4;11)(q21;q23) KMT2A-AFF1 FISH"
  * target[+]
    * code = #GT1191 "KMT2A::AFF1, t(4;11)(q21;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.40 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.3) KMT2A-MLLT1 FISH"
  * target[+]
    * code = #GT1309 "KMT2A::MLLT1, t(11;19)(q23;p13.3) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.41 "Acute Lymphoblastic Leukaemia, t(6;11)(q27;q23) KMT2A-AFDN FISH"
  * target[+]
    * code = #GT512 "KMT2A::AFDN, t(6;11)(q27;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.42 "Acute Lymphoblastic Leukaemia,  t(9;11)(p21;q23) KMT2A-MLLT3 FISH"
  * target[+]
    * code = #GT844 "KMT2A::MLLT3, t(9;11)(p21;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.43 "Acute Lymphoblastic Leukaemia,  t(10;11)(p12;q23) KMT2A-MLLT10 FISH"
  * target[+]
    * code = #GT1308 "KMT2A::MLLT10, t(10;11)(p12;q23) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.44 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.1) KMT2A-ELL FISH"
  * target[+]
    * code = #GT1300 "KMT2A::ELL, t(11;19)(q23;p13.1) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.45 "Acute Lymphoblastic Leukaemia, t(1;7)(p32;q11) TRB-TAL1 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.46 "Acute Lymphoblastic Leukaemia, t(11;14)(p15;q11) TRD-LMO1 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.47 "Acute Lymphoblastic Leukaemia, t(7;11)(p15;p15) NUP98-HOXA13 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.48 "Acute Lymphoblastic Leukaemia, t(10;14)(q24;q11) TLX1-TRD FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.49 "Acute Lymphoblastic Leukaemia, t(7;10)(q34;q24) TRB-TLX1 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.50 "Acute Lymphoblastic Leukaemia, t(5;14)(q35;q32.2) BCL11B-TLX3 FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.51 "Acute Lymphoblastic Leukaemia, TAL1 rearrangement FISH (other than TRB-TAL1 see M91.45)"
  * target[+]
    * code = #GT10 "TAL1, 1p33 FISH - T-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.52 "Acute Lymphoblastic Leukaemia, TLX1 rearrangement FISH (other than TLX1-TRD & TRB-TLX1 see M91.48 & M91.49)"
  * target[+]
    * code = #GT239 "TLX1::, 10q24 FISH - T-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.53 "Acute Lymphoblastic Leukaemia, PDGFRA rearrangement FISH"
  * target[+]
    * code = #GT1089 "PDGFRA, 4q12 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.54 "Acute Lymphoblastic Leukaemia, PDGFRB rearrangement FISH"
  * target[+]
    * code = #GT1180 "PDGFRB / CSF1R, 5q32 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.55 "Acute Lymphoblastic Leukaemia, ABL1 rearrangement FISH (other than BCR-ABL1 see M91.10)"
  * target[+]
    * code = #GT85 "ABL1, 9q34 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.56 "Acute Lymphoblastic Leukaemia, JAK2 rearrangement FISH"
  * target[+]
    * code = #GT52 "JAK2, 9p24.1 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.57 "Acute Lymphoblastic Leukaemia, KMT2A rearrangement FISH (other than specific rearrangements described in tests M91.30-91,44)"
  * target[+]
    * code = #GT301 "KMT2A, 11q23 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.58 "Acute Lymphoblastic Leukaemia, ABL2 rearrangement FISH"
  * target[+]
    * code = #GT296 "ABL2, 1q25 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.59 "Acute Lymphoblastic Leukaemia, CSF1R rearrangement FISH"
  * target[+]
    * code = #GT1180 "PDGFRB / CSF1R, 5q32 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.60 "Acute Lymphoblastic Leukaemia, 14q32(IGH) rearrangement FISH"
  * target[+]
    * code = #GT56 "IGH, 14q32 FISH - B-ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.61 "Acute Lymphoblastic Leukaemia, CRLF2 rearrangement FISH"
  * target[+]
    * code = #GT7 "CRLF2, Xp22/Yp11 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.62 "Acute Lymphoblastic Leukaemia, EPOR rearrangement FISH"
  * target[+]
    * code = #GT200 "Other FISH Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.63 "Acute Lymphoblastic Leukaemia, t(12;21)(p13;q22) ETV6-RUNX1 RT-PCR"
  * target[+]
    * code = #GT577 "ETV6::RUNX1, t(12;21)(p13;q22) RT-PCR - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.64 "Acute Lymphoblastic Leukaemia, t(1;19)(q23;p13) TCF3-PBX1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.65 "Acute Lymphoblastic Leukaemia, t(17;19)(q22;p13) TCF3-HLF RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.66 "Acute Lymphoblastic Leukaemia, t(4;11)(q21;q23) KMT2A-AFF1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.67 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.3) KMT2A-MLLT1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.68 "Acute Lymphoblastic Leukaemia, t(6;11)(q27;q23) KMT2A-AFDN RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.69 "Acute Lymphoblastic Leukaemia, t(9;11)(p21;q23) KMT2A-MLLT3 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.70 "Acute Lymphoblastic Leukaemia,  t(10;11)(p12;q23) KMT2A-MLLT10 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.71 "Acute Lymphoblastic Leukaemia, t(11;19)(q23;p13.1) KMT2A-ELL RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.72 "Acute Lymphoblastic Leukaemia, t(1;7)(p32;q11) TRB-TAL1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.73 "Acute Lymphoblastic Leukaemia, t(11;14)(p15;q11) TRD-LMO1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.74 "Acute Lymphoblastic Leukaemia, t(7;11)(p15;p15) NUP98-HOXA13 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.75 "Acute Lymphoblastic Leukaemia, t(10;14)(q24;q11) TLX1-TRD RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.76 "Acute Lymphoblastic Leukaemia, t(7;10)q34;q24) TRB-TLX1 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.77 "Acute Lymphoblastic Leukaemia, t(5;14)(q35;q32.2) BCL11B-TLX3 RT-PCR"
  * target[+]
    * code = #GT739 "Other RT-PCR Targets - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.78 "Acute Lymphoblastic Leukaemia, Multi-target NGS panel, copy number variant (to include hyperdiploidy, high hyperdiploidy, near haploidy, low hypodiploidy etc.)"
  * target[+]
    * code = #GT350 "Next Generation Sequencing Panel - Copy Number Variants - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.79 "Acute Lymphoblastic Leukaemia, MRD BCR-ABL1 RT-qPCR rare"
  * target[+]
    * code = #GT673 "MRD BCR::ABL1 Rare Transcripts - AML, ALL & CML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.80 "Acute Lymphoblastic Leukaemia, TPMT"
  * target[+]
    * code = #GT1185 "TPMT, 6p22 Pharmacogenomic Test - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.81 "Acute Lymphoblastic Leukaemia, NUDT15"
  * target[+]
    * code = #GT694 "NUDT15, 13q14 Pharmacogenomic Test - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.82 "Acute Lymphoblastic Leukaemia, WGS Tumour First"
  * target[+]
    * code = #GT687 "WGS Tumour First - T-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT781 "WGS Tumour First - B-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.83 "Acute Lymphoblastic Leukaemia, WGS Follow-up Germline"
  * target[+]
    * code = #GT1050 "WGS Follow-up Germline - B-ALL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT225 "WGS Follow-up Germline - T-ALL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91.84 "Acute Lymphoblastic Leukaemia, MYC rearrangement FISH"
  * target[+]
    * code = #GT756 "MYC, 8q24 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.85 "Acute Lymphoblastic Leukaemia, t(8;14)(q34;q32) IGH-MYC FISH"
  * target[+]
    * code = #GT729 "IGH::MYC, t(8;14)(q34;q32) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.86 "Acute Lymphoblastic Leukaemia, t(2;8)(p12;q24) IGK-MYC FISH"
  * target[+]
    * code = #GT546 "IGK::MYC, t(2;8)(p12;q24) FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.87 "Acute Lymphoblastic Leukaemia, t(8;22)(q24;q11) IGL-MYC FISH"
  * target[+]
    * code = #GT483 "IGL::MYC, t(8;22)(q24;q11) FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.88 "Acute Lymphoblastic Leukaemia, BCL2 rearrangement FISH"
  * target[+]
    * code = #GT1052 "BCL2, 18q21 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M91.89 "Acute Lymphoblastic Leukaemia, BCL6 rearrangement FISH"
  * target[+]
    * code = #GT723 "BCL6, 3q27 FISH - ALL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.1 "Plasma Cell Dyscrasia, Multi-target NGS panel, small variant (KRAS, NRAS, BRAF, TP53, DIS3, TENT5C, IRF4)"
  * target[+]
    * code = #GT429 "Next Generation Sequencing Panel - Small Variants - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.2 "Plasma Cell Dyscrasia, t(4;14) IGH-FGFR3FISH/RT-PCR"
  * target[+]
    * code = #GT40 "IGH::FGFR3, t(4;14)(p16;q32) FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.3 "Plasma Cell Dyscrasia, t(6;14)  IGH-CCND3 FISH/RT-PCR"
  * target[+]
    * code = #GT890 "IGH::CCND3, t(6;14)(p21;q32) FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.4 "Plasma Cell Dyscrasia, t(11;14)(q13;q32)  IGH-CCND1 FISH/RT-PCR"
  * target[+]
    * code = #GT187 "IGH::CCND1, t(11;14)(q13;q32) FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.5 "Plasma Cell Dyscrasia, t(14;16) IGH-MAF FISH/RT-PCR"
  * target[+]
    * code = #GT549 "IGH::MAF, t(14;16)(q32;q23) FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.6 "Plasma Cell Dyscrasia, t(14;20)  IGH-MAFB FISH/RT-PCR"
  * target[+]
    * code = #GT746 "IGH::MAFB, t(14;20)(q32;q12) FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.7 "Plasma Cell Dyscrasia, Multi-target NGS panel, structural variant (To include IGH-FGFR3, IGH-CCND3, IGH-CCND1, IGH-MAF, IGH-MAFB, MYC rearrangements)"
  * target[+]
    * code = #GT1274 "Next Generation Sequencing Panel - Structural Variants - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.8 "Plasma Cell Dyscrasia, IGH rearrangement FISH"
  * target[+]
    * code = #GT725 "IGH, 14q32 FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.9 "Plasma Cell Dyscrasia, Hyperdiploidy copy number FISH"
  * target[+]
    * code = #GT1277 "Hyperdiploidy CNV FISH or MLPA - Myeloma"
    * equivalence = #relatedto
  * target[+]
    * code = #GT178 "SNP Array - Myeloma"
    * equivalence = #relatedto
  * target[+]
    * code = #GT565 "Other FISH Targets - Myeloma"
    * equivalence = #relatedto
* group.element[+]
  * code = #M92.10 "Plasma Cell Dyscrasia, del(1p) copy number FISH"
  * target[+]
    * code = #GT855 "CKS1B, 1q21 & CDKN2C, 1p32 CNV FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.11 "Plasma Cell Dyscrasia, gain(1q) copy number FISH"
  * target[+]
    * code = #GT855 "CKS1B, 1q21 & CDKN2C, 1p32 CNV FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.12 "Plasma Cell Dyscrasia, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT383 "Chromosome 17 CNV FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.13 "Plasma Cell Dyscrasia, Multi-target NGS panel (To include hyperdiploidy, del(1p), gain(1q), del17p)"
  * target[+]
    * code = #GT75 "Next Generation Sequencing Panel - Copy Number Variants - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M92.14 "Plasma Cell Dyscrasia, MYC rearrangement FISH"
  * target[+]
    * code = #GT632 "MYC, 8q24 FISH - Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M93.3 "Lymphoma, WGS Germline and Tumor"
  * target[+]
    * code = #GT1356 "WGS Germline & Tumour - Low Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M93.4 "Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1366 "WGS Follow-up Germline - Low Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M93.5 "Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1366 "WGS Follow-up Germline - Low Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M93.6 "Lymphoma, Multi-target NGS panel-small variant (BTK, PLCG2, RAS, MAP2K1, BCL2)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.1 "Chronic Lymphocytic Leukaemia, Multi-target NGS panel, small variant (TP53,BTK, PLCG2, BCL2)"
  * target[+]
    * code = #GT1209 "Next Generation Sequencing Panel - Small Variants - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.2 "Chronic Lymphocytic Leukaemia, Multi-target NGS panel, copy number variant (TP53,ATM, DLEU2/7, RB1, trisomy 12)"
  * target[+]
    * code = #GT929 "Next Generation Sequencing Panel - Copy Number Variants - CLL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT935 "SNP Array - CLL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M94.4 "Chronic Lymphocytic Leukaemia, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT923 "Chromosome 17 CNV FISH - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.5 "Chronic Lymphocytic Leukaemia, Ig gene (heavy & light chain) rearrangement & hypermutation detection multiplex seq"
  * target[+]
    * code = #GT551 "IGHV Hypermutation (Multiplex Sequencing) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.6 "Chronic Lymphocytic Leukaemia, Ig gene (heavy & light chain) rearrangement & hypermutation detection NGS"
  * target[+]
    * code = #GT1181 "IGHV Hypermutation (NGS) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.7 "Chronic Lymphocytic Leukaemia, TP53 seq"
  * target[+]
    * code = #GT1209 "Next Generation Sequencing Panel - Small Variants - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.8 "Chronic Lymphocytic Leukaemia, 11q copy number FISH"
  * target[+]
    * code = #GT231 "Chromosome 11 CNV FISH - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94.9 "Chronic Lymphocytic Leukaemia, 13q copy number FISH"
  * target[+]
    * code = #GT338 "Chromosome 13 CNV FISH - CLL"
    * equivalence = #relatedto
  * target[+]
    * code = #GT926 "Other FISH Targets - CLL"
    * equivalence = #relatedto
* group.element[+]
  * code = #M94.10 "Chronic Lymphocytic Leukaemia, chromosome 12 copy number FISH"
  * target[+]
    * code = #GT1281 "Chromosome 12 CNV FISH - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.1 "B Cell Non-Hodgkin Lymphoma, Ig gene (heavy & light chain) rearrangement & hypermutation detection multiplex seq"
  * target[+]
    * code = #GT1253 "IGHV hypermutation (Multiplex Sequencing) - Hairy Cell Leukaemia"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.2 "B Cell Non-Hodgkin Lymphoma, Ig gene (heavy & light chain) rearrangement & hypermutation detection NGS"
  * target[+]
    * code = #GT1380 "IGHV Hypermutation (NGS) - Hairy Cell Leukaemia"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.3 "B Cell Non-Hodgkin Lymphoma, Ig rearrangement FISH"
  * target[+]
    * code = #GT852 "IGH, 14q32 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.4 "B Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, small variant (EZH2)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.5 "B Cell Non-Hodgkin Lymphoma, EZH2 copy number FISH"
  * target[+]
    * code = #GT414 "EZH2, 7q36 CNV FISH - Mature B Cell Neoplams"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.6 "B Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, small variant (BTK, PLCG2)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.7 "B Cell Non-Hodgkin Lymphoma, WGS Germline and Tumor"
  * target[+]
    * code = #GT1356 "WGS Germline & Tumour - Low Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.8 "B Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, structural variant (Ig)"
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.9 "B Cell Non-Hodgkin Lymphoma, Mutli-target NGS panel, copy number (EZH2)"
  * target[+]
    * code = #GT306 "Next Generation Sequencing Panel - Copy Number Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.10 "B Cell Non-Hodgkin Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1377 "WGS Tumour First - Low Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.11 "B Cell Non-Hodgkin Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1366 "WGS Follow-up Germline - Low Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95.12 "B cell Non-Hodgkin Lymphoma, MYD88 (L265P) hotspot"
  * target[+]
    * code = #GT272 "MYD88 Hotspot (L265P Variants) - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.1 "Burkitt Lymphoma, MYC rearrangement FISH"
  * target[+]
    * code = #GT1394 "MYC, 8q24 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.2 "Burkitt Lymphoma, t(8;14)(q34;q32) IGH-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT576 "MYC::IGH, t(8;14)(q34;q32) FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.3 "Burkitt Lymphoma, t(2;8)(p12;q24) IGK-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT664 "IGK::MYC, t(2;8)(p12;q24) FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.4 "Burkitt Lymphoma, t(8;22)(q24;q11) IGL-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT312 "IGL::MYC, t(8;22)(q24;q11) FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.5 "Burkitt Lymphoma, BCL2 rearrangement FISH"
  * target[+]
    * code = #GT613 "BCL2, 18q21 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.6 "Burkitt Lymphoma, BCL6 rearrangement FISH"
  * target[+]
    * code = #GT1285 "BCL6, 3q27 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.7 "Burkitt Lymphoma, WGS Germline and Tumor"
  * target[+]
    * code = #GT1350 "WGS Germline & Tumour - Burkitt Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.8 "Burkitt Lymphoma, Multi-target NGS panel, structural variant (IGH-MYC, IGK-MYC, IGL-MYC, other rearrangements of MYC,  BCL2, BCL6)"
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.9 "Burkitt Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1349 "WGS Tumour First - Burkitt Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96.10 "Burkitt Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1388 "WGS Follow-up Germline - Burkitt Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M97.1 "Burkitt Like Lymphoma with 11q Abnormalities, 11q copy number FISH"
  * target[+]
    * code = #GT444 "SNP Array - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT479 "Chromosome 11q CNV FISH - B Cell Lymphoma with 11q Aberration"
    * equivalence = #relatedto
* group.element[+]
  * code = #M97.2 "Burkitt Like Lymphoma with 11q Abnormalities, WGS Germline and Tumor"
  * target[+]
    * code = #GT1339 "WGS Germline & Tumour - B Cell Lymphoma with 11q Aberration"
    * equivalence = #equivalent
* group.element[+]
  * code = #M97.3 "Burkitt Like Lymphoma with 11q Abnormalities, Multi-target NGS panel, copy number variant (11q)"
  * target[+]
    * code = #GT306 "Next Generation Sequencing Panel - Copy Number Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M97.4 "Burkitt Like Lymphoma with 11q Abnormalities, WGS Tumour First"
  * target[+]
    * code = #GT1390 "WGS Tumour First - B Cell Lymphoma with 11q Aberration"
    * equivalence = #equivalent
* group.element[+]
  * code = #M97.5 "Burkitt Like Lymphoma with 11q Abnormalities, WGS Follow-up Germline"
  * target[+]
    * code = #GT1363 "WGS Follow-up Germline - B Cell Lymphoma with 11q Aberration"
    * equivalence = #equivalent
* group.element[+]
  * code = #M98.1 "Large B Cell Like Lymphoma with IRF4 Rearrangement, IRF4 rearrangement FISH"
  * target[+]
    * code = #GT369 "IRF4, 6p25 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M98.2 "Large B Cell Like Lymphoma with IRF4 Rearrangement, WGS Germline and Tumor"
  * target[+]
    * code = #GT1341 "WGS Germline & Tumour - B Cell Lymphoma with IRF4 Rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M98.3 "Large B Cell Like Lymphoma with IRF4 Rearrangement, Multi-target NGS panel, structural variant (IRF4)"
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M98.4 "Large B Cell Like Lymphoma with IRF4 Rearrangement, WGS Tumour First"
  * target[+]
    * code = #GT1392 "WGS Tumour First - B Cell Lymphoma with IRF4 Rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M98.5 "Large B Cell Like Lymphoma with IRF4 Rearrangement, WGS Follow-up Germline"
  * target[+]
    * code = #GT1367 "WGS Follow-up Germline - B Cell Lymphoma with IRF4 Rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.1 "High Grade Lymphoma, MYC rearrangement FISH"
  * target[+]
    * code = #GT1394 "MYC, 8q24 FISH - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT665 "Other FISH Targets - Mature B Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M99.2 "High Grade Lymphoma, t(8;14)(q34;q32) IGH-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT576 "MYC::IGH, t(8;14)(q34;q32) FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.3 "High Grade Lymphoma, t(2;8)(p12;q24) IGK-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT664 "IGK::MYC, t(2;8)(p12;q24) FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.4 "High Grade Lymphoma, t(8;22)(q24;q11) IGL-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT312 "IGL::MYC, t(8;22)(q24;q11) FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.5 "High Grade Lymphoma, BCL2 rearrangement FISH"
  * target[+]
    * code = #GT613 "BCL2, 18q21 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.6 "High Grade Lymphoma, t(14;18)(q32;q21) IGH-BCL2 FISH/RT-PCR"
  * target[+]
    * code = #GT646 "IGH::BCL2, t(14;18)(q32;q21) FISH - Follicular Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.7 "High Grade Lymphoma, BCL6 rearrangement FISH"
  * target[+]
    * code = #GT1285 "BCL6, 3q27 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.8 "High Grade Lymphoma, WGS Germline and Tumor"
  * target[+]
    * code = #GT1347 "WGS Germline & Tumour - High Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.9 "High Grade Lymphoma, Mutli-target NGS panel, structural variant (IGH-MYC, IGK-MYC, IGL-MYC, IGH-BCL2, other rearrangements of MYC, BCL2, BCL6)"
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.10 "High Grade Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1393 "WGS Tumour First - High Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99.11 "High Grade Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1351 "WGS Follow-up Germline - High Grade Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100.1 "Primary Mediastinal B Cell Lymphoma, CD274, PDCD1LG2 rearrangement FISH"
  * target[+]
    * code = #GT1348 "CIITA, 16p13 FISH - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1404 "CD274 / PDCD1LG2, 9p24 FISH - Mature B Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M100.2 "Primary Mediastinal B Cell Lymphoma, CD274, PDCD1LG2 Copy number FISH"
  * target[+]
    * code = #GT1404 "CD274 / PDCD1LG2, 9p24 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100.3 "Primary Mediastinal B Cell Lymphoma, REL copy number FISH"
  * target[+]
    * code = #GT534 "REL, 2p16 CNV FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100.4 "Primary Mediastinal B Cell Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1381 "WGS Germline & Tumour - Primary Mediastinal B Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100.5 "Primary Mediastinal B Cell Lymphoma, Multi-target NGS panel, copy number variant (CD274, PDCD1LG2, REL)"
  * target[+]
    * code = #GT306 "Next Generation Sequencing Panel - Copy Number Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100.6 "Primary Mediastinal B Cell Lymphoma, Multi-target NGS panel, rearrangement (CD274, PDCD1LG2)"
  * target[+]
    * code = #GT50 "Next Generation Sequencing RNA Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M100.7 "Primary Mediastinal B Cell Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1391 "WGS Tumour First - Primary Mediastinal B Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100.8 "Primary Mediastinal B Cell Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1387 "WGS Follow-up Germline - Primary Mediastinal B Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101.1 "ALK Positive Large B Cell Lymphoma, ALK rearrangement FISH"
  * target[+]
    * code = #GT1354 "ALK, 2p23 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101.2 "ALK Positive Large B Cell Lymphoma, t(2;17)(p23;q23) CLTC-ALK FISH/RT-PCR"
  * target[+]
    * code = #GT1354 "ALK, 2p23 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101.3 "ALK Positive Large B Cell Lymphoma, t(2;5)(p23;q35) ALK-NPM1 FISH/RT-PCR"
  * target[+]
    * code = #GT1354 "ALK, 2p23 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101.4 "ALK Positive Large B Cell Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1378 "WGS Germline & Tumour - ALK Positive Large B Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101.5 "ALK Positive Large B Cell Lymphoma, Multi-target NGS panel, structural variant (CLTC-ALK, ALK-NPM1, other ALK rearrangements)"
  * target[+]
    * code = #GT50 "Next Generation Sequencing RNA Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M101.6 "ALK Positive Large B Cell Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1360 "WGS Tumour First - ALK Positive Large B Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101.7 "ALK Positive Large B Cell Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1383 "WGS Follow-up Germline - ALK Positive Large B Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M102.1 "Mantle Cell Lymphoma, t(11;14)(q13;q32) IGH-CCND1 FISH/RT-PCR"
  * target[+]
    * code = #GT1407 "IGH::CCND1, t(11;14)(q13;q32) FISH - Mantle Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M102.2 "Mantle Cell Lymphoma, CCND1 rearrangement FISH"
  * target[+]
    * code = #GT868 "CCND1, 11q13 FISH - Mantle Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M102.3 "Mantle Cell Lymphoma, CCND2 rearrangement FISH"
  * target[+]
    * code = #GT637 "CCND2, 12p13 FISH - Mantle Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M102.4 "Mantle Cell Lymphoma, Multi-target NGS panel, structural variant (IGH-CCND1, other CCND1 rearrangements, CCND2)"
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M102.5 "Mantle Cell Lymphoma, Multi-target NGS panel, small variant (TP53)"
  * target[+]
    * code = #GT1337 "CD79B Hotspot (Y196 Variants) - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M103.1 "Follicular Lymphoma, t(14;18)(q32;q21) IGH-BCL2 FISH/RT-PCR"
  * target[+]
    * code = #GT646 "IGH::BCL2, t(14;18)(q32;q21) FISH - Follicular Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M103.2 "Follicular Lymphoma, BCL2 rearrangement FISH"
  * target[+]
    * code = #GT613 "BCL2, 18q21 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M103.3 "Follicular Lymphoma, BCL6 rearrangement FISH"
  * target[+]
    * code = #GT1285 "BCL6, 3q27 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M103.4 "Follicular Lymphoma, Multi-target NGS panel, small variant (CARD11, CREBBP, EZH2, ARID1A, EP300, MEF2B, FOXO1)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M103.5 "Follicular Lymphoma, Multi-target NGS panel, structural variant (IGH-BCL2, BCL2, BCL6)"
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M104.1 "Lymphoplasmacytic Lymphoma/Waldenstrom Macroglobulinaemia, Multi-target NGS panel, small variant (MYD88, CXCR4)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M104.2 "Lymphoplasmacytic Lymphoma/Waldenstrom Macroglobulinaemia, MYD88 hotspot"
  * target[+]
    * code = #GT272 "MYD88 Hotspot (L265P Variants) - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M105.1 "Igm Monoclonal Gammopathy of Uncertain Significance, Multi-target NGS panel, small variant (MYD88, CXCR4)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M105.2 "Igm Monoclonal Gammopathy of Uncertain Significance, MYD88 hotspot"
  * target[+]
    * code = #GT272 "MYD88 Hotspot (L265P Variants) - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M106.1 "Intra-Ocular Lymphoma, MYD88 hotspot"
  * target[+]
    * code = #GT272 "MYD88 Hotspot (L265P Variants) - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.1 "Malt-Lymphoma, t(11;18)(q21;q21) BIRC3-MALT1  FISH/RT-PCR"
  * target[+]
    * code = #GT120 "MALT1, 18q21 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.2 "Malt-Lymphoma, t(1;14)(p22;q32) IGH-BCL10 FISH/RT-PCR"
  * target[+]
    * code = #GT779 "BCL10, 1p22 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.3 "Malt-Lymphoma, t(14;18)(q32;q21) IGH-MALT1 FISH/RT-PCR"
  * target[+]
    * code = #GT120 "MALT1, 18q21 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.4 "Malt-Lymphoma, MALT1 rearrangement FISH"
  * target[+]
    * code = #GT120 "MALT1, 18q21 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.5 "Malt-Lymphoma, BCL10 rearrangement FISH"
  * target[+]
    * code = #GT779 "BCL10, 1p22 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.6 "Malt-Lymphoma, FOXP1 rearrangement FISH"
  * target[+]
    * code = #GT1007 "FOXP1, 3p13 FISH - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.7 "Malt-Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1344 "WGS Germline & Tumour - Marginal Zone Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.8 "Malt-Lymphoma, Multi-target NGS panel, structural variant (BIRC3-MALT1, IGH-BCL10, IGH-MALT1, other MALT rearrangements, other BCL10 rearrangements, FOXP1)"
  * target[+]
    * code = #GT50 "Next Generation Sequencing RNA Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M107.9 "Malt-Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1389 "WGS Tumour First - Marginal Zone Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107.10 "Malt-Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1365 "WGS Follow-up Germline - Marginal Zone Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M108.1 "Hairy Cell Leukaemia, Multi-target NGS panel, small variant (BRAF)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M108.2 "Hairy Cell Leukaemia, BRAF V600 hotspot"
  * target[+]
    * code = #GT321 "BRAF Hotspot (V600E Variants) - Hairy Cell Leukaemia"
    * equivalence = #equivalent
* group.element[+]
  * code = #M108.5 "Hairy Cell Leukaemia, Ig gene hypermutation detection multiplex seq"
  * target[+]
    * code = #GT551 "IGHV Hypermutation (Multiplex Sequencing) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M108.6 "Hairy Cell Leukaemia, Ig gene hypermutation detection NGS"
  * target[+]
    * code = #GT1181 "IGHV Hypermutation (NGS) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M109.1 "Hairy Cell Leukaemia, Vh4-34 Variant, Ig gene (heavy chain) rearrangement detection multiplex seq"
  * target[+]
    * code = #GT551 "IGHV Hypermutation (Multiplex Sequencing) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M109.2 "Hairy Cell Leukaemia, Vh4-34 Variant, Ig gene (heavy chain) rearrangement detection NGS"
  * target[+]
    * code = #GT1181 "IGHV Hypermutation (NGS) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M110.1 "Paediatric Type Follicular Lymphoma, Multi-target NGS panel, small variant (MAP2K1)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M110.2 "Paediatric Type Follicular Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1342 "WGS Germline & Tumour - Follicular Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M110.3 "Paediatric Type Follicular Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1379 "WGS Tumour First - Follicular Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M110.4 "Paediatric Type Follicular Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1343 "WGS Follow-up Germline - Follicular lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.1 "T Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, small variant (RHOA, DNMT3A, IDH2, TET2)"
  * target[+]
    * code = #GT1279 "Next Generation Sequencing Panel - Small Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.2 "T Cell Non-Hodgkin Lymphoma, TCR gene rearrangement detection multiplex seq"
  * target[+]
    * code = #GT39 "T Cell Clonality Testing - Multiplex Sequencing"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.3 "T Cell Non-Hodgkin Lymphoma, TCR gene rearrangement detection NGS"
  * target[+]
    * code = #GT508 "T Cell Clonality Testing - NGS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.4 "T Cell Non-Hodgkin Lymphoma, TCR rearrangement FISH"
  * target[+]
    * code = #GT1146 "TCR FISH - Mature T Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1338 "Other FISH Targets - Mature T cell neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M111.5 "T Cell Non-Hodgkin Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1386 "WGS Germline & Tumour - T Cell NHL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.6 "T Cell Non-Hodgkin Lymphoma, Multi-target NGS panel, structural variant (TCR rearrangement)"
  * target[+]
    * code = #GT821 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.7 "T Cell Non-Hodgkin Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1358 "WGS Tumour First - T Cell NHL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111.8 "T Cell Non-Hodgkin Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1353 "WGS Follow-up Germline - T Cell NHL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M112.3 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), IRF4/DUSP22 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT256 "IRF4/DUSP22, 6p25 FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M112.4 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), TP63 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT733 "TP63, 3q28 FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M112.5 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), WGS Germline and Tumour"
  * target[+]
    * code = #GT1369 "WGS Germline & Tumour - ALK Negative Anaplastic Large Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M112.6 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), Multi-target NGS panel, structural variant (IRF4/DUSP22, TP63)"
  * target[+]
    * code = #GT1153 "Next Generation Sequencing RNA Panel - Structural Variants - Mature T Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #GT821 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature T Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M112.7 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), WGS Tumour First"
  * target[+]
    * code = #GT1362 "WGS Tumour First - ALK Negative Anaplastic Large Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M112.8 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes), WGS Follow-up Germline"
  * target[+]
    * code = #GT1359 "WGS Follow-up Germline - ALK Negative Anaplastic Large Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M113.1 "T Prolymphocytic Leukaemia, TCL1A rearrangement FISH"
  * target[+]
    * code = #GT59 "TCL1A, 14q32 FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M113.2 "T Prolymphocytic Leukaemia, Chr8 rearrangement FISH"
  * target[+]
    * code = #GT1422 "Chromosome 8 CNV FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M113.3 "T Prolymphocytic Leukaemia, Multi-target NGS panel, structural variant (TCL1A, Chr8)"
  * target[+]
    * code = #GT821 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M113.6 "T Prolymphocytic Leukaemia, Karyotype (to include TCL1 rearrangements t(X;14))"
  * target[+]
    * code = #GT918 "Karyotype - Mature B & T Cell Neoplasm"
    * equivalence = #equivalent
* group.element[+]
  * code = #M114.1 "Large Granular Lymphocyte Leukaemia, Multi-target NGS panel, small variant (STAT3, STAT5B)"
  * target[+]
    * code = #GT1279 "Next Generation Sequencing Panel - Small Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M115.1 "NK Cell/Gamma-Delta T Cell Lymphoma, Multi-target NGS panel, small variant (STAT3, STAT5B)"
  * target[+]
    * code = #GT1279 "Next Generation Sequencing Panel - Small Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M115.2 "NK Cell/Gamma-Delta T Cell Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1376 "WGS Germline & Tumour - NK Cell/Gamma-Delta T Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M115.3 "NK Cell/Gamma-Delta T Cell Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1384 "WGS Tumour First - NK Cell/Gamma-Delta T Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M115.4 "NK Cell/Gamma-Delta T Cell Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1372 "WGS Follow-up Germline - NK Cell/Gamma-Delta T Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M116.1 "Hepatosplenic T Cell Lymphoma, Multi-target NGS panel, small variant (STAT3, STAT5B)"
  * target[+]
    * code = #GT1279 "Next Generation Sequencing Panel - Small Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M116.2 "Hepatosplenic T Cell Lymphoma, i7q rearrangement FISH"
  * target[+]
    * code = #GT345 "Chromosome 7 CNV FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M116.3 "Hepatosplenic T Cell Lymphoma, WGS Germline and Tumour"
  * target[+]
    * code = #GT1352 "WGS Germline & Tumour - Hepatosplenic T Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M116.4 "Hepatosplenic T Cell Lymphoma, Multi-target NGS panel, structural variant (i17q)"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1297 "Next Generation Sequencing Panel - Small Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT635 "SNP Array - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT821 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature T Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M116.5 "Hepatosplenic T Cell Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1361 "WGS Tumour First - Hepatosplenic T Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M116.6 "Hepatosplenic T Cell Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1364 "WGS Follow-up Germline - Hepatosplenic T Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.1 "Histiocytosis, Multi-target NGS panel, small variant (BRAF, MAP2K1, NRAS, KRAS, HRAS, ERBB3, ARAF, MAP3K1, PIK3CA, PIK3CD)"
  * target[+]
    * code = #GT892 "Next Generation Sequencing Panel - Small Variants - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.2 "Histiocytosis, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT914 "Next Generation Sequencing Panel - Structural Variants - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.3 "Histiocytosis, ALK rearrangement FISH"
  * target[+]
    * code = #GT579 "ALK, 2p23 FISH - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.7 "Histiocytosis, BRAF rearrangement FISH"
  * target[+]
    * code = #GT426 "BRAF, 7q34 FISH - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.12 "Histiocytosis, NTRK1 rearrangement FISH"
  * target[+]
    * code = #GT456 "NTRK1, 1q23 FISH - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.16 "Histiocytosis, WGS Germline and Tumour"
  * target[+]
    * code = #GT593 "WGS Germline & Tumour - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.17 "Histiocytosis, WGS Tumour First"
  * target[+]
    * code = #GT35 "WGS Tumour First - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.18 "Histiocytosis, WGS Follow-up Germline"
  * target[+]
    * code = #GT836 "WGS Follow-up Germline - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M117.19 "Histiocytosis, High Sensitivity BRAF"
  * target[+]
    * code = #GT69 "BRAF Hotspot (V600E) High Sensitivity - Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M118.1 "Any patient undergoing Allogeneic Haematopoietic Stem Cell transplantation, STR Testing"
  * target[+]
    * code = #GT1368 "Chimerism by STR Testing - Post Stem Cell Transplant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M118.2 "Any patient undergoing Allogeneic Haematopoietic Stem Cell transplantation, Sex chromosome FISH"
  * target[+]
    * code = #GT1370 "Chimerism by XY FISH - Post Stem Cell Transplant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M119.2 "Paediatric Tumours, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.1 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, Multi-target NGS panel, small variant (SMARCA4, SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.2 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCA4 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.3 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.4 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.5 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, SMARCB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.6 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.7 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.8 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.9 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.10 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.11 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.12 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.13 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.14 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.15 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.16 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.17 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, Multi-target NGS panel, copy number variant (SMARCA4, SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M120.18 "Atypical Teratoid/Rhabdoid Tumour, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M124.2 "Clear Cell Kidney Sarcoma, Paediatric, BCOR seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M124.3 "Clear Cell Kidney Sarcoma, Paediatric, BCOR copy number FISH"
  * target[+]
    * code = #GT131 "BCOR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M124.4 "Clear Cell Kidney Sarcoma, Paediatric, BCOR rearrangement FISH"
  * target[+]
    * code = #GT777 "BCOR rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M124.6 "Clear Cell Kidney Sarcoma, Paediatric, NUTM2E-YWHAE FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M124.7 "Clear Cell Kidney Sarcoma, Paediatric, NUTM1-YWHAE FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M126.1 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, MN1 rearrangement FISH"
  * target[+]
    * code = #GT1280 "MN1 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M126.2 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M126.3 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, Multi-target NGS panel, structural variant (MN1, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M126.4 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.1 "Cribriform Neuroepithelial Tumour, Paediatric, Multi-target NGS panel, small variant (SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.2 "Cribriform Neuroepithelial Tumour, Paediatric, SMARCB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.3 "Cribriform Neuroepithelial Tumour, Paediatric, SMARCB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.4 "Cribriform Neuroepithelial Tumour, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.5 "Cribriform Neuroepithelial Tumour, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.6 "Cribriform Neuroepithelial Tumour, Paediatric, Multi-target NGS panel, copy number variant (SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M130.7 "Cribriform Neuroepithelial Tumour, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M131.2 "Cystic Nephroma, Paediatric, DICER1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M131.3 "Cystic Nephroma, Paediatric, DICER1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M131.5 "Cystic Nephroma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.1 "Desmoplastic Infantile Gangliogliomas, Paediatric, Multi-target NGS panel, small variant (BRAF)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.2 "Desmoplastic Infantile Gangliogliomas, Paediatric, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.3 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.4 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.5 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.6 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.7 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.8 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.9 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.10 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.11 "Desmoplastic Infantile Gangliogliomas, Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.12 "Desmoplastic Infantile Gangliogliomas, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M132.13 "Desmoplastic Infantile Gangliogliomas, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M133.1 "Desmoplastic Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (SUFU)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M133.2 "Desmoplastic Medulloblastoma, Paediatric, SUFU seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M133.3 "Desmoplastic Medulloblastoma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M133.4 "Desmoplastic Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M133.5 "Desmoplastic Medulloblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M136.1 "Fibrolamellar Hepatocellular Carcinoma, Paediatric, DNAJB1-PRKACA FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.1 "Ganglioglioma, Paediatric, Multi-target NGS panel, small variant (BRAF)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.2 "Ganglioglioma, Paediatric, Multi-target NGS panel, structural variant (BRAF-KIAA1549, BRAF-FXR1, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B, BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.3 "Ganglioglioma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.4 "Ganglioglioma, Paediatric, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.5 "Ganglioglioma, Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.6 "Ganglioglioma, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.7 "Ganglioglioma, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.8 "Ganglioglioma, Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.9 "Ganglioglioma, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.10 "Ganglioglioma, Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.11 "Ganglioglioma, Paediatric, KIAA1549 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.12 "Ganglioglioma, Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.13 "Ganglioglioma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.14 "Ganglioglioma, Paediatric, Multi-target NGS panel, copy number variant (KIAA1549)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M137.15 "Ganglioglioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M138.1 "Glial Tumours, Paediatric, Multi-target NGS panel, small variant (ATRX)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M138.2 "Glial Tumours, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M138.3 "Glial Tumours, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M138.4 "Glial Tumours, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.1 "Glioblastoma, Paediatric, Multi-target NGS panel, small variant (BRAF, CDKN2A, FGFR4)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.2 "Glioblastoma, Paediatric, Multi-target NGS panel, structural variant (BRAF-KIAA1549, BRAF-FXR1, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B,  BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.3 "Glioblastoma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.4 "Glioblastoma, Paediatric, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.5 "Glioblastoma, Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.6 "Glioblastoma, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.7 "Glioblastoma, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.8 "Glioblastoma, Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.9 "Glioblastoma, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.10 "Glioblastoma, Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.12 "Glioblastoma, Paediatric, CDKN2A seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.13 "Glioblastoma, Paediatric, FGFR4 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.14 "Glioblastoma, Paediatric, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.15 "Glioblastoma, Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.16 "Glioblastoma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.17 "Glioblastoma, Paediatric, Multi-target NGS panel, copy number variant (CDKN2A)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M139.18 "Glioblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M143.2 "Lung, Paediatric, H3-3A seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M143.3 "Lung, Paediatric, H3-3B seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M143.5 "Lung, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.1 "Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (ALK, BCOR, PTCH1, PTCH2, PTEN, TERT promoter)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.3 "Medulloblastoma, Paediatric, BCOR seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.4 "Medulloblastoma, Paediatric, PTCH1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.5 "Medulloblastoma, Paediatric, PTCH2 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.6 "Medulloblastoma, Paediatric, TERT promoter seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.7 "Medulloblastoma, Paediatric, ALK copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.8 "Medulloblastoma, Paediatric, ALK rearrangement FISH"
  * target[+]
    * code = #GT913 "ALK rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.9 "Medulloblastoma, Paediatric, BCOR copy number FISH"
  * target[+]
    * code = #GT131 "BCOR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.10 "Medulloblastoma, Paediatric, BCOR rearrangement FISH"
  * target[+]
    * code = #GT777 "BCOR rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.11 "Medulloblastoma, Paediatric, C19MC copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.12 "Medulloblastoma, Paediatric, PTEN copy number FISH"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.13 "Medulloblastoma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.14 "Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (ALK, BCOR, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.15 "Medulloblastoma, Paediatric, Multi-target NGS panel, copy number variant (ALK, BCOR, C19MC, PTEN)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M145.16 "Medulloblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.1 "Medulloblastoma Group 3, Paediatric, Multi-target NGS panel, small variant (SMARCA4, DDX3X)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.2 "Medulloblastoma Group 3, Paediatric, SMARCA4 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.3 "Medulloblastoma Group 3, Paediatric, DDX3X seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.4 "Medulloblastoma Group 3, Paediatric, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.5 "Medulloblastoma Group 3, Paediatric, PVT1-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.6 "Medulloblastoma Group 3, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.7 "Medulloblastoma Group 3, Paediatric, Multi-target NGS panel, structural variant (PVT1-MYC, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.8 "Medulloblastoma Group 3, Paediatric, Multi-target NGS panel, copy number variant (SMARCA4)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M146.9 "Medulloblastoma Group 3, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.1 "Medulloblastoma Group 3/4, Paediatric, Multi-target NGS panel, small variant (MYCN, EZH2)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.2 "Medulloblastoma Group 3/4, Paediatric, MYCN seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.3 "Medulloblastoma Group 3/4, Paediatric, EZH2 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.4 "Medulloblastoma Group 3/4, Paediatric, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.5 "Medulloblastoma Group 3/4, Paediatric, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.6 "Medulloblastoma Group 3/4, Paediatric, MYC rearrangement FISH"
  * target[+]
    * code = #GT27 "MYC rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.7 "Medulloblastoma Group 3/4, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.8 "Medulloblastoma Group 3/4, Paediatric, Multi-target NGS panel, structural variant (MYC, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.9 "Medulloblastoma Group 3/4, Paediatric, Multi-target NGS panel, copy number variant (MYCN, MYC)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M147.10 "Medulloblastoma Group 3/4, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.1 "Medulloblastoma TP53 WT, Paediatric, Multi-target NGS panel, small variant (YAP1, PTCH1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.2 "Medulloblastoma TP53 WT, Paediatric, YAP1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.3 "Medulloblastoma TP53 WT, Paediatric, PTCH1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.4 "Medulloblastoma TP53 WT, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.5 "Medulloblastoma TP53 WT, Paediatric, YAP1-TFE3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.6 "Medulloblastoma TP53 WT, Paediatric, YAP1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.7 "Medulloblastoma TP53 WT, Paediatric, PTCH1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.8 "Medulloblastoma TP53 WT, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.9 "Medulloblastoma TP53 WT, Paediatric, Multi-target NGS panel, structural variant (YAP1-C11orf95, YAP1-TFE3, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.10 "Medulloblastoma TP53 WT, Paediatric, Multi-target NGS panel, copy number variant (YAP1, PTCH1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M148.11 "Medulloblastoma TP53 WT, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M149.3 "Melanotic Tumours, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.1 "Meningioma, Paediatric, Multi-target NGS panel, small variant (SMARCE1, AKT1, NF2, TERT promoter)"
  * target[+]
    * code = #GT1420 "Meningiomas Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.2 "Meningioma, Paediatric, SMARCE1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.3 "Meningioma, Paediatric, AKT1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.4 "Meningioma, Paediatric, NF2 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.5 "Meningioma, Paediatric, TERT promoter seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.6 "Meningioma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT259 "Meningioma WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.7 "Meningioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M150.8 "Meningioma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M151.2 "Midline Carcinoma, Paediatric, NUTM1-BRD3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M151.3 "Midline Carcinoma, Paediatric, NUTM1-BRD4 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.1 "Neuroblastoma, Paediatric, SNP Array"
  * target[+]
    * code = #GT854 "SNP Array"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.4 "Neuroblastoma, Paediatric, FGFR1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.5 "Neuroblastoma, Paediatric, PHOX2B seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.6 "Neuroblastoma, Paediatric, TP53 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.7 "Neuroblastoma, Paediatric, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.8 "Neuroblastoma, Paediatric, ALK copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.13 "Neuroblastoma, Paediatric, ALK rearrangement FISH"
  * target[+]
    * code = #GT913 "ALK rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.15 "Neuroblastoma, Paediatric, MYCN seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M152.18 "Neuroblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M153.2 "Nodular Brain Tumour, Paediatric, SMO seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M153.3 "Nodular Brain Tumour, Paediatric, SMO copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M153.5 "Nodular Brain Tumour, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M153.7 "Nodular Brain Tumour, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M155.1 "Oligoastrocytoma, Paediatric, Multi-target NGS panel, small variant (KIT)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M155.2 "Oligoastrocytoma, Paediatric, KIT copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M155.3 "Oligoastrocytoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M155.4 "Oligoastrocytoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M155.5 "Oligoastrocytoma, Paediatric, Multi-target NGS panel, copy number variant (KIT)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M155.6 "Oligoastrocytoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.1 "Oligodendroglioma, Paediatric, Multi-target NGS panel, small variant (RB1, ATRX)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.2 "Oligodendroglioma, Paediatric, ATRX seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.3 "Oligodendroglioma, Paediatric, RB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.4 "Oligodendroglioma, Paediatric, Multi-target NGS panel, copy number variant (1p19q, RB1, ATRX)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.6 "Oligodendroglioma, Paediatric, RB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.8 "Oligodendroglioma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.9 "Oligodendroglioma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M156.10 "Oligodendroglioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M157.2 "Thyroid Papillary Carcinoma, Paediatric, RET seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.1 "Pilocytic Astrocytoma, Paediatric, Multi-target NGS panel, small variant (RAF1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.2 "Pilocytic Astrocytoma, Paediatric, RAF1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.3 "Pilocytic Astrocytoma, Paediatric, RAF1-SRGAP3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.4 "Pilocytic Astrocytoma, Paediatric, RAF1-NF1A FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.5 "Pilocytic Astrocytoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.6 "Pilocytic Astrocytoma, Paediatric, Multi-target NGS panel, structural variant (RAF1-SRGAP3, RAF1-NF1A, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M158.7 "Pilocytic Astrocytoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.1 "Pituitary Blastoma, Paediatric, Multi-target NGS panel, small variant (DICER1)"
  * target[+]
    * code = #GT1405 "Tumours of the Sellar Region and Pituitary Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.2 "Pituitary Blastoma, Paediatric, DICER1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.3 "Pituitary Blastoma, Paediatric, DICER1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.4 "Pituitary Blastoma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT1433 "Tumours of the Sellar Region and Pituitary Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.5 "Pituitary Blastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.6 "Pituitary Blastoma, Paediatric, Multi-target NGS panel, copy number variant (DICER1)"
  * target[+]
    * code = #GT1405 "Tumours of the Sellar Region and Pituitary Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M159.7 "Pituitary Blastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.1 "Pleomorphic Xanthoastrocytoma, Paediatric, Multi-target NGS panel, small variant (BRAF, H3-3A)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.2 "Pleomorphic Xanthoastrocytoma, Paediatric, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.3 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.4 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.5 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.6 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.7 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.8 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.9 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.10 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.11 "Pleomorphic Xanthoastrocytoma, Paediatric, H3-3A seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.12 "Pleomorphic Xanthoastrocytoma, Paediatric, KIAA1549 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.13 "Pleomorphic Xanthoastrocytoma, Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.14 "Pleomorphic Xanthoastrocytoma, Paediatric, WGS Germline and Tumour"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.15 "Pleomorphic Xanthoastrocytoma, Paediatric, Multi-target NGS panel, copy number variant (KIAA1549)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M160.16 "Pleomorphic Xanthoastrocytoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M161.2 "Pleuropulmonary Blastoma, Paediatric, DICER1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M161.3 "Pleuropulmonary Blastoma, Paediatric, DICER1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M161.5 "Pleuropulmonary Blastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.1 "Primitive Neuroectodermal Tumours, Paediatric, Multi-target NGS panel, small variant (MSH6, PMS2, PTEN)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.2 "Primitive Neuroectodermal Tumours, Paediatric, MSH6 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.3 "Primitive Neuroectodermal Tumours, Paediatric, PMS2 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.4 "Primitive Neuroectodermal Tumours, Paediatric, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.5 "Primitive Neuroectodermal Tumours, Paediatric, MYC rearrangement FISH"
  * target[+]
    * code = #GT27 "MYC rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.6 "Primitive Neuroectodermal Tumours, Paediatric, MSH6 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.7 "Primitive Neuroectodermal Tumours, Paediatric, PTEN copy number FISH"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.8 "Primitive Neuroectodermal Tumours, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.9 "Primitive Neuroectodermal Tumours, Paediatric, Multi-target NGS panel, structural variant (MYC, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.10 "Primitive Neuroectodermal Tumours, Paediatric, Multi-target NGS panel, copy number variant (MYC, MSH6, PTEN)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M162.11 "Primitive Neuroectodermal Tumours, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M165.2 "Renal Tumours, Paediatric, ATRX seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M165.3 "Renal Tumours, Paediatric, CTNNB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M165.4 "Renal Tumours, Paediatric, DAXX seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M165.7 "Renal Tumours, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M166.3 "Retinoblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M166.4 "Retinoblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M167.1 "Rhabdoid Tumours, Paediatric, Multi-target NGS panel, small variant (SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M167.2 "Rhabdoid Tumours, Paediatric, SMARCB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M167.3 "Rhabdoid Tumours, Paediatric, SMARCB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M167.4 "Rhabdoid Tumours, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M167.5 "Rhabdoid Tumours, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M167.6 "Rhabdoid Tumours, Paediatric, Multi-target NGS panel, copy number variant (SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M168.2 "Rosette-Forming Glioneuronal Tumour, Paediatric, FGFR1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M168.3 "Rosette-Forming Glioneuronal Tumour, Paediatric, FGFR1 rearrangement FISH"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M168.4 "Rosette-Forming Glioneuronal Tumour, Paediatric, FGFR1 ITD FISH"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #relatedto
* group.element[+]
  * code = #M168.5 "Rosette-Forming Glioneuronal Tumour, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M168.6 "Rosette-Forming Glioneuronal Tumour, Paediatric, Multi-target NGS panel, structural variant (FGFR1, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M168.8 "Rosette-Forming Glioneuronal Tumour, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M169.1 "Secondary Glioblastoma, Paediatric, Multi-target NGS panel, small variant (IDH1, IDH2)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M169.2 "Secondary Glioblastoma, Paediatric, IDH1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M169.3 "Secondary Glioblastoma, Paediatric, IDH2 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M169.4 "Secondary Glioblastoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M169.5 "Secondary Glioblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M169.6 "Secondary Glioblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.1 "SHH Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (SMO, DDX3X)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.2 "SHH Medulloblastoma, Paediatric, SMO seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.3 "SHH Medulloblastoma, Paediatric, DDX3X seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.4 "SHH Medulloblastoma, Paediatric, SMO copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.5 "SHH Medulloblastoma, Paediatric, DDX3X copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.6 "SHH Medulloblastoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.7 "SHH Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.8 "SHH Medulloblastoma, Paediatric, Multi-target NGS panel, copy number variant (SMO, DDX3X)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M170.9 "SHH Medulloblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.1 "SHH Medulloblastoma, TP53 WT, Paediatric, Multi-target NGS panel, small variant (SUFU, TERT promoter, PTCH1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.2 "SHH Medulloblastoma, TP53 WT, Paediatric, PTCH1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.3 "SHH Medulloblastoma, TP53 WT, Paediatric, SUFU seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.4 "SHH Medulloblastoma, TP53 WT, Paediatric, TERT promoter seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.5 "SHH Medulloblastoma, TP53 WT, Paediatric, PTCH1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.6 "SHH Medulloblastoma, TP53 WT, Paediatric, TERT copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.7 "SHH Medulloblastoma, TP53 WT, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.8 "SHH Medulloblastoma, TP53 WT, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.9 "SHH Medulloblastoma, TP53 WT, Paediatric, Multi-target NGS panel, copy number variant (PTCH1, TERT)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M171.10 "SHH Medulloblastoma, TP53 WT, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.1 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, Multi-target NGS panel, small variant (TP53, MYCN)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.2 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, TP53 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.3 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, MYCN seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.4 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.5 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.6 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.7 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.8 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, Multi-target NGS panel, copy number variant (TP53, MYCN)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M172.9 "SHH Medulloblastoma, TP53 MUTANT, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M174.2 "Testicular, Paediatric, PRKAR1A seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M174.4 "Testicular, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M178.2 "Wilms Tumours, Paediatric, DROSHA seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M178.4 "Wilms Tumours, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.1 "WNT Medulloblastoma, Paediatric, Multi-target NGS panel, small variant (DDX3X, CTNNB1, SMARCA4, TP53)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.2 "WNT Medulloblastoma, Paediatric, DDX3X seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.3 "WNT Medulloblastoma, Paediatric, CTNNB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.4 "WNT Medulloblastoma, Paediatric, SMARCA4 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.5 "WNT Medulloblastoma, Paediatric, TP53 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.6 "WNT Medulloblastoma, Paediatric, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.7 "WNT Medulloblastoma, Paediatric, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.8 "WNT Medulloblastoma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.9 "WNT Medulloblastoma, Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.10 "WNT Medulloblastoma, Paediatric, Multi-target NGS panel, copy number variant (SMARCA4, TP53)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M179.11 "WNT Medulloblastoma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M180.2 "Xp11.2 Translocation-Associated Renal Cell Carcinoma, Paediatric, TFE3 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M180.3 "Xp11.2 Translocation-Associated Renal Cell Carcinoma, Paediatric, TFE3-ASPSCR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M180.4 "Xp11.2 Translocation-Associated Renal Cell Carcinoma, Paediatric, TFE3-MITF FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M180.5 "Xp11.2 Translocation-Associated Renal Cell Carcinoma, Paediatric, TFE3-PRCC FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M181.1 "Hairy Cell Leukaemia, Non-Classical Variant, Multi-target NGS panel, small variant (MAP2K1)"
  * target[+]
    * code = #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M181.4 "Hairy Cell Leukaemia, Non-Classical Variant, Ig gene hypermutation detection multiplex seq"
  * target[+]
    * code = #GT551 "IGHV Hypermutation (Multiplex Sequencing) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M181.5 "Hairy Cell Leukaemia, Non-Classical Variant, Ig gene hypermutation detection NGS"
  * target[+]
    * code = #GT1181 "IGHV Hypermutation (NGS) - CLL"
    * equivalence = #equivalent
* group.element[+]
  * code = #M182.1 "ALK Positive Anaplastic Large Cell Lymphoma, t(2;5)(p23;q35) ALK-NPM1 FISH/RT-PCR"
  * target[+]
    * code = #GT1385 "ALK::NPM1, t(2;5)(p23;q35) FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M182.2 "ALK Positive Anaplastic Large Cell Lymphoma, ALK rearrangement FISH"
  * target[+]
    * code = #GT1416 "ALK, 2p23 FISH - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M182.3 "ALK Positive Anaplastic Large Cell Lymphoma, WGS Germline and Tumor"
  * target[+]
    * code = #GT999 "WGS Germline & Tumour - ALK Positive Anaplastic Large Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M182.4 "ALK Positive Anaplastic Large Cell Lymphoma, Multi-target NGS panel, structural variant (ALK-NPM1, other ALK rearrangements)"
  * target[+]
    * code = #GT1153 "Next Generation Sequencing RNA Panel - Structural Variants - Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M182.5 "ALK Positive Anaplastic Large Cell Lymphoma, WGS Tumour First"
  * target[+]
    * code = #GT1008 "WGS Tumour First - ALK Positive Anaplastic Large Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M182.6 "ALK Positive Anaplastic Large Cell Lymphoma, WGS Follow-up Germline"
  * target[+]
    * code = #GT1002 "WGS Follow-up Germline - ALK Positive Anaplastic Large Cell Lymphoma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.1 "Diffuse Midline Glioma, Paediatric, Multi-target NGS panel, small variant (H3-3A, NF1, TERT promoter)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.2 "Diffuse Midline Glioma, Paediatric, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.3 "Diffuse Midline Glioma, Paediatric, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.4 "Diffuse Midline Glioma, Paediatric, MYC rearrangement FISH"
  * target[+]
    * code = #GT27 "MYC rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.5 "Diffuse Midline Glioma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.6 "Diffuse Midline Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.7 "Diffuse Midline Glioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.8 "Diffuse Midline Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q, MYC, MYCN)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183.9 "Diffuse Midline Glioma, Paediatric, Multi-target NGS panel, structural variant (MYC, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.1 "Glioma, Paediatric, Multi-target NGS panel, small variant (H3-3B, H3C2, H3C3, H3C14, IDH1, IDH2, TP53, VHL)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.2 "Glioma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.3 "Glioma, Paediatric, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.4 "Glioma, Paediatric, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.5 "Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.6 "Glioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.7 "Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M184.8 "Glioma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M185.1 "High Grade Glioma, Paediatric, Multi-target NGS panel, small variant (CDKN2B)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M185.2 "High Grade Glioma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M185.3 "High Grade Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M185.4 "High Grade Glioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M185.5 "High Grade Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.1 "Low Grade Glioma, Paediatric, Multi-target NGS panel, small variant (TSC1, TSC2, IDH1, IDH2, FGFR1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.2 "Low Grade Glioma, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.3 "Low Grade Glioma, Paediatric, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.4 "Low Grade Glioma, Paediatric, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.5 "Low Grade Glioma, Paediatric, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.6 "Low Grade Glioma, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.7 "Low Grade Glioma, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M186.8 "Low Grade Glioma, Paediatric, Multi-target NGS panel, structural variant  (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M187.4 "Uveal melanoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.1 "Brain Tumour, No Further Morphological Classification, Paediatric, Multi-target NGS panel, small variant (IDH1, IDH2, BRAF, H3C2, H3C3, H3C14, H3-3A, H3-3B, TERT promoter, TP53, VHL, YAP1, SMARCA4, SMARCB1, DDX3X, CTNNB1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1429 "Tumours of the CNS NOS including Rare tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #relatedto
* group.element[+]
  * code = #M189.2 "Brain Tumour, No Further Morphological Classification, Paediatric, Multi-target NGS panel, structural variant (CIC, BCOR, BCOR-CCNB3, C11orf95-RELA, YAP1-C11orf95, YAP1-TFE3, EWSR1, MN1, RELA, YAP1, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1430 "Tumours of the CNS NOS including Rare tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #relatedto
* group.element[+]
  * code = #M189.3 "Brain Tumour, No Further Morphological Classification, Paediatric, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.5 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.6 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1-TFE3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.7 "Brain Tumour, No Further Morphological Classification, Paediatric, EWSR1 rearrangement FISH"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.8 "Brain Tumour, No Further Morphological Classification, Paediatric, MN1 rearrangement FISH"
  * target[+]
    * code = #GT1280 "MN1 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.9 "Brain Tumour, No Further Morphological Classification, Paediatric, RELA rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT453 "RELA rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.10 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT583 "YAP1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.11 "Brain Tumour, No Further Morphological Classification, Paediatric, SNP Array"
  * target[+]
    * code = #GT854 "SNP Array"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.12 "Brain Tumour, No Further Morphological Classification, Paediatric, C19MC copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.13 "Brain Tumour, No Further Morphological Classification, Paediatric, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.14 "Brain Tumour, No Further Morphological Classification, Paediatric, SMARCB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.15 "Brain Tumour, No Further Morphological Classification, Paediatric, YAP1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.16 "Brain Tumour, No Further Morphological Classification, Paediatric, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.17 "Brain Tumour, No Further Morphological Classification, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1431 "CNS of uncertain differentiation (NOS) and Rare Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.18 "Brain Tumour, No Further Morphological Classification, Paediatric, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.19 "Brain Tumour, No Further Morphological Classification, Paediatric, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.20 "Brain Tumour, No Further Morphological Classification, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M189.21 "Brain Tumour, No Further Morphological Classification, Paediatric, Multi-target NGS panel, copy number variant  (C19MC, SMARCA4, SMARCB1, YAP1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1429 "Tumours of the CNS NOS including Rare tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #relatedto
* group.element[+]
  * code = #M190.1 "Embryonal Tumour Differential, Adult and Paediatric, Multi-target NGS panel, small variant (CDKN2A, DICER1, RB1, YAP1, SMARCA4, SMARCB1, MSH6, PMS2, PTEN, ATRX)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.2 "Embryonal Tumour Differential, Adult and Paediatric, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.3 "Embryonal Tumour Differential, Adult and Paediatric, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.4 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.5 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.6 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.7 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.8 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-FRX1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.9 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.10 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.11 "Embryonal Tumour Differential, Adult and Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.12 "Embryonal Tumour Differential, Adult and Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.13 "Embryonal Tumour Differential, Adult and Paediatric, C11orf95-RELA FISH/RT-PCR"
  * target[+]
    * code = #GT1332 "ZFTA rearrangements FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.14 "Embryonal Tumour Differential, Adult and Paediatric, RELA rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT453 "RELA rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.15 "Embryonal Tumour Differential, Adult and Paediatric, TTYH1-C19MC FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.16 "Embryonal Tumour Differential, Adult and Paediatric, YAP1 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT583 "YAP1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.17 "Embryonal Tumour Differential, Adult and Paediatric, YAP1-C11orf95 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.18 "Embryonal Tumour Differential, Adult and Paediatric, YAP1-TFE3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.19 "Embryonal Tumour Differential, Adult and Paediatric, MYC rearrangement FISH"
  * target[+]
    * code = #GT27 "MYC rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.20 "Embryonal Tumour Differential, Adult and Paediatric, MN1 rearrangement FISH"
  * target[+]
    * code = #GT1280 "MN1 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.21 "Embryonal Tumour Differential, Adult and Paediatric, SNP Array"
  * target[+]
    * code = #GT854 "SNP Array"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.22 "Embryonal Tumour Differential, Adult and Paediatric, C19MC copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.23 "Embryonal Tumour Differential, Adult and Paediatric, DICER1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.24 "Embryonal Tumour Differential, Adult and Paediatric, MSH6 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.25 "Embryonal Tumour Differential, Adult and Paediatric, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.26 "Embryonal Tumour Differential, Adult and Paediatric, PTEN (10q23) copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.27 "Embryonal Tumour Differential, Adult and Paediatric, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.28 "Embryonal Tumour Differential, Adult and Paediatric, SMARCB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.30 "Embryonal Tumour Differential, Adult and Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.31 "Embryonal Tumour Differential, Adult and Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M190.32 "Embryonal Tumour Differential, Adult and Paediatric, Multi-target NGS panel, copy number variant  (C19MC, DICER1, MSH6, MYC, PTEN, SMARCA4, SMARCB1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.1 "Low Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3-3B, H3C2, H3C3, H3C14, BRAF, TERT promoter, CDKN2B, TP53, VHL, NF1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.2 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.3 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.4 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.5 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.6 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.7 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.8 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.9 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.10 "Low Grade Intrinsic Brain Tumour Differential, Adult, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.11 "Low Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, copy number variant  (1p, 19q, EGFR, CDKN2A, PTEN)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.12 "Low Grade Intrinsic Brain Tumour Differential, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.13 "Low Grade Intrinsic Brain Tumour Differential, Adult, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.14 "Low Grade Intrinsic Brain Tumour Differential, Adult, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.15 "Low Grade Intrinsic Brain Tumour Differential, Adult, EGFRvIII RT-PCR"
  * target[+]
    * code = #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.16 "Low Grade Intrinsic Brain Tumour Differential, Adult, PTEN (10q23) copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.17 "Low Grade Intrinsic Brain Tumour Differential, Adult, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.18 "Low Grade Intrinsic Brain Tumour Differential, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.19 "Low Grade Intrinsic Brain Tumour Differential, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.20 "Low Grade Intrinsic Brain Tumour Differential, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.21 "Low Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M191.22 "Low Grade Intrinsic Brain Tumour Differential, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.1 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX,  H3-3A, H3-3B, H3C2, H3C3,  H3C14, BRAF, TERT promoter, CDKN2B, TP53, VHL, NF1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.2 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.3 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.4 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.5 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.6 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.7 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.8 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.9 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.10 "High Grade Intrinsic Brain Tumour Differential, Adult, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.12 "High Grade Intrinsic Brain Tumour Differential, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.13 "High Grade Intrinsic Brain Tumour Differential, Adult, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.14 "High Grade Intrinsic Brain Tumour Differential, Adult, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.15 "High Grade Intrinsic Brain Tumour Differential, Adult, EGFRvIII RT-PCR"
  * target[+]
    * code = #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.16 "High Grade Intrinsic Brain Tumour Differential, Adult, PTEN (10q23) copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.17 "High Grade Intrinsic Brain Tumour Differential, Adult, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.18 "High Grade Intrinsic Brain Tumour Differential, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.19 "High Grade Intrinsic Brain Tumour Differential, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.20 "High Grade Intrinsic Brain Tumour Differential, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.21 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.22 "High Grade Intrinsic Brain Tumour Differential, Adult, Multi-target NGS panel, copy number variant  (1p, 19q, EGFR, CDKN2A, PTEN)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M192.23 "High Grade Intrinsic Brain Tumour Differential, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.1 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, small variant (IDH1, IDH2, ATRX, H3-3A, H3-3B, H3C2, H3C3, H3C14, BRAF, TERT promoter, CDKN2B, TP53, VHL, NF1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.2 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.3 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.4 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.5 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.6 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-FXR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.7 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.8 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.9 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.10 "Unable To Grade Intrinsic Brain Tumour, Adult, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.12 "Unable To Grade Intrinsic Brain Tumour, Adult, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.13 "Unable To Grade Intrinsic Brain Tumour, Adult, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.14 "Unable To Grade Intrinsic Brain Tumour, Adult, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.15 "Unable To Grade Intrinsic Brain Tumour, Adult, EGFRvIII RT-PCR"
  * target[+]
    * code = #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.16 "Unable To Grade Intrinsic Brain Tumour, Adult, PTEN (10q23) copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.17 "Unable To Grade Intrinsic Brain Tumour, Adult, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.18 "Unable To Grade Intrinsic Brain Tumour, Adult, IDH1 hotspot"
  * target[+]
    * code = #GT1317 "Small variant (IDH1)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.19 "Unable To Grade Intrinsic Brain Tumour, Adult, IDH2 hotspot"
  * target[+]
    * code = #GT6 "Small variant (IDH2)"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.20 "Unable To Grade Intrinsic Brain Tumour, Adult, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.21 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.22 "Unable To Grade Intrinsic Brain Tumour, Adult, Multi-target NGS panel, copy number variant  (1p, 19q, EGFR, CDKN2A, PTEN)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M193.23 "Unable To Grade Intrinsic Brain Tumour, Adult, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.1 "Medulloblastoma all Subtypes, Multi-target NGS panel, small variant (ALK, BCOR, CTNNB1, DDX3X, DDX3X, EZH2, MYCN,  PTCH1, PTCH2, PTEN, SMARCA4, SMO, SUFU, TERT promoter, TP53,  YAP1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.2 "Medulloblastoma all Subtypes, ALK rearrangement FISH"
  * target[+]
    * code = #GT913 "ALK rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.3 "Medulloblastoma all Subtypes, BCOR rearrangement FISH"
  * target[+]
    * code = #GT777 "BCOR rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.4 "Medulloblastoma all Subtypes, MYC rearrangement FISH"
  * target[+]
    * code = #GT27 "MYC rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.5 "Medulloblastoma all Subtypes, PVT1-MYC FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.6 "Medulloblastoma all Subtypes, YAP1-C11orf95 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.7 "Medulloblastoma all Subtypes, YAP1-TFE3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.8 "Medulloblastoma all Subtypes, SNP Array"
  * target[+]
    * code = #GT854 "SNP Array"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.9 "Medulloblastoma all Subtypes, ALK copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.10 "Medulloblastoma all Subtypes, BCOR copy number FISH"
  * target[+]
    * code = #GT131 "BCOR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.11 "Medulloblastoma all Subtypes, C19MC copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.12 "Medulloblastoma all Subtypes, DDX3X copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.13 "Medulloblastoma all Subtypes, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.14 "Medulloblastoma all Subtypes, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.15 "Medulloblastoma all Subtypes, PTCH1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.16 "Medulloblastoma all Subtypes, PTEN (10q23) copy number FISH/RT-PCR"
  * target[+]
    * code = #GT1012 "PTEN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.17 "Medulloblastoma all Subtypes, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.18 "Medulloblastoma all Subtypes, SMO copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.19 "Medulloblastoma all Subtypes, TERT copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.20 "Medulloblastoma all Subtypes, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.21 "Medulloblastoma all Subtypes, YAP1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.22 "Medulloblastoma all Subtypes, WGS Germline and Tumor"
  * target[+]
    * code = #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.23 "Medulloblastoma all Subtypes, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.24 "Medulloblastoma all Subtypes, Multi-target NGS panel, structural variant (ALK, BCOR, MYC, PVT1-MYC, YAP1-C11orf95, YAP1-TFE3, NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M194.25 "Medulloblastoma all Subtypes, Multi-target NGS panel, copy number variant  (ALK, BCOR, C19MC, DDX3X, MYC, MYCN, PTCH1, PTEN, SMARCA4, SMO, TERT, TP53, YAP1)"
  * target[+]
    * code = #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M195.1 "Craniopharyngioma, Adult and Paediatric, Multi-target NGS panel, small variant (BRAF, CTNNB1)"
  * target[+]
    * code = #GT1405 "Tumours of the Sellar Region and Pituitary Tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M195.2 "Craniopharyngioma, Adult and Paediatric, MGMT promoter hyperMethylation"
  * target[+]
    * code = #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M195.3 "Craniopharyngioma, Adult and Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1433 "Tumours of the Sellar Region and Pituitary Tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M195.4 "Craniopharyngioma, Adult and Paediatric, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M195.5 "Craniopharyngioma, Adult and Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M197.3 "Round Cell Sarcoma of Soft Tissue Differential, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M197.6 "Round Cell Sarcoma of Soft Tissue Differential, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M198.1 "Vascular Soft Tissue Tumour Differential, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M198.2 "Vascular Soft Tissue Tumour Differential, SERPINE1-FOSB FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M198.3 "Vascular Soft Tissue Tumour Differential, WWTR1-CAMTA1 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M199.3 "Spindle Cell Soft Tissue Tumour Differential, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M200.6 "Myxoid Soft Tissue Tumour Differential, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M202.1 "Epithelioid Soft Tissue Tumour Differential, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M202.5 "Epithelioid Soft Tissue Tumour Differential, WWTR1-CAMTA1  RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M204.2 "Undifferentiated tumour, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M205.3 "Cartilage Forming Bone Tumour Differential, H3-3A seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M205.4 "Cartilage Forming Bone Tumour Differential, H3-3B seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M205.6 "Cartilage Forming Bone Tumour Differential, SNP Array"
  * target[+]
    * code = #GT854 "SNP Array"
    * equivalence = #equivalent
* group.element[+]
  * code = #M206.3 "Bone Forming Bone Tumour Differential, H3-3A seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M206.4 "Bone Forming Bone Tumour Differential, H3-3B seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M207.2 "Osteoclast-Rich Bone Tumour Differential, H3-3B seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M208.2 "Round Cell Sarcoma of Bone Differential, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M208.4 "Round Cell Sarcoma of Bone Differential, BCOR-CCNB3 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M209.1 "Vascular Tumour of Bone Differential, MYC copy number FISH"
  * target[+]
    * code = #GT790 "MYC CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M209.2 "Vascular Tumour of Bone Differential, SERPINE1-FOSB FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M209.3 "Vascular Tumour of Bone Differential, WWTR1-CAMTA1 RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M210.2 "Spindle Cell Tumour of Bone Differential, EWSR1 rearrangement FISH or RT-PCR"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M211.4 "Fibro-Osseous Tumour of Bone Differential, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.2 "Renal Tumour Differential, Paediatric, ATRX seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.3 "Renal Tumour Differential, Paediatric, CTNNB1 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.4 "Renal Tumour Differential, Paediatric, DAXX seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.5 "Renal Tumour Differential, Paediatric, TFE3 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.6 "Renal Tumour Differential, Paediatric, TP53 seq"
  * target[+]
    * code = #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.8 "Renal Tumour Differential, Paediatric, del(17p) TP53 copy number FISH"
  * target[+]
    * code = #GT1258 "TP53 deletion CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.11 "Renal Tumour Differential, Paediatric, TFE3-ASPSCR1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.12 "Renal Tumour Differential, Paediatric, TFE3-MITF FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M212.13 "Renal Tumour Differential, Paediatric, TFE3-PRCC FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.1 "Glial and Glioneuronal Tumour Differential, Paediatric, Multi-target NGS panel, small variant (SMARCA4, SMARCB1, DDX3X, CTNNB1, CDKN2A, TP53, RAF1, PIK3CA, FGFR1, FGFR4, KIT,  BRAF, H3-3A, ALK, ATRX, NRAS, PHOX2B)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.2 "Glial and Glioneuronal Tumour Differential, Paediatric, Multi-target NGS panel, structural variant (BRAF-KIAA1549, BRAF-AGK, BRAF-AKAP9, BRAF-CCDC6, BRAF-FAM118B, BRAF-FXR1, BRAF-GNAI1, BRAF-MACF1, other rearrangements of BRAF, ALK, C1"
  * target[+]
    * code = #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.3 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF rearrangement FISH"
  * target[+]
    * code = #GT236 "BRAF rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.4 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-AGK FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.5 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-AKAP9 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.6 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-CCDC6 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.7 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-FAM118B FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.8 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-FRX1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.9 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-GNAI1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.10 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-KIAA1549 FISH/RT-PCR"
  * target[+]
    * code = #GT592 "BRAF::KIAA1549 rearrangement"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.11 "Glial and Glioneuronal Tumour Differential, Paediatric, BRAF-MACF1 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.12 "Glial and Glioneuronal Tumour Differential, Paediatric, ALK-NPM1 rearrangement FISH"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.13 "Glial and Glioneuronal Tumour Differential, Paediatric, C11orf95-RELA FISH/RT-PCR"
  * target[+]
    * code = #GT1332 "ZFTA rearrangements FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.14 "Glial and Glioneuronal Tumour Differential, Paediatric, EWSR1 rearrangement FISH"
  * target[+]
    * code = #GT237 "EWSR1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.15 "Glial and Glioneuronal Tumour Differential, Paediatric, FGFR1 rearrangement FISH"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.16 "Glial and Glioneuronal Tumour Differential, Paediatric, RAF1-NF1A FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.17 "Glial and Glioneuronal Tumour Differential, Paediatric, RAF1-SRGAP3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.18 "Glial and Glioneuronal Tumour Differential, Paediatric, RELA rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT453 "RELA rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.19 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1 rearrangement FISH/RT-PCR"
  * target[+]
    * code = #GT583 "YAP1 rearrangement FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.20 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1-C11orf95 FISH/RT-PCR"
  * target[+]
    * code = #GT1332 "ZFTA rearrangements FISH"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #relatedto
* group.element[+]
  * code = #M213.21 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1-TFE3 FISH/RT-PCR"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.22 "Glial and Glioneuronal Tumour Differential, Paediatric, Multi-target NGS panel, copy number variant (1p, 19q, EGFR, ALK, C19MC, CDKN2A,  FGFR1, KIAA1549, KIT, MYCN, PDGFRA, SMARCA4, SMARCB1, YAP1)"
  * target[+]
    * code = #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.23 "Glial and Glioneuronal Tumour Differential, Paediatric, 1p19q codel FISH/RT-PCR"
  * target[+]
    * code = #GT279 "1p19q CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.24 "Glial and Glioneuronal Tumour Differential, Paediatric, ALK copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.25 "Glial and Glioneuronal Tumour Differential, Paediatric, C19MC copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.26 "Glial and Glioneuronal Tumour Differential, Paediatric, CDKN2A copy number FISH"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.27 "Glial and Glioneuronal Tumour Differential, Paediatric, EGFR copy number FISH"
  * target[+]
    * code = #GT1049 "EGFR CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.28 "Glial and Glioneuronal Tumour Differential, Paediatric, FGFR1 ITD FISH"
  * target[+]
    * code = #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #relatedto
* group.element[+]
  * code = #M213.29 "Glial and Glioneuronal Tumour Differential, Paediatric, KIAA1549 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.30 "Glial and Glioneuronal Tumour Differential, Paediatric, KIT copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.31 "Glial and Glioneuronal Tumour Differential, Paediatric, MYCN copy number FISH"
  * target[+]
    * code = #GT634 "MYCN CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.32 "Glial and Glioneuronal Tumour Differential, Paediatric, PDGFRA FISH/RT-PCR"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.33 "Glial and Glioneuronal Tumour Differential, Paediatric, SMARCA4 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.34 "Glial and Glioneuronal Tumour Differential, Paediatric, SMARCB1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.35 "Glial and Glioneuronal Tumour Differential, Paediatric, YAP1 copy number FISH"
  * target[+]
    * code = #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.36 "Glial and Glioneuronal Tumour Differential, Paediatric, EGFRvIII RT-PCR"
  * target[+]
    * code = #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.37 "Glial and Glioneuronal Tumour Differential, Paediatric, WGS Germline and Tumor"
  * target[+]
    * code = #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M213.38 "Glial and Glioneuronal Tumour Differential, Paediatric, DNA Methylation"
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M215.1 "Endometrial Cancer, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M219.2 "Pancreatic Cancer, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M221.1 "Spitzoid tumour, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M222.2 "Hepatocellular carcinoma, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.1 "MDS/MPN, Multi-target NGS panel, small variant"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1297 "Next Generation Sequencing Panel - Small Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT635 "SNP Array - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.2 "MDS/MPN, Karyotype (To include detection of complex karyotype)"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1375 "Karyotype - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT635 "SNP Array - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.3 "MDS/MPN, FISH copy number and rearrangement Other: See tests M224. -M224. for individual specified FISH targets."
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.4 "MDS/MPN, WGS Germline and Tumor"
  * target[+]
    * code = #GT265 "WGS Germline & Tumour - MDS/MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.5 "MDS/MPN, Multi-target NGS limited panel, small variant (JAK2, CALR, MPL)"
  * target[+]
    * code = #GT717 "Next Generation Sequencing Panel - Small Variants (Limited) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.6 "MDS/MPN, FIP1L1-PDGFRA FISH/RT-PCR"
  * target[+]
    * code = #GT468 "FIP1L1::PDGFRA, 4q12 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.7 "MDS/MPN, FIP1L1-PDGFRA RT-qPCR"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.8 "MDS/MPN, ETV6-PDGFRB FISH/RT-PCR"
  * target[+]
    * code = #GT1282 "ETV6::PDGFRB, t(5;12)(q33;p13) FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.9 "MDS/MPN, PCM1-JAK2 FISH/RT-PCR"
  * target[+]
    * code = #GT818 "PCM1::JAK2, t(8;9)(p22;q24) FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.10 "MDS/MPN, BCR-ABL1 multiplex"
  * target[+]
    * code = #GT649 "BCR::ABL1 multiplex - CML, ALL or AML"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.11 "MDS/MPN, Other RT-PCR"
  * target[+]
    * code = #GT614 "Other RT-PCR Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.13 "MDS/MPN, JAK2 V617F hotspot"
  * target[+]
    * code = #GT986 "JAK2 Hotspot (V617F) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.14 "MDS/MPN, JAK2 exon 12 hotspot"
  * target[+]
    * code = #GT965 "JAK2 Hotspot (exon 12) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.15 "MDS/MPN, CALR exon 9 hotspot"
  * target[+]
    * code = #GT1042 "CALR Hotspot (exon 9) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.16 "MDS/MPN, MPL exon 10 hotspot"
  * target[+]
    * code = #GT326 "MPL Hotspot (exon 10) - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.18 "MDS/MPN, Chr8 copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT635 "SNP Array - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.19 "MDS/MPN, Chr7/Chr7q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT635 "SNP Array - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.20 "MDS/MPN, Chr5/Chr5q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.21 "MDS/MPN, i(17q)/t(17p) FISH"
  * target[+]
    * code = #GT355 "Chromosome 17 CNV FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.22 "MDS/MPN, Chr12p copy number FISH, t(12p) rearrangement FISH"
  * target[+]
    * code = #GT1015 "Chromosome 12 CNV FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.23 "MDS/MPN, t(9;22)(q34;q11) BCR-ABL1 FISH"
  * target[+]
    * code = #GT763 "BCR::ABL1, t(9;22)(q34;q11) FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.24 "MDS/MPN, PDGFRA rearrangement FISH (other than FIP1L1-PDGFRA see M85.7)"
  * target[+]
    * code = #GT373 "PDGFRA, 4q21 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.25 "MDS/MPN, PDGFRB rearrangement FISH (other than ETV6-PDGFRB see M85.9)"
  * target[+]
    * code = #GT1355 "PDGFRB, 5q32 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.26 "MDS/MPN, FGFR1 rearrangement FISH"
  * target[+]
    * code = #GT147 "FGFR1, 8p11 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.27 "MDS/MPN, JAK2 rearrangement FISH (other than PCM1-JAK2 see M85.10)"
  * target[+]
    * code = #GT13 "JAK2, 9q24 FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.28 "MDS/MPN, inv(3)/t(3;3) FISH"
  * target[+]
    * code = #GT172 "MECOM, 3q21 FISH - MDS & MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.29 "MDS/MPN, 11q23 (KMT2A) rearrangement FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.30 "MDS/MPN, ABL1 rearrangement FISH (other than BCR-ABL1 see M85.24)"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.31 "MDS/MPN, FLT3 rearragement FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.32 "MDS/MPN, RET rearrangement FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.33 "MDS/MPN, NTRK3 rearrangement FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.34 "MDS/MPN, Chr13/Chr13q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.35 "MDS/MPN, Chr11q copy number FISH"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT939 "Other FISH Targets - MDS"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.36 "MDS/MPN, Chr9q copy number FISH"
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.37 "MDS/MPN, Chr17/Chr17p copy number FISH"
  * target[+]
    * code = #GT355 "Chromosome 17 CNV FISH - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.38 "MDS/MPN, idic(X)(q13) FISH"
  * target[+]
    * code = #GT1211 "Other FISH Targets - MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.39 "MDS/MPN, Multi-target NGS panel, copy number variant (-7/del7q, -5/del5q, -13/del13q, del11q, del12p, del9q, del17/del17p/i(17q) & idic(X)(q13), cryptic deletion of 4q12, trisomy 8)"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.40 "MDS/MPN, Multi-target NGS panel, structural variant"
  * target[+]
    * code = #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
    * equivalence = #relatedto
  * target[+]
    * code = #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
    * equivalence = #relatedto
  * target[+]
    * code = #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224.41 "MDS/MPN, WGS Tumour First"
  * target[+]
    * code = #GT889 "WGS Tumour First - MDS/MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M224.42 "MDS/MPN, WGS Follow-up Germline"
  * target[+]
    * code = #GT128 "WGS Follow-up Germline - MDS/MPN"
    * equivalence = #equivalent
* group.element[+]
  * code = #M225.1 "Suspected Lymphoma, Ig gene (heavy & light chain) rearrangement detection multiplex seq"
  * target[+]
    * code = #GT1423 "B Cell Clonality Testing - Multiplex Sequencing"
    * equivalence = #equivalent
* group.element[+]
  * code = #M225.2 "Suspected Lymphoma, Ig gene (heavy & light chain) rearrangement detection NGS"
  * target[+]
    * code = #GT1408 "B Cell Clonality Testing - NGS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M225.3 "Suspected Lymphoma, TCR gene rearrangement detection multiplex seq"
  * target[+]
    * code = #GT39 "T Cell Clonality Testing - Multiplex Sequencing"
    * equivalence = #equivalent
* group.element[+]
  * code = #M225.4 "Suspected Lymphoma, TCR gene rearrangement detection NGS"
  * target[+]
    * code = #GT508 "T Cell Clonality Testing - NGS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M225.5 "Suspected Lymphoma, Karyotype"
  * target[+]
    * code = #GT918 "Karyotype - Mature B & T Cell Neoplasm"
    * equivalence = #equivalent
* group.element[+]
  * code = #M226.1 "Cancer of Unknown Primary, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M227.1 "Solid tumour other (i.e. specific histology not listed elsewhere in the test directory), Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M231.2 "small cell lung cancer, Multi-target NGS panel, structural variant (NTRK1, NTRK2, NTRK3)"
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #M235.1 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment, WGS Germline and Tumor"
  * target[+]
    * code = #GT104 "WGS Germline & Tumour - exhausted SOC"
    * equivalence = #equivalent
* group.element[+]
  * code = #M235.2 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment, WGS Tumour First"
  * target[+]
    * code = #GT88 "WGS Tumour First - exhausted SOC"
    * equivalence = #equivalent
* group.element[+]
  * code = #M235.3 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment, WGS Follow-up Germline"
  * target[+]
    * code = #GT1076 "WGS Follow-up Germline - exhausted SOC"
    * equivalence = #equivalent
* group.element[+]
  * code = #M241.5 "Conjunctival melanoma, CDKN2A & 9cen (FISH)"
  * target[+]
    * code = #GT353 "CDKN2A CNV FISH"
    * equivalence = #equivalent
* group.element[+]
  * code = #M242.1 "Any patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected), STR Testing"
  * target[+]
    * code = #GT1335 "Chimerism by STR Testing - Post Solid Organ Transplant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M242.2 "Any patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected), Sex chromosome FISH"
  * target[+]
    * code = #GT1336 "Chimerism by XY FISH - Post Solid Organ Transplant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M246.1 ""
  * target[+]
    * code = #GT1436 "Cranial and paraspinal nerve tumours WGS- Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M246.2 ""
  * target[+]
    * code = #GT1434 "Cranial and paraspinal nerve tumours Differential - NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M246.3 ""
  * target[+]
    * code = #GT1435 "Cranial and paraspinal nerve tumours Differential - NGS Panel Structural Variant"
    * equivalence = #equivalent
* group.element[+]
  * code = #M246.4 ""
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M247.1 ""
  * target[+]
    * code = #GT1428 "Choroid plexus tumours WGS - Paediatric and Adult"
    * equivalence = #equivalent
* group.element[+]
  * code = #M247.2 ""
  * target[+]
    * code = #GT1427 "Choroid plexus tumours - NGS Panel SNV and CNV"
    * equivalence = #equivalent
* group.element[+]
  * code = #M247.3 ""
  * target[+]
    * code = #GT217 "Genome-wide DNA Methylation Profiling"
    * equivalence = #equivalent
* group.element[+]
  * code = #M247.4 ""
  * target[+]
    * code = #GT431 "NTRK - Multi-target NGS panel - structural variants"
    * equivalence = #equivalent
* group.element[+]
  * code = #R428.1 ""
  * target[+]
    * code = #GT1335 "Chimerism by STR Testing - Post Solid Organ Transplant"
    * equivalence = #equivalent
* group.element[+]
  * code = #R428.2 ""
  * target[+]
    * code = #GT1336 "Chimerism by XY FISH - Post Solid Organ Transplant"
    * equivalence = #equivalent
