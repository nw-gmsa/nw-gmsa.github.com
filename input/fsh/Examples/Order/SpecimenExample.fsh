Instance: SpecimenExample
InstanceOf: Specimen
Title: "Specimen Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[+].
  * value = "25GEN-029GN00001"
  * system = "http://www.acme.org/specimen/Beaker"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "R0A"

* accessionIdentifier.type = $v2-0203#ACSN
* accessionIdentifier.value = "1001166717"
* accessionIdentifier.system = "http://www.example.org/specimen/accession"
* accessionIdentifier.assigner.identifier.system = $ods-code
* accessionIdentifier.assigner.identifier.value = "690S0"

* status = #available

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* collection.collectedDateTime = "2025-01-29T10:37:26+00:00"

* type
  * coding[+]
    * code = #258580003
    * display = "Whole blood specimen"
    * system = $sct

