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
