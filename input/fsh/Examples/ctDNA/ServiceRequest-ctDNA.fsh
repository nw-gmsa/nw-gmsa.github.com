Instance: ServiceRequest-ctDNA
InstanceOf: ServiceRequest
Title: "ServiceRequest ctDNA Example"
Description: "TODO"

* meta.versionId = "1.0"

* identifier[OrderIdentifier].type = $v2-0203#FILL
* identifier[OrderIdentifier].value = "T26-59XG"
* identifier[OrderIdentifier].system = "https://fhir.nwgenomics.nhs.uk/Identifier/IGENE-TestIdentifier"
* identifier[OrderIdentifier].assigner.identifier.system = $ods-code
* identifier[OrderIdentifier].assigner.identifier.value = "699X0"

* requisition
  * identifier[OrderIdentifier].type = $v2-0203#PGN
  * identifier[OrderIdentifier].value = "R26-15AY"
  * identifier[OrderIdentifier].system = "https://fhir.nwgenomics.nhs.uk/Identifier/IGENE-ReferralIdentifier"
  * identifier[OrderIdentifier].assigner.identifier.system = $ods-code
  * identifier[OrderIdentifier].assigner.identifier.value = "699X0"

* status = #active
* intent = #order

* category[GenomicProcedure] = $sct#116148004 "Molecular genetics procedure"

//* authoredOn = "2025-09-29"

* code = $test-directory#M4.14

* requester
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "RHQ"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737873858"


* performer[+]
  * type = #Organization
  * identifier.system = $ods-code
  * identifier.value = "699X0"

* specimen[+].reference = "urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5"

* reasonCode[+]
  * coding[+]
    * code = #M4
    * system = $GCC
