removed from LTW.md


#### Relationship to NHS England Pathology

This guide builds on the use cases described in the [NHS England Pathology FHIR Implementation Guide](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/Design/Background), extending them to support a wider range of stakeholders and introducing standards for the Laboratory Order LAB-1.

Key differences include:

- **Workflow foundation:** The [IHE Laboratory and Testing Worflow LTW](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) is used as the reference model for describing laboratory testing processes.
- **Order Placer role:** The GP Electronic Patient Record (EPR) System and the Order Communications System together form the Order Placer role, which may also be fulfilled by other EPR systems.
- **Intermediary between Order Placer and Order Filler:** This intermediary performs message translation and code conversion.
- **Order Result Tracker role:** For results, the GP EPR System acts as the Order Result Tracker, though other systems (e.g. Secondary Care EPR) can provide this function.
- **Intermediary between Order Filler and Order Result Tracker:** This intermediary also handles message translation and code conversion.
- **Canonical model:** A standardised model ([Canonical model](https://en.wikipedia.org/wiki/Canonical_model)), expressed in HL7 FHIR, that can be implemented using HL7 v2, FHIR, and IHE XDS. It aligns with the latest HL7 UK Core and NHS England Data Model and Dictionary. While primarily focused on genomics, it incorporates elements from pathology and radiology for compatibility, and mandates the use of NHS England National Procedure Codes.

<img style="padding:3px;width:95%;" src="Relationship to NHS England Pathology.drawio.png" alt="Relationship to NHS England Pathology"/>
<br clear="all">
<p class="figureTitle">Relationship to NHS England Pathology</p> 
<br clear="all">

### Summary of Order and Report

Genomic Test Order and Report use cases form part of a broader diagnostic testing workflow, which is guided by:

- [NICE](https://www.nice.org.uk/) standards
- **Getting It Right First Time (GIRFT)** best practice pathways (e.g. [Getting It Right First Time (GIRFT) Best Practice Timed Diagnostic Cancer pathways ](https://gettingitrightfirsttime.co.uk/wp-content/uploads/2024/03/BestPracticeTimedDiagnosticCancerPathwayssummary-guide-March-24-V3.pdf)
- Local Diagnostic Pathway Guidance.

These pathways are technically implmented and generally align with the [IHE Laboratory and Testing Worflow LTW](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) (for Imaging workflows see [IHE Radiology (RAD)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf))

Within EHR systems, test orders are usually created through an **Order Entry Form** (also referred to in health informatics as a *Template*). Reports are typically displayed in the EPR as a *Composition* (health informatics terminology).

Between the **Order Placer** (e.g., consultant and EPR) and the **Order Filler** (e.g., laboratory and LIMS), various intermediary systems are used. These are often called Trust Integration Engines (TIEs). The most widely used messaging standard is HL7 v2.

To modernise these workflows, the North West GMSA is also introducing **FHIR**. Alongside this, a regional canonical data model—compatible with HL7 v2, FHIR, and IHE XDS—is being developed. This model aims to reduce the need for multiple message transformations by establishing a common (regional) NHS core data standard.

### Relationship to NHS England Genomic Order Management Service FHIR API

This guide builds on the use cases outlined in [NHS England Genomic Order Management Service FHIR API - Background](https://simplifier.net/guide/genomic-order-management-service-fhir-api/Home/Design/Background), expanding them to support a broader range of participants and introducing standards for the `Laboratory Order LAB-1`.
Key differences include:

- **Workflow basis:** The [IHE Laboratory and Testing Worflow LTW](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) serves as the primary reference for describing laboratory testing processes.
- **Message translation and code conversion:** The Regional Orchestration Engine (RIE) handles translations and code mappings to and from the Genomic Order Management Service FHIR API.
- **Routing of orders and reports:** The RIE routes orders and reports for other GMSAs through the Genomic Order Management Service FHIR API.
- **Regional workflow consistency:** Existing regional workflows remain largely unchanged, with both HL7 v2 and FHIR standardised across the region.
- **Report compatibility:** Reports are aligned with neighbouring Welsh NHS systems, using DHCW HL7 v2 ORU as the core model for both HL7 v2 and FHIR in the North West.

<img style="padding:3px;width:95%;" src="Relationship to NHS England Genomic Order Management Service.drawio.png" alt="Relationship to NHS England Genomic Order Management Service FHIR API"/>
<br clear="all">
<p class="figureTitle">Relationship to NHS England Genomic Order Management Service</p> 
<br clear="all">


