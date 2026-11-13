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
Description: "iGene test number (e.g. `T26-59XG`), assigned by NW GLH (699X0). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) of the Laboratory Order, the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of iGene work orders (LTW LAB-4), and the Laboratory Report identifier (`DiagnosticReport.identifier`)."
Usage: #definition
* insert LIMSNamingSystem(IGeneReportIdentifier, https://fhir.nwgenomics.nhs.uk/iGene/ReportIdentifier, FILL)
* description = "iGene test number (e.g. `T26-59XG`), assigned by NW GLH (699X0). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) of the Laboratory Order, the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of iGene work orders (LTW LAB-4), and the Laboratory Report identifier (`DiagnosticReport.identifier`)."


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


Instance: DLIMS-OrderIdentifier
InstanceOf: NamingSystem
Title: "DLIMS Order Identifier"
Description: "DLIMS order number, assigned by NW GLH (699X0) when DLIMS accepts a work order from iGene (LTW LAB-4). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) of the work order."
Usage: #definition
* insert LIMSNamingSystem(DLIMSOrderIdentifier, https://fhir.nwgenomics.nhs.uk/DLIMS/OrderIdentifier, FILL)
* description = "DLIMS order number, assigned by NW GLH (699X0) when DLIMS accepts a work order from iGene (LTW LAB-4). Used as the Order Filler Number (`ServiceRequest.identifier[OrderFillerNumber]`) of the work order."


Instance: DLIMS-WorkOrderIdentifier
InstanceOf: NamingSystem
Title: "DLIMS Work Order Identifier"
Description: "DLIMS processing request number, assigned by NW GLH (699X0) when DLIMS asks OmicsDSS to process a work order received from iGene. Used as the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of that request."
Usage: #definition
* insert LIMSNamingSystem(DLIMSWorkOrderIdentifier, https://fhir.nwgenomics.nhs.uk/DLIMS/WorkOrderIdentifier, PLAC)
* description = "DLIMS processing request number, assigned by NW GLH (699X0) when DLIMS asks OmicsDSS to process a work order received from iGene. Used as the Order Placer Number (`ServiceRequest.identifier[OrderPlacerNumber]`) of that request."


Instance: OmicsDSS-ResultIdentifier
InstanceOf: NamingSystem
Title: "OmicsDSS Result Identifier"
Description: "OmicsDSS result number, assigned by NW GLH (699X0) when Lab 2 (DLIMS or Clarity LIMS, with OmicsDSS) returns test results for an iGene work order (LTW LAB-5). Used as the test results identifier (`DiagnosticReport.identifier[ReportIdentifier]`)."
Usage: #definition
* insert LIMSNamingSystem(OmicsDSSResultIdentifier, https://fhir.nwgenomics.nhs.uk/OmicsDSS/ResultIdentifier, FILL)
* description = "OmicsDSS result number, assigned by NW GLH (699X0) when Lab 2 (DLIMS or Clarity LIMS, with OmicsDSS) returns test results for an iGene work order (LTW LAB-5). Used as the test results identifier (`DiagnosticReport.identifier[ReportIdentifier]`)."
