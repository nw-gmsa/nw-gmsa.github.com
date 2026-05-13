Profile:        LaboratoryAnalyteResult
Parent:         MolecularBiomarker
Id:             LaboratoryAnalyteResult
Title:          "Laboratory Analyte Result (Observation)"
Description:    """
`Diagnostic - Genomics Result`
"""

//https://github.com/HL7/genomics-reporting/blob/master/input/fsh/CGFindings.fsh

* ^keyword[+] = #archetype "Domain Analysis Model"
* ^keyword[+] = #genomics "Genomics"
* ^keyword[+] = #diagnostics "Diagnostics"




* value[x] only Quantity

* component.value[x] only Quantity