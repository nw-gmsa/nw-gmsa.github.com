
## Reference Standards

### Health Documents Sharing

- [IHE Cross-Enterprise Document Sharing (XDS.b)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) 
- [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) ITI-105 - The document in the payload can be pdf or a FHIR Document (informatics description: composition). [NHS England - National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir) is also an option here.

#### Clinical Compositions (FHIR Documents and CDA)

These are formats for clinical documents (equivalent to PDF, html, png, etc), used with `Health Document Sharing`

  - [HL7 International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/index.html)
  - [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) - This a [FHIR Document](https://hl7.org/fhir/R4/documents.html) version of the HL7 v2 ORU (and any FHIR Message equivalent).
  - [HL7 Europe Imaging Study Report](https://build.fhir.org/ig/hl7-eu/imaging/branches/initial-version/index.html)

### Clinical Data Sharing

The health document approaches above can be considered the summary and clinical data sharing is the detailed record.

- [HL7 International Patient Access (IPA)](https://build.fhir.org/ig/HL7/fhir-ipa/) (or [IHE Query for Existing Data for Mobile (QEDm)](https://profiles.ihe.net/PCC/QEDm/) which is mostly the same standard). 
  - Supplier specifications
    - [EPIC FHIR](https://fhir.epic.com/)
    - [Meditech FHIR](https://fhir.meditech.com/)
    - [Cerner/Oracle Health Millennium FHIR](https://docs.oracle.com/en/industries/health/millennium-platform-apis/mfrap/r4_overview.html)



## Health Document Sharing

### References 

- [IHE Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html)
- [IHE HIE White Paper](https://profiles.ihe.net/ITI/HIE-Whitepaper/) in-progress
- [NHS England - National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir)

### Overview 

Is based on federating the referenced standards via [Scatter-Gather](https://www.enterpriseintegrationpatterns.com/patterns/messaging/BroadcastAggregate.html)

<figure>
{%include HIE-MHD-Federated-Sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Health Document Sharing - Federated</p>
</figure>
<br clear="all">

1. `Document Consumer` makes a call to the `Intermediary`. This is an updated version of [Cross-Community Access (XCA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-18.html) with ITI-67 used in place of ITI-18.
2. The `Intermediary` calls National Record Locator to find nationally held record references.
3. The `Intermediary` optionally calls the `Master Patient Index`. This is similar to the use of [Cross-Community Patient Discovery (XCPD)](https://profiles.ihe.net/ITI/TF/Volume1/ch-27.html) with XDS.b but uses ITI-78 in place of HL7 v3 ITI-55 or HL7 v2 PDQ ITI-21 
4. The `Intermediary` calls systems within the region using either IHE XDS or IHE QEDm/HL7 IPA api standards to find XDS DocumentEntry or FHIR DocumentReference. 
5. The `Intermediary` [transforms](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageTranslator.html) XDS DocumentEntry to FHIR DocumentReference, performs de-duplication and [aggregates](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Aggregator.html) them into a single list.
6. The list of FHIR DocumentReference is returned to the `Document Consumer`

## Clinical Data Sharing

### References

- [HL7 Intermediataries White Paper](https://confluence.hl7.org/spaces/FHIR/pages/144967060/Intermediaries+White+Paper)

### Overview

Like `Health Document Sharing` is based on federating the referenced standards via [Scatter-Gather](https://www.enterpriseintegrationpatterns.com/patterns/messaging/BroadcastAggregate.html)

<figure>
{%include HIE-QEDm-Federated-Sequence.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Health Document Sharing - Federated</p>
</figure>
<br clear="all">

1. `Clinical Data Consumer` makes a call to the `Intermediary`. This is [Query Existing Data [PCC-44]](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html)/[HL7 IPA Finding and Retrieving Patient Information](https://build.fhir.org/ig/HL7/fhir-ipa/fetching.html) - these are expected to merge, the FHIR {resource} queried will vary.
2. The `Intermediary` optionally calls the `Master Patient Index`. This is similar to the use of [Cross-Community Patient Discovery (XCPD)](https://profiles.ihe.net/ITI/TF/Volume1/ch-27.html) with XDS.b but uses ITI-78 in place of HL7 v3 ITI-55 or HL7 v2 PDQ ITI-21
3. The `Intermediary` calls systems within the region using [Query Existing Data [PCC-44]](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html)/[HL7 IPA Finding and Retrieving Patient Information](https://build.fhir.org/ig/HL7/fhir-ipa/fetching.html) to find FHIR {resource}
4. The `Intermediary` Performs de-duplication of the FHIR {resource}'s and [aggregates](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Aggregator.html) them into a single list. 
5. The list of FHIR {resource} is returned to the `Clinical Data Consumer`
