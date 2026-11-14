// Order for the Whole Genome Sequencing FHIR Document example. The order is the existing
// dWGS Trio message from NE&Y GLH (Bundle-dWGS-Trio-r26000000203-p26000000104, OML^O21 as a FHIR Message);
// its ServiceRequest, Specimen and requester are restated here for the report document, with the same fullUrls.

Instance: PractitionerRole-Requester-NEYGLH
InstanceOf: PractitionerRole
Title: "PractitionerRole - NE&Y GLH duty scientist (dWGS Trio order)"
Description: "Requester of the dWGS Trio order r26000000203, as in the dWGS Trio order message"
Usage: #example

* practitioner.display = "Duty Scientist on behalf of NEYGLH Medical"

* organization.identifier.system = $ods-code
* organization.identifier.value = "699N0"
* organization.display = "Northern Genetics Service, Newcastle (NE&Y Genomics)"


Instance: ServiceRequest-WGS
InstanceOf: ServiceRequest
Title: "ServiceRequest - R27.3 Paediatric disorders (WGS), dWGS Trio r26000000203"
Description: "The proband's filler order from the dWGS Trio order message (NGIS referral r26000000203)"
Usage: #example

* identifier[OrderPlacerNumber].type = $v2-0203#PLAC
* identifier[OrderPlacerNumber].value = "4000000004"
* identifier[OrderPlacerNumber].assigner.identifier.system = $ods-code
* identifier[OrderPlacerNumber].assigner.identifier.value = "699N0"

* requisition
  * type = $v2-0203#PGN
  * system = "https://genomicsengland.co.uk/healthcare/referral-id"
  * value = "r26000000203"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "8J834"

* status = #active
* intent = #filler-order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

* code = $test-directory#R27.3

* requester
  * type = #PractitionerRole
  * reference = "urn:uuid:d8573b87-4984-48e4-87f5-599509c0a5bc"
  * identifier.system = $ods-code
  * identifier.value = "699N0"

* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"

* specimen[+].reference = "urn:uuid:ace6ede5-177c-4560-a407-02e27a6545bc"

* reasonCode[+] = $GCC#R27 "Paediatric disorders"

* note[+].text = "Patient has intellectual disability"


Instance: Specimen-WGS
InstanceOf: Specimen
Title: "Specimen - whole blood (EDTA) S26-1A04, dWGS Trio r26000000203"
Description: "The proband's sample from the dWGS Trio order message"
Usage: #example

* identifier[PlacerSpecimenNumber]
  * value = "S26-1A04"
  * type = $v2-0203#PLAC
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "RNN"
* identifier[FillerSpecimenNumber]
  * value = "D26-1B04"
  * type = $v2-0203#FILL
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699N0"
* accessionIdentifier
  * system = "https://genomicsengland.co.uk/healthcare/primary-sample-id"
  * value = "S26-1A04"
  * type = $v2-0203#ACSN
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699N0"
* container[0].extension[device].valueReference.type = "Device"
* container[0].extension[device].valueReference.display = "DNA tube (FluidX 2D barcode)"
* container[0].identifier[0].system = "https://genomicsengland.co.uk/healthcare/lab-sample-id"
* container[0].identifier[0].value = "4000000004"
* container[0].identifier[0].type = $nwgmsa#ZCID

* status = #available

* subject.reference = "urn:uuid:eaf97963-82df-4623-9bab-ab9476b295d7"
* subject.display = "Gilly BROUGH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383362"

* type = $sct#258580003 "Whole blood specimen"
* type.text = "blood_unsorted_edta"
* collection.collectedDateTime = "2026-08-18T00:00:00+00:00"
* receivedTime = "2026-08-20T00:00:00+00:00"
