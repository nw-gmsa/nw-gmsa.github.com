Instance: ChimerismTestAdditionalAskAtOrderQuestions

InstanceOf: NWQuestionnaire
Title: "Chimerism Test Additional Ask At Order Entry Questions"
Description: """
**Test Specific Additional Ask At Order Entry Questions** used alongside the
[common core order form](Questionnaire-GenomicTestOrder.html) for the
"Chimerism Testing Blood (PB)" order screen within Histocompatibility and
Immunogenetics orders (SNOMED CT `909871000000100`) - the same "Test
Specific" tier pattern [WGS Test Additional Ask At Order Entry
Questions](Questionnaire-WGSTestAdditionalAskAtOrderQuestions.html) follows
for WGS orders - see
[Order Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions) and
[Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions).
For the sibling HLA testing order screen, see
[HLA Tests - Transplant Ask At Order Entry](Questionnaire-HLATestsTransplantAskAtOrderEntry.html).

Extracted from the `NTE` segments of a live Histotrac `ORM^O01` order for a Chimerism
Testing (Performable) test - see the worked
[example](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry)
for the full message. The original order carried two `NTE` segments (Specimen Source,
then Patient Test(s)); only Specimen Source is asked here - Specimen Identifier (a
speculative future `SPM-2` addition) and Patient Test(s) have both since been dropped
as Ask At Order Entry questions. See also [Chimerism Testing Result
Panel](Questionnaire-ChimerismResultPanel.html) for the (separate) structured *result*
payload this order eventually produces.

**Research summary**: as with [HLA Tests - Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html),
no NHS England or NHSBT-published order-comms/interoperability standard was found
specifically for Chimerism testing order entry. NHSBT's INF136 "User Guide for
Histocompatibility and Immunogenetics Diagnostics Services" defines `FRM1010` "H&I
Haematopoietic Stem Cell Transplantation (Recipients & Donors)" as the relevant national
request form for post-transplant chimerism monitoring, but does not publish a
FHIR/LOINC/SNOMED binding for the specific test-panel or specimen-source values Hive
uses. See each item below for candidate LOINC/SNOMED codes.
"""
Usage:  #definition

* title = "Chimerism Testing Blood (PB) Ask At Order Entry"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/ChimerismTestAdditionalAskAtOrderQuestions"
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

// Specimen Source :->Blood (PB)

  * item[+]
    * type = #choice
    * linkId = "ChimIG/specimen_source"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerOption[+].valueCoding = $sct#119297000 "Blood specimen"
    * answerOption[+].valueCoding = $sct#119359002 "Bone marrow specimen"
    * text = "Specimen Source"
    * item[+]
      * linkId = "ChimIG/specimen_source-designNote"
      * type = #display
      * text = """
      Confirmed as this 2-value list (Blood, Bone marrow) from the Hive/Histotrac
      order-entry UI's Chimerism panel - a different list from the Blood/Buccal/Other
      list [HLA Tests -
      Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) uses for the
      same underlying `code` (LOINC `66746-9`), since the two order screens offer
      different specimen-source options in Hive. Coded against SNOMED CT (the EU/UK/NW-compatible
      [Specimen Type](ValueSet-specimen-type.html) value set's own generic codes -
      `119297000` "Blood specimen" for Blood (PB), `119359002` "Bone marrow specimen"
      for Bone Marrow (BM)) rather than a local `NWGMSA` code, once converted onto
      `SPM-4` (`Specimen.type`) - see [Chimerism Testing Ask At Order
      Entry](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry).
      Deliberately given its own `ChimIG/specimen_source` linkId rather than reusing
      the base [Genomic Test Order](Questionnaire-GenomicTestOrder.html)'s own
      `LN/66746-9` Specimen Type item - the IG Publisher's Questionnaire derivation
      validator does not support a `derivedFrom`/`extends` item reusing a base item's
      linkId while also declaring more than one `answerOption`. Matches `NTE|1` in the
      live Histotrac order. Specimen Identifier (a speculative future `SPM-2` addition)
      and Patient Test(s) (`NTE|2`) have since been dropped, leaving Specimen Source as
      this Questionnaire's only Ask At Order Entry question.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "ChimIG/specimen_source-reference"
      * type = #display
      * text = """
      Post-transplant chimerism monitoring conventionally uses peripheral blood, with
      bone marrow used for deeper/marrow-level engraftment assessment - consistent with
      this 2-value list. No dedicated NHS-published specimen-type binding specific to
      H&I chimerism testing was found; the generic [Specimen
      Type](ValueSet-specimen-type.html) SNOMED CT codes above are used instead.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
