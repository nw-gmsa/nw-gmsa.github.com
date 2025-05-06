Profile:        Specimen
//Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Specimen
Parent:         http://hl7.eu/fhir/laboratory/StructureDefinition/Specimen-eu-lab
Id:             Specimen
Title:          "Specimen"
Description:    """
DRAFT Extension of UKCore-Specimen which includes constraints from:
- [NHS England Genomics Specimen](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/FHIRAssets/Profiles/All-Profiles/UKCore-Specimen) use text descriptions only, not the rendered profile.

See also [HL7 Europe Laboratory Report - Specimen: Laboratory](https://build.fhir.org/ig/hl7-eu/laboratory/StructureDefinition-Specimen-eu-lab.html)
"""

* identifier 1..* MS
* identifier only CorrelationIdentifier

* accessionIdentifier 0..1 MS
* accessionIdentifier only AccessionNumber

* subject 1..1 MS
* subject only Reference(Patient)

* collection.collected[x] only dateTime
* collection.collectedDateTime 0..1 MS

* type from SpecimenType (required)

* collection.collector 0..1 MS
* collection.collector only Reference(PractitionerRole)

* collection.bodySite MS

* collection.quantity MS
