Instance: ee9b8fcc-c233-43e1-b7fb-b58ce4cf1db8
InstanceOf: PractitionerRole
Title: "PractitionerRole C3456789 Example"
Description: "TODO"

* practitioner.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* practitioner.identifier.value = "C3456789"
* practitioner.display = "Dr Samuel Darwin"

* organization.identifier.system = $ods-code
* organization.identifier.value = "R0A"

* specialty[+]
  * coding[+]
    * system = "https://fhir.hl7.org.uk/CodeSystem/UKCore-PracticeSettingCode"
    * code = #100
