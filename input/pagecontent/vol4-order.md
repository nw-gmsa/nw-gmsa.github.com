The intent is to follow the data model (FHIR profiles, valuesets and codesystems) contained in [NHS England FHIR Genomics Implementation Guide](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home) 

## Genomic Test Request Model


<figure>
{%include orders-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Request Model</p>
</figure>
<br clear="all">

This model is a summarisation of:

- [NHS England Genomics IG - How to construct Bundles](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Build/How-to-construct-Bundles)
- [NHS England Genomics IG - Clinical headings](https://simplifier.net/guide/fhir-genomics-implementation-guide/Home/Design/Clinicalheadings)

This also includes messaging concepts which are described in this guide to add compatibility with HL7 v2 and IHE LTW.
This additional has a very strong focus on the use of [Correlation Identifier (Enterprise Integration Patterns)](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CorrelationIdentifier.html) or [Rule 3: Reference Other Aggregates by Identity (Implementing Domain Driven Design)](https://www.archi-lab.io/infopages/ddd/aggregate-design-rules-vernon.html#rule-3-reference-other-aggregates-by-identity), which is also consistent with IHE/HL7 concepts of [Bounded Context (martinfowler.com)](https://martinfowler.com/bliki/BoundedContext.html) 

In practice this means, the following FHIR resources will have the following identifiers within the `IHE Laboratory Testing Workflow` domain:

- ServiceRequest
  - [Accession Number](StructureDefinition-accession-number.html)
  - [Order Placer Number](StructureDefinition-order-placer-number.html)
- Specimen
  - identifier
  - [Accession Number](StructureDefinition-accession-number.html)
- DiagnosticReport
  - identifier
  - [Accession Number](StructureDefinition-accession-number.html)
- Patient (not strictly within the domain but included for HL7/IHE/NHSE compatability reasons)
  - [NHS Number](StructureDefinition-nhs-number.html)
  - [Medical Record Number](StructureDefinition-medical-record-number.html)

This includes making use of FHIR Identifier `assigner.identifier.value` (HL7 v2 `Assigning Facility` in a variety of ID types) to distinguish these identifiers between different organisations, the recommendation is to use [ODS Code](https://www.datadictionary.nhs.uk/attributes/organisation_code.html), e.g.

```aiignore
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
            "code" : "ACSN"
          }
        ]
      },
      "value" : "1001166717",
      "assigner" : {
        "identifier" : {
          "system" : "https://fhir.nhs.uk/Id/ods-organization-code",
          "value" : "699X0"
        }
      }
    }
```

### References to other domains

Is present around Organisation, Practioner and PractitionerRole. NHS England has expressed a preference to use NHS England Identifiers, these are:

- Organization 
  - [ODS Code](StructureDefinition-organisation-code.html)
- Practitioner
  - [Practitioner Identifiers](StructureDefinition-EnglandPractitionerIdentifier.html)
- PractitionerRole
  - [ODS Code](StructureDefinition-organisation-code.html)
  - [Practitioner Identifiers](StructureDefinition-EnglandPractitionerIdentifier.html)

### Codes or Resources

This is for discussion, this applies to FHIR resources identified as not being entities (and the use of identifier is not mandatory). These include:

- Observation
- Condition

In FHIR the codes for these will be [CodeableConcept](https://hl7.org/fhir/R4/datatypes.html#CodeableConcept) (HL7 v2 CE Data Types). It is excepted NHS England will

- express a preference towards [SNOMED CT](https://digital.nhs.uk/services/terminology-and-classifications/snomed-ct)
- the use of FHIR Resources to represent these.

The use of FHIR resources for data which is currently HL7 v2 CE Data Type may need to be questioned. 
For example mapping of HL7 v2 `ORC-16` is to `ServiceRequest.requestCode` according to [ServiceRquest - HL7 v2 Mapping](https://digital.nhs.uk/services/terminology-and-classifications/snomed-ct), this is a v2 CE to FHIR CodeableConcept conversion. 
Curently this is stated as an implied `ServiceRequest.requestReference` mapping (ISSUE link: [NHS England Developer Community Genomics Order Management Service - FHIR ServiceRequest reason](https://developer.community.nhs.uk/t/genomics-order-management-service-fhir-servicerequest-reason/4396))

