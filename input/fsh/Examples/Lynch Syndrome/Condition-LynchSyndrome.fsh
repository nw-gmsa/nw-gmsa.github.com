// The Lynch syndrome Condition on Ned Liverpool's problem list, in two versions: suspected (provisional) when the
// consultant requests genomic diagnostic testing, then confirmed when the Laboratory Report finds a pathogenic variant.

Instance: Condition-LynchSyndrome-Provisional
InstanceOf: Condition
Title: "Condition - Lynch Syndrome (suspected)"
Description: "Fictitious example: version 1 of the Lynch syndrome Condition. The consultant suspects Lynch syndrome after bowel cancer, as tumour immunohistochemistry shows loss of MLH1 and PMS2, and records it as provisional before requesting genomic diagnostic testing."
Usage: #example

* meta.versionId = "1"
* identifier[+].value = "c8f82825-e4cb-4e1f-b728-3fd2808e93db"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional

* recordedDate = "2023-09-05T09:30:00+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"

* code
  * coding[+]
    * code = #716318002
    * display = "Lynch syndrome"
    * system = $sct

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"

* evidence[+]
  * detail[+] = Reference(DocumentReference-LynchSyndrome-PathologyReport)
  * detail[=].display = "Cellular pathology report - tumour MMR immunohistochemistry"

Instance: c8f82825-e4cb-4e1f-b728-3fd2808e93db
InstanceOf: Condition
Title: "Condition - Lynch Syndrome (confirmed)"
Description: "Fictitious example: version 2 of the Lynch syndrome Condition. The Laboratory Report finds a heterozygous pathogenic germline MLH1 variant, so the consultant updates the Condition to confirmed, evidenced by the genomic diagnostic implication."
Usage: #example

* meta.versionId = "2"
* identifier[+].value = "c8f82825-e4cb-4e1f-b728-3fd2808e93db"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* recordedDate = "2023-09-05T09:30:00+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"

* code
  * coding[+]
    * code = #716318002
    * display = "Lynch syndrome"
    * system = $sct

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"

* evidence[+]
  * detail[+] = Reference(6beb613f-d303-42af-b025-86e8e0872061)
