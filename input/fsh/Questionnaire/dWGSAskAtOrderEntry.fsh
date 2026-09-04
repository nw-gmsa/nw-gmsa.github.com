Instance: dWGSAskAtOrderEntry
InstanceOf: NWQuestionnaire
Title: "dWGS Ask At Order Entry Questions"
Description: """
**For analysis purposes only - not an active or planned project.**

**Ask At Order Entry Questions** for a **distributed WGS (dWGS)**
sub-contracted order (IHE LTW `LAB-35`), used alongside the [common core
order form](Questionnaire-GenomicTestOrder.html) - see [Order Entry
Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions). This
Questionnaire carries only the fields from the [dWGS digital
manifest](dWGS.html#field-mapping-csv--hl7-v2--fhir) (NHS England `RGL to SGL
SOP` Appendix 3, plus 5 local extension fields) that are **not** already
asked by the common core - see [dWGS Sub-Order
Manifest](Questionnaire-dWGSSubOrder.html) for the full 42-field manifest
description, including the fields this Questionnaire deliberately omits
because the common core already asks them.
"""
Usage:  #definition

* title = "dWGS Ask At Order Entry Questions"
* status = #draft
* url = "https://fhir.nwgenomics.nhs.uk/Questionnaire/dWGSAskAtOrderEntry"
* derivedFrom = "https://fhir.nwgenomics.nhs.uk/Questionnaire/GenomicTestOrder"
* derivedFrom.extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-derivationType"
  * valueCoding = http://hl7.org/fhir/questionnaire-derivationType#extends

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
    * item[+]
      * linkId = "dWGS/referral_id-designNote"
      * type = #display
      * text = "Not the same field as the common core's own G Number (Pedigree Number) - Order Group Number (Patient.identifier:PedigreeNumber) - this identifies the referral/requisition shared across every participant's sub-order, the base field identifies a pedigree on the Patient. See dWGS - Outstanding Issues (resolved) for why these were previously confused."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Test Code

  * item[+]
    * type = #choice
    * linkId = "dWGS/clinical_indication_test_type_id"
    * text = "Test Code"
    * required = false
    * answerValueSet = Canonical(GenomicTestCodes)
    * definition = "http://hl7.org/fhir/StructureDefinition/ServiceRequest#ServiceRequest.code"
    * item[+]
      * linkId = "dWGS/clinical_indication_test_type_id-designNote"
      * type = #display
      * text = "The common core's own Test Code item only appears via enableWhen branches gated on Test Category (Rare and Inherited Disease/Haemoglobinopathy/Cancer) - there is no Whole Genome Sequencing/dWGS Test Category, so none of those branches can fire for a dWGS order. This item fills that gap directly against the broader GenomicTestCodes value set rather than one of the base's narrower per-category lists."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Original Ordering Facility Code (referring Trust ODS)

  * item[+]
    * type = #string
    * linkId = "dWGS/ordering_entity_id"
    * text = "Original Ordering Facility Code"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier.assigner.identifier.value"
    * item[+]
      * linkId = "dWGS/ordering_entity_id-designNote"
      * type = #display
      * text = "ODS code of the original referring Trust - assigner of the Received Sample Identifier (type=PLAC) below, not the same as the Filler Order Ordering Facility Code. Conceptually related to the common core's own Referring Organisation ODS Code / Ordering Facility (HL7/ORC-21), but carried here on Specimen.identifier.assigner rather than PractitionerRole.organization, since dWGS distinguishes the original referring organisation (who provides the specimen) from the requester of this particular sub-order."
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
      * text = "A Genomic Laboratory Hub (GLH) ODS code, not the referring Trust's own ODS code - also assigns ServiceRequest.requisition and the Specimen's LIMS identifier (type=FILL). Conceptually related to the common core's own Referring Organisation ODS Code / Ordering Facility (HL7/ORC-21), but identifies the Sequencing Genomic Laboratory acting on this sub-order rather than the clinician's own referring organisation, and is carried directly on ServiceRequest.requester rather than via PractitionerRole."
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
    * item[+]
      * linkId = "dWGS/clinical_information-designNote"
      * type = #display
      * text = "Same FHIR target (ServiceRequest.note) as the common core's own Relevant clinical information and family history item (HL7/NTE-1), but sourced from a different HL7 v2 NTE field occurrence (NTE-3, not NTE-1) - both append to the same note list rather than conflicting."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
      * text = "No confirmed identifier system - carried as Patient.identifier.assigner (Genomics England, ODS 8J834, who run NGIS), type=PI (v2-0203 Patient internal identifier). The common core's own Patient group (name/DOB/NHS number) is not repeated here - it is asked once by Genomic Test Order itself."
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
    * item[+]
      * linkId = "dWGS/primary_sample_received_date-designNote"
      * type = #display
      * text = "Same FHIR target (Specimen.receivedTime) as Date and time sample received in lab in NW Genomic General Ask At Order Questions (NOS/SampleReceived) - kept as its own item here since it belongs to dWGS's two-specimen model (primary vs dispatched), not because it is new content."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Received Sample Identifier

  * item[+]
    * type = #string
    * linkId = "dWGS/primary_sample_id_as_received_by_glh"
    * text = "Received Sample Identifier"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.identifier"
    * item[+]
      * linkId = "dWGS/primary_sample_id_as_received_by_glh-designNote"
      * type = #display
      * text = "Assigned by the Original Ordering Facility - coded type=PLAC (Placer Identifier). The same general element as the common core's own Specimen ID Number (LN/80398-1) - this is the PLAC-typed instance of it, specific to the two-specimen (primary/dispatched) dWGS model."
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
      * text = "Assigned by the Filler Order Ordering Facility (GLH) - coded type=FILL (Filler Identifier). Conceptually the same as the common core's own Lab DNA Number (If Known) (Specimen/accessionIdentifier), which instead uses Specimen.accessionIdentifier rather than a typed Specimen.identifier - the two have not been reconciled onto a single FHIR element."
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

// Sample Topography (cancer only)

  * item[+]
    * type = #string
    * linkId = "dWGS/received_sample_topography"
    * text = "Sample Topography"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.bodySite"
    * item[+]
      * linkId = "dWGS/received_sample_topography-designNote"
      * type = #display
      * text = "Cancer referrals only. Conceptually overlaps with the common core's own Tissue source/organ of origin (LN/39111-0, Specimen.collection.bodySite) - kept separate pending reconciliation of the exact FHIR path."
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
      * text = "Cancer referrals only. The same underlying concept as Neoplastic cell content in WGS Local Test Order Ask At Order Entry Questions (NOS/NeoplasticCellContent-wgs) - see dWGS - Comparison with WGS Local Test Order for how the distributed (dWGS) and local paper-based WGS pathways relate."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Comments

  * item[+]
    * type = #string
    * linkId = "dWGS/received_sample_comments"
    * text = "Sample Comments"

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
      * text = "Not currently built into any FHIR resource - the worked example's single Specimen only carries the primary specimen's Sample Material Type."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

// Sample Volume

  * item[+]
    * type = #decimal
    * linkId = "dWGS/dispatched_sample_volume_ul"
    * text = "Sample Volume (uL)"
    * extension[unit].valueCoding = $ucum#uL "uL"
    * definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.quantity"
    * item[+]
      * linkId = "dWGS/dispatched_sample_volume_ul-designNote"
      * type = #display
      * text = "Same FHIR target (Specimen.collection.quantity) as the common core's own Specimen Volume/number of slides or scrolls (LN/3169-0) - kept as its own item because it specifically measures the dispatched DNA volume, not the raw specimen."
      * extension[itemControl].valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control#help

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
      * text = "Carried as a Specimen identifier, coded type=STN (Shipment Tracking Number) - the same identifier type as the common core's own Tracking number (LN/97209-1, Specimen.identifier[ShipmentTrackingNumber])."
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
