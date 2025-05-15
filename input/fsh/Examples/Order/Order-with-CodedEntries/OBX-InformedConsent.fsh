Instance: OBX-InformedConsent
InstanceOf: Observation
Title: "Informed Consent"
Description: "TODO"

* identifier[+].value = "0d472ee5-8c21-467a-aafe-29c89a42ed4e"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #762911000000102
    * display = "Informed consent given for treatment"
    * system = $sct
  * text = "Confirmation of Consent for Testing - MANDATORY Testing will not be performed without completed confirmation of consent"

* valueCodeableConcept = $loinc#LA33-6 "Yes"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


