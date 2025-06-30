## Workflow

#### Actors (Swimlanes from left to right):

- Order Placer – Typically a clinician or system that initiates a lab test.
- Enterprise Document Sharing – Repository or system used for document exchange.
- Intermediary/Regional Integration Engine (RIE) – A middleware system for routing and transforming healthcare messages.
- Order Filler – Laboratory or testing system that performs the test and produces the result.

### Current/Traditional Workflow with Clinical Document Repository

<figure>
{%include LTW-now-sequence.svg%}
</figure>
<br clear="all">

#### Workflow Steps:

1. Submit Test Order Form
   - The Order Placer submits a test order form.
2. In the IHE LTW Workflow, the system may send an HL7 FHIR Message called Laboratory Order O21 and this is transformed into an HL7 v2 Message called ORM_O01 to the Order Filler via the RIE.
2. Perform Test
   - The Order Filler receives the order and performs the test.
3. Send Genomic Report
   - After the test, the Order Filler sends a genomic report.
   - HL7 v2 Message ORU_R01 is used to transmit the result:
     - First sent from Order Filler to RIE.
     - Then from RIE to Order Placer.
4. Finally, it may also be sent from RIE to Enterprise Document Sharing.

Notes:

- HL7 Messages:
  - O21 (FHIR): A modern standard for ordering lab tests.
  - ORM_O01: A traditional HL7 v2 order message.
  - ORU_R01: A standard HL7 v2 message used to send lab results.
- IHE LTW Workflow: IHE (Integrating the Healthcare Enterprise) Laboratory Testing Workflow, which includes guidelines for standardized lab test communication.



### Addition of a Clinical Data Repository

The API to the CDR (FHIR Repository) will conform to [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) for clinical data and also [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html)
The data standard will follow this guide and also [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/)

<figure>
{%include LTW-cdr-sequence.svg%}
</figure>
<br clear="all">

### Addition of FHIR Workflow

This adds in the [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) to the Clinical Data Repository.
FHIR Subscription is described in [FHIR Subscription](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/toc.html) page.

This will require development of a FHIR Subscription service within the TIE. This may be limited to just supporting FHIR Task and message based subscriptions.

<figure>
{%include LTW-fhir-sequence.svg%}
</figure>
<br clear="all">
