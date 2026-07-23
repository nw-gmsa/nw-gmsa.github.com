Instance: Specimen-ctDNA
InstanceOf: Specimen
Title: "Specimen ctDNA Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[FillerSpecimenNumber]
  * value = "S26-1K1Q"
  * system = "https://fhir.nwgenomics.nhs.uk/iGene/SpecimenIdentifier"
  * type = $v2-0203#FILL
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* status = #available

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"

* collection.collectedDateTime = "2026-06-29"

* type
  * coding[+]
    * code = #119297000
    * display = "Blood specimen"
    * system = $sct

