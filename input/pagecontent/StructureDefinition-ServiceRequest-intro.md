<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

See [Genomic Test Order](StructureDefinition-GenomicTestOrder.html) for detailed notes.

### Performer

Which `performer` slice to use depends on whether the order leaves the requesting organisation.

| Order | Transaction | Crosses organisation? | `performer` | Example |
|---|---|---|---|---|
| Laboratory Order | [LAB-1](LTW.html#laboratory-order-lab-1) | Yes | `performer[organization]` - the Order Filler's ODS code | Trust to NW GLH (`699X0`) |
| Sub-order to another laboratory | [LAB-35](ILW.html#sub-orders-lab-35-and-lab-36) | Yes | `performer[organization]` - the Subcontractor's ODS code | NW GLH to another Genomic Laboratory Hub |
| Sub-order to another system in the same laboratory | [LAB-35](ILW.html#dlims-sub-order-omics-dss) | No | `performer[laboratoryInformationSystem]` - the receiving system as a [Laboratory Information System](StructureDefinition-LaboratoryInformationSystem.html) (`Device`) | iGene to DLIMS (OMICS DSS) |
| Work Order | [LAB-4](LTW.html#work-order-and-test-result-management-lab-4-and-lab-5) | No | `performer[laboratoryInformationSystem]` - the Automation Manager as a [Laboratory Information System](StructureDefinition-LaboratoryInformationSystem.html) (`Device`) | DLIMS to OmicsDSS |
{:.grid}

- **External orders (LAB-1, and LAB-35 to another organisation)**: `performer[organization]` SHALL be used. The ODS code identifies the receiving laboratory.
- **Internal orders (LAB-4, and LAB-35 within the same organisation)**: `performer[laboratoryInformationSystem]` SHALL be used, because the requester and performer share an ODS code and the code alone cannot say which system should act on the order. `performer[organization]` MAY also be populated, holding that same ODS code.

The `Device` performer lets the receiving system, or the RIE on its behalf, find its own orders:

```
GET [base]/ServiceRequest?performer:identifier=https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system|DLIMS&status=active
```

See the examples [OMICS DSS sub-order from iGene to DLIMS](ServiceRequest-ServiceRequest-ctDNA-DLIMS-SubOrder.html) (LAB-35) and [OMICS DSS work order from DLIMS to OmicsDSS](ServiceRequest-ServiceRequest-ctDNA-OmicsDSS-WorkOrder.html) (LAB-4).
