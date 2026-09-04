This Questionnaire describes the common requirement for a Genomic Order,
which is now extended by Ask At Order Entry Questionnaires. Which set of
these extension questionnaires is used depends on the order/test type
(`ServiceRequest.code`) - see [Order Entry Questions](#order-entry-questions)
below.

Although this Questionnaire is genomics-specific in name, the model it
describes - Patient, Hospital Spell, Diagnostic Workflow and Specimen -
is a **core model for diagnostic orders generally**, not something unique to
genomics. The same shape applies equally to pathology, radiology and clinical
referral orders; genomics is simply the domain this IG documents it against
first. See [Diagnostic Core](diagnostic-core.html) for the basic model this
Questionnaire adds detail to, and how it relates to [Genomic Test
Report](Questionnaire-GenomicTestReport.html) on the report side.

## Reference

- [HL7 Europe Laboratory Report - ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- HL7 Europe [ServiceRequest: Laboratory Order](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-ServiceRequest-eu-lab.html)
- [NHS England Genomics ServiceRequest](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-ServiceRequest) use text descriptions only, not the rendered profile.
- [NHS Genomic Medicine Service test order forms](https://www.england.nhs.uk/publication/nhs-genomic-medicine-service-test-order-forms/)
- [NHS England FHIR Genomics Implementation Guide—Clinical Headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/home/design/clinicalheadings)
- Prior Results (Oncology)
  - HL7 USA [minimal Common Oncology Data Elements (mCODE) Implementation Guide - Assessment](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html)

## Domain Archetype

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>

<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#orc" _target="_blank">ORC</a>
</div>

This is a **level 2** (field-level) view of the [basic model](diagnostic-core.html#entity-relationship-diagram)
introduced in Diagnostic Core, showing the entities and key attributes a
Genomic Test Order actually carries:

```mermaid
erDiagram
    Patient ||--|{ ServiceRequest : subject
    HospitalSpell ||--o{ ServiceRequest : encounter
    ServiceRequest ||--o{ Specimen : specimen
    ServiceRequest }o--|| PractitionerRole : requester
    PractitionerRole }o--|| Organization : organization
    ServiceRequest }o--o{ Condition : reasonCode
    ServiceRequest ||--o{ Observation : supportingInfo

    Patient {
        Identifier nhsNumber
        Identifier medicalRecordNumber
        date birthDate
        string postalCode
    }

    HospitalSpell {
        Identifier hospitalProviderSpellIdentifier
        code serviceType
    }

    ServiceRequest {
        Identifier orderIdentifier "Placer"
        Identifier orderFillerNumber "Filler"
        Identifier orderGroupNumber
        code code "Procedure/Test Code"
        dateTime authoredOn
        string note "Clinical Details"
    }

    PractitionerRole {
        Identifier practitionerIdentifier "Ordering Practitioner"
    }

    Organization {
        Identifier organisationCode "Ordering Facility"
    }

    Specimen {
        Identifier specimenId
        CodeableConcept type
        CodeableConcept bodySite
        Identifier accessionIdentifier
        Identifier shipmentTrackingNumber
        dateTime collectedDateTime
        dateTime receivedTime
    }

    Condition {
        CodeableConcept code "Suspected Condition"
    }
```

## Diagnostic Order


<img style="padding:3px;width:95%;" src="SDC Overview.drawio.png" alt="Order Test Form - Data Extraction Overview"/>
<br clear="all">
<p class="figureTitle">Order Test Form - Data Extraction Overview</p> 
<br clear="all">

The FHIR exchange style used [FHIR Message](https://hl7.org/fhir/R4/messaging.html) following [laboratory-order](MessageDefinition-laboratory-order.html) message definition. This definition is based on HL7 v2 `OML_O21 Laboratory Order` which simplifies conversion to/from pipe+hat (v2) and json (FHIR) formats.

> At present, the NW GLH Laboratory Information Management System (LIMS) will not support HL7 FHIR. The Regional Integration Exchange (RIE) will perform conversion between v2 and FHIR formats.

This message is an [aggregate (DDD)](https://martinfowler.com/bliki/DDD_Aggregate.html)/[archetype](https://en.wikipedia.org/wiki/Archetype_(information_science)) and so is a collection of FHIR Resources (similar to v2 segments) which is described in [Genomic Test Order](StructureDefinition-ServiceRequest.html).


###### Communicating Ask at Order Entry questions and prior results

See also [HL7 Europe Laboratory Report - ServiceRequest](https://hl7.eu/fhir/laboratory/StructureDefinition-ServiceRequest-eu-lab.html#communicating-ask-at-order-entry-questions-and-prior-results)
This message can be extended by a [template (FHIR Questionnaire)](https://hl7.org/fhir/R4/questionnaire.html) which allows the definition of additional questions to be defined for the `laboratory order`.

The detail of this form/template defines:

<img style="padding:3px;width:700px;" src="sdc-order-test-form.png" alt="Order Test Form Example (extract)"/>
<br clear="all">
<p class="figureTitle">Order Text Form Example (extract)</p> 
<br clear="all">

| Question                             | CodeSystem | Code      | FHIR Profile                                                    | HL7 v2 Segment | FHIR Questionniare <br/>item.type | FHIR Observation <br/>value[x] | v2 OBX-2                                                                      |
|--------------------------------------|------------|-----------|-----------------------------------------------------------------|----------------|--------------------------------|--------------------------------|-------------------------------------------------------------------------------|
| Does This Test Relate to a Pregnancy | SNOMED     | 77386006  | [Observation](StructureDefinition-Observation.html)             | OBX            | boolean                        | valueBoolean                   | CE ([code 0136](https://terminology.hl7.org/5.1.0/CodeSystem-v2-tables.html)) |
| Sample                               | LOINC      | 68992-7   | [Observation-Panel](StructureDefinition-Observation-Panel.html) | OBR            |                                |                                |                                                                               |
| High Infection Risk Sample           | SNOMED     | 281269004 | [Observation](StructureDefinition-Observation.html)             | OBX            | boolean                        | valueBoolean                   | CE ([code 0136](https://terminology.hl7.org/5.1.0/CodeSystem-v2-tables.html)) |
{:.grid}

> It is not expected the NW GLH Laboratory Information Management System (LIMS) will support UK SNOMED CT, and the RIE will handle the conversion either internally using [FHIR ConceptMap](https://hl7.org/fhir/R4/conceptmap.html) or a terminology service with the following capabilities [IHE Sharing Valuesets, Codes, and Maps (SVCM)](https://profiles.ihe.net/ITI/SVCM/index.html)


### Patient Demographics

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-Patient.html" _target="_blank">Patient</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#pid" _target="_blank">PID</a>
</div>

| Name                  | Value Set / Data Type                                                 | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest                                     | HL7 FHIR Resource (Message + RESTful)                                       |
|-----------------------|-----------------------------------------------------------------------|-------------|--------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|
| NHS Number            | [NHS Number](StructureDefinition-NHSIdentifier.html)                  | 0..1        | [PID](hl7v2.html#pid)-3  | ServiceRequest.subject.identifier                           | [Patient](StructureDefinition-Patient.html).identifier[nhsNumber]           |
| Medical Record Number | [Medical Record Number](StructureDefinition-MedicalRecordNumber.html) | 0..1        | [PID](hl7v2.html#pid)-3  | if NHS Number not present ServiceRequest.subject.identifier | [Patient](StructureDefinition-Patient.html).identifier[MedicalRecordNumber] |
| Date of Birth         | [Date of Birth](StructureDefinition-DateOfBirth.html)                 | 0..1        | [PID](hl7v2.html#pid)-7  |                                                             | [Patient](StructureDefinition-Patient.html).birthDate                       |
| Postcode              | [Postcode](StructureDefinition-Postcode.html)                         | 0..1        | [PID](hl7v2.html#pid)-11 |                                                             | [Patient](StructureDefinition-Patient.html).address.postalCode              |
{:.grid}

### Hospital Spell

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-HospitalSpell.html" _target="_blank">Hospital Spell</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#pv1" _target="_blank">PV1</a>
</div>

Treat as mandatory for reflex or subcontracted orders.

| Name                                  | Value Set / Data Type                                                                       | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest             | HL7 FHIR Resource (Message + RESTful)                                        |
|---------------------------------------|---------------------------------------------------------------------------------------------|-------------|--------------------------|-------------------------------------|------------------------------------------------------------------------------|
| Hospital Service                      | [Service](ValueSet-service.html)                                                            | 0..1        | [PV1](hl7v2.html#pv1)-10 |                                     | Encounter.serviceType                                                        | 
| Case Identification or Account Number | [HospitalProviderSpellIdentifier](StructureDefinition-HospitalProviderSpellIdentifier.html) | 0..1        | [PV1](hl7v2.html#pv1)-19 | ServiceRequest.encounter.identifier | Encounter.identifier [HospitalSpell](StructureDefinition-HospitalSpell.html) |
{:.grid}

### Diagnostic Workflow

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-ServiceRequest.html" _target="_blank">ServiceRequest</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#orc" _target="_blank">ORC</a>
</div>

| Name                        | Value Set / Data Type                                                              | Cardinality | HL7 v2 OML_O21 Message            | HL7 FHIR ServiceRequest                                                                                                           | 
|-----------------------------|------------------------------------------------------------------------------------|-------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Order Identifier (Placer)   | [Order Identifier](StructureDefinition-OrderIdentifier.html)                       | 1..1        | [ORC](hl7v2.html#orc)-2           | ServiceRequest.identifier[OrderIdentifier]                                                                                        |                                                                                                                                             
| Filler Order Number         |                                                                                    | 0..1        | [ORC](hl7v2.html#orc)-3           | ServiceRequest.identifier[OrderFillerNumber]                                                                                      |                                                                                                                                             
| (Placer) Order Group Number | [Order Group Number](StructureDefinition-OrderGroupNumber.html)                    | 0..1        | [ORC](hl7v2.html#orc)-4           | ServiceRequest.requisition.identifier                                                                                             |                                                                                                                                                           
| (Order) Procedure Code      | Diagnostic Domain specific - See below                                             | 1..1        | [OBR](hl7v2.html#obr)-4           | ServiceRequest.code                                                                                                               |                                                                                                                                             
| Order date                  |                                                                                    | 0..1        | [ORC](hl7v2.html#orc)-9           | ServiceRequest.authoredOn                                                                                                         |                                                                                                                                             
| Ordering Practitioner       | [England Practitioner Identifier](StructureDefinition-PractitionerIdentifier.html) | 0..1        | [ORC](hl7v2.html#orc)-12          | ServiceRequest.requester[PractitionerRole]                                                                                        |                                                                                                                                                              
| Ordering Facility           | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 1..1        | [ORC](hl7v2.html#orc)-21          | If Order has requesting practitioner ServiceRequest.requester[PractitionerRole] <br/> else ServiceRequest.requester[Organization] | 
| performer                   | [Organisation Code](StructureDefinition-OrganisationCode.html)                     | 0..1        | implied by destination of message | ServiceRequest.performer                                                                                                          |                                                                                      
| Suspected Condition         | Domain specific - See below (Generally SNOMED Condition code)                      | *..*        | [DG1](hl7v2.html#dg1)-3           | ServiceRequest.reasonCode                                                                                                         |                                                                                                                                             
| Supporting Information      | Domain specific - See below                                                        | 0..*        | [OBX](hl7v2.html#obx)             | ServiceRequest.supportingInformation                                                                                              |                                                                                                                                      
| Notes                       |                                                                                    | 0..*        | [NTE](hl7v2.html#nte)             | ServiceRequest.note                                                                                                               |                                                                                                                                             
| Specimen                    | See Specimen below                                                                 | 0..*        | [SPM](hl7v2.html#spm)             | ServiceRequest.specimen.identifier                                                                                                |                                                                                               
{:.grid}

### Diagnostic Genomics

| Name                                                  | Value Set / Data Type                                                   | Cardinality | HL7 v2 OML_O21 Message  | HL7 FHIR ServiceRequest   | 
|-------------------------------------------------------|-------------------------------------------------------------------------|-------------|-------------------------|---------------------------|
| (Order) Procedure Code - Genomic Test Code            | [Genomic Test Directory](ValueSet-GenomicTestCodes.html)                | 1..1        | [OBR](hl7v2.html#obr)-4 | ServiceRequest.code       |                               
{:.grid}

### Original Order and Filler Order

`ServiceRequest` may also be split into two logical entities called
`OriginalOrder` and `FillerOrder`. The former represents the order received by
the Order Filler from the Order Placer, and the latter is orders the `Order
Filler` creates to fulfil that order. These are often also called `reflex`,
`work-order` or `sub-contract` orders - both are structurally the same
Genomic Test Order archetype above, just created by a different actor.

```mermaid
erDiagram

    OriginalOrder ||--|{ FillerOrder : "has (FillerOrderNumber = FillerGroupNumber)"

    OriginalOrder {
        identifier PlacerOrderNumber
        identifier FillerOrderNumber
        code NGTDTestCode
        code RequestingOrganisationCode
        reference Specimen
        reference Patient
        reference HospitalSpellProviderIdentifier
    }

    FillerOrder {
        code OrderStatus
        date TestOrderDate
        identifier TestAccessionIdentifier
        code NGTDTestCode
        string ClinicalDetails
        code Performer
        reference Specimen
        reference Patient
        reference OriginalOrder
        reference HospitalSpellProviderIdentifier
    }
```

In IHE Laboratory Testing Workflow, the Original Order is the key entity in
[LAB-1](LTW.html#diagnostic-testing), and the Filler Order is the key entity
in [LAB-4](LTW.html#work-order-and-test-result-management-lab-4-and-lab-5) -
both share the field-by-field mapping in [Diagnostic
Workflow](#diagnostic-workflow) above.

#### Filler Order Intent

| Type                | Description                                                                                                                                                     | IHE PALM | Created by   | Original Order Intent | Filler Order Intent   |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|--------------|----------------------------------------|-----------------------|
| Laboratory Order    | A request for one or more laboratory investigations submitted by the requesting clinician or system.                                                            | LAB-1    | Order Placer | order / reflex                         |                       | 
| Work Order          | A subordinate order created by the laboratory to organise and fulfil part of the overall Laboratory Order.                                                      | LAB-4    | Order Filler |                                        | instance-order       | 
| Subcontracted Order | A laboratory order forwarded to another laboratory for fulfilment, for example when a specialised test is referred to an external provider.                     | LAB-35   | Order Filler |                                        | filler-order |
| Reflex Order        | A new order created automatically by the Order Filler based on previous test results, for example when pathology findings automatically trigger a genomic test. | LAB-35   | Order Filler |                                        | reflex                | 
{:.grid}

### Order Entry Questions

This Genomic Test Order Questionnaire (defined below) is the **common core**
order form: the Patient, Healthcare Professional, Test Request and Specimen fields
shared by every order, regardless of test type, mapping onto the standardised
[HL7 v2 OML_O21](hl7v2.html#oml_o21-laboratory-order) message and its FHIR equivalent,
the [FHIR Message O21](MessageDefinition-laboratory-order.html).

Ask At Order Entry questions vary by order/test type, so they are **not** part of the
common core - each order/test type instead uses its own Ask At Order Entry
Questionnaire, which `derivedFrom`/extends this common core Questionnaire:

| Order/Test Type                          | Ask At Order Entry Questionnaire                                                                                     |
|-------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| General (default)                          | [NW Genomic General Test Order](Questionnaire-GenomicGeneralAskAtOrderEntry.html)                                     |
| Distributed WGS (dWGS) sub-contracted order| [dWGS Sub-Order Manifest](Questionnaire-dWGSSubOrder.html) - see [dWGS](dWGS.html#ask-at-order-entry-the-dwgs-digital-manifest) |
| Histocompatibility and Immunogenetics - HLA Tests (Transplant) | [HLA Tests - Transplant Ask At Order Entry](Questionnaire-HLATestsTransplantAskAtOrderEntry.html) - see [Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html#ask-at-order-entry-questions) |
| Histocompatibility and Immunogenetics - Chimerism Testing | [Chimerism Testing Blood (PB) Ask At Order Entry](Questionnaire-ChimerismTestingAskAtOrderEntry.html) - see [Histocompatibility and Immunogenetics](HistocompatibilityAndImmunogenetics.html#chimerism-testing-ask-at-order-entry) |
| Cancer - Solid Tumour (HRD and Tumour BRCA) | [HRD and Tumour BRCA Ask At Order Entry](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html) |
| Cancer - Haematology Oncology | [Haemato-Oncology Ask At Order Entry](Questionnaire-HaematoOncologyAskAtOrderEntry.html) |
| Rare and Inherited Disease (generic) | [Rare Disease Genomic Testing Ask At Order Entry](Questionnaire-RareDiseaseGenomicAskAtOrderEntry.html) |
| Rare and Inherited Disease - Prenatal Haemoglobinopathy | [Prenatal Haemoglobinopathy Ask At Order Entry](Questionnaire-HaemoglobinopathyPrenatalAskAtOrderEntry.html) |
| Rare and Inherited Disease - Haemoglobinopathy Genetic Testing | [Haemoglobinopathy Genetic Testing Ask At Order Entry](Questionnaire-HaemoglobinopathyGeneticAskAtOrderEntry.html) |
| Rare and Inherited Disease - Cystic Fibrosis Carrier Testing | [Cystic Fibrosis Carrier Testing Ask At Order Entry](Questionnaire-CysticFibrosisCarrierAskAtOrderEntry.html) |
| Rare and Inherited Disease - WGS (local paper order) | [WGS Local Test Order Ask At Order Entry](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) |
| Rare and Inherited Disease - Genomic Variant Review | [Genomic Variant Review Ask At Order Entry](Questionnaire-VariantReviewAskAtOrderEntry.html) |
| Rare and Inherited Disease - Deafness (R67) | [Deafness (R67) Ask At Order Entry](Questionnaire-DeafnessR67AskAtOrderEntry.html) |
| Rare and Inherited Disease - CYP2C19 Mavacamten (R454) | [CYP2C19 Mavacamten (R454) Ask At Order Entry](Questionnaire-CYP2C19MavacamtenAskAtOrderEntry.html) |
{:.grid}

#### NW GLH Paper Test Request Forms

The nine rows above the divider in the table already covered digital
order-entry screens (dWGS, Histocompatibility/Chimerism); the ten below it
are the NW GLH's own [paper test request
forms](https://mft.nhs.uk/nwglh/documents/test-request-forms/), each
compared directly against this Questionnaire below using the same fields
every paper order form needs to identify: NHS Number, Medical Record Number,
Order Placer Number, Account Number/Hospital Spell Identifier, Specimen
Identifier, Test Code, Ordering Facility, and Ordering Clinician (GMC/GMP).

**Cancer**

| Form | NHS Number | Medical Record Number | Order Placer Number | Account Number/Hospital Spell | Specimen Identifier | Test Code | Ordering Facility | Ordering Clinician (GMC/GMP) |
|---|---|---|---|---|---|---|---|---|
| [HRD and Tumour BRCA](Questionnaire-HRDTumourBRCAAskAtOrderEntry.html) | Yes | Yes | No | No | Pathology block/sample number only | **Implied** - tick box (HRD / tBRCA / relapsed), not a GTD R-code | Yes (free text) | Name + position only, no GMC/GMP |
| [Haemato-Oncology](Questionnaire-HaematoOncologyAskAtOrderEntry.html) | Yes | Yes | No | No | Pathology block/sample number, optional | **Implied** - named panel tick box, not a GTD R-code | Yes (free text) | Name only, no GMC/GMP |
{:.grid}

**Rare and Inherited Disease**

| Form | NHS Number | Medical Record Number | Order Placer Number | Account Number/Hospital Spell | Specimen Identifier | Test Code | Ordering Facility | Ordering Clinician (GMC/GMP) |
|---|---|---|---|---|---|---|---|---|
| [Rare Disease (generic)](Questionnaire-RareDiseaseGenomicAskAtOrderEntry.html) | Yes | Yes | No | No | No (sticker/label only) | **Explicit** - R code | Yes (free text) | Name only, no GMC/GMP |
| [Haemoglobinopathy Prenatal](Questionnaire-HaemoglobinopathyPrenatalAskAtOrderEntry.html) | Yes (maternal + paternal) | Yes (maternal + paternal) | No | No | No | Not present - **implied** by the form itself | Free text | Name only, no GMC/GMP |
| [Haemoglobinopathy Genetic](Questionnaire-HaemoglobinopathyGeneticAskAtOrderEntry.html) | Yes | Yes | No | No | No | Not present - **implied** by the form itself | Free text | Name only, no GMC/GMP |
| [Cystic Fibrosis Carrier](Questionnaire-CysticFibrosisCarrierAskAtOrderEntry.html) | Yes | Yes | No | No | No | Not present - **implied** by the form itself | Free text (GP surgery) | GP name only, no GMC/GMP |
| [WGS (local paper order)](Questionnaire-WGSLocalTestOrderAskAtOrderEntry.html) | Yes | Yes | No | No | Barcode placeholder ("NGIS/Barcode") | **Explicit** - NGIS Test Code | Yes (free text) | Name only, no GMC/GMP |
| [Genomic Variant Review](Questionnaire-VariantReviewAskAtOrderEntry.html) | Yes | Yes | No (has "Report reference" - see below) | No | N/A - no new specimen | Not present - reviewing a prior result, not requesting a new one | Yes (free text) | Name only, no GMC/GMP |
| [Deafness (R67)](Questionnaire-DeafnessR67AskAtOrderEntry.html) | Yes | Yes | No | No | No (separate DNA request card assumed) | **Implied** - fixed, R67 is the form itself | No (free text address only) | Name only, no GMC/GMP |
| [CYP2C19 Mavacamten (R454)](Questionnaire-CYP2C19MavacamtenAskAtOrderEntry.html) | Yes | Yes | No | No | No (lab sticker only) | **Implied** - fixed, R454 is the form itself | Yes (free text) | Name only, no GMC/GMP |
{:.grid}

A pattern holds across **all ten** paper forms: none captures an Order
Placer Number, an Account Number/Hospital Spell Identifier, or a clinician
professional identifier (GMC/GMP number) - see [Common Fields We May Have
Missed](#common-fields-we-may-have-missed) below for why the first two are a
structural difference rather than a gap, and the third genuinely is one.
Test Code is **explicit** on only two forms (Rare Disease generic, WGS); on
five it is **implied** by which specific form/tick-box was used rather than
entered as a coded value, and on one (Genomic Variant Review) no test code
applies at all, since it reviews a result already reported rather than
requesting a new one.

#### Common Fields We May Have Missed

Comparing all ten forms side by side surfaces a few candidate additions to
this common core Questionnaire, alongside two apparent gaps that are better
understood as structural differences between paper and digital ordering:

- **Order Placer Number and Account Number/Hospital Spell Identifier are
  absent from every paper form, not missing from this Questionnaire.** Both
  are usually assigned by the requesting system/PAS at the point of digital
  order creation - a paper form filled in by a referring clinician predates
  that assignment, so there is nothing on the form to capture. This
  Questionnaire's own fields for these ([Diagnostic
  Workflow](#diagnostic-workflow), [Hospital Spell](#hospital-spell)) remain
  correct; the paper forms simply sit upstream of where those identifiers
  get created.
- **Ordering Clinician Professional Identifier (GMC/GMP) is a genuine gap -
  on the paper side, not this Questionnaire.** Every one of the ten forms
  captures the ordering clinician by **name only** (occasionally with
  position/specialty), never a GMC or GMP number, even though [Referring
  Clinician Professional Identifier](#diagnostic-workflow) (`LN/46608-6`) is
  `required = true` on this Questionnaire. Converting one of these paper
  forms to a digital order will need to resolve the clinician's professional
  identifier from name (+ organisation) some other way - e.g. an ODS/PDS
  lookup - since the form itself never supplies it.
- **Gender Identity**, distinct from Sex Registered at Birth, appears as its
  own field on four of the ten forms (Rare Disease generic, Genomic Variant
  Review, Haemato-Oncology, CYP2C19 Mavacamten - all recent DOC-numbered
  templates). This Questionnaire only has [Sex registered at
  birth](#patient-demographics) (`LN/46098-0`) - Gender Identity (LOINC
  `76691-5`) is a plausible common-core addition rather than something
  specific to any one order type.
- **Copy Report To / secondary report recipient**, distinct from the
  ordering clinician, appears on five of the ten forms ("Requested by/Cc.
  Report to", "Preferred method of report"). This Questionnaire's own
  [Referring Clinician Email](#diagnostic-workflow) (`LN/89058-2`) already
  repeats, which can hold a second address, but there is no field for a
  second recipient's **name** distinct from the referrer - worth considering
  if a named cc'd recipient (not just an extra email address) turns out to
  matter operationally.
- **Specimen "Taken by"** (the person who collected the sample) appears
  consistently across the WGS, CYP2C19 and Haemato-Oncology forms, alongside
  Specimen Collection Date, which this Questionnaire already has
  ([Specimen](#specimen), `LN/33882-2`) - a "collected by" field does not
  currently exist.
- **A named relative/partner reference for comparative interpretation**
  recurs independently across three different Rare Disease forms
  (Haemoglobinopathy Genetic, Cystic Fibrosis Carrier, and the WGS Proband
  reference for a Family Member sample) - each names a specific relative
  whose own affected/carrier status or result affects how *this* test is
  interpreted. Rather than adding this to the common core, each affected
  Ask At Order Entry Questionnaire above models it locally via
  `ServiceRequest.supportingInfo` -> `RelatedPerson`/`Patient`, the same
  shape as [Genetic Clinical Referral -
  Consultand](Questionnaire-GeneticReferralConsultand.html) - it recurs
  often enough to be worth naming as a pattern, even though it isn't
  universal enough to belong in the shared core.

### Specimen

<div class="alert alert-info" role="alert">
<b>HL7 FHIR Profile:</b> <a href="StructureDefinition-Specimen.html" _target="_blank">Specimen</a> 
</div>
<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#spm" _target="_blank">SPM</a>
</div>

| Name                      | LOINC   | Value Set / Data Type                                                         | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR [Specimen](StructureDefinition-Specimen.html) |
|---------------------------|---------|-------------------------------------------------------------------------------|-------------|--------------------------|--------------------------------------------------------|
| Specimen ID               | 80398-1 |                                                                               | 0..*        | [SPM](hl7v2.html#spm)-2  | Specimen.identifier[PlacerSpecimenNumber]              |
| Specimen Type             |         | [Specimen Type](ValueSet-specimen-type.html)                                  | 1..1        | [SPM](hl7v2.html#spm)-4  | Specimen.type                                          |
| Specimen Source Site      |         | [Specimen Body Site](ValueSet-specimen-bodysite.html)                         | 0..1        | [SPM](hl7v2.html#spm)-8  | Specimen.collection.bodySite                           |
| Specimen Accession Number | 80398-1 | [Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) | 0..*        | [SPM](hl7v2.html#spm)-30 | Specimen.accessionIdentifier                           |
| Shipment Tracking Number  | 97209-1 | [Shipment Tracking Number](StructureDefinition-ShipmentTrackingNumber.html)   | 0..*        | [SPM](hl7v2.html#spm)-32 | Specimen.identifier[ShipmentTrackingNumber]            | 
| Specimen Collection Date  |         |                                                                               | 0..1        | [SPM](hl7v2.html#spm)-17 | Specimen.collection.collectedDateTime                  |
| Specimen Received Date    |         |                                                                               | 0..1        | [SPM](hl7v2.html#spm)-18 | Specimen.receivedTime                                  |
{:.grid}

Note: it is likely that source systems will use ORM_01 and not include specimen details. In this case it is suggested that the specimen details are captured as 'Ask at Order Entry Questions' and so provided as OBX segments.


