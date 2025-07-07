Instance: OBX-SupervisingClinician
InstanceOf: Observation
Title: "Supervising Clinician"
Description: "TODO"

* identifier[+].value = "298e99de-fd29-4802-bcf2-78f901b33a6e"

* status = #final

* effectiveDateTime = "2025-01-29T10:37:26+00:00"

* code
  * coding[+]
    * code = #unknown
    * display = "Name of Supervising Clinician"
    * system = $MFTEPIC

* valueString = "DESHPANDE, CHARULATA"

// EPIC-PV1
* encounter.reference = "urn:uuid:984b8a89-4194-4eb4-a7ea-ca8049ebeea3"

* performer[+].reference = "urn:uuid:ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8"

* subject.reference = "urn:uuid:d6faafcf-db64-4c11-9da8-25f36774c1bd"
* subject.display = "Octavia CHISLETT"
* subject.identifier
  * system = $nhs-number
  * value = "9449305552"


