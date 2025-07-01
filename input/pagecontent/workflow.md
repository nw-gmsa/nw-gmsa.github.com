## Workflow

### Actors

- Order Placer – Typically a clinician or system that initiates a lab test.
- Enterprise Document Sharing – Repository or system used for document exchange.
- Order Filler – Laboratory or testing system that performs the test and produces the result.


### Transaction & Archetype Maps

The different options include the use of the following archetypes. The differing formats are generally compatible with each other.

| FHIR Document                                                                | HL7 v2                                                                                                   | HL7 FHIR Message                                                                               | HL7 FHIR Resource |
|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|-------------------|
|                                                                              | [OML_O21 Laboratory Order](hl7v2.html#oml_o21-laboratory-order)                                          | [Laboratory (Genomic) Order O21](MessageDefinition-laboratory-order.html)                      |                   |
| [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) | [ORU_R01 Unsolicited Observation](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) | [Unsolicited Observation (Genomic Report) R01](MessageDefinition-unsolicited-observation.html) | [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/)          |


## Options 

### Traditional Messaging Option

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



### Event Notifications and Enterprise Shared Data/Document Repositories Option

The API to the CDR (FHIR Repository) will conform to [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) for clinical data and also [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html)
The data standard will follow this guide and also [HL7 Genomics Reporting](https://build.fhir.org/ig/HL7/genomics-reporting/)

<figure>
{%include LTW-cdr-sequence.svg%}
</figure>
<br clear="all">

### Shared Repositories and FHIR Workflow Option

This adds in the [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) to the Clinical Data Repository.
FHIR Subscription is described in [FHIR Subscription](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/toc.html) page.

This will require development of a FHIR Subscription service within the TIE. This may be limited to just supporting FHIR Task and message based subscriptions.

<figure>
{%include LTW-fhir-sequence.svg%}
</figure>
<br clear="all">
