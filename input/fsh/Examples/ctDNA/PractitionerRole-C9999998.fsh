Instance: 4446ab81-35ef-49cb-b2fe-1d6f1a0dcc02
InstanceOf: PractitionerRole
Title: "PractitionerRole C9999998 Example"
Description: "TODO"

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C9999998"
* practitioner.display = "Sheffield Lung Doctor"

* organization.identifier.system = $ods-code
* organization.identifier.value = "RHQ"

* specialty[+]
  * coding[+]
    * system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode"
    * code = #100
