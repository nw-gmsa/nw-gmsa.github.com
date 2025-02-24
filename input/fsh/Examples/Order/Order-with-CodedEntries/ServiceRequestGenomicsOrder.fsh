Instance: ServiceRequestGenomicsOrderCodedEntries
InstanceOf: ServiceRequest
Title: "ServiceRequest Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[placerOrderNumber].type = $v2-0203#PLAC
* identifier[placerOrderNumber].value = "1601737"
* identifier[placerOrderNumber].system = "https://fhir.mft.nhs.uk/Id/PlacerOrderNumber/Hive"
* identifier[placerOrderNumber].assigner.identifier.system = $ods-code
* identifier[placerOrderNumber].assigner.identifier.value = "R0A"

* identifier[accessionNumber].type = $v2-0203#ACSN
* identifier[accessionNumber].value = "1001166717"
* identifier[accessionNumber].system = "https://fhir.mft.nhs.uk/Id/AccessionNumber"
* identifier[accessionNumber].assigner.identifier.system = $ods-code
* identifier[accessionNumber].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"
* category[genomicsWholeCaseSequencing] = https://fhir.hl7.org.uk/CodeSystem/UKCore-GenomeSequencingCategory#cancer-wgs

* authoredOn = "2025-01-29"

* code = $test-directory#R240.1

* requester.reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"

* supportingInfo[+].reference = "urn:uuid:27ca6057-e481-426a-ba8a-2acfffc0c1c4"

* specimen[+].reference = "urn:uuid:89e66518-9197-4553-9253-5ab5133b62c0"

* reasonCode[+]
  * coding[+]
    * code = #363349007
    * display = "Malignant tumour of stomach"
    * system = $sct
