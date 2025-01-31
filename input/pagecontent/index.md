
**This is an elaboration of an approach. It is not an official guide**

## Introduction

This guide describes the HL7 FHIR and v2 interfaces used to support Genomics testing. It is designed to be future compatible with:

- [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles) which defines the conformance requirements for Genomics in England.

This guide focuses on the regional adoption of Genomics and will conform to the **NHS England - FHIR Genomics Implementation Guide**, such as:

- Conversion of messages to/from HL7 v2 from/to HL7 FHIR.
- Enable use of FHIR Testing tools such as [Command Line FHIR Validation](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) and [Online FHIR Validation](https://validator.fhir.org/)

## Reporting Component Model

<figure>
{%include reports-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Report Component Model</p>
</figure>
<br clear="all"

### Interface Standards

- **Document/Report Message Exchange**
  - HL7 v2.x ORU - 
    - [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2) includes **Data Standards**
    - [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/) conversion of HL7 v2 Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
    - Supplier specifications
      - iGene TO FOLLOW (LIMS to TIE)
      - [EPIC HL7 v2](https://open.epic.com/Interface/HL7v2) See Discrete Genomic Results (TIE to EPIC EPR)
  - IHE [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) ITI-41/[MHD](https://profiles.ihe.net/ITI/MHD/index.html) ITI-105 - The document in the payload can be pdf or a FHIR Document (informatics description: composition). [NHS England - National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir) is also an option here.
    - [HL7 EU Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) - This a [FHIR Document](https://hl7.org/fhir/R4/documents.html) version of the HL7 v2 ORU (and any FHIR Message equivalent). 
- **Document/Report Sharing**
  - HL7 [IPA](https://build.fhir.org/ig/HL7/fhir-ipa/) (or IHE [QEDm](https://profiles.ihe.net/PCC/QEDm/)). Note this is already implemented in EPIC.  
    - **Data Standards** [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html) which describes international data models around Genomics
    - Supplier specifications
      - [EPIC FHIR](https://fhir.epic.com/)
  - IHE [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) ITI-18 & 43/[MHD](https://profiles.ihe.net/ITI/MHD/index.html) ITI-67 and 68
  - [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) which is a centralised workflow broker service for managing Genomics Order
    - **Data Standards** [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide). **Note the application of this data standard may extend to other interfaces**
- **Document/Report Event Notification**
  - IHE [DSUBm](https://profiles.ihe.net/ITI/DSUBm/index.html) ITI-112
  - [Multicast Notification Service](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)

## Dependencies

{% include dependency-table.xhtml %}
