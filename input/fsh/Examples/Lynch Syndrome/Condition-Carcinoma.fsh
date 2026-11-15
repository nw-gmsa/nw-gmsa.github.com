Instance: d6c19529-a64e-476b-b896-303abec26a79
InstanceOf: Condition
Title: "Condition - Bowel cancer"
Description: "Fictitious example: bowel (colon) cancer, evidenced by pathology diagnostic testing"

* identifier[+].value = "d6c19529-a64e-476b-b896-303abec26a79"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* recordedDate = "2023-08-21T09:00:00+00:00"

* category[+] = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item "Problem List Item"

* code
  * coding[+]
    * code = #363406005
    * display = "Malignant neoplasm of colon"
    * system = $sct


* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Ned LIVERPOOL"

* evidence[+]
  * detail[+].display = "Pathology Diagnostic Report"
