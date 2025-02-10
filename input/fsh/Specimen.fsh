Profile:        Specimen
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Specimen
Id:             Specimen
Title:          "Specimen"
Description:    """
DRAFT Extension of UKCore-Specimen which includes constraints from:
- [NHS England Genomics Specimen](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-Specimen) use text descriptions only, not the rendered profile.
"""
Usage: #definition

* identifier 1..* MS
* identifier only CorrelationIdentifier

* accessionIdentifier 0..1 MS
* accessionIdentifier only AccessionNumber

* subject 1..1 MS
* subject only Reference(Patient)
