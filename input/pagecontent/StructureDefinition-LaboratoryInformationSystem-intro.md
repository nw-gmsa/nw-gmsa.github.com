<div class="alert alert-danger" role="alert">
This is currently being elaborated and subject to change.
</div>

A laboratory can run more than one Laboratory Information Management System (LIMS). NW GLH (`699X0`) runs both iGene and DLIMS, for example. When one of these systems sub-orders work to another ([ILW LAB-35](ILW.html#sub-orders-lab-35-and-lab-36)), the ODS code in `ServiceRequest.performer` cannot tell them apart. The receiving system is therefore also referenced as a `Device` in `ServiceRequest.performer[laboratoryInformationSystem]`.

### Referencing by identifier

`Device` resources are not normally exchanged in messages. They are held in repositories (e.g. the RIE), and other resources reference the system by `identifier` only, using the system `https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system` (see [Laboratory Information System Identifier](NamingSystem-laboratory-information-system.html)). A literal `reference` MAY also be included where the `Device` is held on the same server.

| Identifier value | System | Organisation | Example |
|---|---|---|---|
| `DLIMS` | DLIMS | NW GLH (`699X0`) | [DLIMS](Device-DLIMS.html) |
| `OmicsDSS` | Omics DSS | NW GLH (`699X0`) | [OmicsDSS](Device-OmicsDSS.html) |
{:.grid}

### Querying

This lets the receiving system, or the RIE on its behalf, query for its own orders:

```
GET [base]/ServiceRequest?performer:identifier=https://fhir.nwgenomics.nhs.uk/Id/laboratory-information-system|DLIMS&status=active
```

<div class="alert alert-info" role="alert">
See <a href="ILW.html#dlims-sub-order-omics-dss">ILW - DLIMS Sub-order (OMICS DSS)</a> and the example <a href="ServiceRequest-ServiceRequest-ctDNA-DLIMS-SubOrder.html">OMICS DSS sub-order from iGene to DLIMS</a>.
</div>
