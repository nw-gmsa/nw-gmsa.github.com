ValueSet: ServiceRequestIntent
Id: ServiceRequestIntent
Title: "ServiceRequest Intent"
Description: """
The ServiceRequest intents used by this guide:
- `order` / `original-order` - LAB-1 order from the Order Placer
- `reflex-order` - an order added by the laboratory as a consequence of a result (e.g. genomic reflex from pathology)
- `filler-order` - LAB-35 sub-order to a Subcontractor
- `instance-order` - LAB-4 work order to an Automation Manager
"""
* ^experimental = false

* http://hl7.org/fhir/request-intent#order "Order"
* http://hl7.org/fhir/request-intent#original-order "Original Order"
* http://hl7.org/fhir/request-intent#reflex-order "Reflex Order"
* http://hl7.org/fhir/request-intent#filler-order "Filler Order"
* http://hl7.org/fhir/request-intent#instance-order "Instance Order"
