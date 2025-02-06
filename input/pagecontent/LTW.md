
## References 

A. [IHE Pathology and Laboratory Medicine (PaLM) Technical Framework - Volume 1](https://www.ihe.net/uploadedFiles/Documents/PaLM/IHE_PaLM_TF_Vol1.pdf) 

## Actors and Transactions

| Actor                | Definition                                                                                                                                       |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Order Placer         | Commonly known as the Electronic Patient Record (EPR) System                                                                                     |
| Order Filler         | Genomic Laboratory Hub (GLH), Laboratory Information System (LIMS)                                                                               |
| Automation Manager   | This is the function of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) |
| Order Result Tracker | This is the function of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir) |

See also Ref A `Section 3 Laboratory Testing Workflow (LTW) Profile` for detailed description of actors.

<figure>
{%include ihe-palm-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">IHE LTW Actor Diagram</p>
</figure>
<br clear="all">

Initially only the IHE `LAB-1` is in focus and this is probably using HL7 v2.x ORM_O01/OML_O21 as described below.
This will be followed by IHE `LAB-3` probably using HL7 v2.x ORU_R01
Later stages will include the use of [Genomic Order Management Service](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir), using HL7 FHIR which will add in concepts covered in `LAB-4`.

## Overview

### Use Cases

#### Use Case 1: Order to Regional GLH



#### Use Case 2: Order to GLH in another region

TODO

## Security Considerations

TODO 

This may include [IHE Internet User Authentication [IUA]](https://profiles.ihe.net/ITI/IUA/index.html) and [IHE Basic Audit Log Patterns[BALP]](https://profiles.ihe.net/ITI/BALP/index.html) which includes use of:

- OAuth2 Standard for **Authorisation**
  - including use of JWT access tokens and including future support for [SMART-on-FHIR Scopes](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html))
- FHIR AuditEvent for **Logging Access**
- TLS for **Transport Security**

## Cross-Profile Considerations

It is recommended that the actors receive patient demographic and encounter updates only within the
context of a work order. Whenever patient data changes, due to:

- Update patient information (A31 or A08)
- Patient transfer (A02)
- Transfer cancelled (A12)
- Patients merge (A40)

Note: Event trigger definitions based on [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) which is NHS England's supplement to IHE Technical Framework Volume2: [Patient Identity Management [ITI-30]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-30.html) and  [Patient Encounter Management [ITI-31]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html).

It is common for this requirement to be answered by a combination of:

- [IHE Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html)/HL7 v2 ADT Patient Demographic Update (A31 and A40)
  - HL7 FHIR version [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html)
- [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html)//HL7 v2 ADT Patient Encounter Management (A02, A08 and A12)
  - (Denmark) HL7 FHIR version [DK MedCom HospitalNotification](https://medcomfhir.dk/ig/hospitalnotification/)






