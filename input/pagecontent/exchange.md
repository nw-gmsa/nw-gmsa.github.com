
## Document Messaging

This basic patten is the exchange of records via [Document Messaging](https://www.enterpriseintegrationpatterns.com/patterns/messaging/DocumentMessage.html) and is supported by a wide area of [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/index.html) 
In NHS Trusts this is often supported by a Trust Integration Engine.

```mermaid
graph LR;

    s[Data Source]
 

    d[Data Consumer]

s --> |v2 Message<br/>FHIR Message<br/>FHIR Transaction| d 

classDef yellow fill:#FFF2CC;

class v2D,fMessage yellow
```

### Example - Laboratory Testing Workflow

Is based on Document Messaging and two flows are combined to create a workflow e.g. [IHE Laboratory Testing Workflow (LTW)](LTW.html)

```mermaid
graph LR;

 subgraph s[Order Placer];
    EPR
 end

subgraph d[Order Filler];
    LIMS
end

EPR --> |LAB-1 Laboratory Order OML_O21/ORM_O01| LIMS
LIMS -->  |LAB-3 Laboratory Report ORU_R01| EPR

classDef yellow fill:#FFF2CC;

class v2D,fMessage yellow
```

## Document Sharing

Document Messaging main limitation is it is between two parties, often in health care many other practitioners are involved. Messaging can be used to solve this but it begins to have scaling and data concurrency issues. 

```mermaid
graph LR;

    s[Document Consumer]
    d[Document Registry & Repository]

s --> |Query API<br/>XDS API<br/>FHIR RESTful| d 

classDef yellow fill:#FFF2CC;

class v2D,fMessage yellow
```

### Example - Document Exchange

See also [Health Information Exchange - Document Exchange](HIE.html#document-exchange)

```mermaid
graph LR;

    s[Document Consumer]
    
    subgraph d[Document Registry & Repository];
        Registry
        Repository
    end

s --> |Find Document References ITI-67 FHIR RESTful<br/>Registry Stored Query ITI-18| Registry
s --> |Retrieve Document ITI-68<br/>Retrieve Document Set ITI-41| Repository

classDef yellow fill:#FFF2CC;

class v2D,fMessage yellow
```

### Example - NHS England National Record Locator

See [NHS England National Record Locator](https://digital.nhs.uk/services/national-record-locator)

### Example - Cross Enterprise Document Sharing Laboratory 

Electronic Document Management (EDM) is a common practice for storing and sharing documents across healthcare systems and common formats for the documents are often PDF. In diagnostics this is not desirable and so instead a document format called [Clinical Document Architecture (CDA)](https://en.wikipedia.org/wiki/Clinical_Document_Architecture), in HL7 FHIR this is known as [FHIR Document](https://hl7.org/fhir/R4/documents.html)

This is the is described in [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/), [NHS England Pathology](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Design/How-to-Construct-Bundles?version=0.4.0) is a based on this but it using [Document Messaging](#document-messaging---generation-1), the EU is likely to use [Document Sharing](#document-sharing---generation-2).

## Document Event Notifications

Prerequisite is [Document Sharing](#document-sharing) 

```mermaid
graph LR;


Publisher[Notification Publisher]
Broker[Notification Broker]
Subscriber[Notification Subscriber]
Recipient[Notification Recipient]

Publisher --> |Event Publish| Broker
Subscriber --> |Event Subscription| Broker
Broker --> |Event Notify| Recipient

classDef yellow fill:#FFF2CC;

class v2D,fMessage yellow
```

### Example - Multicast Notifcation Service

See [NHS England Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)

### Example - Document Subscription for Mobile (DSUBm)

See [IHE Document Subscription for Mobile (DSUBm)](https://profiles.ihe.net/ITI/DSUBm/index.html)

## Data Sharing

Can be considered an extension of Document Sharing where the data contained in the documents is queryable. This data is known as Resources and is related to Segments used in HL7 v2 Messaging.

This is the most common use of HL7 FHIR.

```mermaid
graph LR


provider[Resource Access Provider<br/><br/>Genomic Data Platform]
consumer[Resource/Data Consumer]

consumer --> |Request Resources| provider
provider --> |Respond| consumer
```

### Example - Resource Exchange

See also [Health Information Exchange - Resource Exchange](HIE.html#resource-exchange)

## Resource Event Notifications 

Prerequisite is [Data Sharing](#data-sharing) 
