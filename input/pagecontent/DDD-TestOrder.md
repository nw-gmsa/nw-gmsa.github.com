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

#### Prior Results (Panel) Example

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

This **appears to be related** to [LOINC 58410-2](https://loinc.org/58410-2) which has an example in FHIR US Core [Example: CBC panel - Blood by Automated count](Questionnaire-58410-2.html)
This **may be** related to [NHS England Pathology FHIR Implementation Guide - PATH-R4-10: Bundle Example - Full Blood Count Report](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home/FHIRAssets/AllAssets/All-Profiles/Examples/Bundles/Full-Blood-Count-Report?version=0.1)

If you browse between the different standards, you may be confused. At present, I think I am correct.
So the DHCW B0309 code for MCV is also LOINC 787-2 that has an example in US Core with the same coding and ucum units (fl). 
Can we assume from NHS England's example, the SNOMED concept is **1491000237105 Erythrocytes MCV (mean corpuscular volume) in blood**
Similarly the panel/OBR codes are:

- DHCW *B0001 Full blood count*
- LOINC (and US Core) *58410-2 CBC panel - Blood by Automated count*
- NHS England SNOMED CT *26604007 Full blood count*


## Communication Model  

[Placer Order Management [LAB-1]](LAB-1.html)
