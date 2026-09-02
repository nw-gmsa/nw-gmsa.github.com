Instance: ChimerismTestingAskAtOrderEntry

InstanceOf: NWQuestionnaire
Title: "Chimerism Testing Blood (PB) Ask At Order Entry"
Description: """
**Ask At Order Entry Questions** used alongside the [common core order
form](Questionnaire-GenomicTestOrder.html) for the "Chimerism Testing Blood (PB)" order
screen within Histocompatibility and Immunogenetics orders (SNOMED CT
`909871000000100`) - see
[Order Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions) and
[Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions).
For the sibling HLA testing order screen, see
[HLA Tests - Transplant Ask At Order Entry](Questionnaire-HLATestsTransplantAskAtOrderEntry.html).

Unlike the HLA Tests - Transplant screen, no live Histotrac `NTE` example order for
this screen has yet been seen - the two items below are inferred directly from the
Hive/Histotrac "Chimerism Testing Blood (PB)" order-entry UI screenshot, following the
same `NTE` `Label:->Value` convention this Questionnaire family otherwise uses. See also
[Chimerism Testing Result Panel](Questionnaire-ChimerismResultPanel.html) for the
(separate) structured *result* payload this order eventually produces.

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
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/ChimerismTestingAskAtOrderEntry"
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

// Patient Test(s):->Chimerism Peripheral Blood

  * item[+]
    * type = #choice
    * linkId = "ChimIG/patient_test"
    * text = "Patient Test(s)"
    * repeats = true
    * answerOption[+].valueCoding = $nwgmsa#ChimerismPeripheralBlood "Chimerism Peripheral Blood"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismCD3 "Chimerism CD3"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismCD15 "Chimerism CD15"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismCD19 "Chimerism CD19"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismLineageOther "Chimerism Lineage Other"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "ChimIG/patient_test-designNote"
      * type = #display
      * text = """
      Which chimerism panel/lineage is being tested - the same Ask At Order Entry
      pattern as `HistoIG/patient_test` on
      [HLA Tests - Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html)
      (`repeats = true`, since the Hive UI presents them as checkboxes - more than one
      may be selected per order). Confirmed as this fixed 5-value checklist from the
      Hive/Histotrac order-entry UI - coded locally against the `NWGMSA` CodeSystem, as
      no NHSBT/NHS England-published FHIR/LOINC/SNOMED binding exists.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "ChimIG/patient_test-reference"
      * type = #display
      * text = """
      No MFT/NHS England code set was found for these five specific test names. LOINC
      has short tandem repeat (STR)/chimerism-adjacent panels (e.g. `48018-6` Gene
      studied, engraftment-monitoring local codes used elsewhere in genetics
      laboratories) but no exact match for a CD3/CD15/CD19 lineage-specific chimerism
      checklist was confirmed - a candidate future binding if a coded alternative to
      the local `NWGMSA` codes is wanted. See also this IG's existing
      [Chimerism](CodeSystem-Chimerism.html) CodeSystem, which covers the *result*
      payload's OBX-3 sub-identifiers (STR/IM/RANGE/CV/EXT/PURE/POST/DTP/DID) rather
      than these order-entry test-selection values.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Specimen Source :->Blood (PB)

  * item[+]
    * type = #choice
    * linkId = "LN/66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismBloodPB "Blood (PB)"
    * answerOption[+].valueCoding = $nwgmsa#ChimerismBoneMarrowBM "Bone Marrow (BM)"
    * text = "Specimen Source"
    * item[+]
      * linkId = "LN/66746-9-designNote"
      * type = #display
      * text = """
      Confirmed as this 2-value list (Blood (PB), Bone Marrow (BM)) from the
      Hive/Histotrac order-entry UI's Chimerism panel - a different list from the
      Blood/Buccal/Other list [HLA Tests -
      Transplant](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) uses for the
      same `LN/66746-9` linkId/question code, since the two order screens offer
      different specimen-source options in Hive. Coded locally against the
      `NWGMSA` CodeSystem rather than the EU/UK/NW-compatible
      [Specimen Type](ValueSet-specimen-type.html) value set, to match what Hive
      actually offers for this exchange.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
    * item[+]
      * linkId = "LN/66746-9-reference"
      * type = #display
      * text = """
      Post-transplant chimerism monitoring conventionally uses peripheral blood, with
      bone marrow used for deeper/marrow-level engraftment assessment - consistent with
      this 2-value list. If a coded alternative to the local `NWGMSA` codes is wanted,
      the [Specimen Type](ValueSet-specimen-type.html) value set remains a candidate
      binding (e.g. whole blood specimen for Blood (PB); bone marrow specimen for Bone
      Marrow (BM)). No dedicated NHS-published specimen-type binding specific to H&I
      chimerism testing was found.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help
