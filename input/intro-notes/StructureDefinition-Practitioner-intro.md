
## Practitioner (Resource) or Reference by Practitioner Identity

In message paradigms, especially HL7 v2 `laboratory order (OML_O21/ORM_O01)` and `unsolicitied observations (ORU_R01)` it was common to use the XCN (Extended Composite Id Number And Name For Persons. The FHIR equivalent to this datatype is FHIR [Reference](https://hl7.org/fhir/R4/references.html)

For example:

**HL7 v2 XCN**

```
C3456789^Darwin^Samuel^^^Dr^^^GMC
```

**HL7 FHIR Reference**

```json
{
    "reference" : "Practitioner/1234"
    "type" : "Practitioner",
    "identifier" : {
      "system" : "https://fhir.hl7.org.uk/Id/gmc-number",
      "value" : "C3456789"
    },
    "display" : "Dr Darwin, Samuel"
}
```

FHIR Reference introduces a `reference` to a detailed version of Practitioner which includes fields such as telecom and gender. 

It is not clear in Enterprise/Regional use of FHIR which approach *Resource* or *Reference* should be taken, both HL7 v2 and FHIR support `Reference aggregate or entities by identity` from Dommain Driven Design (DDD) and this appears to also be followed by IHE XDS and DICOM.
In addition, [NHS England Data Dictionary](https://www.datadictionary.nhs.uk/) and *NHS England HL7 v2 ADT Message Specification* favour *Reference*
NHS England FHIR STU3/R4 specifications around Messaging, tend to favour *Resource*.
