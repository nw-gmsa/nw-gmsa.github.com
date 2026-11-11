// Pharmacogenomic report, following HL7 Genomics Reporting Pharmacogenomic Reporting (pharmacogenomics.html).
// Fictitious example: the genotype, dates and wording are illustrative only. Dosing follows the
// mavacamten Summary of Product Characteristics (SmPC), which is not reproduced here.

Instance: Composition-GenomicsReport-Pharmacogenomics
InstanceOf: CompositionGenomicReport
Title: "Composition - Genomics Report Pharmacogenomics (CYP2C19 Mavacamten)"
Description: "Composition - Genomics Report Pharmacogenomics (R454.1 Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy)"
Usage: #example

* extension[diagnosticReport].valueReference.reference = "urn:uuid:7d97f7b6-1cd8-4563-94ff-efebd54590e2"

* identifier
  * value = "e9a1b7c4-pgx-r454"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"

* category[+] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"

* status = #final
* type.coding[+] = $GTD#R454.1
* type.coding[+] = $sct#1054161000000101 "Genetic report"

* date = "2026-11-02T15:45:00+00:00"
* author.identifier.system = $ods-code
* author.identifier.value = "699X0"
* author.display = "NW GLH"
* attester[+].mode = #legal
* attester[=].time = "2026-11-02T15:45:00+00:00"
* attester[=].party.reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* attester[=].party.identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
* attester[=].party.identifier.value = "C1234567"
* attester[=].party.display = "FICTITIOUS, Ralph"

* title = "Composition Genomics Report Pharmacogenomics CYP2C19 Mavacamten"

* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"

// Sections in reading order. SUSHI pre-fills the profile's required section slices at the first
// positions, so each section sets code.coding[0] (replacing the pre-filled code) rather than
// code (which would add a second coding and match two slices).
* section[+]
  * title = "Referral"
  * code.coding[0] = $loinc#42349-1 "Reason for referral (narrative)"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>R454 Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy. CYP2C19 genotyping before starting mavacamten.</p></div>"
  * entry[+].reference = "urn:uuid:a3ef9f92-1896-4174-8523-659726543fb4"

* section[+]
  * title = "Specimen"
  * code.coding[0] = $sct#123038009 "Specimen"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Peripheral blood (EDTA). Collected 27-Oct-2026, received 28-Oct-2026.</p></div>"
  * entry[+].reference = "urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4"

* section[+]
  * title = "Result summary"
  * code.coding[0] = $loinc#51968-6 "Discrete variation analysis overall interpretation"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>CYP2C19 *2/*2 - poor metaboliser.</p></div>"
  * entry[+].reference = "urn:uuid:7d97f7b6-1cd8-4563-94ff-efebd54590e2"

* section[+]
  * title = "Results"
  * code.coding[0] = $loinc#69548-6 "Genetic variant assessment"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>CYP2C19 genotype and the haplotype that defines it.</p></div>"
  * section[+]
    * title = "Pharmacogenomics"
    * code = $loinc#82118-1
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>CYP2C19 genotype *2/*2.</p></div>"
    * entry[+].reference = "urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b"
  * section[+]
    * title = "Haplotype definitions"
    * code = $loinc#83011-7
    * text.status = #generated
    * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>CYP2C19*2 (rs4244285, c.681G&gt;A), homozygous.</p></div>"
    * entry[+].reference = "urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff"

* section[+]
  * title = "Interpretation"
  * code.coding[0] = GenomicReportSection#interpretation
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>This genotype predicts a CYP2C19 poor metaboliser. Mavacamten exposure is increased in CYP2C19 poor metabolisers.</p></div>"
  * entry[+].reference = "urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1"

* section[+]
  * title = "Recommendations"
  * code.coding[0] = $loinc#62385-0 "Recommendation [Interpretation] Document"
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Start and titrate mavacamten using the dosing recommended for CYP2C19 poor metabolisers in the Summary of Product Characteristics.</p></div>"

* section[+]
  * title = "Methodology and limitations"
  * code.coding[0] = GenomicReportSection#methodology
  * text.status = #generated
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Targeted genotyping of CYP2C19 *2, *3 and *17. Other rare alleles are not tested; a sample without a tested allele is assigned *1.</p></div>"
  * entry[+].reference = "urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2"


Instance: DiagnosticReport-GenomicsReport-Pharmacogenomics
InstanceOf: DiagnosticReport
Title: "Diagnostic Report Example - Pharmacogenomics (CYP2C19 Mavacamten)"
Description: "Mace Northwich CYP2C19 genotyping for mavacamten"
Usage: #inline

* extension[DiagnosticReportCompositionR5].valueReference.reference = "urn:uuid:5e71bb01-36a9-44b6-bc00-c9403a2c432c"
* identifier[ReportIdentifier]
  * value = "e9a1b7c4-pgx-r454"
  * system = "http://www.acme.org/diagnosticreport/identifiers"
  * assigner.identifier.system = $ods-code
  * assigner.identifier.value = "699X0"
* basedOn[OrderPlacerNumber]
  * type = "ServiceRequest"
  * identifier.type = $v2-0203#PLAC
  * identifier.system = "http://www.acme.org/servicerequest"
  * identifier.value = "71388"
  * identifier.assigner.identifier.system = $ods-code
  * identifier.assigner.identifier.value = "699X0"
  * reference = "urn:uuid:a3ef9f92-1896-4174-8523-659726543fb4"
* specimen[+].reference = "urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4"
* status = #final
* category[Genetics] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code.coding[+] = $GTD#R454.1
* code.coding[+] = $sct#1054161000000101 "Genetic report"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* subject.identifier
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9737383311"
* effectiveDateTime = "2026-10-27T10:15:00+00:00"
* issued = "2026-11-02T15:45:00+00:00"
* performer[organization]
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GLH"
* resultsInterpreter[author]
  * type = "PractitionerRole"
  * reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
  * identifier.system = "https://fhir.hl7.org.uk/Id/gmc-number"
  * identifier.value = "C1234567"
  * display = "FICTITIOUS, Ralph"
* conclusion = "CYP2C19 *2/*2 - poor metaboliser."
* conclusionCode[+] = $GTOC#321 "VARIANT DETECTED"
* result[+].reference = "urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b"
* result[+].reference = "urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff"
* result[+].reference = "urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1"
* result[+].reference = "urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2"


Instance: Genotype-Pharmacogenomics-CYP2C19
InstanceOf: Genotype
Title: "Genotype - CYP2C19 *2/*2"
Description: "Fictitious example: CYP2C19 genotype, derived from its haplotype"
Usage: #inline

* identifier[+].value = "ed3eaf0e-7075-4902-bb52-c2967317264b"

* status = #final
* effectiveDateTime = "2026-11-02T15:45:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* derivedFrom.reference = "urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff"
* valueCodeableConcept.text = "CYP2C19 *2/*2"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:2621 "CYP2C19"


Instance: Haplotype-Pharmacogenomics-CYP2C19-2
InstanceOf: Haplotype
Title: "Haplotype - CYP2C19*2"
Description: "Fictitious example: CYP2C19*2 haplotype (rs4244285), homozygous"
Usage: #inline

* identifier[+].value = "d5636dc9-38ab-4700-9512-21fb7f024dff"

* status = #final
* effectiveDateTime = "2026-11-02T15:45:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* valueCodeableConcept.text = "CYP2C19*2"
* component[+].code = $loinc#48018-6 "Gene studied [ID]"
* component[=].valueCodeableConcept = $genenames#HGNC:2621 "CYP2C19"
* component[+].code = $loinc#81255-2
* component[=].valueCodeableConcept.text = "rs4244285"
* component[+].code = $loinc#53034-5 "Allelic state"
* component[=].valueCodeableConcept = $loinc#LA6705-3 "Homozygous"


Instance: TherapeuticImplication-Pharmacogenomics-Mavacamten
InstanceOf: TherapeuticImplication
Title: "Therapeutic Implication - CYP2C19 poor metaboliser mavacamten"
Description: "Fictitious example: CYP2C19 poor metaboliser implication for mavacamten"
Usage: #inline

* identifier[+].value = "c645241f-8361-465c-83ab-f270a23fcfa1"

* status = #final
* effectiveDateTime = "2026-11-02T15:45:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* derivedFrom.reference = "urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b"
* component[+].code = $loinc#51963-7
* component[=].valueCodeableConcept.text = "Mavacamten"
* component[+].code = $loinc#53040-2
* component[=].valueCodeableConcept.text = "Poor metabolizer"
* component[+].code = $TbdCodesCS#conclusion-string
* component[=].valueString = "CYP2C19 *2/*2 predicts a poor metaboliser. Start and titrate mavacamten using the dosing recommended for CYP2C19 poor metabolisers in the Summary of Product Characteristics."


Instance: GenomicStudyPanel-Pharmacogenomics
InstanceOf: GenomicStudyPanel
Title: "Genomic Study (Panel) - CYP2C19 Mavacamten"
Description: "Fictitious example: overall study variables for R454.1 CYP2C19 targeted variant testing"
Usage: #inline

* identifier[+].value = "2c43b15a-0b31-4c49-b087-88292f80abd2"

* status = #final
* effectiveDateTime = "2026-11-02T15:45:00+00:00"
* category[geCategory] = http://terminology.hl7.org/CodeSystem/v2-0074#GE "Genetics"
* code = $loinc#81306-3 "Variables that apply to the overall study"
* subject.reference = "urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a"
* subject.display = "Mace NORTHWICH"
* performer[+].reference = "urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c"
* component[+]
  * code = $loinc#51967-8 "Genetic disease assessed [ID]"
  * valueCodeableConcept = $GCC#R454 "Mavacamten for treating symptomatic obstructive hypertrophic cardiomyopathy"
* component[+]
  * code = $loinc#51963-7
  * valueCodeableConcept.text = "Mavacamten"
* component[+]
  * code = $loinc#48018-6 "Gene studied [ID]"
  * valueCodeableConcept = $genenames#HGNC:2621 "CYP2C19"


Instance: FHIRDocumentGeneticReportBundle-Pharmacogenomics
InstanceOf: BundleDocument
Title: "Bundle `Document` - Genomics Report Pharmacogenomics (CYP2C19 Mavacamten)"
Description: "FHIR Document Genomics Report (Pharmacogenomics, R454.1 CYP2C19 for mavacamten) for Mace Northwich, following HL7 Genomics Reporting Pharmacogenomic Reporting. Results use the Pharmacogenomics and Haplotype definitions sub-sections; the therapeutic implication is in the Interpretation section."
Usage: #example
* insert DocumentBundle("8c2d4f6a-1e3b-4a5c-9d7e-0f1a2b3c4d5e", "2026-11-02T15:45:00+00:00")
* insert EntryDocument("urn:uuid:5e71bb01-36a9-44b6-bc00-c9403a2c432c", Composition-GenomicsReport-Pharmacogenomics)
* insert EntryDocument("urn:uuid:50d6aefa-e2d2-439a-820f-cb495c72ae6a", Patient-Northwich)
// Order (also in the order message GenomicsOrderMessage-Pharmacogenomics): ServiceRequest, requester and Specimen
* insert EntryDocument("urn:uuid:a3ef9f92-1896-4174-8523-659726543fb4", ServiceRequest-Pharmacogenomics)
* insert EntryDocument("urn:uuid:354876d4-435a-413f-817d-eb6440b0a4ef", PractitionerRole-Requester-Cardiology-RBQ)
* insert EntryDocument("urn:uuid:5cd4af98-b7b4-410e-8f71-0dbc2a3e1af4", Specimen-Pharmacogenomics)
* insert EntryDocument("urn:uuid:7d97f7b6-1cd8-4563-94ff-efebd54590e2", DiagnosticReport-GenomicsReport-Pharmacogenomics)
//  Performer
* insert EntryDocument("urn:uuid:59577028-8fcc-4554-8b43-988561d41d9c", 59577028-8fcc-4554-8b43-988561d41d9c)
// Observation
* insert EntryDocument("urn:uuid:ed3eaf0e-7075-4902-bb52-c2967317264b", Genotype-Pharmacogenomics-CYP2C19)
* insert EntryDocument("urn:uuid:d5636dc9-38ab-4700-9512-21fb7f024dff", Haplotype-Pharmacogenomics-CYP2C19-2)
* insert EntryDocument("urn:uuid:c645241f-8361-465c-83ab-f270a23fcfa1", TherapeuticImplication-Pharmacogenomics-Mavacamten)
* insert EntryDocument("urn:uuid:2c43b15a-0b31-4c49-b087-88292f80abd2", GenomicStudyPanel-Pharmacogenomics)
