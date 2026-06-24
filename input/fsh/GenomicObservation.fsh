Profile:        GenomicObservation
Parent:         Observation
Id:             GenomicObservation
Title:          "Genomic Observation"
Description:    """
`Diagnostic - Genomic Reporting`
"""

* code ^short = "Indicates archetype/FHIR Profile"

* component 1..*
//* component.value[x] only CodeableConcept or Quantity or string
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"
* component contains conclusion-string 0..1
* component[conclusion-string] ^short = "Clinical Conclusion"
* component[conclusion-string] ^definition = "Concise and clinically contextualized summary conclusion (interpretation/impression) of the observation"
* component[conclusion-string] ^requirements = "Need to be able to provide a conclusion that is not lost among the basic result data."
* component[conclusion-string] ^comment = "An example would be the interpretative information, typically canned, about a variant identified in the patient."
* component[conclusion-string].code = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/tbd-codes-cs#conclusion-string
* component[conclusion-string].code ^short = "conclusion-string"
//* component[conclusion-string].value[x] only string or Quantity
//* component[conclusion-string].value[x] ^short = "Summary conclusion (interpretation/impression)"
