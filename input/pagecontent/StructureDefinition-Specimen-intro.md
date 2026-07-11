<div class="alert alert-info" role="alert">
<b>HL7 v2 Segment:</b> <a href="hl7v2.html#spm" _target="_blank">SPM</a>
</div>

## Reference

- [NHS England Genomics Specimen](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-Specimen) use text descriptions only, not the rendered profile.
- [HL7 Europe Laboratory Report - Specimen: Laboratory](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Specimen-eu-lab.html)
- [The_Management_of_Pathology_using_GS1_Standards - UK](https://www.gs1uk.org/sites/default/files/The_Management_of_Pathology_using_GS1_Standards.pdf)
  - Specimen.identifier
    - GS1 [Global Individual Asset Identifier (GIAI)](https://www.gs1.org/standards/id-keys/global-individual-asset-identifier-giai) urn:oid:2.51.1.5
  - Shipment Tracking Number
    - GS1 [Serial Shipping Container Code (SSCC)](https://www.gs1.org/standards/id-keys/sscc) urn:oid:2.51.1.2

Related: 

- [Optimal Blood Use - EU](http://www.optimalblooduse.eu/content/62-blood-component-label) This is more comprehensive than a sample for laboratory testing.

## Domain Archetype

| Name                      | LOINC   | Value Set / Data Type                                                         | Cardinality | HL7 v2 OML_O21 Message   | HL7 FHIR ServiceRequest | HL7 FHIR [Specimen](StructureDefinition-Specimen.html)                           |
|---------------------------|---------|-------------------------------------------------------------------------------|-------------|--------------------------|-------------------------|----------------------------------------------------------------------------------|
| Specimen ID               | 80398-1 |                                                                               | 0..*        | [SPM](hl7v2.html#spm)-2  | specimen                | Specimen.identifier[PlacerSpecimenNumber]                                        |
| Specimen Type             |         | [Specimen Type](ValueSet-specimen-type.html)                                  | 1..1        | [SPM](hl7v2.html#spm)-4  |                         | Specimen.type                               |
| Specimen Source Site      |         | [Specimen Body Site](ValueSet-specimen-bodysite.html)                         | 0..1        | [SPM](hl7v2.html#spm)-8  |                         | Specimen.collection.bodySite                |
| Specimen Accession Number | 80398-1 | [Specimen Accession Number](StructureDefinition-SpecimenAccessionNumber.html) | 0..*        | [SPM](hl7v2.html#spm)-30 |                         | Specimen.accessionIdentifier                |
| Shipment Tracking Number  | 97209-1 | [Shipment Tracking Number](StructureDefinition-ShipmentTrackingNumber.html)   | 0..*        | [SPM](hl7v2.html#spm)-32 |                         | Specimen.identifier[ShipmentTrackingNumber] | 
| Specimen Collection Date  |         |    | 0..1        | [SPM](hl7v2.html#spm)-17 |                         | Specimen.collection.collectedDateTime       |
| Specimen Received Date    |         |         | 0..1        | [SPM](hl7v2.html#spm)-18 |                         | Specimen.receivedTime                       |
{:.grid}



