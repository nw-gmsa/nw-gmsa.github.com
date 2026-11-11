Instance: Observation-LynchSyndrome-MMR-IHC
InstanceOf: Observation
Title: "Observation - Mismatch Repair Immunohistochemistry (Histopathology)"
Description: "Fictitious example: tumour mismatch repair (MMR) protein immunohistochemistry reported by Histopathology, restated in the genomic report as a result from another laboratory"
Usage: #inline

* identifier[+].value = "9541381a-ba5f-4e4c-a748-507fd7f701f7"
* status = #final
* category[+] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"
* code.text = "Mismatch repair protein immunohistochemistry (tumour)"
* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"
* effectiveDateTime = "2023-08-21T09:00:00+00:00"
* performer[+]
  * identifier.system = $ods-code
  * identifier.value = "R0A"
  * display = "Histopathology, MANCHESTER UNIVERSITY NHS FOUNDATION TRUST"
* valueString = "Loss of MLH1 and PMS2 expression; MSH2 and MSH6 retained. No MLH1 promoter hypermethylation."
