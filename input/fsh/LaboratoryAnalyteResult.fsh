Profile:        LaboratoryAnalyteResult
Parent:         http://hl7.org/fhir/StructureDefinition/Observation
Id:             LaboratoryAnalyteResult
Title:          "Laboratory Analyte Result (Observation)"
Description:    """
`Diagnostic - Laboratory`
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGFindings.fsh

//* ^keyword[+] = #archetype "Domain Analysis Model"
//* ^keyword[+] = #genomics "Genomics"
//* ^keyword[+] = #diagnostics "Diagnostics"

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category code pattern"
* category ^slicing.ordered = false

* category contains labCategory 0..1
                and geCategory 0..1
* category[labCategory].coding 1..1
* category[labCategory].coding = $OBSCAT#laboratory
* category[geCategory].coding 1..1
* category[geCategory].coding = $DIAGNOSTICSERVICE#GE

* hasMember 0..0

//* value[x] only Quantity
//* component.value[x] only CodeableConcept or Quantity or string
