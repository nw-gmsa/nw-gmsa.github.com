## Workflow

### Current/Traditional Workflow with Clinical Document Repository

<figure>
{%include LTW-now-sequence.svg%}
</figure>
<br clear="all">

### Addition of a Clinical Data Repository

The API to the CDR (FHIR Repository) will conform to [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html)
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
