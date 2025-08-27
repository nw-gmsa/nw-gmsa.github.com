Profile:        Condition
Parent:         https://fhir.hl7.org.uk/StructureDefinition/UKCore-Condition
Id:             Condition
Title:          "Condition"
Description:    """
**HL7 v2** [DG1](hl7v2.html#dg1) *mapping* [DG1 to Condition](https://build.fhir.org/ig/HL7/v2-to-fhir/ConceptMap-segment-dg1-to-condition.html)

Reference:
- HL7 DG1 segment definitions from [NHS England HL7 v2 ADT Message Specification](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws)
"""

* identifier 1..* MS

* subject 1..1 MS
* subject only Reference(Patient)
* subject.identifier only NHSNumber
