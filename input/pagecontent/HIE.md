Follow **API Contracts** from EURIDICE [EU Health Data API](https://hl7.eu/fhir/health-data-api/1.0.0-ballot/en/index.html) and **Data Contracts** from EHDS in particular:

1. [HL7 Europe Base and Core FHIR IG](https://build.fhir.org/ig/hl7-eu/base/)
2. [HL7 Europe Laboratory Report](https://hl7.eu/fhir/laboratory/)

This specification adds England-specific data modeling from NHS England Canonical Data Model ([NHS Futures - Canonical Data Model (CDM)](https://future.nhs.uk/DataArchitecture/view?objectId=59464656)).
This specification also conforms to HL7 UK Core.

Process flows and background information are the same as [EU Health Data API](https://hl7.eu/fhir/health-data-api/1.0.0-ballot/en/index.html) and so are not repeated here.

## API Security 

See [API Security](api-security.html)

### Authorization

HL7 SMART Backend Services - Defines authorization in FHIR. We use the SMART Backend Services profile for system-system authorization, and FHIR scopes.
[Authorisation [IUA]](IUA.html) - Defines authorization and access control actors and mechanisms. We use the actors and transactions model.

## Patient Identity Matching

[Patient Identity Matching [PDQm]](PDQm.html) - Defines how a client can perform patient lookup given demographics against a server.

## Document Exchange

```mermaid
graph LR

    publisher[Document Publisher]
    subgraph provider[Document Access Provider]
        registry[Document Registry]
        repository[Document Repository]
    end
    consumer[Document Consumer]

    publisher --> |"Publish Document<br/><br/>Simplified Publish [ITI-105 HL7 FHIR]<br/>Original document notification and content [HL7 v2 MDM_T02]"| provider
    consumer --> |"Find Documents<br/><br/>Find Document References [ITI-67 HL7 FHIR]<br/>Registry Stored Query [ITI-18 XDS]"| registry
    consumer --> |"Retrieves Documents<br/><br/>Retrieve Document [ITI-68]<br/>Retrieve Document Set [ITI-43 XDS]"| repository
    registry --> consumer
    repository -->  consumer
```

The IHE XDS/MHD document-sharing pattern used in health information exchange, has three actor roles:

- Document Publisher — pushes documents into the system using either the FHIR-based Simplified Publish (ITI-105) transaction or the older HL7 v2 MDM_T02 notification.
- Document Access Provider — a grouping of two services:
  - Document Registry, which indexes document metadata and answers queries (Find Document References ITI-67 in FHIR, or the older Registry Stored Query ITI-18 in XDS).
  - Document Repository, which stores and serves the actual document content (Retrieve Document ITI-68 in FHIR, or Retrieve Document Set ITI-43 in XDS).
- Document Consumer — queries the registry to find documents and retrieves them from the repository.

In short: a publisher submits documents into the registry/repository, and a consumer discovers them via the registry then fetches the content from the repository — with each interaction supporting both a modern FHIR transaction and its older HL7v2/XDS equivalent.

[Document Exchange [MHD]](MHD.html) - Defines exchange of Documents, which we use to exchange FHIR document content.

### Publish Document 

NW Genomics support:

- [HL7 v2 MDM_T02](MHD.html#document-publish)
- [IHE-105 Simplified Publish (HL7 FHIR)](https://hl7.eu/fhir/health-data-api/1.0.0-ballot/en/document-exchange.html#iti-105-simplified-publish).

```mermaid
sequenceDiagram

    participant LIMS as Order Filler<br/>LIMS 
    participant Provider as Document Producer<br/>(Regional Orchestration Engine)
    participant Consumer as Document Consumer

    note over LIMS,Provider: IHE LAB-3 Laboratory Report
    LIMS ->> Provider: Sends Laboratory Report

    opt IHE ITI-105 Simplified Publish
        Note over Consumer,Provider:ITI-105 Simplified Publish
        Provider->>Consumer: POST /DocumentReference
        Consumer-->>Provider: Response OperationOutcome
    end 
    opt HL7 v2 MDM_T02
         Note over Consumer,Provider:Original document <br/>notification and content
        Provider->>Consumer: HL7 v2 MDM_T02 Message
        Consumer-->>Provider: Response HL7 v2 ACK
    end 
```

## Resource Exchange

```mermaid
graph LR

publisher["Workflow Exchange (i.e. IHE LTW)<br/>Bioninformatics Pipelines"]
provider[Resource Access Provider<br/><br/>Genomic Data Platform]
consumer[Resource/Data Consumer]

publisher -->  provider
consumer --> |Request Resources| provider
provider --> |Respond| consumer
```

[Resource Access [IPA/QEDm]](QEDm.html) - using HL7 International Patient Access (IPA), aligned with IHE Query for Existing Data for Mobile (QEDm) — for querying individual FHIR resources such as conditions, medications, and observations
