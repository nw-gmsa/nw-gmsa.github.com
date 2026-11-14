Instance: iGene
InstanceOf: Endpoint
Title: "Endpoint iGene"
Description: "Example endpoint for iGene, the North West GLH Laboratory Information Management System (LIMS), receiving HL7 v2 over MLLP. The address is a placeholder."
Usage: #example

* status = http://hl7.org/fhir/endpoint-status#active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#hl7v2-mllp
* payloadType[+] = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#any
* address = "htttps://example.acme.org"
