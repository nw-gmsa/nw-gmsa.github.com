Instance: CapabilityStatementRIE
InstanceOf: CapabilityStatement
Title: "CapabilityStatement for NW GMSA Regional Integration Engine for Genomics"
Usage: #definition

* description = """
Is based on [FHIR Messaging](https://hl7.org/fhir/R4/messaging.html) to handle transformation of HL7 FHIR and v2 Messages to FHIR Workflow.

The `OpenAPISwagger Definition file` below, can be viewed using [Swagger Editor](https://editor.swagger.io/)
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

* insert ResourceWithExpectation(#Bundle, Bundle, #SHALL)
* rest.resource[=]
  * documentation = """
  ## Search (Poll for Messages)

  The Order Placer (or TIE) will [poll](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PollingConsumer.html) for new messages using a FHIR RESTful query.

  ```
  GET [base]/Bundle?message.receiver:identifier=[odsCode]&_lastUpdated=[date]
  ```

  ### Example

  ```
  GET [base]/Bundle?message.receiver:identifier=R0A&_lastUpdated=gt2025-02-01
  ```

  Example returned search results [Bundle 'SearchSet' - Genomics Order](Bundle-GenomicsOrderSearchSet.html)

  ## Update (Acknowledge Message)

  This is used to acknowledge the message and is the original message sent back to the server with the source and destination reversed.

  ```
  PUT [base]/Bundle?identifier=[identifier]
  ```

  ### Example

  ```
  PUT [base]/Bundle?identifier=9612365d-52a4-4fab-87e7-8a09d753f095
  ```

  The acknowledgement may be sent via a [FHIR Transaction](https://hl7.org/fhir/R4/http.html#transaction)

  ```
    POST [base]/
  ```


  """
  * conditionalUpdate = true

* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert InteractionWithExpectation(#create, #SHALL)
* insert SearchParamWithExpectation(message.receiver:identifier, #token, #SHALL)
* insert WithSearchParamDocumentation(The ODS code of the message recipient)
* insert SearchParamWithExpectation(_lastUpdated, #date, #SHALL)
* insert WithSearchParamDocumentation(The data the message was last updated)

* insert ResourceWithExpectation(#Patient, Patient, #SHALL)
* rest.resource[=]
  * documentation = """
## Update

  This is used to update the `laboratory order`. See also [IHE PIXm - Patient Identity Feed FHIR [ITI-104]](https://profiles.ihe.net/ITI/PIXm/ITI-104.html)
  The IHE PIX/[NHS England HL7 ADT](https://drive.google.com/drive/folders/1FRkyZvWpZB1nCKbvQbo-eW_q9VtlR3Ws) equivalent is ADT_A31 and ADT_A40.

  ```
  PUT [base]/Patient?identifier=[identifier]
  ```
"""
  * conditionalUpdate = true
* insert InteractionWithExpectation(#update, #SHALL)

* insert ResourceWithExpectation(#PractitionerRole, PractitionerRole, #SHALL)
* rest.resource[=]
  * documentation = """
## Update

  This is used to update the `laboratory order`. The HL7 equivalent is [MFN_M02 - Master files notification - Staff/practitioner master file](https://hl7-definition.caristix.com/v2/HL7v2.5.1/TriggerEvents/MFN_M02)

  ```
  PUT [base]/PractitionerRole?identifier=[identifier]
  ```
"""
  * conditionalUpdate = true
* insert InteractionWithExpectation(#update, #SHALL)


* rest[=].interaction[+]
  * code = #transaction

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
