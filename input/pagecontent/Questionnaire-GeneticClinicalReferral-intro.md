<div class="alert alert-danger" role="alert">
This is for information and analysis purposes only and is not an active or
planned project.
</div>

This Questionnaire sketches a computable data model for a closed-loop
clinical referral into a genomics/clinical genetics service - the narrative
use case is [Genetic Referrals](GeneticReferrals.html), and the underlying
HL7 v2 message this is modelled on is `REF_I12` (Patient Referral), per that
page's own [Referral Data Model](GeneticReferrals.html#referral-data-model)
and [Target Referral Model](GeneticReferrals.html#target-referral-model).

It is deliberately built the same way as [Genomic Test
Order](Questionnaire-GenomicTestOrder.html) and [Genomic Test
Report](Questionnaire-GenomicTestReport.html) - a computable FHIR
`Questionnaire`, not a spreadsheet or Word document - see [How To Engineer
(scale and deliver)
Interoperability](HowToEngineerInteroperability.html#documenting-the-data-model)
for why this IG prefers that approach. Where a data item is genuinely the
same one [Genomic Test Order](Questionnaire-GenomicTestOrder.html) already
captures (e.g. patient demographics, both populating HL7 v2 `PID`), this
Questionnaire reuses the same item rather than re-defining it, per the "check
for existing patterns" principle on that same page.

## Domain Archetype

<div class="alert alert-info" role="alert">
<b>HL7 v2 Message:</b> `REF_I12` (Patient Referral)
</div>

```mermaid
erDiagram
    Patient ||--|{ ServiceRequest : subject
    ServiceRequest }o--|| PractitionerRole : "requester (Referring Provider, PRD)"
    ServiceRequest }o--o{ PractitionerRole : "performer (Referred-to Provider, PRD)"
    ServiceRequest }o--o{ HealthcareService : "performer (Referred-to Service, PRD)"
    PractitionerRole }o--|| Organization : organization
    ServiceRequest ||--o| Condition : reasonReference
    ServiceRequest ||--o{ DocumentReference : "supportingInfo (Family Letter)"
    DocumentReference ||--o| Binary : "content (Attachment.url)"
    ServiceRequest ||--o{ RelatedPerson : "supportingInfo (Consultand)"
    RelatedPerson }o--|| Patient : "patient (the proband)"

    Patient {
        Identifier nhsNumber
        Identifier medicalRecordNumber
        Identifier pedigreeNumber
    }

    ServiceRequest {
        Identifier referralIdentifier "RF1-6"
        code status "RF1-1"
        code priority "RF1-2"
        string code "RF1-4 - not yet coded"
        string note "brief note, if no letter attached"
    }

    PractitionerRole {
        Identifier practitionerIdentifier
    }

    Organization {
        Identifier organisationCode
    }

    HealthcareService {
        string name
    }

    Condition {
        CodeableConcept code "Suspected/confirmed condition"
    }

    DocumentReference {
        code type "Family Letter"
    }

    Binary {
        code contentType
        base64Binary data
    }

    RelatedPerson {
        Identifier nhsNumber "if known"
        HumanName name
        CodeableConcept relationship "NK1-3"
        code gender "NK1.15"
        date birthDate "NK1-16"
    }
```

This is a **level 2** (field-level) sketch of [Genetic Referrals'](GeneticReferrals.html)
own [Target Referral Model](GeneticReferrals.html#target-referral-model) - the
same entities, with the fields this Questionnaire actually asks.

## Differences from Genomic Test Order

Both Questionnaires exist for the same reason - a computable common core,
extended per scenario rather than re-modelled each time - but a clinical
referral and a laboratory order are genuinely different things. The table
below is the concrete comparison:

| Aspect | [Genomic Test Order](Questionnaire-GenomicTestOrder.html) | Genetic Clinical Referral |
|---|---|---|
| HL7 v2 basis | `OML_O21` (Laboratory Order), `ORC`/`OBR` | `REF_I12` (Patient Referral), `RF1`/`PRD` |
| What it requests | A specific laboratory test, from a Genomic Test Directory code | An assessment/service (e.g. genetic counselling, cascade testing) - not a specific lab test |
| Patient demographics | `PID` - Patient group | **Same** - reuses the identical items (both populate `PID`) |
| Who initiated it | Healthcare Professional group (`ORC-12`/`ORC-21`) - a single referrer | Referring Provider group (`PRD`, role = Referring Provider) - same shape, same reused items |
| Who it's going to | *(implicit - the destination LIMS is fixed, not chosen per-order)* | **Referred-to Provider/Service group (`PRD`, role = Referred-to Provider) - new, no equivalent in Genomic Test Order.** A referral explicitly names the receiving clinic/service; an order doesn't need to, because the Order Filler is already fixed |
| Test/order identifier | Order Placer/Filler Number (`ORC-2`/`ORC-3`), Order Group Number (`ORC-4`, pedigree/`G Number`) | Referral Identifier (`RF1-6`) - a single identifier, not a Placer/Filler pair, and no eRS UBRN equivalent modelled (see [Genetic Referrals - Notes on this sketch](GeneticReferrals.html#referral-data-model)) |
| Priority | `ServiceRequest.priority` (`LN/82768-3`) | **Same** - reuses the identical item (`RF1-2` maps onto the same FHIR element) |
| Reason | Suspected disease/CITT code (`LN/51967-8`) plus free-text clinical information (`NTE-1`) | **Same** reason-code item reused (`RF1-12`/`DG1`) |
| Specimen | **Specimen/Biopsy group** - detailed fields (type, body site, accession number, collection/received dates, shipment tracking) | **None.** A referral is a request for assessment, not a physical test - no specimen is collected until/unless it leads to an actual [Genomic Test Order](Questionnaire-GenomicTestOrder.html) later |
| Order/test-type-specific detail | **Ask At Order Entry Questionnaires** - structured, `derivedFrom`/extended, exactly **one** applies per order/test type (see [Order Entry Questions](Questionnaire-GenomicTestOrder.html#order-entry-questions)) | **Partly structured.** General family history stays in an attached **family letter** (`supportingInfo` -> `DocumentReference` -> `Binary`, the same pattern eRS uses) or free text - but a *named* consultand is structured via [Genetic Referral Consultand](Questionnaire-GeneticReferralConsultand.html) (`supportingInfo` -> `RelatedPerson`, HL7 v2 `NK1`), `derivedFrom`/extended the same way, except **repeating** (one per named relative) rather than a single choice - see [Order Entry Questions](#order-entry-questions) below |
{:.grid}

### Family History

Genomic Test Order's Ask At Order Entry Questionnaires model order-type-specific
detail as structured, coded data. A referral's equivalent detail doesn't have
that today: per [Genetic Referrals](GeneticReferrals.html)'s "Genetic Counselling /
Cascade Testing Referral" section and [Cancer Background Information for Use
Cases - Genetic Counselling Referral Across
Regions](CancerNOS.html#genetic-counselling-referral-across-regions), this
detail is carried in an unstructured **family letter** - a dictated or
secure-email clinical letter summarising the variant/condition, the
inheritance pattern, and which relatives are thought to be at risk. Rather
than inventing a structured family-history data model that doesn't exist in
current practice, this Questionnaire models the letter itself as an
attachment: `ServiceRequest.supportingInfo` references a `DocumentReference`,
whose `content.attachment.url` points at a `Binary` holding the actual
document (with a separate free-text `ServiceRequest.note` item as a fallback
for a brief note sent without an attached letter). This is not a new pattern
invented for this Questionnaire - it is the **same shape NHS e-Referral
Service (eRS) already uses** for referral attachments
(`ReferralRequest.supportingInfo` -> `DocumentReference`), see [Genetic
Referrals - eRS FHIR Resource
Model](GeneticReferrals.html#ers-fhir-resource-model).

**General** family history - the wider pedigree, who else is affected - stays
in that unstructured letter; this Questionnaire doesn't attempt to structure
all of it. The one part that *is* called out as structured is a **named
consultand** - a specific at-risk relative who is themselves being referred
for counselling/testing, not just mentioned in passing - see [Order Entry
Questions](#order-entry-questions) below.

## Order Entry Questions

This Genetic Clinical Referral Questionnaire (defined above) is the
**common core** referral form, the same way [Genomic Test
Order](Questionnaire-GenomicTestOrder.html#order-entry-questions) is the
common core order form. Where a *named consultand* is being referred
alongside (or instead of) the proband, that detail is added by a separate,
`derivedFrom`/extended Questionnaire representing HL7 v2 `NK1` (Next of
Kin/Associated Parties) as a FHIR `RelatedPerson`, referenced from
`ServiceRequest.supportingInfo` - the same `supportingInfo` slot the family
letter's `DocumentReference` uses, just a different resource type:

| Referral Content | Questionnaire |
|---|---|
| Named consultand (structured, `NK1`/`RelatedPerson`) | [Genetic Clinical Referral - Consultand (RelatedPerson)](Questionnaire-GeneticReferralConsultand.html) |
{:.grid}

Unlike [Genomic Test Order](Questionnaire-GenomicTestOrder.html#order-entry-questions),
where exactly one Ask At Order Entry Questionnaire applies per order/test
type, this table is expected to grow by **repetition** rather than by
alternative: a referral naming three at-risk relatives would reference three
separate `GeneticReferralConsultand`-derived answers, one per consultand, not
a choice between variants.

## Data Models

- [Genomic Test Order](Questionnaire-GenomicTestOrder.html) - the equivalent
  archetype for a laboratory order, compared above
- [Genetic Clinical Referral - Consultand (RelatedPerson)](Questionnaire-GeneticReferralConsultand.html) -
  the `derivedFrom`/extended Questionnaire for a named consultand, see [Order
  Entry Questions](#order-entry-questions) above
- [RelatedPerson](StructureDefinition-RelatedPerson.html) - the FHIR profile
  the Consultand Questionnaire structures (HL7 v2 `NK1`)
- [Diagnostic Core](diagnostic-core.html) - the identifier profiles reused
  above ([NHS Identifier](StructureDefinition-NHSIdentifier.html), [Medical
  Record Number](StructureDefinition-MedicalRecordNumber.html), [Order
  Identifier](StructureDefinition-OrderIdentifier.html))
- [Genetic Referrals](GeneticReferrals.html) - the narrative use case, actors,
  transactions and REF_I12/eRS/BaRS mapping this Questionnaire is built from

Nothing on this page has been adopted as an active profile or interface in
this IG.
