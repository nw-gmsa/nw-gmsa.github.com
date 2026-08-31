<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

Worked-example Jupyter notebooks from
[nw-gmsa/Testing](https://github.com/nw-gmsa/Testing/tree/main/notebooks) - each
builds a piece of this IG's FHIR/HL7 v2 conversion by hand, in Python, against real
example data. They form a series (`01` onward assumes the reader has read the earlier
ones), and most relate directly to one or more of this IG's [Use Cases](index.html#use-cases).

| Notebook | What it covers | Related Use Case(s) |
|---|---|---|
| [01 - FHIR Search Basics](https://github.com/nw-gmsa/Testing/blob/main/notebooks/01-fhir-search-basics.ipynb) | How this app talks to the FHIR R4 server with plain `GET` searches - foundational reading for the rest of the series, not tied to a specific use case. | - |
| [02 - Work Orders: A Worked Example](https://github.com/nw-gmsa/Testing/blob/main/notebooks/02-work-orders-worked-example.ipynb) | Finding a laboratory's current work orders (`Task`-based filtering) for Liverpool GLH (ODS `K1S6S`), one of the regional LIMS the RIE integrates. | [Regional Orders and Reports](overview.html), [StarLIMS / iGene Integration](starLIMS.html), [OMICS DSS Result Integration](reportable-variants.html) |
| [03 - Orders: Building a FHIR Order Message from a CSV](https://github.com/nw-gmsa/Testing/blob/main/notebooks/03-laboratory-order-from-csv.ipynb) | Builds a laboratory-order `Bundle` from a row of `Input/NEYctDNA.csv`, following the `laboratory-order` `MessageDefinition`. | [NE&Y Management Information (ctDNA)](overview.html#technical-detail) |
| [04 - Reports: HL7 v2 `ORU^R01` into FHIR](https://github.com/nw-gmsa/Testing/blob/main/notebooks/04-laboratory-report-fhir-from-hl7v2.ipynb) | Converts a lab's own HL7 v2 report into a FHIR `R01` Message, and on to the `MDM_T02` document feed sent to shared care record providers. | [Regional Orders and Reports](overview.html), [Greater Manchester Care Record (GMCR)](overview.html#shared-care-record-feeds---wire-tap-on-lab-3oru_r01) |
| [05 - Test Results: GA4GH VCF to FHIR Genomics Reporting](https://github.com/nw-gmsa/Testing/blob/main/notebooks/05-test-results-from-vcf.ipynb) | Converts a GA4GH VCF file into discrete `variant` Observations conforming to the HL7 Genomics Reporting IG, plus an NW-GMSA `R01` Test Results message. | [OMICS DSS Result Integration](reportable-variants.html) |
| [06 - EU Laboratory Report: FHIR Messages to a FHIR Document](https://github.com/nw-gmsa/Testing/blob/main/notebooks/06-eu-laboratory-report-fhir-document.ipynb) | Builds a FHIR Document (`Composition`-led `Bundle`) from the same ctDNA source data as 04/05 - the shape NHS England's Unified Genomic Record (UGR) Phase 2 expects. | [ctDNA NHS England Unified Genomic Record Phase 1](overview.html#shared-care-record-feeds---wire-tap-on-lab-3oru_r01), [NE&Y Management Information (ctDNA)](overview.html#technical-detail) |
| [07 - FHIR Repository: RESTful Events and Aggregates](https://github.com/nw-gmsa/Testing/blob/main/notebooks/07-fhir-repository-events-and-aggregates.ipynb) | RESTful `GET`/`batch`/`transaction` access against the FHIR Repository the RIE populates via wire-tap, versus the Messaging `$process-message` interactions notebooks 03-06 use. | [Regional Orders and Reports](overview.html#fhir-repository) |
| [08 - Subcontracted Laboratory Order from an External GLH](https://github.com/nw-gmsa/Testing/blob/main/notebooks/08-subcontracted-laboratory-order-from-external-glh.ipynb) | Builds a `LAB-35` sub-order manifest and Bundle for a distributed WGS referral from an external Requesting Genomic Laboratory - the source of this IG's dWGS examples. | [Distributed WGS (dWGS)](dWGS.html) |
| [09 - LIMS Integration with the Genomic Order Management Service](https://github.com/nw-gmsa/Testing/blob/main/notebooks/09-genomic-order-management-fhir-to-hl7v2-for-lims.ipynb) | Converts a FHIR order from NHS England's Genomic Order Management Service (GOMS) API into the HL7 v2 this region's LIMS expects. | [Regional Orders and Reports](overview.html), [NHS England Genomic Order Management Service (GOMS)](GenomicOrderManagementService.html) |
{:.grid}
