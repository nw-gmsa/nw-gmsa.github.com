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

- Patient Identity Source (left box)
  - The system that creates or maintains patient identity information (e.g., a hospital registration system, EHR, or patient administration system).
  - It sends identity data such as patient identifiers, name, date of birth, and updates like merges or changes.
- Patient Identifier Cross-reference Manager (right box)
  - A system that manages multiple patient identifiers across different domains.
  - It links and reconciles identifiers for the same patient coming from different hospitals, clinics, or systems.
  - Example: If Hospital A identifies a patient as 12345 and Hospital B as XYZ678, this manager can cross-reference them to the same person.
- Patient Identity Feed (top label)
  - The interaction between the Identity Source and the Cross-reference Manager.
  - There are several technical transactions defined:
    - Patient Identity Feed (ITI-8): HL7 v2-based standard (classic hospital integration).
    - Patient Identity Feed FHIR (ITI-104): Modern RESTful FHIR-based implementation.
    - Mobile Patient Identity Feed (ITI-93): Lightweight RESTful API (FHIR/REST) optimized for mobile/web apps.

✅ In summary:
This diagram shows how a Patient Identity Source (like an EHR or registration system) sends patient identity information to a Patient Identifier Cross-reference Manager using different technical standards (HL7 v2, FHIR, or mobile REST). The cross-reference manager then ensures consistent patient identity mapping across multiple systems.

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

- Patient Demographics Consumer (left box)
  - This is the system or application that needs patient demographic information (for example, an EHR system, a registration system, or another clinical application).
  - It sends a query to request demographic details (like name, DOB, address, identifiers, etc.) about a patient.
- Patient Demographics Supplier (right box)
  -This is the system that maintains and provides patient demographic information (e.g., a Master Patient Index (MPI) or a hospital registration system).
  - It receives the query and responds with the matching patient demographic data.
- Patient Demographic Query (top label)
  - Represents the type of interaction between the consumer and supplier.
  - There are two technical transaction standards for this query:
    - Mobile Patient Demographics Query (ITI-78) → uses modern RESTful APIs (FHIR-based), suitable for mobile or web apps.
    - Patient Demographics Query (ITI-21) → the older HL7 v2 message-based standard.

✅ In short:
The diagram shows that a Patient Demographics Consumer system can request patient demographic data from a Patient Demographics Supplier system using either the older ITI-21 transaction or the newer ITI-78 transaction.
