<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

## Reference Standards

1. Health Information Exchange (IHE)
   - [IHE HIE White Paper](https://profiles.ihe.net/ITI/HIE-Whitepaper/)
   - [HL7 Intermediataries White Paper](https://confluence.hl7.org/spaces/FHIR/pages/144967060/Intermediaries+White+Paper)
2. [IHE Cross-Enterprise Document Sharing (XDS.b)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) 
3. [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html)
4. [IHE Query for Existing Data Mobile (QEDm)](https://profiles.ihe.net/PCC/QEDm/index.html)

## Actors and Transactions

| Actor                  | Definition                                                                                                                                                                          |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Consumer      | A system (e.g., an EHR or healthcare app) that requests documents (such as patient records, lab results, or images). It initiates queries and retrieves the actual documents.       |
| Document Source        | The system that creates or owns a document (e.g., a hospital EHR, lab system, or imaging system). Responsible for sending the document and its metadata.                            |
| Document Recipient     | The system that receives, stores, and indexes the submitted document. It consists of: **Document Registry** and **Document Repository**                                             |                                                                                          |
| Document Responder     | The system that responds to the consumer’s requests. It contains two main parts: **Document Registry** and **Document Repository**                                                  |
| Document Registry      | Stores metadata (indexes) about available documents (e.g., type, patient ID, creation date, author), not the actual documents. It helps the consumer find what documents exist.     |
| Document Repository    | Stores the actual documents (clinical content). Once a document is identified, this is where it’s retrieved from.                                                                   | 
| Clinical Data Consumer | A system or application (e.g., mobile health app, EHR system, patient portal) that needs to access existing clinical data.                                                          |
| Clinical Data Source   | The system that stores and manages the clinical data (e.g., EHR database, hospital information system, lab system). It responds to queries by providing the requested patient data. |  

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

#### Interactions (Publishing Options)

The Document Source sends documents to the Document Recipient using one of several possible methods:

- Provide and Register Document Set-b [ITI-41]
  - Classic IHE XDS transaction.
  - Sends both the document(s) and their metadata in a structured set.
- Provide Document Bundle [ITI-65]
  - FHIR-based transaction.
  - Sends a document (e.g., CDA, PDF) wrapped in a FHIR Bundle along with metadata.
- Simplified Publish [ITI-105]
  - A simplified publication mechanism for certain use cases, requiring fewer steps.
- Generate Metadata [ITI-106]
  - Used when the document source wants the recipient to generate metadata automatically (instead of providing it explicitly).

HL7 v2 [MDM_T02 - NW GMSA](mdm_t02-original-document-notification-and-content) can also be used for this purpose.

### Search and Retrieve document

<figure>
{%include ITI-67.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Search and Retrieve document</p>
</figure>
<br clear="all">

- [NW GMSA Clinical Data Repository IHE MHD](MHD.html)

#### Interactions

- Search (Querying for Documents)
  - The Document Consumer sends queries to the Document Registry.
  - Supported interactions:
    - Registry Stored Query [ITI-18] → Standard stored query mechanism to search by patient ID, document type, date, etc.
    - Find Document References [ITI-67] → A FHIR-based query to find references to available documents.

✅ Goal: Find references to documents (not the actual documents yet).

- Retrieve (Getting the Documents)
  - After finding references, the Document Consumer retrieves the documents from the Document Repository.
  - Supported interactions:
    - Retrieve Document Set [ITI-43] → Used to retrieve one or more documents from a repository.
    - Retrieve Document [ITI-68] → FHIR-based retrieval of a specific document.

✅ Goal: Get the actual document content (e.g., PDF, CDA, images).   

#### Strengths:

- Good for sharing legal clinical documents (signed, immutable records).
- Provides a registry for organized search.
- Strong governance and audit support.

#### Limitations:

- Data inside documents may be hard to query directly (need to download and parse).
- Best for document-level interoperability, not fine-grained data queries.

## Query Clinical Data 

<figure>
{%include PCC-44.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Query Clinical Data</p>
</figure>
<br clear="all">

- [NW GMSA Clinical Data Repository IHE QEDm](QEDm.html)

- This is the IHE transaction for mobile clinical data access.
- It is FHIR-based and allows the Clinical Data Consumer to query and retrieve structured clinical data directly from the Clinical Data Source.
- Examples of data that can be retrieved:
  - Patient demographics
  - Allergies
  - Medications
  - Problems/diagnoses
  - Lab results
  - Clinical notes

#### Strengths:

- Fine-grained access: you can retrieve just a lab result, allergy list, or active medications.
- More real-time and lightweight, well-suited for mobile and modern apps.
- Easier integration with FHIR APIs.

#### Limitations:

- No central registry — consumers must know which sources to query.
- Less emphasis on document integrity (since it’s data fragments, not signed documents).
- Governance may be more complex across multiple data sources.

## Side-by-Side Comparison

| Feature	      | Document Sharing (XDS, ITI transactions)	                    | Clinical Data Query (PCC-44)                                |
|---------------|--------------------------------------------------------------|-------------------------------------------------------------|
| Data Type     | 	Whole documents (CDA/FHIR Documents, PDF, images)	          | Discrete data (FHIR resources)                              |
| Query Target	 | Document Registry (then repository)	                         | Direct Data Source                                          |
| Retrieval     | ITI-43, ITI-68 (document content)                            | 	PCC-44 (FHIR resources)                                    |
| Use Case	     | Legal record exchange, discharge summaries, imaging reports	 | Mobile apps, clinical decision support, patient-facing apps |
| Strength	     | Strong governance, legal compliance, document integrity      | 	Flexible, real-time, fine-grained data access              |
| Limitation    | 	Less flexible for data analytics                            | 	No document-level legal record                             |
