<div class="alert alert-danger" role="alert">
This is for information/analysis purposes only and is not a planned piece of work. It is not clinically validated and does not represent actual service behaviour.
</div>

Cancer Background Information for Use Cases is a high-level page that pulls
together several of this IG's other diagnostic testing and
treatment-monitoring use cases - a genomics test following on from a
pathology test order can often
occur around cancer, and cancer referrals bring their own notification
patterns. Rather than a single pathway, this page follows the same simple
three-stage structure Macmillan Cancer Support uses on
[macmillan.org.uk/cancer-information-and-support](https://www.macmillan.org.uk/cancer-information-and-support) -
**Diagnosis**, **Treatment**, and **After Treatment** - and shows where
genomic/genetic testing fits within each, using worked examples from the
[Cheshire and Merseyside Pathology](CheshireAndMerseysidePathology.html) and
[Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html#haematological-malignancy-diagnostic-services)
use cases.

## References

1. [Macmillan Cancer Support - Cancer information and support](https://www.macmillan.org.uk/cancer-information-and-support) - the Diagnosis / Treatment / After Treatment structure this page follows
2. [Getting It Right First Time (GIRFT) Best Practice Timed Diagnostic Cancer pathways](https://gettingitrightfirsttime.co.uk/wp-content/uploads/2024/03/BestPracticeTimedDiagnosticCancerPathwayssummary-guide-March-24-V3.pdf)
3. [macmillan.org.uk - Genomic Tests on the bowel cancer cells](https://www.macmillan.org.uk/cancer-information-and-support/bowel-cancer/tests-on-the-bowel-cancer-cells)
4. [NICE DG27 Molecular testing strategies for Lynch syndrome in people with colorectal cancer](https://www.nice.org.uk/guidance/dg27)
5. [Inherited MMR deficiency (Lynch syndrome) - R210](Questionnaire-GenomicTestReport.html#inherited-mmr-deficiency-lynch-syndrome---r210)
6. [ctDNA NHS England Unified Genomic Record (UGR)](ctDNAUGR.html) - the source of the After Treatment ctDNA monitoring pathway below

## Clinical Pathway Overview

This page illustrates three separate clinical pathways, each showing where
genomic/genetic testing fits within a patient's wider cancer journey - see
[Current Process](#current-process) below for the full Diagnosis/Treatment/After
Treatment breakdown of each:

- **Diagnosis** - the Colorectal Cancer diagnostic pathway, where a genomic test on the tumour sample can confirm the diagnosis and identify an inherited condition (Lynch syndrome).
- **Treatment** - the NHS North West Children Cancer example, illustrating how laboratory results (genomic tests follow a similar pattern) reach everyone who needs to act on them during ongoing treatment.
- **After Treatment** - a ctDNA monitoring pathway, using a follow-up blood test to look for early signs the cancer may be returning.

## Actors

| IHE Actor                                                                                                                   | Role                                    |
|----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------|
| [Order Placer](ActorDefinition-OrderPlacer.html) / [Order Result Tracker](ActorDefinition-OrderResultTracker.html) | Primary Treatment Centre (PTC) - requests testing, acts on results |
| *(no IHE actor defined for this role yet)*                                                                                          | Community Nurse / POSCU - specimen collection, notification relay |
| [Order Filler](ActorDefinition-OrderFiller.html)                                                                                     | Laboratory - performs testing, writes laboratory report |
{:.grid}

## Transactions

This page is cross-cutting narrative rather than its own transaction set - see the
`LAB-1`/`LAB-3`/`LAB-35`/`LAB-36` transactions on
[Cheshire and Merseyside Pathology](CheshireAndMerseysidePathology.html) and
[Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html) for the
underlying genomics ordering transactions these cancer pathways occur within.

## Current Process

Genomic and genetic testing does not happen at just one point in a cancer
pathway - it can help confirm a diagnosis, choose or adjust treatment, and
watch for the cancer coming back afterwards. The three sections below follow
Macmillan's own structure for
[cancer information and support](https://www.macmillan.org.uk/cancer-information-and-support),
so a family carer or patient reading this alongside a Macmillan guide can see
where the genomic/genetic testing fits in the wider picture.

```mermaid
flowchart LR
    D["Diagnosis"] --> T["Treatment"] --> A["After Treatment"]
    D -.-> D1["Colorectal Cancer<br/>diagnostic pathway"]
    T -.-> T1["NHS North West<br/>Children Cancer"]
    A -.-> A1["ctDNA monitoring<br/>pathway"]

    classDef blue fill:#DAE8FC;
    class T,A blue
```

### Diagnosis

[Macmillan - Diagnosis](https://www.macmillan.org.uk/cancer-information-and-support/diagnosis)
covers what happens when cancer is suspected and how a diagnosis is
confirmed. Genomic testing at this stage usually looks at the tumour sample
itself, to help confirm the diagnosis and check for an inherited condition
that could run in the family.

#### Diagnostic Cancer Pathways

<!--
<img style="padding:3px;width:20%;" src="cancer-diagnostics.png" alt="Cancer Diagnostics"/>
<br clear="all">
<p class="figureTitle">Cancer Diagnostics</p> 
<br clear="all">
-->

##### Colorectal Cancer—Diagnostic Pathways Example

The details of this are beyond the scope of this guide, for more details see [Getting It Right First Time (GIRFT) Best Practice Timed Diagnostic Cancer pathways ](https://gettingitrightfirsttime.co.uk/wp-content/uploads/2024/03/BestPracticeTimedDiagnosticCancerPathwayssummary-guide-March-24-V3.pdf). The diagram below is a simplified view of the same journey, in the style of a [Macmillan cancer information](https://www.macmillan.org.uk/cancer-information-and-support/bowel-cancer/tests-on-the-bowel-cancer-cells) guide:

```mermaid
flowchart LR
    A["Symptoms or a<br/>screening result"] --> B["GP referral"]
    B --> C["Colonoscopy<br/>and biopsy"]
    C --> D["Pathology confirms<br/>colorectal cancer"]
    D --> E["Genomic test on the<br/>tumour sample<br/>e.g. Lynch syndrome screening"]
    E -->|"Inherited pattern found"| F["Genetic counselling for<br/>patient and family"]
    E --> G["Result helps plan<br/>treatment"]
```

Underneath that simplified view, each step is really a **closed-loop referral** -
a request goes out, and a report or result comes back to whoever made the
request, before the next step begins:

- The **GP referral** is most likely made via the [NHS e-Referral Service (eRS)](https://digital.nhs.uk/services/e-referral-service) - referrals like this are generally linked to IHE 360X and HL7 v2 `REF_I12`. The resulting hospital outpatient/clinic report is returned to the GP via [MESH](https://digital.nhs.uk/services/message-exchange-for-social-care-and-health-mesh) (in the "Kettering" EDT/XML format many GP systems still expect) or, increasingly, the NHS England Transfer of Care standard. Discharge summaries and hospital reports sent this way often use HL7 v2 `MDM_T02` or `ORU_R01`.
- The **colonoscopy** itself may also generate a separate Imaging Report, alongside the biopsy specimen sent for pathology - following the equivalent IHE Radiology transactions, Imaging Order (`RAD-2`, `OMG^O19`) and Imaging Report (`RAD-28`, `ORU_R01`).
- **Colonoscopy to Pathology** follows this IG's own pattern: a Laboratory Order (`LAB-1`) is placed with the pathology lab, and a Laboratory Report (`LAB-3`) is returned.
- **Pathology to Genomics** follows the same pattern again: a Laboratory Order (`LAB-1`) is placed with the genomics lab, and a Laboratory Report (`LAB-3`) is returned.
- The link between **Genomics Testing and Genetic Counselling** is itself another referral (again potentially IHE 360X / HL7 v2 `REF_I12`), and may include orders for other family members (consultands), not just the patient (proband), as described in [Distributed WGS (dWGS)](dWGS.html)'s Family Structure/Participant Type pattern. This referral cannot use eRS in the same way the initial GP referral does - eRS is only available to GPs, so a referral from Genomics/Genetic Counselling (a hospital-based service) to arrange counselling has to use a different mechanism.
- Planning and monitoring of treatment is often coordinated by a **Multi-Disciplinary Team (MDT)**, drawing on the pathology and genomics reports above, who may produce a **Care Plan**.


This still follows the generic clinical process (Assessment, Diagnosis, Plan,
Implement, Evaluate - "ADPIE") described in [LTW - Clinical
Process](LTW.html#clinical-process), with diagnostic testing (colonoscopy,
imaging, pathology, genomics) as the embedded supporting workflow each time
more evidence is needed. The diagram below uses the same colour scheme as
that ADPIE diagram, so the two can be read side by side:

```mermaid
flowchart LR
    GP["GP"] -->|"Referral via NHS eRS<br/>(IHE 360X / REF_I12)"| Hosp["Hospital<br/>outpatient clinic"]
    Hosp -->|"Hospital report<br/>(MESH/Kettering XML or<br/>NHS Transfer of Care -<br/>MDM_T02 / ORU_R01)"| GP
    Hosp --> Colo["Colonoscopy"]
    Colo -->|"Imaging Order (RAD-2)<br/>OMG^O19"| Img["Imaging"]
    Img -->|"Imaging Report (RAD-28)<br/>ORU_R01"| Colo
    Colo -->|"Laboratory Order (LAB-1)"| Path["Pathology"]
    Path -->|"Laboratory Report (LAB-3)"| Colo
    Path -->|"Laboratory Order (LAB-1)"| Gen["Genomics"]
    Gen -->|"Laboratory Report (LAB-3)"| Path
    Gen -->|"Referral, not via eRS<br/>(IHE 360X / REF_I12) -<br/>may include family/<br/>consultand orders"| Couns["Genetic Counselling"]
    Path --> MDT["Multi-Disciplinary<br/>Team (MDT)"]
    Gen --> MDT
    MDT --> Plan["Care Plan"]

    Hosp -.->|"ITI-105"| SCR["Shared Care Record<br/>e.g. GMCR, Lancashire<br/>and South Cumbria"]
    Img -.->|"ITI-105"| SCR
    Path -.->|"ITI-105"| SCR
    Gen -.->|"ITI-105"| SCR
    Couns -.->|"ITI-105"| SCR

    classDef purple fill:#E1D5E7;
    classDef yellow fill:#FFF2CC;
    classDef pink fill:#F8CECC;
    classDef green fill:#D5E8D4;
    classDef blue fill:#DAE8FC;
    classDef orange fill:#FFE6CC;

    class GP,Hosp pink
    class Colo,Img,Path,Gen purple
    class Couns yellow
    class MDT,Plan green
```

Each closed-loop referral above only shares its report with the two parties
involved. Ideally, every report on this pathway - hospital/discharge reports,
the report from genetic counselling, laboratory reports, and imaging reports -
would instead be visible to all clinicians currently involved in the
patient's care, and to any consultant who sees the patient in future. This is
best achieved via shared care record systems, such as the [Lancashire and
South Cumbria Genomic Reports](GMCR.html#lancashire-and-south-cumbria)
and [Greater Manchester Care Record (GMCR)](GMCR.html)
feeds, and the [National Record Locator (NRL)](ctDNAUGR.html) service - this
group of shared care record systems is associated with the IHE XDS, MHD and
MHDS profiles (see [Health Data API (EURDICE)](HIE.html)).

This elaboration also relates to [Inherited MMR deficiency (Lynch syndrome) -
R210](Questionnaire-GenomicTestReport.html#inherited-mmr-deficiency-lynch-syndrome---r210), a
genomic test that can be requested on this pathway - see that section for the
full set of Genomics, Patient Care and Genetic Counseling examples (Diagnostic
Implication, Condition, FamilyMemberHistory, etc.) built around it.

For information on `Genomic Tests on the bowel cancer cells`, see [macmillan.org.uk](https://www.macmillan.org.uk/cancer-information-and-support/bowel-cancer/tests-on-the-bowel-cancer-cells) and [NICE DG27 Molecular testing strategies for Lynch syndrome in people with colorectal cancer](https://www.nice.org.uk/guidance/dg27)

<!--
<img style="padding:3px;width:90%;" src="ERIC.drawio.png" alt="Colorectal Cancer Diagnostics and Patient Referrals"/>
<br clear="all">
<p class="figureTitle">Colorectal Cancer Diagnostics and Patient Referrals</p> 
<br clear="all">
-->

##### Genetic Counselling Referral Across Regions

The genetic counselling referral above assumes the patient and their at-risk
relatives (consultands) all live in the same catchment as the diagnosing
genomics/genetics service. In practice a relative may live under a different
regional clinical genetics service - for example, a patient diagnosed in
Liverpool whose relatives live in Nottingham and Leeds. There is no national
system linking clinical genetics services across regions for this, so the
diagnosing service instead sends a **family letter** - a clinical letter
summarising the variant, the inheritance pattern and the relatives thought to
be at risk - to each relative's GP or directly to the regional genetics
service covering them, inviting a local referral for [cascade (predictive)
testing](https://www.macmillan.org.uk/cancer-information-and-support/worried-about-cancer/causes-and-risk-factors/what-is-genetic-counselling).
A relative within the diagnosing service's own catchment (e.g. another
relative living locally in Liverpool) is typically seen directly by that
service instead.

```mermaid
flowchart LR
    LivG["Liverpool Clinical<br/>Genetics (diagnosing service)"] -->|"Family letter"| NottG["Nottingham Regional<br/>Genetics Service"]
    NottG -->|"Cascade/predictive<br/>test arranged locally"| RelN["Mother<br/>(Nottingham)"]
    LivG -->|"Family letter"| LeedsG["Leeds Regional<br/>Genetics Service"]
    LeedsG -->|"Cascade/predictive<br/>test arranged locally"| RelL["Son<br/>(Leeds)"]
    LivG -->|"Seen directly -<br/>same catchment"| RelLiv["Other relative<br/>(Liverpool)"]
```

This inter-service handoff is an informal clinical convention rather than a
defined referral pathway or transaction: the family letter travels by
NHS.net secure email or dictated hospital correspondence (the same generic
mechanisms as any inter-trust referral), not via eRS or a genetics-specific
message type, and it does not carry structured/coded variant data - the
receiving service re-keys the details to order the relative's targeted
single-variant test. It also falls outside the shared care record feeds
described below, since those are regional/ICB-scoped and won't bridge two
different clinical genetics services. See [Genetic
Referrals](GeneticReferrals.html) for an information/analysis-only look
at what a more structured, closed-loop version of this referral (and its report
back) could look like.

<div class="alert alert-info" role="alert">
<b>User Story:</b> As the clinical genetics team following up a Lynch
syndrome diagnosis, we want the patient's family member history to identify
relatives living under different regional genetics services, so we can send
each one a family letter inviting local cascade testing - even though no
shared system links the two services' records.
</div>

This is already the scenario modelled by the [Inherited MMR deficiency (Lynch
syndrome) - R210](Questionnaire-GenomicTestReport.html#inherited-mmr-deficiency-lynch-syndrome---r210)
worked example: [Patient LIVERPOOL](Patient-Patient-Liverpool.html) is
diagnosed with Lynch syndrome from a [genomic
study](Procedure-f0036554-cd1a-463c-ac8a-d891ca409af9.html), a [diagnostic
implication](Observation-6beb613f-d303-42af-b025-86e8e0872061.html) and an
[NTHL1 variant](Observation-8385c2fd-313d-4fd5-b98e-d5ea4bae6f99.html),
recorded as a [Condition](Condition-c8f82825-e4cb-4e1f-b728-3fd2808e93db.html).
The same example already includes two FamilyMemberHistory resources for
consultands under different regional genetics services - a [mother in
Nottingham](FamilyMemberHistory-c76b8bc2-ec36-4ce1-a2ea-8c57215115e2.html) and
a [son in Leeds](FamilyMemberHistory-074ea905-8d91-452c-af3c-15b5b860fdb2.html)
- which is exactly the geographically-dispersed-family scenario the
  cross-region referral above describes.

##### Ongoing Clinical Process (ADPIE)

What happens after the genetic counselling referral (and any cascade testing)
is not a separate genomics-specific process - it is the same generic clinical
process described in [LTW - Clinical Process](LTW.html#clinical-process):
Assessment, Diagnosis, Plan, Implement/Interventions, Evaluate ("ADPIE"),
cycling round again as needed. Diagnostic testing - including the
colonoscopy, imaging, pathology and genomics steps above - is the supporting
workflow embedded within that cycle whenever the clinical team needs more
evidence.

```mermaid
graph TD;

    A[Assessment]-->|Creates Observations| B;
    A--> |"Orders (LAB-1)"| T;
    T[Diagnostic Testing<br/>colonoscopy, imaging,<br/>pathology, genomics] --> |"Diagnostic Report (LAB-3)"| A
    B[Diagnosis<br/>e.g. Lynch syndrome confirmed]-->|Creates Condition| C;
    C[Plan<br/>MDT / Care Plan]-->|Creates Goals and Tasks| D;
    D[Implement/Interventions<br/>e.g. surveillance, surgery]-->|Actions Tasks| E;
    D --> |"Monitoring<br/>Orders (LAB-1)"| T;
    T --> |"Monitoring<br/>Diagnostic Report (LAB-3)"| D
    E[Evaluate]--> |Reviews Care| A;

    classDef purple fill:#E1D5E7;
    classDef yellow fill:#FFF2CC;
    classDef pink fill:#F8CECC;
    classDef green fill:#D5E8D4;
    classDef blue fill:#DAE8FC;
    classDef orange fill:#FFE6CC;

    class A pink
    class B yellow
    class C green
    class D blue
    class E orange
    class T purple
```

### Treatment

[Macmillan - Treatment](https://www.macmillan.org.uk/cancer-information-and-support/treatment)
covers the different types of cancer treatment and what to expect. During
treatment, blood tests and other laboratory results are used regularly to
check how a patient is responding and to guide medicine doses - keeping
results flowing quickly and accurately between the hospital, community teams
and the laboratory matters just as much as the test itself.

#### NHS North West Children Cancer Example

> **Note:** This example is a pathology (blood test) example, not necessarily
> a genomic one - it is included as background information to illustrate the
> wider testing and notification processes a child on a cancer pathway goes
> through. The blood testing processes used for adults may not be as
> distributed as this example. The blood test itself may also link into ctDNA
> testing, which likewise starts with a blood sample - see the
> [ctDNA Monitoring Pathway](#ctdna-monitoring-pathway) under After Treatment
> below.

<!--
<img style="padding:3px;width:95%;" src="OrderCommunicationAndNotifications.drawio.png" alt="Order Communication and Notifications"/>
<br clear="all">
<p class="figureTitle">Genomic Order Notifications - Use Case 4</p> 
<br clear="all">
-->

The diagram below is a simplified view of the same as-is process, showing how a
blood test result reaches everyone who needs to see it and act on it:

```mermaid
flowchart LR
    PTC["Hospital treatment team<br/>(PTC)"] -->|"Requests blood test"| Nurse["Community nurse or<br/>POSCU"]
    Nurse -->|"Takes blood sample"| Lab["Laboratory"]
    Lab -->|"Sends result"| Nurse
    Lab -->|"Sends result"| PTC
    Nurse -->|"Confirms result received"| PTC
    PTC -->|"May adjust<br/>treatment plan"| Child(("Child and family"))
    PTC -->|"Tells local team about<br/>any change"| Nurse
```

##### As is Process

(From North West Children Cancer. This is centred around laboratory tests, genomic tests will have similar notification systems)

- Blood test requested by Primary Treatment Centre (PTC)
- Blood sample taken by Community Nurse or Paediatric Oncology Shared Care Unit (POSCU) and the specimen details are documented
- Blood Laboratory Order is created and a laboratory order request is sent to the laboratory
- Blood test performed by laboratory
- Laboratory writes up a blood results report (laboratory report)
- Laboratory report sent to Community Nurse or POSCU
- Laboratory report then sent to PTC
- Community Nurse or POSCU calls PTC by phone to notify that the results have been sent and to confirm that they have been received
- If results cannot be understood, PTC will call Community Nurse or POSCU to inform them. This is usually due to a defective message
    - Community Nurse or POSCU sends results in a different format (via telephone or re-writes the results out)
- PTC may edit a child's prescription on regimen in light of blood results and may need to recall a patient into hospital for additional tests
- If prescription is amended then PTC must notify POSCU

### After Treatment

[Macmillan - After Treatment](https://www.macmillan.org.uk/cancer-information-and-support/after-treatment)
covers [follow-up care](https://www.macmillan.org.uk/cancer-information-and-support/after-treatment/follow-up-care-after-treatment)
once treatment finishes, including watching for signs the cancer may be
coming back. One newer approach is testing a blood sample for tiny traces of
tumour DNA circulating in the blood - often called "ctDNA" or a "liquid
biopsy" - which can pick up early warning signs without needing a further
scan or biopsy of the tumour itself.

#### ctDNA Monitoring Pathway

This is a simplified view of the [ctDNA NHS England Unified Genomic Record
(UGR)](ctDNAUGR.html) use case, framed as a patient follow-up pathway rather
than a system integration:

This follows the same [ADPIE clinical process](LTW.html#clinical-process) as
the colorectal pathway above, using the same colour scheme:

```mermaid
flowchart LR
    A["Treatment finishes"] --> B["Follow-up blood test<br/>('liquid biopsy')"]
    B --> C["ctDNA test looks for<br/>trace tumour DNA"]
    C -->|"None found"| D["Continue routine<br/>follow-up care"]
    C -->|"Found"| E["Specialist review -<br/>possible early sign<br/>cancer is returning"]
    E --> F["Further scans or<br/>tests arranged"]
    E --> MDT["Multi-Disciplinary<br/>Team (MDT)"]
    MDT --> Plan["Care Plan"]

    classDef purple fill:#E1D5E7;
    classDef pink fill:#F8CECC;
    classDef green fill:#D5E8D4;
    classDef orange fill:#FFE6CC;

    class B,C,F purple
    class E pink
    class D orange
    class MDT,Plan green
```

As with the colorectal pathway above, planning and monitoring of ongoing or
follow-up treatment is often coordinated by a Multi-Disciplinary Team (MDT),
who may produce a Care Plan in response to the ctDNA result.

The underlying test result is a genomic report produced by NW Genomics and
shared nationally via the [ctDNA NHS England Unified Genomic Record
(UGR)](ctDNAUGR.html) use case, drawing on the discrete result values (variant
Observations) described in [OMICS DSS Result Integration](reportable-variants.html).

## Future Process

No distinct future-state changes are currently defined for the Diagnosis or
Treatment pathways above. The After Treatment ctDNA monitoring pathway is
itself a future integration - see [ctDNA NHS England Unified Genomic Record
(UGR)](ctDNAUGR.html) for its planned phases.

## Data Models

- [Inherited MMR deficiency (Lynch syndrome) - R210](Questionnaire-GenomicTestReport.html#inherited-mmr-deficiency-lynch-syndrome---r210) - Genomics, Patient Care and Genetic Counseling examples (Diagnostic Implication, Condition, FamilyMemberHistory)

## Examples

<div class="alert alert-info" role="alert">
<b>Example Scenario:</b> <a href="ExampleScenario-BiopsyProcedure.html">Collect Specimen - Biopsy Procedure</a>
</div>

[ExampleScenario-BiopsyProcedure](ExampleScenario-BiopsyProcedure.html) documents
the specimen collection process (day case admission, biopsy procedure) for a real
patient on this Colorectal Cancer pathway in the North Midlands - background
information on how the specimen behind a genomic test order is actually obtained,
not itself part of this genomic specification.

## Security Considerations

Includes:

- OAuth2 Standard for [Authorisation](api-security.html#authorisation---oauth2)
  - including use of JWT access tokens and future support for [SMART-on-FHIR Scopes](api-security.html#scopes)
- FHIR AuditEvent/IHE BALP for [Audit Logging](api-security.html#audit-logging)
- TLS for [Transport Security/Encryption](api-security.html#encryption)

## Developer Guides

No [Developer Guides](DeveloperGuides.html) notebook covers this use case yet.
