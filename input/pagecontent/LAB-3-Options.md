


<img style="padding:3px;width:70%;" src="Modernisation IHE LTW LAB-3.drawio.png" alt="IHE LTW LAB-3 Options"/>
<br clear="all">
<p class="figureTitle">IHE LTW LAB-3 Modernisation Options</p> 
<br clear="all">

<figure>
{%include LTW-usecase-4-options.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE LTW LAB-3 Modernisation Options Sequence Diagram</p>
</figure>
<br clear="all">

#### Phase: Traditional Workflow

This is the most widely used method for exchanging laboratory reports and is based on the [HL7 v2 ORU_R01](hl7v2.html#oru_r01-unsolicited-transmission-of-an-observation-message) message. Currently, many NHS trusts and laboratories use custom implementations of this standard, which are adapted via Trust Integration Engines (TIE). To reduce integration costs and enhance regional interoperability, we propose developing a regional standard for ORU_R01. This will build upon the  [Digital Health and Care Wales - HL7 ORU_R01 2.5.1 Implementation Guide](DHCW-HL7-v2-5-1-ORUR01-Specification.pdf) (as NHS England has not issued equivalent guidance) and incorporate elements from:

- The Royal College of Radiologists – [Reporting networks - understanding the technical options](https://www.rcr.ac.uk/media/wwtp2mif/rcr-publications_radiology-reporting-networks-understanding-the-technical-options_march-2022.pdf) for ORC+OBR/FHIR DiagnosticReport
- [IHE Europe Document Metadata](https://www.ihe-europe.net/sites/default/files/2017-11/IHE_ITI_XDS_Metadata_Guidelines_v1.0.pdf) for OBX (value type = ED)/FHIR DocumentReference metadata
- [Digital Health and Care Scotland - (EH4001) CLINICAL DOCUMENT INDEXING STANDARDS ](https://www.digihealthcare.scot/app/uploads/2024/05/CDI-Standard-V4.5-FINAL.pdf) for OBX (value type = ED)/FHIR DocumentReference metadata

Reports will be shared in PDF format, potentially limited to regionally placed orders (supported by complementary integration methods).

> The regional ORU_R01 design is not specific to genomics and can be reused across the six regional diagnostic networks (including imaging and pathology).

#### Phase: Regional Genomic Data Sharing

One major limitation of the `traditional workflow` is that reports are only accessible within systems that received them via HL7 v2 ORU_R01. This phase introduces a regional Clinical Data Repository (CDR) for genomics, accessible to all care providers in the region.

The CDR will be built using the InterSystems FHIR Repository and follow FHIR RESTful/IHE QEDm (PCC-44) standards. In future phases, it will connect to the national Genomics CDR through a Health Information Exchange (HIE) integration pattern.

Initially, the CDR will be populated by converting HL7 v2 ORU_R01 (and OML_O21) messages into HL7 FHIR, with additional data sources providing structured genomic reports based on the Genomics Reporting Implementation Guide. This will also serve as a useful resource for HL7 v2 developers, offering insights into converting v2 messages into FHIR.

#### Phase: Event Notifications

This phase introduces real-time notification support, similar to online order tracking where updates are sent via email or SMS.

The notification system will be based on the [Subscriptions R5 Backport](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/index.html) and initially support:

- Email
- FHIR Messaging – using FHIR Task-based event notifications

Future expansions will include notifications from the national [Genomic Order Management Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) via its FHIR API.
