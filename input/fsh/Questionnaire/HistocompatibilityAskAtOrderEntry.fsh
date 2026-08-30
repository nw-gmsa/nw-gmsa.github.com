Instance: HistocompatibilityAskAtOrderEntry

InstanceOf: NWQuestionnaire
Title: "Histocompatibility and Immunogenetics Ask At Order Entry"
Description: """
**Ask At Order Entry Questions** used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) for Histocompatibility and Immunogenetics
orders (SNOMED CT `909871000000100`) - see
[Order Entry Questions](ServiceRequest.html#order-entry-questions) and
[Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions).

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

* title = "Histocompatibility and Immunogenetics Ask At Order Entry"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/HistocompatibilityAskAtOrderEntry"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

// NTE|1 Patient Test(s):->HLA ANTIBODY SCREENING (TRANSPLANT)

  * item[+]
    * type = #string
    * linkId = "HistoIG/patient_test"
    * text = "Patient Test(s)"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "HistoIG/patient_test-designNote"
      * type = #display
      * text = "Histotrac NTE-3 (CommentType=OSQ): restates the OBR-4 test name, not a new mapping."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/patient_test-openQuestion"
      * type = #display
      * text = "Open question: does a standard code set for this test name already exist (MFT local code, NHS England Genomic Test Directory, or elsewhere)? If confirmed, this item should become #choice bound to that code system instead of free text."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/patient_test-reference"
      * type = #display
      * text = """
      No MFT/NHS England code set was found for this test name specifically, but LOINC
      has panels the Histotrac test catalogue could map onto: 102092-4 (HLA-ABDR typing
      panel), 96615-0/96629-1 (HLA-A/B/C class I typing, high/low resolution), 94492-6
      (HLA-DQA1/DQB1 typing), 72905-3 (Neutrophil Ab and HLA Ab screen panel), 94428-0
      (HLA class I and II IgG panel), and 80737-0 (Calculated panel reactive antibody).
      Not the NHS England Genomic Test Directory (England-GenomicTestDirectory) - H&I is
      not part of that catalogue.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|2 HLA Type:->Patient

  * item[+]
    * type = #string
    * linkId = "HistoIG/hla_type"
    * text = "HLA Type"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "HistoIG/hla_type-designNote"
      * type = #display
      * text = """
      Whose HLA is being typed, e.g. "Patient" or "Donor" - carried as an Observation
      referenced from ServiceRequest.supportingInfo, the same Ask at Order Entry
      pattern used by dWGS's Family Structure/Participant Type. Text-only, no
      NW-GMSA-confirmed coding system exists.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/hla_type-openQuestion"
      * type = #display
      * text = """
      Open question: is this a fixed list of values (e.g. Patient/Donor), and if so
      what is the full list? For the Clatterbridge <-> NW Genomics exchange, the
      preference is to carry this on an OBX segment (a discrete, coded observation)
      rather than free text - Histotrac itself will still receive it as an NTE
      segment, so the RIE would need to transform the OBX into the NTE format
      Histotrac expects.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/hla_type-reference"
      * type = #display
      * text = """
      Confirmed as a fixed national list, not free text: NHSBT's INF136 (Table 2) names
      a national request form "H&I Organ Transplant (Patients and Donors)" (FRM1008),
      and its sample-requirements table lists "HLA type of patient, donors or family
      members" for Solid Organ Transplantation - so the full list is at least
      Patient/Donor/Family Member, not just Patient/Donor. A separate national form,
      "H&I Haematopoietic Stem Cell Transplantation (Recipients & Donors)" (FRM1010),
      uses Recipient/Donor instead of Patient/Donor for that transplant type. No
      NHSBT-published FHIR/LOINC/SNOMED binding exists for either.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|3 Patient type:->Renal

  * item[+]
    * type = #string
    * linkId = "HistoIG/patient_type"
    * text = "Patient Type"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "HistoIG/patient_type-designNote"
      * type = #display
      * text = "Transplant context, e.g. \"Renal\" - carried as an Observation referenced from ServiceRequest.supportingInfo."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/patient_type-openQuestion"
      * type = #display
      * text = """
      Open question: is this a fixed list of values (e.g. Renal, Liver, Cardiac...),
      and if so what is the full list? For the Clatterbridge <-> NW Genomics exchange,
      the preference is to carry this on an OBX segment rather than free text -
      Histotrac itself will still receive it as an NTE segment, so the RIE would need
      to transform the OBX into the NTE format Histotrac expects.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/patient_type-reference"
      * type = #display
      * text = """
      NHSBT's INF136 (4.5.1) describes 24-hour on-call cover for "renal and, where
      appropriate, cardiothoracic transplantation" as the two Solid Organ
      Transplantation categories with routine H&I on-call support - consistent with a
      small fixed list (at least Renal, Cardiothoracic). The same section notes HLA
      matching is "not normally a primary consideration" for other transplant types
      (cardiothoracic, liver, etc.), which may still appear as a Patient Type value
      even without on-call cover. No NHSBT/NHS England LOINC/SNOMED binding was found
      for this field.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|4 Organ:->Kidney

  * item[+]
    * type = #string
    * linkId = "HistoIG/organ"
    * text = "Organ"
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "HistoIG/organ-designNote"
      * type = #display
      * text = "The organ relevant to the transplant, e.g. \"Kidney\" - carried as an Observation referenced from ServiceRequest.supportingInfo. No confirmed SNOMED CT mapping yet - low confidence, free text only."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/organ-openQuestion"
      * type = #display
      * text = """
      Open question: is this a fixed list of values? The preference is to use SNOMED CT
      body site codes from the FHIR body-site value set
      (https://hl7.org/fhir/R4/valueset-body-site.html), as this aligns with EU/UK
      standards, rather than free text. For the Clatterbridge <-> NW Genomics exchange,
      the preference is to carry this on an OBX segment - Histotrac itself will still
      receive it as an NTE segment, so the RIE would need to transform the OBX into the
      NTE format Histotrac expects.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "HistoIG/organ-reference"
      * type = #display
      * text = """
      Besides the generic FHIR body-site value set, NHS Digital publishes a UK-specific
      alternative: the "Solid organ transplant codes" (ORGTRANSP_COD) SNOMED CT (UK
      Edition) reference set, part of the NHS Digital Primary Care Domain Refsets
      (~364 codes, https://www.opencodelists.org/codelist/nhsd-primary-care-domain-refsets/orgtransp_cod/) -
      covering NHSBT's six national organ transplant groups (kidney, pancreas, heart,
      lung, liver, small bowel), a closer domain fit than the generic body-site set.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// NTE|5 Specimen source->Blood

  * item[+]
    * type = #choice
    * linkId = "LN/66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerValueSet = Canonical(SpecimenType)
    * text = "Specimen Source"
    * item[+]
      * linkId = "LN/66746-9-openQuestion"
      * type = #display
      * text = """
      This already uses the EU/UK/NW-compatible [Specimen Type](ValueSet-specimen-type.html)
      value set - we may need to pick a subset of its codes for this specific exchange.
      For the Clatterbridge <-> NW Genomics exchange, the preference is to carry this on
      an SPM segment - Histotrac itself will still receive it as an NTE segment, so the
      RIE would need to transform the SPM into the NTE format Histotrac expects.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "LN/66746-9-reference"
      * type = #display
      * text = """
      NHSBT's INF136 Table 5 (sample requirements) shows nearly every H&I test uses
      peripheral blood (EDTA and/or clotted, varying by test), with spleen/lymph node
      as the exception for deceased-donor crossmatching - a narrow subset of the
      SpecimenType value set (e.g. whole blood, plasma/serum specimen) would likely
      cover this exchange, consistent with the subset dWGS already uses. No dedicated
      NHS-published specimen-type binding specific to H&I was found.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
