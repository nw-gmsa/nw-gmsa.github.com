Instance: GenomicClinicalIndicationToDigitalGenomicTestServices
InstanceOf: ConceptMap
Title: "Genomic Clinical Indication (M*) to Digital Genomic Test Services (TP)"
Description: """
Legacy 1st-level clinical-indication numbers (`GenomicClinicalIndication`) for
Haematological Oncology and Cancer CNS, mapped to the `TP*` codes that replace
them - derived from the same `Legacy 'M' codes` column used for the `GT*` map
above (each legacy code's leading number, cross-referenced against which `TP`
its row belongs to), since NHS England's spreadsheets don't name the old CI
number directly. Genuinely many-to-many for a large share of these: the old
haem-onc CI grouping was organised around a shared assay/test method, not
disease, so one old CI number routinely feeds several disease-specific `TP`s -
recorded as multiple `target`s with `equivalence = #relatedto`, not forced to
one.

Display text for the old CI numbers has no live source any more (see notebook
14's own note on this) - taken from the current `EnglandTestCode.fsh`'s own
`M*.*` entries for that number.

Built by [nw-gmsa/Testing notebook 14](https://github.com/nw-gmsa/Testing/blob/main/notebooks/14-national-genomic-test-directory-codesystems.ipynb), checked against v1.1/v2 on 2026-09-05.
"""
Usage:  #definition

* name = "GenomicClinicalIndicationToDigitalGenomicTestServices"
* experimental = false
* url = "https://fhir.nwgenomics.nhs.uk/ConceptMap/GenomicClinicalIndicationToDigitalGenomicTestServices"
* version = "2026-09-05"
* status = #active

* group.source = "https://fhir.nwgenomics.nhs.uk/CodeSystem/GenomicClinicalIndication"
* group.sourceVersion = "2026-09-05"
* group.target = "https://fhir.nhs.uk/CodeSystem/England-DigitalGenomicTestServices"
* group.targetVersion = "2026-09-05"

* group.element[+]
  * code = #M1 "Colorectal Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M2 "Ovarian Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M3 "Breast Cancer"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M5 "Mesothelioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M7 "Melanoma - Adult"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M8 "Gastrointestinal Stromal Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M9 "Thyroid Papillary Carcinoma - Adult"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M11 "Poorly Differentiated Anaplastic Thyroid Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #equivalent
* group.element[+]
  * code = #M12 "Thyroid Medullary Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M13 "Phaeochromocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M14 "Adrenal Cortical Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M15 "Head and Neck Squamous Cell Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M17 "Secretory Carcinoma (Salivary Gland)"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M20 "Anaplastic Astrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M21 "Astrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M22 "Diffuse Astrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M23 "Diffuse Midline Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M24 "Embryonal Tumours with Multi-Layered Rosettes"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M25 "Ependymoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M26 "Ependymoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M27 "Glioblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M28 "Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M29 "High Grade Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M30 "IDH-Wildtype Glioblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M31 "Low Grade Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M32 "Low Grade Glioma/Glioneuronal Tumours"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M33 "Meningioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M34 "Non-Midline Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M35 "OligodendroGlioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M36 "Pilocytic Astrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M37 "Pineoblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M38 "Pituitary Tumours"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M39 "Rare Primitive Neuroectodermal Tumours Groups 2/3"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M45 "Angiomatoid Fibrous Histiocytoma"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M46 "Chondrosarcoma Conventional Central"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M47 "Chondroblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M48 "Clear Cell Sarcoma of Soft Tissue"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M54 "Epithelioid Haemangioendothelioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M55 "Ewing Like Sarcoma/PNET"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M56 "Ewing Sarcoma of Bone"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M57 "Ewing-Like Soft-Tissue Sarcoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M60 "Giant Cell Tumour of Bone"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M61 "High-Grade Neuroepithelial Tumour-Bcor Group"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M66 "Myoepithelial Tumours of Soft Tissue"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M70 "Osteosarcoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M72 "Primitive Mesenchymal Myxoid Tumour of Infancy"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M73 "Pseudomyogenic Haemangioendothelioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M74 "Radiation Induced Angiosarcoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M75 "Round Cell Sarcoma Nos"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M79 "Well Differentiated/Dedifferentiated Liposarcoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M80 "Acute Myeloid Leukaemia"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M81 "Transient Abnormal Myelopoiesis"
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #equivalent
* group.element[+]
  * code = #M82 "Myelodysplasia"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
* group.element[+]
  * code = #M83 "Aplastic Anaemia"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
* group.element[+]
  * code = #M84 "Chronic Myeloid Leukaemia"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M85 "Myeloproliferative Neoplasm"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M86 "Systemic Mastocytosis"
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #equivalent
* group.element[+]
  * code = #M87 "Chronic Neutrophilic Leukaemia"
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #equivalent
* group.element[+]
  * code = #M88 "Juvenile Myelomonocytic Leukaemia"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
* group.element[+]
  * code = #M89 "Acute Leukaemia Other"
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M90 "Blastic Plasmacytoid Dendritic Cell Neoplasm"
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M91 "Acute Lymphoblastic Leukaemia"
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M92 "Plasma Cell Dyscrasia"
  * target[+]
    * code = #TP126 "Myeloma"
    * equivalence = #equivalent
* group.element[+]
  * code = #M93 "Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M94 "Chronic Lymphocytic Leukaemia"
  * target[+]
    * code = #TP533 "Chronic Lymphocytic Leukaemia"
    * equivalence = #equivalent
* group.element[+]
  * code = #M95 "B cell Non-Hodgkin Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M96 "Burkitt Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M97 "Burkitt Like Lymphoma with 11q Abnormalities"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M98 "Large B Cell Like Lymphoma with IRF4 Rearrangement"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M99 "High Grade Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M100 "Primary Mediastinal B Cell Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M101 "ALK Positive Large B Cell Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M102 "Mantle Cell Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M103 "Follicular Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M104 "Lymphoplasmacytic Lymphoma/Waldenstrom Macroglobulinaemia"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M105 "Igm Monoclonal Gammopathy of Uncertain Significance"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M106 "Intra-Ocular Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M107 "Malt-Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M108 "Hairy Cell Leukaemia"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #TP533 "Chronic Lymphocytic Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M109 "Hairy Cell Leukaemia"
  * target[+]
    * code = #TP533 "Chronic Lymphocytic Leukaemia"
    * equivalence = #equivalent
* group.element[+]
  * code = #M110 "Paediatric Type Follicular Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M111 "T Cell Non-Hodgkin Lymphoma"
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #TP62 "Clonality Testing"
    * equivalence = #relatedto
* group.element[+]
  * code = #M112 "ALK Negative Anaplastic Large Cell Lymphoma (Including Primary Cutaneous Subtypes)"
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M113 "T Prolymphocytic Leukaemia"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M114 "Large Granular Lymphocyte Leukaemia"
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M115 "NK Cell/Gamma-Delta T Cell Lymphoma"
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M116 "Hepatosplenic T Cell Lymphoma"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #relatedto
* group.element[+]
  * code = #M117 "Histiocytosis"
  * target[+]
    * code = #TP182 "Histiocytosis"
    * equivalence = #equivalent
* group.element[+]
  * code = #M118 "Any patient undergoing Allogeneic Haematopoietic Stem Cell transplantation"
  * target[+]
    * code = #TP401 "Chimerism Testing"
    * equivalence = #equivalent
* group.element[+]
  * code = #M119 "Paediatric Tumours"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M120 "Atypical Teratoid/Rhabdoid Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M124 "Clear Cell Kidney Sarcoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M126 "CNS High-Grade Neuroepithelial Tumour with MN1 Alteration"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M130 "Cribriform Neuroepithelial Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M131 "Cystic Nephroma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M132 "Desmoplastic Infantile Gangliogliomas"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M133 "Desmoplastic Medulloblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M136 "Fibrolamellar Hepatocellular Carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M137 "Ganglioglioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M138 "Glial Tumours"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M139 "Glioblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M143 "Lung - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M145 "Medulloblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M146 "Medulloblastoma Group 3"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M147 "Medulloblastoma Group 3/4"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M148 "Medulloblastoma TP53 WT"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M149 "Melanotic Tumours - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M150 "Meningioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M151 "Midline Carcinoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M152 "Neuroblastoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M153 "Nodular Brain Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M155 "Oligoastrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M156 "Oligodendroglioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M157 "Thyroid Papillary Carcinoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M158 "Pilocytic Astrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M159 "Pituitary Blastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M160 "Pleomorphic Xanthoastrocytoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M161 "Pleuropulmonary Blastoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M162 "Primitive Neuroectodermal Tumours"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M165 "Renal Tumours - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M166 "Retinoblastoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M167 "Rhabdoid Tumours - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M168 "Rosette-Forming Glioneuronal Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M169 "Secondary Glioblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M170 "SHH Medulloblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M171 "SHH Medulloblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M172 "SHH Medulloblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M174 "Testicular - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M178 "Wilms Tumours - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M179 "WNT Medulloblastoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M180 "Xp11.2 Translocation-Associated Renal Cell Carcinoma - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M181 "Hairy Cell Leukaemia"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #TP533 "Chronic Lymphocytic Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M182 "ALK Positive Anaplastic Large Cell Lymphoma"
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #equivalent
* group.element[+]
  * code = #M183 "Diffuse Midline Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M184 "Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M185 "High Grade Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M186 "Low Grade Glioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M187 "Uveal melanoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M189 "Brain Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M190 "Embryonal Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M191 "Low Grade Intrinsic Brain Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M192 "High Grade Intrinsic Brain Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M193 "Unable To Grade Intrinsic Brain Tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M194 "Medulloblastoma all Subtypes"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M195 "Craniopharyngioma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M197 "Round Cell Sarcoma of Soft Tissue Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M198 "Vascular Soft Tissue Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M199 "Spindle Cell Soft Tissue Tumour Differential"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M200 "Myxoid Soft Tissue Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M202 "Epithelioid Soft Tissue Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M204 "Undifferentiated tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M205 "Cartilage Forming Bone Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M206 "Bone Forming Bone Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M207 "Osteoclast-Rich Bone Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M208 "Round Cell Sarcoma of Bone Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M209 "Vascular Tumour of Bone Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M210 "Spindle Cell Tumour of Bone Differential"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M211 "Fibro-Osseous Tumour of Bone Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M212 "Renal Tumour Differential - Paediatric"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M213 "Glial and Glioneuronal Tumour Differential"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M215 "Endometrial Cancer"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M219 "Pancreatic Cancer"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M221 "Spitzoid tumour"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M222 "Hepatocellular carcinoma"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M224 "MDS/MPN"
  * target[+]
    * code = #TP202 "Myelodysplastic Syndromes"
    * equivalence = #relatedto
  * target[+]
    * code = #TP228 "Myeloproliferative Neoplasm"
    * equivalence = #relatedto
  * target[+]
    * code = #TP241 "Acute Lymphoblastic Leukaemia - B cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP34 "Acute Lymphoblastic Leukaemia - T cell"
    * equivalence = #relatedto
  * target[+]
    * code = #TP374 "Chronic Myeloid Leukaemia"
    * equivalence = #relatedto
  * target[+]
    * code = #TP450 "Acute Myeloid Leukaemia"
    * equivalence = #relatedto
* group.element[+]
  * code = #M225 "Suspected Lymphoma"
  * target[+]
    * code = #TP377 "Mature B Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #TP58 "Mature T Cell Neoplasms"
    * equivalence = #relatedto
  * target[+]
    * code = #TP62 "Clonality Testing"
    * equivalence = #relatedto
* group.element[+]
  * code = #M226 "Carcinoma of Unknown Primary"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M227 "Solid tumour other (i.e. specific histology not listed elsewhere in the test directory)"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M231 "Small cell lung cancer"
  * target[+]
    * code = #TP604 "Embryonal tumours of the CNS"
    * equivalence = #relatedto
  * target[+]
    * code = #TP613 "Meningiomas"
    * equivalence = #relatedto
  * target[+]
    * code = #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M235 "Proven or Suspected Haematological Tumours Exhausted all Standard of Care Testing and Treatment"
  * target[+]
    * code = #TP245 "Haematological Tumours - Exhausted SOC"
    * equivalence = #equivalent
* group.element[+]
  * code = #M241 "Conjunctival melanoma"
  * target[+]
    * code = #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #M242 "Any patient receiving solid organ transplantation (only in cases where passenger lymphocyte syndrome is suspected)"
  * target[+]
    * code = #TP401 "Chimerism Testing"
    * equivalence = #equivalent
* group.element[+]
  * code = #M246 "M246"
  * target[+]
    * code = #TP623 "Cranial and Paraspinal Nerve Tumours"
    * equivalence = #relatedto
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #relatedto
* group.element[+]
  * code = #M247 "M247"
  * target[+]
    * code = #TP624 "Choroid Plexus Tumours"
    * equivalence = #equivalent
* group.element[+]
  * code = #R428 "R428"
  * target[+]
    * code = #TP401 "Chimerism Testing"
    * equivalence = #equivalent
