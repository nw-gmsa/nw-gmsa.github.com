Instance: CapabilityStatementRIE
InstanceOf: CapabilityStatement
Title: "CapabilityStatement for MFT Regional Integration Engine for Genomics"
Usage: #definition

* description = """
Is based on [FHIR Messaging](https://hl7.org/fhir/R4/messaging.html) to handle transformation of HL7 FHIR and v2 Messages to FHIR Workflow.
"""
* name = "CapabilityStatement-RIE"
* status = #draft
* experimental = false
* date = "2025-01-30"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * security
    * service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
    * description = "Recommend [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html)"

* rest.operation[+]
  * name = "$process-message"
  * definition = Canonical(ProcessMessage)

* messaging[0]
  * supportedMessage[+]
    * mode = #receiver
    * definition = Canonical(laboratory-order)
  * supportedMessage[+]
    * mode = #sender
    * definition = Canonical(unsolicited-observation)
  * supportedMessage[+]
    * mode = #sender
    * definition = Canonical(laboratory-order-acknowledgement)
