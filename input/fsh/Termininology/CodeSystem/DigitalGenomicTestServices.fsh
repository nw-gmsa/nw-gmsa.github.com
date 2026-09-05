CodeSystem: NHSEngland-DigitalGenomicTestServices
Id: DigitalGenomicTestServices
Title: "NHS England Digital Genomic Test Services"
Description: """
The **digital** National Genomic Test Directory codes, rolled out as the
Test Directory itself went digital - replacing the legacy R-code/M-code
style codes in [NHS England Genomic Test
Code](CodeSystem-GenomicTestCode.html) (`$GTD`,
`England-GenomicTestDirectory`) for new/migrated indications. Two code
types share this one system, distinguished by prefix:

- **TP (Test Package)** codes replace the old clinical-indication concept -
  a package of related genomic tests grouped by clinical condition.
- **GT (Genomic/Genetic Test)** codes identify a single specific laboratory
  investigation.

Refreshed from the Haematological Oncology (v1.1) and Cancer CNS (v2) national
genomic test directories on 2026-09-05 - see `ConceptMap-GenomicTestCodeToDigitalGenomicTestServices`
and `ConceptMap-GenomicClinicalIndicationToDigitalGenomicTestServices` for how
these relate to the legacy codes they replace.
"""

* ^name = "DigitalGenomicTestServices"
* ^content = #fragment
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* ^version = "2026.09.05"
* ^date = "2026-09-05"
* ^url = "https://fhir.nhs.uk/CodeSystem/England-DigitalGenomicTestServices"

* ^property[+].code = #parent
* ^property[=].uri = "http://hl7.org/fhir/concept-properties#parent"
* ^property[=].description = "The Test Package (TP) code(s) this Genomic Test (GT) code belongs to"
* ^property[=].type = #code

// Test Package (TP) - clinical-indication-level grouping

* #TP34 "Acute Lymphoblastic Leukaemia - T cell"
* #TP58 "Mature T Cell Neoplasms"
* #TP62 "Clonality Testing"
* #TP126 "Myeloma"
* #TP171 "Cystic renal disease"
* #TP182 "Histiocytosis"
* #TP202 "Myelodysplastic Syndromes"
* #TP228 "Myeloproliferative Neoplasm"
* #TP241 "Acute Lymphoblastic Leukaemia - B cell"
* #TP245 "Haematological Tumours - Exhausted SOC"
* #TP374 "Chronic Myeloid Leukaemia"
* #TP377 "Mature B Cell Neoplasms"
* #TP401 "Chimerism Testing"
* #TP450 "Acute Myeloid Leukaemia"
* #TP533 "Chronic Lymphocytic Leukaemia"
* #TP604 "Embryonal tumours of the CNS"
* #TP613 "Meningiomas"
* #TP622 "Tumours of the Sellar Region and Pituitary Tumours"
* #TP623 "Cranial and Paraspinal Nerve Tumours"
* #TP624 "Choroid Plexus Tumours"
* #TP625 "CNS of uncertain differentiation (NOS) and Rare Tumours"
* #TP640 "Gliomas, Glioneuronal Tumours, and Neuronal tumours"

// Genomic/Genetic Test (GT) - specific laboratory investigation

* #GT6 "Small variant (IDH2)"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT7 "CRLF2, Xp22/Yp11 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT10 "TAL1, 1p33 FISH - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT12 "WGS Tumour First - Systemic mastocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT13 "JAK2, 9q24 FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT14 "Chromosome 12 CNV FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT17 "SNP Array - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT24 "WGS Tumour First - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT27 "MYC rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT31 "MRD BCR::ABL1 - AML, ALL & CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT35 "WGS Tumour First - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT39 "T Cell Clonality Testing - Multiplex Sequencing"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP62
* #GT40 "IGH::FGFR3, t(4;14)(p16;q32) FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT50 "Next Generation Sequencing RNA Panel - Structural Variants - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT52 "JAK2, 9p24.1 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT56 "IGH, 14q32 FISH - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT59 "TCL1A, 14q32 FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT61 "DEK::NUP214, t(6;9)(p22;q34) FISH or RT-PCR - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT69 "BRAF Hotspot (V600E) High Sensitivity - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT71 "Chromosome 19 CNV FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT73 "Chromosome 7 CNV FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT74 "NUP98::NSD1, t(5;11)(q35;p15.5) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT75 "Next Generation Sequencing Panel - Copy Number Variants - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT85 "ABL1, 9q34 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT88 "WGS Tumour First - exhausted SOC"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP245
* #GT99 "Next Generation Sequencing Panel - Structural Variants - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT100 "SNP Array - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT101 "RUNX1::RUNX1T1, t(8;21)(q22;q22) FISH or RT-PCR - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT104 "WGS Germline & Tumour - exhausted SOC"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP245
* #GT112 "RBM15::MRTFA, t(1;22)(p13;q13) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT120 "MALT1, 18q21 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT128 "WGS Follow-up Germline - MDS/MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT131 "BCOR CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT133 "PML::RARA, t(15;17)(q24;q21) FISH or RT-PCR - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT147 "FGFR1, 8p11 FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT152 "ABL1, 9q34 FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT157 "GATA2::MECOM, inv(3)(q21q26) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT160 "Ploidy Status CNV FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT172 "MECOM, 3q21 FISH - MDS & MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT178 "SNP Array - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT180 "NPM1::MLF1, t(3;5)(q25;q34) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT183 "WGS Germline & Tumour - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT185 "Next Generation Sequencing Panel - Structural Variants - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT187 "IGH::CCND1, t(11;14)(q13;q32) FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT198 "Chromosome 7 CNV FISH - MDS & MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT200 "Other FISH Targets - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT214 "Other MRD Targets - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT217 "Genome-wide DNA Methylation Profiling"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP613
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP623
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP624
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP625
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT225 "WGS Follow-up Germline - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT231 "Chromosome 11 CNV FISH - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT236 "BRAF rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT237 "EWSR1 rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT239 "TLX1::, 10q24 FISH - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT246 "KIT Hotspot (D816) High Sensitivity - Systemic Mastocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT253 "Next Generation Sequencing Panel - Small Variants - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT254 "WGS Tumour First - Acute leukaemia other"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT256 "IRF4/DUSP22, 6p25 FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT258 "MLLT3::KMT2A, t(9;11)(p21;q23) & other KMT2A rearrangements FISH or RT-PCR - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT259 "Meningioma WGS - Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP613
* #GT265 "WGS Germline & Tumour - MDS/MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT267 "Next Generation Sequencing Panel - Small Variants - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT272 "MYD88 Hotspot (L265P Variants) - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT275 "CBFB::MYH11, inv(16)(p13.1q22) FISH or RT-PCR - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT279 "1p19q CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT289 "CBFA2T3::GLIS2, inv(16)(p13.3q24.3) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT295 "SNP Array - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT296 "ABL2, 1q25 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT301 "KMT2A, 11q23 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT303 "BCR::ABL1 TKD Variants - AML, ALL & CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT304 "WGS Follow-up Germline - AA"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT306 "Next Generation Sequencing Panel - Copy Number Variants - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT312 "IGL::MYC, t(8;22)(q24;q11) FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT315 "TCF3, 19p13 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT321 "BRAF Hotspot (V600E Variants) - Hairy Cell Leukaemia"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT326 "MPL Hotspot (exon 10) - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT329 "Next Generation Sequencing Panel - Structural Variants - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT332 "MRD Target Identification - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT338 "Chromosome 13 CNV FISH - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT343 "MRD RUNX1::RUNX1T1 - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT345 "Chromosome 7 CNV FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT350 "Next Generation Sequencing Panel - Copy Number Variants - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT351 "Other RT-PCR Targets - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT353 "CDKN2A CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT355 "Chromosome 17 CNV FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT369 "IRF4, 6p25 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT373 "PDGFRA, 4q21 FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT383 "Chromosome 17 CNV FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT386 "Next Generation Sequencing Panel - Structural Variants - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT397 "Next Generation Sequencing Panel - Copy Number Variants - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT414 "EZH2, 7q36 CNV FISH - Mature B Cell Neoplams"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT426 "BRAF, 7q34 FISH - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT429 "Next Generation Sequencing Panel - Small Variants - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT431 "NTRK - Multi-target NGS panel - structural variants"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP613
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP624
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT444 "SNP Array - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT453 "RELA rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT456 "NTRK1, 1q23 FISH - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT467 "WGS Germline & Tumour - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT468 "FIP1L1::PDGFRA, 4q12 FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT475 "MRD PML::RARA - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT478 "KMT2A, 11q23 FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT479 "Chromosome 11q CNV FISH - B Cell Lymphoma with 11q Aberration"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT483 "IGL::MYC, t(8;22)(q24;q11) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT494 "IDH1 Hotspot (R132 Variants) - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT497 "Cystic renal disease - WGS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP171
* #GT508 "T Cell Clonality Testing - NGS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP62
* #GT512 "KMT2A::AFDN, t(6;11)(q27;q23) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT517 "WGS Germline & Tumour - BPDCN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT527 "SNP Array - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT533 "FLT3 ITD Targeted Assay - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT534 "REL, 2p16 CNV FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT538 "WGS Germline & Tumour - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT543 "WGS Tumour First - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT546 "IGK::MYC, t(2;8)(p12;q24) FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT548 "ETV6::RUNX1, t(12;21)(p13;q22) & iAMP21 FISH - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT549 "IGH::MAF, t(14;16)(q32;q23) FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT551 "IGHV Hypermutation (Multiplex Sequencing) - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT552 "WGS Germline & Tumour - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT565 "Other FISH Targets - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT576 "MYC::IGH, t(8;14)(q34;q32) FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT577 "ETV6::RUNX1, t(12;21)(p13;q22) RT-PCR - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT579 "ALK, 2p23 FISH - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT583 "YAP1 rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT592 "BRAF::KIAA1549 rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT593 "WGS Germline & Tumour - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT595 "Chromosome 17 CNV FISH - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT613 "BCL2, 18q21 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT614 "Other RT-PCR Targets - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT629 "Next Generation Sequencing Panel - Copy Number Variants - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT632 "MYC, 8q24 FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT634 "MYCN CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT635 "SNP Array - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT637 "CCND2, 12p13 FISH - Mantle Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT646 "IGH::BCL2, t(14;18)(q32;q21) FISH - Follicular Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT649 "BCR::ABL1 multiplex - CML, ALL or AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT656 "MNX1::ETV6, t(7;12)(q36;p13) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT662 "MRD FIP1L1::PDGFRA - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT664 "IGK::MYC, t(2;8)(p12;q24) FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT665 "Other FISH Targets - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT670 "WGS Germline & Tumour - Acute leukaemia other"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT673 "MRD BCR::ABL1 Rare Transcripts - AML, ALL & CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT687 "WGS Tumour First - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT690 "MECOM, 3q21 FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT694 "NUDT15, 13q14 Pharmacogenomic Test - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT699 "FIP1L1::PDGFRA, 4q12 FISH or RT-PCR - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT700 "Chromosome 7 CNV FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT701 "Next Generation Sequencing Panel - Structural Variants - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT702 "WGS Tumour First - JMML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT703 "Other MRD Targets - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT716 "Other FISH Targets - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT717 "Next Generation Sequencing Panel - Small Variants (Limited) - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT720 "Neurological Tumours-EGFRvIII-RT-PCR"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT723 "BCL6, 3q27 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT725 "IGH, 14q32 FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT726 "WGS Germline & Tumour - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT729 "IGH::MYC, t(8;14)(q34;q32) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT733 "TP63, 3q28 FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT736 "Next Generation Sequencing Panel - Copy Number Variants - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT738 "MRD Target Identification - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT739 "Other RT-PCR Targets - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT746 "IGH::MAFB, t(14;20)(q32;q12) FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT756 "MYC, 8q24 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT763 "BCR::ABL1, t(9;22)(q34;q11) FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT777 "BCOR rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT778 "MYB rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT779 "BCL10, 1p22 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT781 "WGS Tumour First - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT790 "MYC CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT795 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT802 "WGS Follow-up Germline - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT818 "PCM1::JAK2, t(8;9)(p22;q24) FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT819 "Next Generation Sequencing Panel - Small Variants - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT821 "Next Generation Sequencing (DNA Based) Panel - Structural Variants - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT825 "WGS Follow-up Germline - Acute Leukaemia Other"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT836 "WGS Follow-up Germline - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT844 "KMT2A::MLLT3, t(9;11)(p21;q23) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT849 "Next Generation Sequencing Panel - Small Variants - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT852 "IGH, 14q32 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT854 "SNP Array"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP625
* #GT855 "CKS1B, 1q21 & CDKN2C, 1p32 CNV FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT868 "CCND1, 11q13 FISH - Mantle Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT870 "MRD CBFB::MYH11 - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT874 "TCF3::PBX1, t(1;19)(q23;p13) & TCF3::HLF, t(17;19)(q22;p13) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT879 "WGS Tumour First - BPDCN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT889 "WGS Tumour First - MDS/MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT890 "IGH::CCND3, t(6;14)(p21;q32) FISH - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT892 "Next Generation Sequencing Panel - Small Variants - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT913 "ALK rearrangement FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT914 "Next Generation Sequencing Panel - Structural Variants - Histiocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP182
* #GT916 "FLT3 TKD Targeted Assay - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT918 "Karyotype - Mature B & T Cell Neoplasm"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT921 "NPM1 Hotspot (exon 12) - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT923 "Chromosome 17 CNV FISH - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT926 "Other FISH Targets - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT929 "Next Generation Sequencing Panel - Copy Number Variants - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT935 "SNP Array - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT939 "Other FISH Targets - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT943 "Embryonal Tumours WGS - Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT944 "MGMT promoter hypermethylation - methylation specific PCR"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP625
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT965 "JAK2 Hotspot (exon 12) - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT985 "Other MRD Targets - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT986 "JAK2 Hotspot (V617F) - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT999 "WGS Germline & Tumour - ALK Positive Anaplastic Large Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1002 "WGS Follow-up Germline - ALK Positive Anaplastic Large Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1007 "FOXP1, 3p13 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1008 "WGS Tumour First - ALK Positive Anaplastic Large Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1012 "PTEN CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1015 "Chromosome 12 CNV FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1023 "WGS Follow-up Germline - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1029 "WGS Follow-up Germline - Systemic Mastocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1033 "BCR::ABL1, t(9;22)(q34;q11) FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1034 "Chromosome 8 CNV FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1042 "CALR Hotspot (exon 9) - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1049 "EGFR CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1050 "WGS Follow-up Germline - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT1052 "BCL2, 18q21 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT1062 "MRD NPM1 - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1063 "WGS Germline & Tumour - Systemic mastocytosis"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1064 "Chromosome 17 CNV FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1076 "WGS Follow-up Germline - exhausted SOC"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP245
* #GT1089 "PDGFRA, 4q12 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1096 "Karyotype - AML, ALL & CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1114 "WGS Follow-up Germline - JMML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1129 "CDKN2B CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1138 "MYBL1 rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1146 "TCR FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1149 "MRD Quantification - T-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1153 "Next Generation Sequencing RNA Panel - Structural Variants - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1163 "BCR::ABL1, t(9;22)(q34;q11) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1166 "NUP98, 11p15 FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1180 "PDGFRB / CSF1R, 5q32 FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1181 "IGHV Hypermutation (NGS) - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT1185 "TPMT, 6p22 Pharmacogenomic Test - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1191 "KMT2A::AFF1, t(4;11)(q21;q23) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1193 "Other FISH Targets - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1209 "Next Generation Sequencing Panel - Small Variants - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT1211 "Other FISH Targets - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1221 "WGS Follow-up Germline - BPDCN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1224 "Chromosome 5 CNV FISH - MDS & MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1228 "MRD NPM1 Rare Transcripts - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1233 "Karyotype - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1236 "WGS Follow-up Germline - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1238 "WGS Germline & Tumour - JMML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1247 "MRD Quantification - B-ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
* #GT1248 "Chromosome 8 CNV FISH - MDS & MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1253 "IGHV hypermutation (Multiplex Sequencing) - Hairy Cell Leukaemia"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1258 "TP53 deletion CNV FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT1260 "Ependymal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1265 "SNP Array - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1274 "Next Generation Sequencing Panel - Structural Variants - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT1277 "Hyperdiploidy CNV FISH or MLPA - Myeloma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP126
* #GT1279 "Next Generation Sequencing Panel - Small Variants - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1280 "MN1 rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1281 "Chromosome 12 CNV FISH - CLL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP533
* #GT1282 "ETV6::PDGFRB, t(5;12)(q33;p13) FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1285 "BCL6, 3q27 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1294 "Chromosome 5 CNV FISH - AML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP450
* #GT1297 "Next Generation Sequencing Panel - Small Variants - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1300 "KMT2A::ELL, t(11;19)(q23;p13.1) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1302 "Chromosome 20 CNV FISH - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1308 "KMT2A::MLLT10, t(10;11)(p12;q23) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1309 "KMT2A::MLLT1, t(11;19)(q23;p13.3) FISH - ALL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP241
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP34
* #GT1312 "WGS Germline & Tumour - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1317 "Small variant (IDH1)"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1332 "ZFTA rearrangements FISH"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1333 "Structural variant, not otherwise specified - Targeted Variant Test"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1334 "Small nucleotide variant , not otherwise specified - Targeted Variant Test"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP613
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1335 "Chimerism by STR Testing - Post Solid Organ Transplant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP401
* #GT1336 "Chimerism by XY FISH - Post Solid Organ Transplant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP401
* #GT1337 "CD79B Hotspot (Y196 Variants) - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1338 "Other FISH Targets - Mature T cell neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1339 "WGS Germline & Tumour - B Cell Lymphoma with 11q Aberration"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1340 "WGS Tumour First - AA"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1341 "WGS Germline & Tumour - B Cell Lymphoma with IRF4 Rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1342 "WGS Germline & Tumour - Follicular Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1343 "WGS Follow-up Germline - Follicular lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1344 "WGS Germline & Tumour - Marginal Zone Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1345 "Chromosome 17 CNV FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1346 "Copy number variant, not otherwise specified - Targeted Variant Test"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1347 "WGS Germline & Tumour - High Grade Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1348 "CIITA, 16p13 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1349 "WGS Tumour First - Burkitt Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1350 "WGS Germline & Tumour - Burkitt Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1351 "WGS Follow-up Germline - High Grade Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1352 "WGS Germline & Tumour - Hepatosplenic T Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1353 "WGS Follow-up Germline - T Cell NHL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1354 "ALK, 2p23 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1355 "PDGFRB, 5q32 FISH - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
* #GT1356 "WGS Germline & Tumour - Low Grade Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1357 "WGS Follow-up Germline - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1358 "WGS Tumour First - T Cell NHL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1359 "WGS Follow-up Germline - ALK Negative Anaplastic Large Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1360 "WGS Tumour First - ALK Positive Large B Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1361 "WGS Tumour First - Hepatosplenic T Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1362 "WGS Tumour First - ALK Negative Anaplastic Large Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1363 "WGS Follow-up Germline - B Cell Lymphoma with 11q Aberration"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1364 "WGS Follow-up Germline - Hepatosplenic T Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1365 "WGS Follow-up Germline - Marginal Zone Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1366 "WGS Follow-up Germline - Low Grade Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1367 "WGS Follow-up Germline - B Cell Lymphoma with IRF4 Rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1368 "Chimerism by STR Testing - Post Stem Cell Transplant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP401
* #GT1369 "WGS Germline & Tumour - ALK Negative Anaplastic Large Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1370 "Chimerism by XY FISH - Post Stem Cell Transplant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP401
* #GT1371 "BCR::ABL1, t(9;22)(q34;q11) FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1372 "WGS Follow-up Germline - NK Cell/Gamma-Delta T Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1373 "WGS Tumour First - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1375 "Karyotype - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1376 "WGS Germline & Tumour - NK Cell/Gamma-Delta T Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1377 "WGS Tumour First - Low Grade Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1378 "WGS Germline & Tumour - ALK Positive Large B Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1379 "WGS Tumour First - Follicular Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1380 "IGHV Hypermutation (NGS) - Hairy Cell Leukaemia"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1381 "WGS Germline & Tumour - Primary Mediastinal B Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1382 "WGS Germline & Tumour - AA"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1383 "WGS Follow-up Germline - ALK Positive Large B Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1384 "WGS Tumour First - NK Cell/Gamma-Delta T Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1385 "ALK::NPM1, t(2;5)(p23;q35) FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1386 "WGS Germline & Tumour - T Cell NHL"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1387 "WGS Follow-up Germline - Primary Mediastinal B Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1388 "WGS Follow-up Germline - Burkitt Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1389 "WGS Tumour First - Marginal Zone Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1390 "WGS Tumour First - B Cell Lymphoma with 11q Aberration"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1391 "WGS Tumour First - Primary Mediastinal B Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1392 "WGS Tumour First - B Cell Lymphoma with IRF4 Rearrangement"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1393 "WGS Tumour First - High Grade Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1394 "MYC, 8q24 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1403 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1404 "CD274 / PDCD1LG2, 9p24 FISH - Mature B Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1405 "Tumours of the Sellar Region and Pituitary Tumours Differential Diagnosis-NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
* #GT1407 "IGH::CCND1, t(11;14)(q13;q32) FISH - Mantle Cell Lymphoma"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP377
* #GT1408 "B Cell Clonality Testing - NGS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP62
* #GT1411 "Embryonal Tumours Differential Diagnosis-NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT1413 "Embryonal Tumours Differential Diagnosis-NGS Panel Structural Variant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP604
* #GT1414 "Next Generation Sequencing Panel - Copy Number Variant - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1415 "Gliomas, Glioneuronal Tumours, and Neuronal tumours Differential Diagnosis-NGS Panel Structural Variants"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1416 "ALK, 2p23 FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1418 "Ependymal Tumours Differential Diagnosis-NGS Panel Structural Variants"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1420 "Meningiomas Differential Diagnosis-NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP613
* #GT1422 "Chromosome 8 CNV FISH - Mature T Cell Neoplasms"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP58
* #GT1423 "B Cell Clonality Testing - Multiplex Sequencing"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP62
* #GT1424 "Chromosome 5 CNV FISH - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1426 "Next Generation Sequencing Panel - Small Variant - CML"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP374
* #GT1427 "Choroid plexus tumours - NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP624
* #GT1428 "Choroid plexus tumours WGS - Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP624
* #GT1429 "Tumours of the CNS NOS including Rare tumours Differential Diagnosis-NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP625
* #GT1430 "Tumours of the CNS NOS including Rare tumours Differential Diagnosis-NGS Panel Structural Variant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP625
* #GT1431 "CNS of uncertain differentiation (NOS) and Rare Tumours WGS - Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP625
* #GT1432 "Gliomas, Glioneuronal Tumours, and Neuronal tumours WGS - Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP640
* #GT1433 "Tumours of the Sellar Region and Pituitary Tumours WGS - Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP622
* #GT1434 "Cranial and paraspinal nerve tumours Differential - NGS Panel SNV and CNV"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP623
* #GT1435 "Cranial and paraspinal nerve tumours Differential - NGS Panel Structural Variant"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP623
* #GT1436 "Cranial and paraspinal nerve tumours WGS- Paediatric and Adult"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP623
* #GT1439 "WGS Tumour First - MDS"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP202
* #GT1497 "MRD JAK2 Hotspot (V617F) - MPN"
  * ^property[+].code = #parent
  * ^property[=].valueCode = #TP228
