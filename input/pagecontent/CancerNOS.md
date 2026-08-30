<div class="alert alert-danger" role="alert">
This is for information/analysis purposes only and is not a planned piece of work.
</div>

Cancer (Not Otherwise Specified) diagnostic and notification pathways that cut
across the [Cheshire and Merseyside Pathology](CheshireAndMerseysidePathology.html)
and [Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html#haematological-malignancy-diagnostic-services)
use cases - a genomics test following on from a pathology test order can often
occur around cancer, and cancer referrals bring their own notification patterns.

## References

1. [Getting It Right First Time (GIRFT) Best Practice Timed Diagnostic Cancer pathways](https://gettingitrightfirsttime.co.uk/wp-content/uploads/2024/03/BestPracticeTimedDiagnosticCancerPathwayssummary-guide-March-24-V3.pdf)
2. [macmillan.org.uk - Genomic Tests on the bowel cancer cells](https://www.macmillan.org.uk/cancer-information-and-support/bowel-cancer/tests-on-the-bowel-cancer-cells)
3. [NICE DG27 Molecular testing strategies for Lynch syndrome in people with colorectal cancer](https://www.nice.org.uk/guidance/dg27)
4. [Inherited MMR deficiency (Lynch syndrome) - R210](DiagnosticReport.html#inherited-mmr-deficiency-lynch-syndrome---r210)

## Actors

| Actor                            | Role                                    |
|-------------------------------------|------------------------------------------|
| Primary Treatment Centre (PTC)        | Requests testing, acts on results          |
| Community Nurse / POSCU               | Specimen collection, notification relay    |
| Laboratory                            | Performs testing, writes laboratory report |
{:.grid}

## Transactions

This page is cross-cutting narrative rather than its own transaction set - see the
`LAB-1`/`LAB-3`/`LAB-35`/`LAB-36` transactions on
[Cheshire and Merseyside Pathology](CheshireAndMerseysidePathology.html) and
[Haemato-Oncology Diagnostic Pathway](HaematoOncologyPathway.html) for the
underlying genomics ordering transactions these cancer pathways occur within.

## Current Process

### Diagnostic Cancer Pathways

<img style="padding:3px;width:20%;" src="cancer-diagnostics.png" alt="Cancer Diagnostics"/>
<br clear="all">
<p class="figureTitle">Cancer Diagnostics</p> 
<br clear="all">

#### Colorectal Cancer—Diagnostic Pathways Example

The details of this are beyond the scope of this guide, for more details see [Getting It Right First Time (GIRFT) Best Practice Timed Diagnostic Cancer pathways ](https://gettingitrightfirsttime.co.uk/wp-content/uploads/2024/03/BestPracticeTimedDiagnosticCancerPathwayssummary-guide-March-24-V3.pdf)

This elaboration also relates to [Inherited MMR deficiency (Lynch syndrome) -
R210](DiagnosticReport.html#inherited-mmr-deficiency-lynch-syndrome---r210), a
genomic test that can be requested on this pathway - see that section for the
full set of Genomics, Patient Care and Genetic Counseling examples (Diagnostic
Implication, Condition, FamilyMemberHistory, etc.) built around it.

For information on `Genomic Tests on the bowel cancer cells`, see [macmillan.org.uk](https://www.macmillan.org.uk/cancer-information-and-support/bowel-cancer/tests-on-the-bowel-cancer-cells) and [NICE DG27 Molecular testing strategies for Lynch syndrome in people with colorectal cancer](https://www.nice.org.uk/guidance/dg27)

<img style="padding:3px;width:90%;" src="ERIC.drawio.png" alt="Colorectal Cancer Diagnostics and Patient Referrals"/>
<br clear="all">
<p class="figureTitle">Colorectal Cancer Diagnostics and Patient Referrals</p> 
<br clear="all">

### NHS North West Children Cancer Example

<img style="padding:3px;width:95%;" src="OrderCommunicationAndNotifications.drawio.png" alt="Order Communication and Notifications"/>
<br clear="all">
<p class="figureTitle">Genomic Order Notifications - Use Case 4</p> 
<br clear="all">

#### As is Process

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

## Future Process

No distinct future-state changes are currently defined for these pathways.

## Data Models

- [Inherited MMR deficiency (Lynch syndrome) - R210](DiagnosticReport.html#inherited-mmr-deficiency-lynch-syndrome---r210) - Genomics, Patient Care and Genetic Counseling examples (Diagnostic Implication, Condition, FamilyMemberHistory)

## Examples

<div class="alert alert-info" role="alert">
<b>Example Scenario:</b> <a href="ExampleScenario-BiopsyProcedure.html">Collect Specimen - Biopsy Procedure</a>
</div>

[ExampleScenario-BiopsyProcedure](ExampleScenario-BiopsyProcedure.html) documents
the specimen collection process (day case admission, biopsy procedure) for a real
patient on this Colorectal Cancer pathway in the North Midlands - background
information on how the specimen behind a genomic test order is actually obtained,
not itself part of this genomic specification.
