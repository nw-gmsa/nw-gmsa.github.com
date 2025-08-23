<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>


## References

1. **NHS England IHE PAM and HL7 v2 Messaging Specification** from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
2. [IHE Patient Administration Module (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html) HL7 v2
3. IHE Patient Administration Module HL7 FHIR 
   - [Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html)
   - [Patient Demographics Query for Mobile (PDQm)](https://profiles.ihe.net/ITI/PDQm/index.html)
   - [Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/index.html)

## Overview

While the order is being fulfilled, patient demographics may change and systems involved in fulfilling the order require notification of these changes.

## Actors and Transactions

| Actor                                                                 | Definition                                                                                                                                                   |
|-----------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Patient Identity Source](ActorDefinition-PatientIdentitySource.html) | Commonly implemented by Patient Administration (PAS) or Electronic Patient Record (EPR) Systems                                                              |
| Patient Identifier Cross-reference Manager                            | For the purposes of this IG, this is either [Order Filler](ActorDefinition-OrderFiller.html) or [Automation Manager](ActorDefinition-AutomationManager.html) |
| Patient Demographics Consumer                                         | 	Requests a list of patients matching the supplied set of demographics criteria (example: ID or Name) from the Patient Demographics Supplier.                |
| Patient Demographics Supplier                                         | Returns demographic information for all patients matching the demographics criteria provided by the Patient Demographics Consumer                            |

### Patient Identifier Cross-referencing (PIX)

<figure>
{%include ITI-8.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Patient Identity Feed</p>
</figure>
<br clear="all">

<figure>
{%include PIX-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE PIX/PIX(m) Actor Diagram</p>
</figure>
<br clear="all">

- The `Patient Identity Source` sends a IHE ITI-8/HL7 v2 A31 (or [ITI-104](https://profiles.ihe.net/ITI/PIXm/ITI-104.html)/FHIR PUT (upsert)) event to the RIE 
- The RIE forwards this event to the local `Order Filler`
- For external orders (how do we know this?), the RIE to NHS England's `Automation Manager` Genomic Order Management System. At present this is:
  - Lookup up existing Patient via supplied identifiers (MRN or NHS Number) via a [FHIR RESTful Search](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#get-/FHIR/R4/Patient). 
  - If a Patient record is found, then update the Patient record via a [FHIR RESTful Update](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#put-/FHIR/R4/Patient/-id-)

### Patient Demographic Query (PDQ)

<figure>
{%include ITI-78.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Patient Demographic Query</p>
</figure>
<br clear="all">
