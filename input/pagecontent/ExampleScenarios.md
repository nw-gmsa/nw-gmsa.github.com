The example scenarios are worked examples of genomic testing pathways, from the order to the report and, where it applies, the
referral of the family to clinical genetics. Each scenario lists its actors, the messages and documents exchanged, and the
example resources for each step, so the scenarios can also be used for **end-to-end testing**: the example messages are the
test data for each step.

### Scope

The scenarios cover **genomic diagnostic testing**: the genomic test order (HL7 FHIR Message O21), the Laboratory Report
(R01) with its results and the report PDF, the FHIR Document sent to a central repository, and the referral of the family
to clinical genetics (O19). Other testing is mentioned where it is part of the pathway but is not modelled, for example
tests on the cancer cells done by histopathology (immunohistochemistry, microsatellite instability, hormone receptors and
HER2). A copy of the pathology report is sent with the order instead. Clinical decisions, such as the choice of treatment,
are not covered.

The plain-English descriptions of the cancer pathways follow [Macmillan Cancer Support](https://www.macmillan.org.uk/),
for example **diagnostic testing** (testing the person who has had cancer) and **predictive testing** (testing relatives
for the same variant).

### Cancer

| Scenario | What happens | Genomic test | Messages and documents |
|----------|--------------|--------------|------------------------|
| [Lynch Syndrome](ExampleScenario-LynchSyndrome.html) | Bowel cancer, and tests on the cancer cells suggest an inherited cause. A blood test finds a pathogenic MLH1 variant, and the family is referred for predictive testing | R210.2 Inherited MMR deficiency (Lynch syndrome) | O21 order with the pathology report, R01 report, FHIR Document, O19 referral |
| [Suspected Lynch Syndrome - Clinical Workflow](ExampleScenario-ClinicalAndGenomicWorkflow.html) | The consultant's view of Lynch Syndrome: the Condition is recorded as suspected, the tests are requested, and the Condition is updated to confirmed when the test is positive | R210.2 | The Lynch Syndrome messages, and the Condition before and after |
| [Inherited Breast Cancer (BRCA)](ExampleScenario-BreastCancer.html) | Triple-negative breast cancer at a young age. A blood test finds a pathogenic BRCA1 variant, and the family is referred so her sister can have predictive testing | R208.1 Inherited breast cancer and ovarian cancer | O21 order with the pathology report, R01 report, FHIR Document, O19 referral |
| [Lung Cancer - Liquid Biopsy (ctDNA)](ExampleScenario-ctDNA.html) | A blood test (liquid biopsy) looks for gene changes in DNA from lung cancer cells, to help choose targeted treatment | M4.14 Non-small cell lung cancer, multi-target ctDNA panel | O21 order, work order (LAB-4), test results (LAB-5), R01 report, FHIR Document |
{:.grid}

### Rare and inherited disease, pregnancy and medicines

| Scenario | What happens | Genomic test | Messages and documents |
|----------|--------------|--------------|------------------------|
| [Rapid Genetic Testing in Pregnancy](ExampleScenario-RapidPrenatalExomeSequencing.html) | A scan finds a fetal anomaly. The home GLH does first-line tests and sends a sub-order to a national testing GLH, and the family is referred to clinical genetics | R21 Fetal anomalies with a likely genetic cause | O21 order, sub-order (LAB-35) via GOMS, order status (O51), sub-order report (LAB-36), R01 report, O19 referral |
| [Hearing Loss Test for Another Region](ExampleScenario-SpecialistTestForAnotherGLH.html) | Another region's GLH sends the North West GLH a sub-order for a specialist test it provides nationally | R67.1 Monogenic hearing loss | O21 order, sub-order (LAB-35) via GOMS, order status (O51), sub-order report (LAB-36), R01 report |
| [Whole Genome Sequencing for a Rare Condition](ExampleScenario-WholeGenomeSequencing.html) | A child's referral is registered with Genomics England. Each family member is sequenced, and the requesting laboratory reports on the family | R27.3 Paediatric disorders | O19 family referral, sub-orders (LAB-35), R01 report |
| [Gene Test Before Starting a Medicine](ExampleScenario-Pharmacogenomics.html) | A gene test before starting mavacamten shows how the patient processes the medicine | R454.1 CYP2C19 genotyping | O21 order, R01 report, FHIR Document |
{:.grid}

### Background

These describe the processes the scenarios above build on.

- [Genomic Test Order Process](ExampleScenario-GenomicTestOrderProcess.html) - order entry and transmission of the order
- [Genomic Test Report Process](ExampleScenario-GenomicTestReportProcess.html) - reporting
- [Collect Specimen - Biopsy Procedure](ExampleScenario-BiopsyProcedure.html) - specimen collection, not part of this specification

### How the examples are built

The example messages follow the same rules in every scenario:

- **One ServiceRequest per message.** Later order messages (sub-orders) and report messages do not carry the original
  order. They identify it by its identifier in `basedOn` (the Order Placer Number, or the NGIS referral id for whole genome
  sequencing).
- **Laboratory Orders and Reports are for one patient.** Specimens and Patients for other family members are not
  included. Relatives appear only in the family referral.
- **The family is the subject of an O19 referral**, as a [Family Genetic Group](StructureDefinition-FamilyGeneticGroup.html)
  whose members are Patients. The referral references the testing done as the Genomic Report document on the central
  registry (a `DocumentReference`). See [Genetic Referrals](GeneticReferrals.html).
- **Laboratory Reports carry their results** as `Observation`s ([Variant](StructureDefinition-Variant.html),
  [Diagnostic Implication](StructureDefinition-DiagnosticImplication.html) and the other genomic result profiles), and the
  report as a PDF (`DiagnosticReport.presentedForm` and a `DocumentReference`).
- **A FHIR Document includes every `Observation`** from the scenario's R01 test results and Laboratory Report messages.
