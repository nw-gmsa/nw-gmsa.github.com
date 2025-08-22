## Reference Standards

1. Health Information Exchange (IHE)
   - [IHE HIE White Paper](https://profiles.ihe.net/ITI/HIE-Whitepaper/)
   - [HL7 Intermediataries White Paper](https://confluence.hl7.org/spaces/FHIR/pages/144967060/Intermediaries+White+Paper)
2. [IHE Cross-Enterprise Document Sharing (XDS.b)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) 
3. [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html)
4. [IHE Query for Existing Data Mobile (QEDm)](https://profiles.ihe.net/PCC/QEDm/index.html)

## Actors and Transactions

| Actor                  | Definition                                                                                                                                                                                                                                                                                                                                                                                                      |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Consumer      | The Document Consumer queries Document Responder for DocumentReference metadata meeting certain criteria and may retrieve selected documents.                                                                                                                                                                                                                                                                   |
| Document Source        | The Document Source is the producer and publisher of Document Content to a Document Recipient.                                                                                                                                                                                                                                                                  |
| Document Recipient     | The Document Recipient receives documents and metadata sent by the Document Source.                                                                                                                                                                                                                                                                                                                             |
| Document Registry      | The Document Registry maintains metadata about each registered document in a document entry/DocumentReference. This includes a link to the Document in the Repository where it is stored. The Document Registry responds to queries from Document Consumer Actors about documents meeting specific criteria. It also enforces some healthcare specific technical policies at the time of document registration. | 
| Document Repository    | The Document Repository is responsible for both the persistent storage of these documents as well as for their registration with the appropriate Document Registry. It assigns a uniqueId to documents for subsequent retrieval by a Document Consumer.                                                                                                                                                                                                                                                                                                                                                                                                                | 
| Clinical Data Consumer | The Clinical Data Consumer sends FHIR RESTful queries to the Clinical Data Source for one or more fine-grained data elements (FHIR resources)                                                                                                                                                                                                                                                                   |
| Clinical Data Source   | The Clinical Data Source responds to FHIR RESTful queries for one or more fine-grained data elements (FHIR resources)                                                                                                                                                                                                                                                                                           |  

In the North West region the HIE systems are:

- Document Registry
    - Greater Manchester Care Record
    - Share2Care
- Document Repository
    - Greater Manchester Care Record
    - Share2Care
    - NW GMSA Clinical Data Repository
- Clinical Data Source
    - Greater Manchester Care Record
    - NW GMSA Clinical Data Repository

### Publish a Document

<figure>
{%include ITI-41.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Publish a Document</p>
</figure>
<br clear="all">

HL7 v2 [MDM_T02 - NW GMSA](mdm_t02-original-document-notification-and-content) can also be used for this purpose. 

### Search and Retrieve document

<figure>
{%include ITI-67.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Search and Retrieve document</p>
</figure>
<br clear="all">

- [NW GMSA Clinical Data Repository IHE MHD](MHD.html)

## Query Clinical Data 

<figure>
{%include PCC-44.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Search and Retrieve document</p>
</figure>
<br clear="all">

- [NW GMSA Clinical Data Repository IHE QEDm](QEDm.html)

