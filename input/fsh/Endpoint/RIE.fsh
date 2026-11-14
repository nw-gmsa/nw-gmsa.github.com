Instance: RIE
InstanceOf: Endpoint
Title: "Endpoint RIE"
Description: "Example endpoint for the North West Regional Integration Engine (RIE), receiving FHIR Messages. The address is a placeholder."
Usage: #example

* status = http://hl7.org/fhir/endpoint-status#active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7-fhir-msg
* payloadType[+] = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any
* address = "htttps://example.acme.org"
