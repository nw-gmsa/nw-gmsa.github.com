Instance: genomic-study-analysis-egfr-dpcr
InstanceOf: http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis
Title: "Genomic Study Analysis - ctDNA EGFR dPCR"
Description: "The EGFR region studied by the ctDNA digital PCR assay, using the Genomics Reporting genomic-study-analysis-regions extension"

* identifier[+].value = "e1e2150d-ba34-4247-83a2-5bc9ab93ba22"

* status = #completed

* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* performedDateTime = "2026-07-13T10:37:26+00:00"

* subject.reference = "urn:uuid:2160525b-0168-4f40-8ebf-9b053052a62c"
* subject.display = "Theon SHEFFIELD"

* performer[+].actor
  * identifier.system = $ods-code
  * identifier.value = "699X0"
  * type = #Organization
  * display = "NW GMSA"

* extension[title].valueString = "EGFR ctDNA digital PCR"
* extension[method-type].valueCodeableConcept = http://hl7.org/fhir/uv/genomics-reporting/CodeSystem/genomic-study-method-type-cs#targeted-variant-analysis "Targeted variant analysis"
* extension[specimen].valueReference.reference = "urn:uuid:b930b4c4-327a-4728-8bb9-f90061914cc5"

* extension[regions]
  * extension[description].valueString = "EGFR (transcript NM_005228.5) exon 20 T790M hotspot position only, plus in a multiplexed panel a small number of other named hotspots such as exon 19 deletions / L858R. Not the full coding sequence of EGFR."
  * extension[studied].valueCodeableConcept = $genenames#HGNC:3236 "EGFR"

* note[+].text = "ILLUSTRATIVE: unlike NGS, a negative dPCR result only rules out variants at the specific positions named in the regions studied; it should not be read as 'EGFR negative' more broadly. Coordinate/region detail (start/end, genome build) is omitted from this illustrative example and should be populated from the assay's validated target list in a real implementation."
