
## Core Standards

### Health Documents Sharing

- [IHE Cross-Enterprise Document Sharing (XDS.b)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) 
- [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) ITI-105 - The document in the payload can be pdf or a FHIR Document (informatics description: composition). [NHS England - National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir) is also an option here.

### Clinical Compositions (FHIR Documents and CDA)

These are formats for clinical documents, typically used with `Health Document Sharing`

- [HL7 International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/index.html)
- [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) - This a [FHIR Document](https://hl7.org/fhir/R4/documents.html) version of the HL7 v2 ORU (and any FHIR Message equivalent).
- [HL7 Europe Imaging Study Report](https://build.fhir.org/ig/hl7-eu/imaging/branches/initial-version/index.html)

### Clinical Data Sharing

The health document approaches above can be considered the summary and clinical data sharing is the detailed record.

- [HL7 International Patient Access (IPA)](https://build.fhir.org/ig/HL7/fhir-ipa/) (or [IHE Query for Existing Data for Mobile (QEDm)](https://profiles.ihe.net/PCC/QEDm/) which is mostly the same standard). 
  - Supplier specifications
    - [EPIC FHIR](https://fhir.epic.com/)
    - [Meditech FHIR](https://fhir.meditech.com/)
    - [Cerner/Oracle Health Millennium FHIR](https://docs.oracle.com/en/industries/health/millennium-platform-apis/mfrap/r4_overview.html)

### Document/Report Event Notification**

- [IHE Document Subscription for Mobile (DSUBm)](https://profiles.ihe.net/ITI/DSUBm/index.html) ITI-112
- [Multicast Notification Service](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)

## Region/Enterprise Standards

Are mostly based on federating the core standards via [Scatter-Gather](https://www.enterpriseintegrationpatterns.com/patterns/messaging/BroadcastAggregate.html)

### Federated Health Documents

- [IHE Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html)

### Federated Clinical Data 

Also known as Health Information Exchange (HIE), this is mostly a work in-progress.

- [IHE HIE White Paper](https://profiles.ihe.net/ITI/HIE-Whitepaper/)
- [HL7 Intermediataries White Paper](https://confluence.hl7.org/spaces/FHIR/pages/144967060/Intermediaries+White+Paper)
