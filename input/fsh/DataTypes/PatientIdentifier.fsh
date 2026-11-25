Profile:        PatientIdentifier
Parent:         CorrelationIdentifier
Id:             PatientIdentifier
Title:          "Patient Identifier"
Description:     """
A patient identifier assigned by a system that is not the patient's Medical Record Number, for example the iGene patient number assigned by NW GLH (`699X0`) (see [iGene Patient Identifier](NamingSystem-iGene-PatientIdentifier.html)).
"""

* type = $v2-0203#PI (exactly)

* assigner 1..1
* assigner ^short = "Assigning Organisation"
* assigner.identifier.system = $ods-code
* assigner.identifier.value ^example.valueString = "699X0"
* assigner.identifier.value ^example.label = "NHS North West Genomic Laboratory Hub"
