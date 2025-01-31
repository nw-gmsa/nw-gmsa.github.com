
**This is an elaboration of an approach. It is not an official guide**

## Introduction

This guide describes the FHIR interfaces used to support Genomics testing. It is designed to be future compatible with:

- [NHS England - Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) which is a centralised workflow broker service for managing Genomics Order
- [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles) which defines the conformance requirements for Genomics in England.

This guide focuses on the regional adoption of Genomics and will conform to the **NHS England - FHIR Genomics Implementation Guide**, such as:

- Conversion of messages to/from HL7 v2 from/to HL7 FHIR.
- Enable use of FHIR Testing tools such as [Command Line FHIR Validation](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) and [Online FHIR Validation](https://validator.fhir.org/)

## Related Standards

- [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/) conversion of HL7 v2 Messages to [FHIR Messages](https://hl7.org/fhir/R4/messaging.html). (Note: NHS England Genomics is intending to use [FHIR Transactions](https://hl7.org/fhir/R4/http.html#transaction))
- [Genomics Reporting Implementation Guide](https://build.fhir.org/ig/HL7/genomics-reporting/index.html) which describes international data models around Genomics
- [HL7 EU Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) - This a [FHIR Document](https://hl7.org/fhir/R4/documents.html) version of the HL7 v2 ORU (and any FHIR Message equivalent). This would also be compatible with [IHE XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) and [NHS England - National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir)
- [HL7 Version 2.5.1 Implementation Guide: Lab Results Interface (LRI), Release 1 from May 2017](https://confluence.hl7.org/download/attachments/25559919/2018%2004%2003%20-%20V2%20LRI%20-%20Ch.%205%20CG%20and%20Code%20System%20Tables.pdf?api=v2)
## Dependencies

{% include dependency-table.xhtml %}
