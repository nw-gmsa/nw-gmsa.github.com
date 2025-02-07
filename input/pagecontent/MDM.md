## References

- A. HL7 v2.5.1 [MFN_M02 - Master files notification - Staff/practitioner master file](https://hl7-definition.caristix.com/v2/HL7v2.5.1/TriggerEvents/MFN_M02)
- B. [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html)

<figure>
{%include MDM-component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">MDM Actor Diagram</p>
</figure>
<br clear="all">

- The `Care Service Update Source` sends a [HL7 v2.5.1 MFN_M02 - Master files notification - Staff/practitioner master file](https://hl7-definition.caristix.com/v2/HL7v2.5.1/TriggerEvents/MFN_M02) event to the RIE
- The RIE forwards this event to the local `Order Filler`
- For external orders (how do we know this?), the RIE to NHS England's `Automation Manager` Genomic Order Management System. At present this is:
    - Lookup up existing PractitionerRole via supplied identifiers (MRN or NHS Number) via a [FHIR RESTful Search](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#get-/FHIR/R4/PractitionerRole).
    - If a PractitionerRole record is found, then update the Patient record via a [FHIR RESTful Update](https://digital.nhs.uk/developer/api-catalogue/genomic-order-management-service-fhir#put-/FHIR/R4/PractitionerRole/-id-)
