Instance: dWGSSubOrder
InstanceOf: NWQuestionnaire
Title: "North West Genomics dWGS Sub-Order Manifest"
Description: """
**For analysis purposes only - not an active or planned project.**

**CSV manifest description**, not an Ask At Order Entry Questionnaire - this
Questionnaire documents the complete digital manifest for a **distributed
WGS (dWGS)** sub-contracted order (IHE LTW `LAB-35`), sent by a Requesting
Genomic Laboratory (RGL) to North West Genomics acting as Sequencing
Genomic Laboratory (SGL): the 37 national digital manifest fields (NHS
England `RGL to SGL SOP` Appendix 3) plus 5 local extension fields, with
`item.definition` mappings to FHIR where a confirmed mapping exists - see
[dWGS](dWGS.html#field-mapping-csv--hl7-v2--fhir). It deliberately carries
**every** manifest field, including several also asked by [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) (Patient name/DOB/NHS number,
Specimen Type, Specimen Collection Date) - because it describes the full CSV
structure a Requesting Genomic Laboratory actually sends, not an incremental
set of order-entry questions. For the genuinely additional Ask At Order
Entry content - the manifest fields **not** already covered by the common
core - see [dWGS Ask At Order Entry
Questions](Questionnaire-dWGSAskAtOrderEntry.html), which `derivedFrom`/
extends [Genomic Test Order](Questionnaire-GenomicTestOrder.html) in the
usual way.
"""
Usage:  #definition

* title = "North West Genomics dWGS Sub-Order Manifest"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/dWGSSubOrder"

* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm"
  * valueCoding = http://hl7.org/fhir/version-algorithm#semver

* item[+]
  * type = #group
  * linkId = "Referral"
  * text = "Referral / Sub-Order"
  * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest"

// Original Order Placer Group Number (Referral ID)

  * item[+]
    * type = #string
    * linkId = "dWGS/referral_id"
    * text = "Original Order Placer Group Number (Referral ID)"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.requisition"

// Test Code

  * item[+]
    * type = #choice
    * linkId = "dWGS/clinical_indication_test_type_id"
    * text = "Test Code"
    * required = false
    * answerValueSet = Canonical(GenomicTestCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"

// Original Ordering Facility Code (referring Trust ODS)

  * item[+]
    * type = #string
    * linkId = "dWGS/ordering_entity_id"
    * text = "Original Ordering Facility Code"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier.assigner.identifier.value"
    * item[+]
      * linkId = "dWGS/ordering_entity_id-designNote"
      * type = #display
      * text = "ODS code of the original referring Trust - assigner of the Received Sample Identifier (type=PLAC) below, not the same as the Filler Order Ordering Facility Code."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Filler Order Ordering Facility Code (GLH ODS)

  * item[+]
    * type = #string
    * linkId = "dWGS/glh_laboratory_id"
    * text = "Filler Order Ordering Facility Code (GLH)"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.requester.identifier.value"
    * item[+]
      * linkId = "dWGS/glh_laboratory_id-designNote"
      * type = #display
      * text = "A Genomic Laboratory Hub (GLH) ODS code, not the referring Trust's own ODS code - also assigns ServiceRequest.requisition and the Specimen's LIMS identifier (type=FILL)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Retrospective Sample Flag

  * item[+]
    * type = #string
    * linkId = "dWGS/retrospective_sample"
    * text = "Retrospective Sample Flag"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.intent"
    * item[+]
      * linkId = "dWGS/retrospective_sample-designNote"
      * type = #display
      * text = """
      Values: "New" (ServiceRequest.intent = filler-order) or "Retrospective"
      (ServiceRequest.intent = reflex-order - NW Genomics is reflexing further testing
      off a specimen it already holds, not a fresh sub-order).
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Clinical Information

  * item[+]
    * type = #text
    * linkId = "dWGS/clinical_information"
    * text = "Clinical Information"
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.note"

// Approved By

  * item[+]
    * type = #string
    * linkId = "dWGS/approved_by"
    * text = "Approved By"

* item[+]
  * type = #group
  * linkId = "Patient"
  * text = "Patient"
  * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient"

// Patient/proband first name

  * item[+]
    * type = #string
    * linkId = "LN/45392-8"
    * code[+] = $loinc#45392-8
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.given"
    * text = "Patient first name"

// Patient/proband surname

  * item[+]
    * type = #string
    * linkId = "LN/45394-4"
    * code[+] = $loinc#45394-4
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.name.family"
    * required = true
    * text = "Patient surname"

// Patient/proband date of birth

  * item[+]
    * type = #date
    * linkId = "LN/21112-8"
    * code[+] = $loinc#21112-8
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.birthDate"
    * text = "Date of birth"

// Patient/proband NHS number

  * item[+]
    * type = #string
    * linkId = "LN/89061-6"
    * code[+] = $loinc#89061-6
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier:nhsNumber"
    * text = "NHS Number"

// Patient Identifier (NGIS)

  * item[+]
    * type = #string
    * linkId = "dWGS/patient_ngis_id"
    * text = "Patient Identifier (NGIS)"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Patient#Patient.identifier"
    * item[+]
      * linkId = "dWGS/patient_ngis_id-designNote"
      * type = #display
      * text = "No confirmed identifier system - carried as Patient.identifier.assigner (Genomics England, ODS 8J834, who run NGIS), type=PI (v2-0203 Patient internal identifier)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "AskAtOrderEntry"
  * text = "Ask At Order Entry Questions"

// Family Structure

  * item[+]
    * type = #string
    * linkId = "NOS/FamilyStructure"
    * code[+] = $nwgmsa#FamilyStructure
    * text = "Family Structure"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "NOS/FamilyStructure-designNote"
      * type = #display
      * text = """
      Values: "Singleton", "Duo" or "Trio" - how many people are being tested together
      as part of this referral. Text-only (no NW-GMSA-confirmed coding system exists),
      carried as an Observation referenced from ServiceRequest.supportingInfo. See
      [dWGS - Singleton, Duo and Trio testing](dWGS.html#singleton-duo-and-trio-testing).
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Participant Type

  * item[+]
    * type = #string
    * linkId = "NOS/ParticipantType"
    * code[+] = $nwgmsa#ParticipantType
    * text = "Participant Type"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
    * item[+]
      * linkId = "NOS/ParticipantType-designNote"
      * type = #display
      * text = """
      Values: "Proband" or "Family Member" - this individual's role within the Family
      Structure above. Text-only, carried as an Observation referenced from
      ServiceRequest.supportingInfo.
      """
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "PrimarySpecimen"
  * text = "Primary Specimen (as received by GLH)"
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"

// Sample Received Date

  * item[+]
    * type = #dateTime
    * linkId = "dWGS/primary_sample_received_date"
    * text = "Sample Received Date"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.receivedTime"

// Received Sample Identifier

  * item[+]
    * type = #string
    * linkId = "dWGS/primary_sample_id_as_received_by_glh"
    * text = "Received Sample Identifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
    * item[+]
      * linkId = "dWGS/primary_sample_id_as_received_by_glh-designNote"
      * type = #display
      * text = "Assigned by the Original Ordering Facility - coded type=PLAC (Placer Identifier)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// LIMS Sample Identifier

  * item[+]
    * type = #string
    * linkId = "dWGS/primary_sample_id_in_glh_lims"
    * text = "LIMS Sample Identifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
    * item[+]
      * linkId = "dWGS/primary_sample_id_in_glh_lims-designNote"
      * type = #display
      * text = "Assigned by the Filler Order Ordering Facility (GLH) - coded type=FILL (Filler Identifier)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Type (germline/tumour)

  * item[+]
    * type = #string
    * linkId = "dWGS/primary_sample_type"
    * text = "Sample Type"
    * item[+]
      * linkId = "dWGS/primary_sample_type-designNote"
      * type = #display
      * text = "Germline/tumour classifier - low confidence, no clean Specimen field identified; not currently built into any FHIR resource."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Material Type

  * item[+]
    * type = #choice
    * linkId = "LN/66746-9"
    * code[+] = $loinc#66746-9 "Specimen Type"
    * code[+] = $sct#123038009 "Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type.coding.code"
    * answerValueSet = Canonical(SpecimenType)
    * text = "Sample Material Type"

// Sample Topography (cancer only)

  * item[+]
    * type = #string
    * linkId = "dWGS/received_sample_topography"
    * text = "Sample Topography"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.bodySite"
    * item[+]
      * linkId = "dWGS/received_sample_topography-designNote"
      * type = #display
      * text = "Cancer referrals only."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Morphology

  * item[+]
    * type = #string
    * linkId = "dWGS/received_sample_morphology"
    * text = "Sample Morphology"

// Tumour Content

  * item[+]
    * type = #decimal
    * linkId = "dWGS/received_sample_tumour_content_pct"
    * text = "Tumour Content (%)"
    * item[+]
      * linkId = "dWGS/received_sample_tumour_content_pct-designNote"
      * type = #display
      * text = "Cancer referrals only."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Comments

  * item[+]
    * type = #string
    * linkId = "dWGS/received_sample_comments"
    * text = "Sample Comments"

// Specimen Collection Date

  * item[+]
    * type = #dateTime
    * linkId = "LN/33882-2"
    * code[+] = $loinc#33882-2 "Collection date of Specimen"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collectedDateTime"
    * text = "Specimen Collection Date"

* item[+]
  * type = #group
  * linkId = "DispatchedSpecimen"
  * text = "Dispatched Specimen (extracted DNA sent onward)"
  * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen"

// Dispatched Sample Identifier

  * item[+]
    * type = #string
    * linkId = "dWGS/dispatched_sample_id_in_glh_lims"
    * text = "Dispatched Sample Identifier"

// Specimen Barcode

  * item[+]
    * type = #string
    * linkId = "dWGS/dispatched_sample_lsid"
    * text = "Specimen Barcode"
    * required = true
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.container.identifier"
    * item[+]
      * linkId = "dWGS/dispatched_sample_lsid-designNote"
      * type = #display
      * text = "Carried on Specimen.container.identifier, coded type=ZCID - see NW IdentifierType."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Dispatched Sample Type

  * item[+]
    * type = #string
    * linkId = "dWGS/dispatched_sample_type"
    * text = "Dispatched Sample Type"

// Dispatched Material Type

  * item[+]
    * type = #string
    * linkId = "dWGS/dispatched_sample_state"
    * text = "Dispatched Material Type"
    * item[+]
      * linkId = "dWGS/dispatched_sample_state-designNote"
      * type = #display
      * text = "Not currently built into any FHIR resource - the worked example's single Specimen only carries the primary specimen's Sample Material Type above."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Volume

  * item[+]
    * type = #decimal
    * linkId = "dWGS/dispatched_sample_volume_ul"
    * text = "Sample Volume (uL)"
    * extension[unit].valueCoding = $ucum#uL "uL"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.quantity"

// DNA Extraction Method

  * item[+]
    * type = #string
    * linkId = "dWGS/dna_extraction_protocol"
    * text = "DNA Extraction Method"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.method"

// Consignment Number

  * item[+]
    * type = #string
    * linkId = "dWGS/glh_sample_consignment_number"
    * text = "Consignment Number"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
    * item[+]
      * linkId = "dWGS/glh_sample_consignment_number-designNote"
      * type = #display
      * text = "Carried as a Specimen identifier, coded type=STN (Shipment Tracking Number)."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

* item[+]
  * type = #group
  * linkId = "LaboratoryQC"
  * text = "Laboratory QC and Logistics"

// Remaining Banked Volume

  * item[+]
    * type = #decimal
    * linkId = "dWGS/laboratory_remaining_volume_banked_ul"
    * text = "Remaining Banked Volume (uL)"
    * extension[unit].valueCoding = $ucum#uL "uL"

// DNA Concentration

  * item[+]
    * type = #decimal
    * linkId = "dWGS/glh_concentration_ng_ul"
    * text = "DNA Concentration (ng/uL)"

// DNA Purity

  * item[+]
    * type = #decimal
    * linkId = "dWGS/glh_od260_280"
    * text = "DNA Purity (OD260/280)"

// DNA Integrity Number

  * item[+]
    * type = #decimal
    * linkId = "dWGS/glh_din_value"
    * text = "DNA Integrity Number"

// DNA Fragment Size

  * item[+]
    * type = #decimal
    * linkId = "dWGS/glh_percentage_dna_over_23kb"
    * text = "DNA Fragment Size (% over 23kb)"

// QC Status

  * item[+]
    * type = #string
    * linkId = "dWGS/glh_qc_status"
    * text = "QC Status"

// Dispatch Date

  * item[+]
    * type = #date
    * linkId = "dWGS/glh_sample_dispatch_date"
    * text = "Dispatch Date"

// Plating Organisation

  * item[+]
    * type = #string
    * linkId = "dWGS/plating_organisation"
    * text = "Plating Organisation"

// Rack Identifier

  * item[+]
    * type = #string
    * linkId = "dWGS/gmc_rack_id"
    * text = "Rack Identifier"

// Rack Well Position

  * item[+]
    * type = #string
    * linkId = "dWGS/gmc_rack_well"
    * text = "Rack Well Position"
    * item[+]
      * linkId = "dWGS/gmc_rack_well-designNote"
      * type = #display
      * text = "Pattern: [A-H]01-09 or [A-H]10-12."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Storage Method

  * item[+]
    * type = #string
    * linkId = "dWGS/prolonged_sample_storage"
    * text = "Sample Storage Method"
