
**This is an elaboration of an approach. It is not an official guide**

## Introduction

This guide describes the HL7 FHIR and v2 interfaces used to support Genomics testing. It is designed to be future compatible with:

- [NHS England - FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles) which defines the conformance requirements for Genomics in England.

This guide focuses on the regional adoption of Genomics and will conform to the **NHS England - FHIR Genomics Implementation Guide**, such as:

- Conversion of messages to/from HL7 v2 from/to HL7 FHIR.
  - v2.5.1 is the version for HL7 v2 used in this IG, to match [Digital Health and Care Wales - HL7 ORU_R01 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf)
- Enable use of FHIR Testing tools such as [Command Line FHIR Validation](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) and [Online FHIR Validation](https://validator.fhir.org/)

## Dependencies

{% include dependency-table.xhtml %}
