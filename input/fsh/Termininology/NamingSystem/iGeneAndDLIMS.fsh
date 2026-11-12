RuleSet: LIMSNamingSystem(name, uri, type)
* name = "{name}"
* status = #draft
* kind = #identifier
* date = "2026-11-12"
* responsible = "NHS North West Genomics"
* type = $v2-0203#{type}
* uniqueId[+]
  * type = #uri
  * value = "{uri}"
  * preferred = true


Instance: iGene-ReportIdentifier
InstanceOf: NamingSystem
Title: "iGene Report Identifier"
Description: "iGene test number (e.g. `T26-59XG`), assigned by NW GLH (699X0). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) and the Laboratory Report identifier (`DiagnosticReport.identifier`)."
Usage: #definition
* insert LIMSNamingSystem(IGeneReportIdentifier, https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier, FILL)
* description = "iGene test number (e.g. `T26-59XG`), assigned by NW GLH (699X0). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) and the Laboratory Report identifier (`DiagnosticReport.identifier`)."


Instance: iGene-ReferralIdentifier
InstanceOf: NamingSystem
Title: "iGene Referral Identifier"
Description: "iGene referral number (e.g. `R26-15AY`), assigned by NW GLH (699X0). Used as the Placer Group Number (`ServiceRequest.requisition`)."
Usage: #definition
* insert LIMSNamingSystem(IGeneReferralIdentifier, https://fhir.nwgenomics.nhs.uk/iGene/ReferralIdentifier, PGN)
* description = "iGene referral number (e.g. `R26-15AY`), assigned by NW GLH (699X0). Used as the Placer Group Number (`ServiceRequest.requisition`)."


Instance: iGene-SpecimenIdentifier
InstanceOf: NamingSystem
Title: "iGene Specimen Identifier"
Description: "iGene specimen number (e.g. `S26-1K1Q`), assigned by NW GLH (699X0). Used as the Filler Specimen Number (`Specimen.identifier[FillerSpecimenNumber]`)."
Usage: #definition
* insert LIMSNamingSystem(IGeneSpecimenIdentifier, https://fhir.nwgenomics.nhs.uk/iGene/SpecimenIdentifier, FILL)
* description = "iGene specimen number (e.g. `S26-1K1Q`), assigned by NW GLH (699X0). Used as the Filler Specimen Number (`Specimen.identifier[FillerSpecimenNumber]`)."


Instance: iGene-SubOrderIdentifier
InstanceOf: NamingSystem
Title: "iGene Sub-order Identifier"
Description: "iGene sub-order number, assigned by NW GLH (699X0) when iGene (Requestor) sub-orders work to another system such as DLIMS (ILW LAB-35). Used as the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of the sub-order."
Usage: #definition
* insert LIMSNamingSystem(IGeneSubOrderIdentifier, https://fhir.nwgenomics.nhs.uk/iGene/SubOrderIdentifier, PLAC)
* description = "iGene sub-order number, assigned by NW GLH (699X0) when iGene (Requestor) sub-orders work to another system such as DLIMS (ILW LAB-35). Used as the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of the sub-order."


Instance: DLIMS-OrderIdentifier
InstanceOf: NamingSystem
Title: "DLIMS Order Identifier"
Description: "DLIMS order number, assigned by NW GLH (699X0) when DLIMS (Subcontractor) accepts a sub-order (ILW LAB-35). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) of the sub-order."
Usage: #definition
* insert LIMSNamingSystem(DLIMSOrderIdentifier, https://fhir.nwgenomics.nhs.uk/DLIMS/OrderIdentifier, FILL)
* description = "DLIMS order number, assigned by NW GLH (699X0) when DLIMS (Subcontractor) accepts a sub-order (ILW LAB-35). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) of the sub-order."


Instance: DLIMS-WorkOrderIdentifier
InstanceOf: NamingSystem
Title: "DLIMS Work Order Identifier"
Description: "DLIMS work order number, assigned by NW GLH (699X0) when DLIMS (Order Filler) places a work order with OmicsDSS (LTW LAB-4). Used as the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of the work order."
Usage: #definition
* insert LIMSNamingSystem(DLIMSWorkOrderIdentifier, https://fhir.nwgenomics.nhs.uk/DLIMS/WorkOrderIdentifier, PLAC)
* description = "DLIMS work order number, assigned by NW GLH (699X0) when DLIMS (Order Filler) places a work order with OmicsDSS (LTW LAB-4). Used as the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of the work order."
