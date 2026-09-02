Instance: HLATestsTransplantAskAtOrderEntry

InstanceOf: NWQuestionnaire
Title: "HLA Tests - Transplant Ask At Order Entry"
Description: """
**Ask At Order Entry Questions** used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) for the "HLA Tests - Transplant" order
screen within Histocompatibility and Immunogenetics orders (SNOMED CT
`909871000000100`) - see
[Order Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions) and
[Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions).
For the sibling Chimerism testing order screen, see
[Chimerism Testing Blood (PB) Ask At Order Entry](Questionnaire-ChimerismTestingAskAtOrderEntry.html).

Extracted from the `NTE` segments (each carrying HL7 v2 Table 0105-style comment type
`OSQ`) of a live Histotrac `ORM^O01` order - see the worked
[example](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions) for the
full message. Each `NTE-3` value uses a local `Label:->Value` convention (e.g.
`HLA Type:->Patient`), split below into a question/answer pair.

**Research summary (no NHS England-published order-comms/interoperability standard was
found for these fields)**: NHS England's published pathology standards
([Pathology Test and Results Standard](https://standards.nhs.uk/published-standards/pathology-test-and-results-standard),
[SNOMED CT for pathology reporting](https://digital.nhs.uk/services/pathology-standards-and-implementation/snomed-ct-for-pathology-reporting))
do not cover Histocompatibility and Immunogenetics (H&I) order entry specifically. The
relevant national body is **NHS Blood and Transplant (NHSBT)**, not NHS England: its
[INF136 "User Guide for Histocompatibility and Immunogenetics Diagnostics
Services"](https://nhsbtdbe.blob.core.windows.net/umbraco-assets-corp/29939/inf136.pdf)
defines six national H&I request forms (Table 2) including `FRM1008` "H&I Organ
Transplant (Patients and Donors)" and `FRM1010` "H&I Haematopoietic Stem Cell
Transplantation (Recipients & Donors)", plus a sample-requirements table listing
"HLA type of **patient, donors or family members**" for Solid Organ Transplantation -
confirming HLA Type is a fixed national list, not free text, even though NHSBT does not
publish a FHIR/LOINC/SNOMED binding for it. NHSBT's Solid Organ Transplantation section
(4.5.1) also describes 24-hour on-call cover for "**renal** and, where appropriate,
**cardiothoracic** transplantation", with liver/other transplant types noted separately
as not having HLA match as a primary factor - consistent with Patient Type being a
small, fixed list. The professional bodies **BSHI** (British Society for
Histocompatibility and Immunogenetics) and **BTS** (British Transplantation Society)
jointly publish clinical guidelines (e.g. the
[2015 BTS/BSHI antibody characterisation guideline](https://bts.org.uk/wp-content/uploads/2016/09/06_BTS_BSHI_Antibodies-1.pdf))
but not data/interoperability standards. This IG's own dependency,
[HL7's Genomics Reporting IG - Histocompatibility and Immunogenetic
Reporting](http://hl7.org/fhir/uv/genomics-reporting/histocompatibility.html), profiles
structured HLA genotype/haplotype *results* (LOINC `84413-4` Genotype display name,
`48018-6` Gene studied, `13298-5` HLA-A [Type], the GL String and HGNC systems) but does
not address order-entry "ask at order" questions like these. See each item below for
LOINC panels and UK code lists relevant to that specific question.
"""
Usage:  #definition

* title = "HLA Tests - Transplant Ask At Order Entry"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HLATestsTransplantAskAtOrderEntry"
* derivedFrom = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"
* derivedFrom.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
  * valueCoding = http://hl7.org/fhir/questionnaire-derivationType#extends

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

// NTE|1 Patient Test(s):->HLA ANTIBODY SCREENING (TRANSPLANT)

  * item[+]
    * type = #choice
    * linkId = "HistoIG/patient_test"
    * text = "Patient Test(s)"
    * repeats = true
    * answerOption[+].valueCoding = $nwgmsa#HLATypingAntibodyScreening "HLA Typing + Antibody Screening"
    * answerOption[+].valueCoding = $nwgmsa#HLAAntibodyScreening "HLA Antibody Screening"
    * answerOption[+].valueCoding = $nwgmsa#HLATypeRecipient "HLA Type Recipient"
    * answerOption[+].valueCoding = $nwgmsa#DSA "DSA"
    * answerOption[+].valueCoding = $nwgmsa#HLAAutoXM "HLA Auto XM"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "HistoIG/patient_test-designNote"
      * type = #display
      * text = """
      Histotrac NTE-3 (CommentType=OSQ): restates the OBR-4 test name, not a new
      mapping. Confirmed as this fixed 5-value checklist (`repeats = true`, since the
      Hive UI presents them as checkboxes - more than one may be selected per order)
      from the Hive/Histotrac order-entry UI, shown identically regardless of Patient
      Type (Stem cell or Renal) - coded locally against the `NWGMSA` CodeSystem.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/patient_test-reference"
      * type = #display
      * text = """
      No MFT/NHS England code set was found for these five specific test names, but
      LOINC has panels the Histotrac test catalogue could map onto if a coded
      alternative to the local `NWGMSA` codes is wanted: 102092-4 (HLA-ABDR typing
      panel), 96615-0/96629-1 (HLA-A/B/C class I typing, high/low resolution), 94492-6
      (HLA-DQA1/DQB1 typing), 72905-3 (Neutrophil Ab and HLA Ab screen panel), 94428-0
      (HLA class I and II IgG panel), and 80737-0 (Calculated panel reactive antibody).
      Not the NHS England Genomic Test Directory (England-GenomicTestDirectory) - H&I is
      not part of that catalogue.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|2 HLA Type:->Patient

  * item[+]
    * type = #choice
    * linkId = "HistoIG/hla_type"
    * text = "HLA Type"
    * required = true
    * answerOption[+].valueCoding = $nwgmsa#Patient "Patient"
    * answerOption[+].valueCoding = $nwgmsa#Donor "Donor"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "HistoIG/hla_type-designNote"
      * type = #display
      * text = """
      Whose HLA is being typed - carried as an Observation referenced from
      ServiceRequest.supportingInfo, the same Ask at Order Entry pattern used by
      dWGS's Family Structure/Participant Type. Confirmed as a 2-value list (Patient,
      Donor) from the Hive/Histotrac order-entry UI screenshots - coded locally
      against the `NWGMSA` CodeSystem as no NHSBT/NHS England-published
      FHIR/LOINC/SNOMED binding exists.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/hla_type-reference"
      * type = #display
      * text = """
      NHSBT's INF136 (Table 2) names a national request form "H&I Organ Transplant
      (Patients and Donors)" (FRM1008), and its sample-requirements table lists "HLA
      type of patient, donors or family members" for Solid Organ Transplantation -
      wider than the Patient/Donor pair the Hive UI actually offers. A separate
      national form, "H&I Haematopoietic Stem Cell Transplantation (Recipients &
      Donors)" (FRM1010), uses Recipient/Donor instead of Patient/Donor for that
      transplant type. No NHSBT-published FHIR/LOINC/SNOMED binding exists for either,
      and Hive does not appear to expose a Family Member/Recipient option here.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|3 Patient type:->Renal

  * item[+]
    * type = #choice
    * linkId = "HistoIG/patient_type"
    * text = "Patient Type"
    * answerOption[+].valueCoding = $nwgmsa#StemCell "Stem cell"
    * answerOption[+].valueCoding = $nwgmsa#Renal "Renal"
    * answerOption[+].valueCoding = $nwgmsa#Thoracic "Thoracic"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "HistoIG/patient_type-designNote"
      * type = #display
      * text = """
      Transplant context - carried as an Observation referenced from
      ServiceRequest.supportingInfo. Confirmed as a 3-value list (Stem cell, Renal,
      Thoracic) from the Hive/Histotrac order-entry UI - coded locally against the
      `NWGMSA` CodeSystem. When Patient Type is "Renal" the Hive UI also shows an
      Organ picker (see `HistoIG/organ` below); no Organ field is shown for Stem
      cell/Thoracic.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/patient_type-reference"
      * type = #display
      * text = """
      NHSBT's INF136 (4.5.1) describes 24-hour on-call cover for "renal and, where
      appropriate, cardiothoracic transplantation" as the two Solid Organ
      Transplantation categories with routine H&I on-call support, and the Hive UI's
      "Thoracic" option lines up with that "cardiothoracic" wording (not "Cardiac").
      Stem cell is a third category the Hive UI groups here rather than treating as a
      separate transplant type. No NHSBT/NHS England LOINC/SNOMED binding was found
      for this field.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|4 Organ:->Kidney

  * item[+]
    * type = #choice
    * linkId = "HistoIG/organ"
    * text = "Organ"
    * answerOption[+].valueCoding = $nwgmsa#Kidney "Kidney"
    * answerOption[+].valueCoding = $nwgmsa#Pancreas "Pancreas"
    * answerOption[+].valueCoding = $nwgmsa#Islets "Islets"
    * answerOption[+].valueCoding = $nwgmsa#SimultaneousPancreasKidney "Simultaneous Pancreas/Kidney"
    * answerOption[+].valueCoding = $nwgmsa#SimultaneousIsletKidney "Simultaneous Islet/Kidney"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "HistoIG/organ-designNote"
      * type = #display
      * text = """
      The organ relevant to the transplant - carried as an Observation referenced from
      ServiceRequest.supportingInfo. Confirmed as this 5-value list (plus a free-text
      "Other" box, not modelled here) from the Hive/Histotrac order-entry UI, only shown
      there when Patient Type is "Renal" - coded locally against the `NWGMSA`
      CodeSystem, since two of the five values (the two "Simultaneous..." combination
      transplants) are not themselves single SNOMED CT body-site concepts.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/organ-reference"
      * type = #display
      * text = """
      For the three single-organ values (Kidney, Pancreas, Islets), SNOMED CT body-site
      codes from the FHIR body-site value set (https://hl7.org/fhir/R4/valueset-body-site.html)
      or NHS Digital's UK-specific "Solid organ transplant codes" (ORGTRANSP_COD)
      reference set (part of the NHS Digital Primary Care Domain Refsets, ~364 codes,
      https://www.opencodelists.org/codelist/nhsd-primary-care-domain-refsets/orgtransp_cod/)
      remain candidate future bindings if a coded alternative to the local `NWGMSA`
      codes is wanted. Neither source has a single code for a combination transplant
      such as "Simultaneous Pancreas/Kidney", which is why the local coding keeps all
      five Hive values together as one list rather than splitting by source.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|5 Specimen source->Blood

  * item[+]
    * type = #choice
    * linkId = "HistoIG/specimen_source"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerOption[+].valueCoding = $nwgmsa#HistoBlood "Blood"
    * answerOption[+].valueCoding = $nwgmsa#HistoBuccal "Buccal"
    * answerOption[+].valueCoding = $nwgmsa#HistoOther "Other"
    * text = "Specimen Source"
    * item[+]
      * linkId = "HistoIG/specimen_source-designNote"
      * type = #display
      * text = """
      Confirmed as this 3-value list (Blood, Buccal, plus a free-text "Other" box, not
      modelled here) from the Hive/Histotrac order-entry UI's HLA panel - narrower than
      the EU/UK/NW-compatible [Specimen Type](ValueSet-specimen-type.html) value set
      previously bound here (`answerValueSet = Canonical(SpecimenType)`), so this item
      now uses local `NWGMSA` codes to match what Hive actually offers for this
      exchange. The separate [Chimerism Testing Blood (PB)](Questionnaire-ChimerismTestingAskAtOrderEntry.html)
      order screen in Hive instead offers "Blood (PB)"/"Bone Marrow (BM)". Deliberately
      given its own `HistoIG/specimen_source` linkId rather than reusing the base
      [Genomic Test Order](Questionnaire-GenomicTestOrder.html)'s own `LN/66746-9`
      Specimen Type item (same `code`/LOINC `66746-9`, so the semantic link is kept via
      `code`) - the two questions are asked at different points for different purposes
      in Hive, and the IG Publisher's Questionnaire derivation validator does not
      support a `derivedFrom`/`extends` item reusing a base item's linkId while also
      declaring more than one `answerOption`.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/specimen_source-reference"
      * type = #display
      * text = """
      NHSBT's INF136 Table 5 (sample requirements) shows nearly every H&I test uses
      peripheral blood (EDTA and/or clotted, varying by test), with spleen/lymph node
      as the exception for deceased-donor crossmatching - consistent with Hive's Blood
      option. If a coded alternative to the local `NWGMSA` codes is wanted, the
      [Specimen Type](ValueSet-specimen-type.html) value set remains a candidate binding
      (e.g. whole blood, plasma/serum specimen for Blood; a buccal swab specimen code
      for Buccal). No dedicated NHS-published specimen-type binding specific to H&I was
      found.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
