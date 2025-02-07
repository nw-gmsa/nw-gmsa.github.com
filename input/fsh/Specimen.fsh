Profile:        Specimen
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Specimen
Id:             Specimen
Title:          "Specimen"
Description:    """
DRAFT Extension of UKCore-Specimen which includes constraints from:
- [NHS England Genomics Specimen](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-Specimen) use text descriptions only, not the rendered profile.
"""

* identifier 1..* MS
* identifier.assigner 1..1 MS
* identifier.assigner.identifier 1..1 MS
* identifier.assigner.identifier.value 1..1 MS
* identifier.assigner.identifier.system 1..1 MS
* identifier.assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"

* accessionIdentifier 0..1 MS
* accessionIdentifier.assigner 1..1 MS
* accessionIdentifier.assigner.identifier 1..1 MS
* accessionIdentifier.assigner.identifier.value 1..1 MS
* accessionIdentifier.assigner.identifier.system 1..1 MS
* accessionIdentifier.assigner.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* accessionIdentifier ^short = "Identifier assigned by the lab, HL7 v2 ORC-3 Order Filler Number"

* subject 1..1 MS
* subject only Reference(Patient)
