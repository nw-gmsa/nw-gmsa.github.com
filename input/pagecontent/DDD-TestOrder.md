## References

- [NHS Genomic Medicine Service test order forms](https://www.england.nhs.uk/publication/nhs-genomic-medicine-service-test-order-forms/)

## Domain Archetype

[North West Genomics Test Order](Questionnaire-GenomicTestOrder.html)

## Communication Information Model

<figure>
{%include orders-model.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Genomics Test Request Model</p>
</figure>
<br clear="all">

### Ask at Order Entry questions and prior results

TODO Explain how questions and answers are converted into v2 OBX/FHIR Observations based on https://build.fhir.org/ig/HL7/sdc/extraction.html

#### Prior Results (Complete Blood Count Panel) Example

The following is an extract from **Digital Health and Care Wales HL7 2.5.1 ORU_R01**. 

> NHS England has not defined HL7 v2 ORU standards, and the use of HL7 v2 ORU is common in England. DHCW example is being used for documentation reasons, the clinical coding shown here is an example and not a standard.

```aiignore
OBR|2||914694928301|B0001^Full blood count|||201803091500|||^ABM: Sian Jones||||201803091500|^^Dr Jones
Indiana|^Jones^Indiana^^^Dr||||||201803091500|||F
TQ1|||||||201803091400|201803091500|S^^^^^^^^Urgent
OBX|1|NM|B0300^White blood cell (WBC) count||3.5|x10\S\9/L|4.0-11.0|L|||F|||201803091500
OBX|2|SN|B0307^Haemoglobin (Hb)||<^149|g/L|130-180|H|||F|||201803091500
OBX|3|NM|B0314^Platelet (PLT) count||500|x10\S\9/L|150-400|H|||F|||201803091500
OBX|4|NM|B0306^Red blood cell (RBC) count||6.00|x10\S\12/L|4.50-6.00|N|||F|||201803091500
OBX|6|CE|B0309^Mean cell volume (MCV)||NA^Not assayed^ACME|fL|80-100|N|||F|||201803091500
```

The coding (B0001, B0300, B0307, etc) is using local laboratory coding, ideally we want all organisations to communicate via standard coding and in the UK this preferred clinical coding is [SNOMED CT UK Edition 83821000000107](https://digital.nhs.uk/services/terminology-and-classifications/snomed-ct) and the preferred coding standard for units is [UCUM](https://ucum.org/). To use local codes would mean 20+ organisation maintaining code mappings between all the different local codesystems, by using SNOMED (or LOINC) this means they only need to maintain mappings between local codes and SNOMED (or LOINC) 

At the time of writing, there is no definition of Complete Blood Count in the NHS. So instead, we look elsewhere: 

- Searching [LOINC](https://loinc.org/) gives:
  - [LOINC 58410-2](https://loinc.org/58410-2) 
- US [minimal Common Oncology Data Elements (mCODE)](https://build.fhir.org/ig/HL7/fhir-mCODE-ig/group-assessment.html#laboratory-tests) points to an example in US Core [Example DiagnosticReport: CBC Example](https://hl7.org/fhir/us/core/DiagnosticReport-cbc.html) which is based on the LOINC panel found in the previous search.

LOINC CBC panel - Blood by Automated count:

| LOINC     | Name                                                                    | R/O/C | UCUM Units |
|-----------|-------------------------------------------------------------------------|-------|------------|
| 58410-2   | CBC panel - Blood by Automated count                                    |       |            |			
| - 6690-2  | Leukocytes [#/volume] in Blood by Automated count                       | R     | 		10*3/uL  
| - 789-8   | Erythrocytes [#/volume] in Blood by Automated count	                    | R	    | 	10*6/uL   
| - 718-7   | Hemoglobin [Mass/volume] in Blood	                                      | R     | 		g/dL     |
| - 4544-3  | Hematocrit [Volume Fraction] of Blood by Automated count                | R	    | 	%         |
| - 787-2   | MCV [Entitic mean volume] in Red Blood Cells by Automated count	        | R	    | 	fL        |
| - 785-6   | MCH [Entitic mass] by Automated count	                                  | R	    | 	pg        |
| - 786-4   | MCHC [Entitic Mass/volume] in Red Blood Cells by Automated count	       | R	    | 	g/dL      |
| - 788-0   | Erythrocyte [DistWidth] in Red Blood Cells by Automated count           | O	    | 	%         |
| - 777-3   | Platelets [#/volume] in Blood by Automated count                        | R	    | 	10*3/uL   |
| - 32207-3 | Platelet distribution width [Entitic volume] in Blood by Automated count	 | O     | 	fL        |
| - 32623-1 | Platelet [Entitic mean volume] in Blood by Automated count              | O     | 		fL       |

Armed with this information which provides more details on the names and units to use, we can search UK sources. Some suggested resources include:

- [NHS England Pathology FHIR Implementation Guide](https://simplifier.net/guide/pathology-fhir-implementation-guide) which reveals 
  - [PATH-R4-10: Bundle Example - Full Blood Count Report](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/All-Profiles/Examples/Bundles/Full-Blood-Count-Report?version=0.1) and so we have UK SNOMED coding.
- [OpenSAFELY codelists](https://www.opencodelists.org/codelist/opensafely) which contain many valuesets used in primary care.
- Internet searches also reveal several NHS Trusts providing documentation around *Full Blood Count*, this often includes the local coding we saw with the HL7 v2 example. The example below is from [University Hospitals of Liverpool Group - Full Blood Count](https://pathlabs.rlbuht.nhs.uk/fullbloodcount__h.htm)

<img style="padding:3px;width:700px;" src="Liverpool-FBC.png" alt="University Hospitals of Liverpool Group Full Blood Count"/>
<br clear="all">
<p class="figureTitle">University Hospitals of Liverpool Group - Full Blood Count</p> 
<br clear="all">

Based on the results we have found so far, we could start to infer LOINC - Local Codes - SNOMED mappings, this is not recommended for a developer or business analyst. 

> Code mappings should be created by a [clinical coder](https://en.wikipedia.org/wiki/Clinical_coder). In HL7 FHIR this code mapping is known as a [ConceptMap](https://hl7.org/fhir/R4/conceptmap.html). NHS England has produced instructions for creating a [ConceptMap](https://digital.nhs.uk/services/terminology-server/training-guides/new-to-the-terminology-server/authoring-fhir-terminology-resources/create-a-new-concept-map) using the [NHS England Ontology Server](https://digital.nhs.uk/services/terminology-server)

However, LOINC and SNOMED have collaborated to produce [The LOINC Ontology SNOMED CT Browser](https://browser.loincsnomed.org/?). Which allows us to alter our previous definition of the panel to:

| LOINC     | SNOMED              | Name                                                                      | R/O/C | UCUM Units |
|-----------|---------------------|---------------------------------------------------------------------------|-------|------------|
| 58410-2   |                     | CBC panel - Blood by Automated count                                      |       |            |			
| - 6690-2  | [147071010000102](http://snomed.info/id/147071010000102) | Leukocytes [#/volume] in Blood by Automated count                         | R     | 		10*3/uL  
| - 789-8   | [249121010000107](http://snomed.info/id/249121010000107)   | Erythrocytes [#/volume] in Blood by Automated count	                      | R	    | 	10*6/uL   
| - 718-7   | [168331010000106](http://snomed.info/id/168331010000106)   | Hemoglobin [Mass/volume] in Blood	                                        | R     | 		g/dL     |
| - 4544-3  | [558261010000109](http://snomed.info/id/558261010000109)   | Hematocrit [Volume Fraction] of Blood by Automated count                  | R	    | 	%         |
| - 787-2   | [613061010000108](http://snomed.info/id/613061010000108)   | MCV [Entitic mean volume] in Red Blood Cells by Automated count	          | R	    | 	fL        |
| - 785-6   | [612991010000106](http://snomed.info/id/612991010000106)   | MCH [Entitic mass] by Automated count	                                    | R	    | 	pg        |
| - 786-4   | [613001010000107](http://snomed.info/id/613001010000107)   | MCHC [Entitic Mass/volume] in Red Blood Cells by Automated count	         | R	    | 	g/dL      |
| - 788-0   | [613181010000104](http://snomed.info/id/613181010000104)   | Erythrocyte [DistWidth] in Red Blood Cells by Automated count             | O	    | 	%         |
| - 777-3   | [218801010000106](http://snomed.info/id/218801010000106)   | Platelets [#/volume] in Blood by Automated count                          | R	    | 	10*3/uL   |
| - 32207-3 |                     | Platelet distribution width [Entitic volume] in Blood by Automated count	 | O     | 	fL        |
| - 32623-1 | [528301010000103](http://snomed.info/id/528301010000103)   | Platelet [Entitic mean volume] in Blood by Automated count                | O     | 		fL       |

> Note these SNOMED codes do not appear to be supported in the UK Edition of SNOMED.

## Communication Model  

[Placer Order Management [LAB-1]](LAB-1.html)
